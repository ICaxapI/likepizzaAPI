package ru.exsoft.likepizza.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.exsoft.likepizza.entity.Award;
import ru.exsoft.likepizza.entity.AwardStatus;
import ru.exsoft.likepizza.repository.AwardRepository;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class AwardService {
    @Autowired
    AwardRepository awardRepository;

    public List<Award> loadAwardByNumber(String phone) {
        List<Award> awardList = awardRepository.findAllByPhone(phone);
        awardList.forEach(award -> {
            if (award.getStatus() == AwardStatus.AVAILABLE && null != award.getPrize().getExpiresIn() && award.getPrize().getExpiresIn().isBefore(LocalDateTime.now())){
                award.setStatus(AwardStatus.EXPIRED);
                updateStatusAwardById(award.getId(), AwardStatus.EXPIRED);
            }
        });

        return awardList;
    }

    public Award hasAccess(String phone){
        return awardRepository.findFirstByPhoneAndCreatedAfter(phone, LocalDateTime.now().truncatedTo(ChronoUnit.DAYS));
    }

    public List<Award> allAwards() {
        return awardRepository.findAll();
    }

    public Award updateStatusAwardById(Long id, AwardStatus status){
        Optional<Award> award = awardRepository.findById(id);
        if (award.isPresent()){
            if (award.get().getStatus() == AwardStatus.AVAILABLE){
                award.get().setStatus(status);
                updateAward(award.get());
                return awardRepository.findById(id).get();
            } else {
                return award.get();
            }
        }
        return null;
    }

    public boolean updateAward(Award award) {
        Award awardFromDB = awardRepository.findFirstByPhoneAndCreated(award.getPhone(), award.getCreated());
        if (awardFromDB != null) {
            return awardRepository.updateAwardStatusById(award.getId(), award.getStatus()) > 0;
        } else {
            return false;
        }
    }

    public Award saveAward(Award award) {
        Award awardFromDB = awardRepository.findFirstByPhoneAndCreated(award.getPhone(), award.getCreated());

        if (awardFromDB != null) {
            return null;
        }

        return awardRepository.save(award);
    }

    public boolean deleteAward(Long awardId) {
        if (awardRepository.findById(awardId).isPresent()) {
            awardRepository.deleteById(awardId);
            return true;
        }
        return false;
    }
}
