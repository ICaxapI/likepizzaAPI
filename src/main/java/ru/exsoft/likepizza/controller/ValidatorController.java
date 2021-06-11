package ru.exsoft.likepizza.controller;

import net.sf.ehcache.CacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import ru.exsoft.likepizza.apidao.ValidateRequest;
import ru.exsoft.likepizza.entity.Award;
import ru.exsoft.likepizza.entity.AwardStatus;
import ru.exsoft.likepizza.service.AwardService;

import javax.annotation.security.RolesAllowed;
import javax.validation.Valid;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import java.util.Comparator;
import java.util.List;

@Validated
@Controller
public class ValidatorController {
    @Autowired
    private AwardService awardService;

    @RolesAllowed({"ROLE_OPERATOR", "ROLE_ADMIN"})
    @GetMapping("/api/validate/{number}")
    public ResponseEntity<?> validate(@PathVariable @Valid @Pattern(regexp="^[8|7][9][0-9]{9}$", message="Wrong number format") String number, Authentication authentication) {
        List<Award> awardList = awardService.loadAwardByNumber("+" + number);
        awardList.sort(new SortByStatus());
        return new ResponseEntity<>(awardList, HttpStatus.OK);
    }

    @RolesAllowed({"ROLE_OPERATOR", "ROLE_ADMIN"})
    @PostMapping("/api/use/{awardId}")
    public ResponseEntity<?> useAward(@PathVariable @Valid @Positive(message="Must be greater then 0") Long awardId, Authentication authentication) {
        Award award = awardService.updateStatusAwardById(awardId, AwardStatus.USED);
        if (null == award) return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        else if (award.getStatus().equals(AwardStatus.USED)) return new ResponseEntity<>(award, HttpStatus.OK);
        else return new ResponseEntity<>(award, HttpStatus.CONFLICT);
    }

    private static class SortByStatus implements Comparator<Award> {
        public int compare(Award a, Award b) {
            return a.getStatus().compareTo(b.getStatus());
        }
    }
}
