package ru.exsoft.likepizza.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.exsoft.likepizza.entity.PrizeRarity;
import ru.exsoft.likepizza.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
