package ru.exsoft.likepizza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.exsoft.likepizza.entity.Prize;
import ru.exsoft.likepizza.entity.PrizeRarity;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

public interface PrizeRepository extends JpaRepository<Prize, Long> {
    List<Prize> findAll();

    @Query(value = "SELECT * FROM t_prizes tp WHERE (tp.expires_in > :dataTime OR tp.expires_in IS NULL) AND (tp.pieces_left > 0 OR tp.pieces_left = -1) AND tp.enabled = 1 ORDER BY id", nativeQuery = true)
    List<Prize> findAllByExpireInBefore(@NotEmpty @Param("dataTime") LocalDateTime dataTime);

    @Modifying
    @Query("UPDATE Prize p1 SET p1.name = :name, " +
            "p1.description = :description, " +
            "p1.rarity = :rarity, " +
            "p1.piecesLeft = :piecesLeft, " +
            "p1.expiresIn = :expiresIn, " +
            "p1.enabled = :enabled, " +
            "p1.redirect = :redirect " +
            "WHERE p1.id = :id")
    int updatePrizeById(@NotEmpty @Param("id") Long id,
                         @NotEmpty @Param("name") String name,
                         @NotEmpty @Param("description") String description,
                         @NotNull @Param("rarity") PrizeRarity rarity,
                         @Param("piecesLeft") Long piecesLeft,
                         @Param("expiresIn") LocalDateTime expiresIn,
                         @Param("redirect") String redirect,
                         @Param("enabled") Boolean enabled);
}
