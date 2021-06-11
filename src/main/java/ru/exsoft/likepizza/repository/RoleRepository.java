package ru.exsoft.likepizza.repository;


import ru.exsoft.likepizza.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
}
