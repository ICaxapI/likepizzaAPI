package ru.exsoft.likepizza.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ru.exsoft.likepizza.apidao.CustomizedExceptionResponse;
import ru.exsoft.likepizza.apidao.RollRequest;
import ru.exsoft.likepizza.entity.Award;
import ru.exsoft.likepizza.entity.AwardStatus;
import ru.exsoft.likepizza.entity.Prize;
import ru.exsoft.likepizza.entity.PrizeRarity;
import ru.exsoft.likepizza.service.AwardService;
import ru.exsoft.likepizza.service.PrizeService;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.LongStream;

import static ru.exsoft.likepizza.utils.MathUtills.rnd;

@Controller
public class PublicController {
    @Autowired
    AwardService awardService;
    @Autowired
    PrizeService prizeService;
    @Autowired
    EntityManager entityManager;

    @Transactional
    @PostMapping("/api/roll")
    public ResponseEntity<?> roll(@Valid @RequestBody RollRequest request) {
        Award award = awardService.hasAccess(request.getPhone());

        if (null == award){
            Random randomForOrder = new Random(request.getSeed());
            Random randomForAward = new Random(new Random().nextInt() + Math.round(10000 * request.getStrength())); //Сила на самом деле ни на что не влияет, просто увеличивает немного сид для ролла барабана.
            List<Prize> allPrizes = prizeService.getAllPrizesForRoll(randomForOrder);
            Collections.shuffle(allPrizes, randomForOrder);
            long hash = getHashFromPrizes(allPrizes);

            if (hash == request.getHash()) {
                Prize prize = allPrizes.get(rnd(0, 15, randomForAward));
                if (prize.getPiecesLeft() != -1) {
                    prize.setPiecesLeft(prize.getPiecesLeft() - 1);
                    if (prize.getPiecesLeft() == 0) prize.setEnabled(false);
                    prizeService.updatePrize(prize);
                }
                allPrizes.stream().filter(prize1 -> prize1.getId().equals(prize.getId()) && !Objects.equals(prize1, prize)).forEach(prize1 -> {
                    entityManager.detach(prize1);
                    prize1.setId(-1L);
                });

                award = new Award().setCreated(LocalDateTime.now()).setPhone(request.getPhone());
                award.setPrize(prize);
                if (prize.getRarity().equals(PrizeRarity.NONE)){
                    award.setStatus(AwardStatus.NONE);
                }
                awardService.saveAward(award);

                Map<String, Object> data = new HashMap<>();
                data.put("prizes", allPrizes);
                data.put("award", award.getPrize());

                return new ResponseEntity<>(data, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(new CustomizedExceptionResponse.WithPrizes("Призы обновились, нужно попытаться ещё раз", HttpStatus.CONFLICT.value(), allPrizes, hash), HttpStatus.CONFLICT);
            }
        } else {
            return new ResponseEntity<>(new CustomizedExceptionResponse("Ты уже крутил сегодня, не жульничай", HttpStatus.FORBIDDEN.value()), HttpStatus.FORBIDDEN);
        }
    }

    @GetMapping("/api/prizes/game")
    public ResponseEntity<?> prizes() {
        long seed = System.currentTimeMillis();
        Random random = new Random(seed);

        List<Prize> allPrizes = prizeService.getAllPrizesForRoll(random);
        Collections.shuffle(allPrizes, random);
        long hash = getHashFromPrizes(allPrizes);

        Map<String, Object> data = new HashMap<>();
        data.put("prizes", allPrizes);
        data.put("seed", seed);
        data.put("hash", hash);
        return new ResponseEntity<>(data, HttpStatus.OK);
    }

    private Long getHashFromPrizes(List<Prize> prizes){
        return LongStream.range(0, prizes.size()).map(i -> new Long((int)
                (       (2 * prizes.get((int) i).getId() * 64 * i) +
                        (4 * prizes.get((int) i).getName().hashCode() * 32 * i) +
                        (8 * prizes.get((int) i).getDescription().hashCode() * 16 * i) +
                        (16 * prizes.get((int) i).getRarity().hashCode() * 8 * i) +
                        (32 * (prizes.get((int) i).getExpiresIn() != null ? prizes.get((int) i).getExpiresIn().toString().hashCode() : 7812) * 4 * i) +
                        (64 * (prizes.get((int) i).getRedirect() != null ? prizes.get((int) i).getRedirect().hashCode() : 2187) * 2 * i)
                )).hashCode()).sum();
    }
}
