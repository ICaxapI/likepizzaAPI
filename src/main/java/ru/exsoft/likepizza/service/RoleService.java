package ru.exsoft.likepizza.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.exsoft.likepizza.entity.Role;
import ru.exsoft.likepizza.repository.RoleRepository;

import java.util.Set;
import java.util.stream.Collectors;

@Service
public class RoleService {
    @Autowired
    RoleRepository roleRepository;

    public Set<Role> getRoles(){
        return roleRepository.findAll().stream().filter(r -> !r.getName().equals("ROLE_SUPERUSER")).collect(Collectors.toSet());
    }

}
