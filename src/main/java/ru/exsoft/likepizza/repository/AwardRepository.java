package ru.exsoft.likepizza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.exsoft.likepizza.entity.Award;
import ru.exsoft.likepizza.entity.AwardStatus;
import ru.exsoft.likepizza.entity.PrizeRarity;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.time.LocalDateTime;
import java.util.List;

public interface AwardRepository extends JpaRepository<Award, Long> {
    @org.springframework.data.jpa.repository.QueryHints({
            @javax.persistence.QueryHint(name = "org.hibernate.cacheable", value = "true")
    })
    Award findFirstByPhoneAndCreatedAfter(String phone, LocalDateTime dateTime);

    @org.springframework.data.jpa.repository.QueryHints({
            @javax.persistence.QueryHint(name = "org.hibernate.cacheable", value = "true")
    })
    List<Award> findAllByPhone(String phone);

    @org.springframework.data.jpa.repository.QueryHints({
            @javax.persistence.QueryHint(name = "org.hibernate.cacheable", value = "true")
    })
    Award findFirstByPhoneAndCreated(String phone, LocalDateTime dateTime);

    @Modifying
    @Query("UPDATE Award a SET a.status = :status " +
            "WHERE a.id = :id")
    int updateAwardStatusById(@NotEmpty @Param("id") Long id,
                               @NotEmpty @Param("status") AwardStatus status);
}
