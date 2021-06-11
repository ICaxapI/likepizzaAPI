package ru.exsoft.likepizza.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.exsoft.likepizza.entity.Prize;
import ru.exsoft.likepizza.entity.PrizeRarity;
import ru.exsoft.likepizza.repository.PrizeRepository;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.stream.Collectors;

import static ru.exsoft.likepizza.utils.MathUtills.rnd;

@Service
@Transactional
public class PrizeService {
    @Autowired
    PrizeRepository prizeRepository;

    public List<Prize> getAllPrizes() {
        return prizeRepository.findAll();
    }

    public List<Prize> getAllPrizesForRoll(Random random){
        List<Prize> prizes = prizeRepository.findAllByExpireInBefore(LocalDateTime.now());
        prizes = prizes.subList(0, Math.min(prizes.size(), 15));

        if (prizes.size() < 16) {
            List<Prize> noRarity = prizes.stream().filter(prize -> prize.getRarity().equals(PrizeRarity.NONE)).collect(Collectors.toList());
            while (prizes.size() < 16){
                Prize toAdd;
                Prize toClone;
                if (noRarity.size() > 0) {
                    toClone = noRarity.get(rnd(0, noRarity.size() - 1, random));
                } else {
                    toClone = prizes.get(rnd(0, prizes.size() - 1, random));
                }
                toAdd = new Prize().setPiecesLeft(toClone.getPiecesLeft()).setRarity(toClone.getRarity()).setDescription(toClone.getDescription()).setExpiresIn(toClone.getExpiresIn()).setId(toClone.getId()).setName(toClone.getName());

                prizes.add(toAdd);
            }
        }
        return prizes;
    }

    public Prize getPrizeById(Long id) {
        return prizeRepository.findById(id).orElse(null);
    }

    public boolean updatePrize(Prize prize){
        Optional<Prize> prizeFromDBO = prizeRepository.findById(prize.getId());
        if (prizeFromDBO.isPresent()){
            return prizeRepository.updatePrizeById(prize.getId(),
                    prize.getName(),
                    prize.getDescription(),
                    prize.getRarity(),
                    prize.getPiecesLeft(),
                    prize.getExpiresIn(),
                    prize.getRedirect(),
                    prize.isEnabled()) > 0;
        } else {
            return false;
        }
    }

    public Prize savePrize(Prize prize) {
        if (prize.getId() == null) {
            return prizeRepository.save(prize);
        } else {
            return null;
        }
    }

    public boolean deletePrize(Prize prize){
        return deletePrize(prize.getId());
    }

    public boolean deletePrize(Long prizeId) {
        if (prizeRepository.findById(prizeId).isPresent()) {
            prizeRepository.deleteById(prizeId);
            return true;
        }
        return false;
    }
}
