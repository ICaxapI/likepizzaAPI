package ru.exsoft.likepizza.apidao;

import com.fasterxml.jackson.annotation.JsonIgnore;
import ru.exsoft.likepizza.entity.Role;

import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;

public class AddUserRequest {
    @Size(min=3, message = "Не меньше 3 знаков")
    private String username;
    @Size(min=3, message = "Не меньше 3 знаков")
    private String password;
    @NotNull
    private Set<String> roles;

    public String getPassword() {
        return password;
    }

    public AddUserRequest setPassword(String password) {
        this.password = password;
        return this;
    }

    public Set<String> getRoles() {
        return roles;
    }

    public AddUserRequest setRoles(Set<String> roles) {
        this.roles = roles;
        return this;
    }

    public String getUsername() {
        return username;
    }

    public AddUserRequest setUsername(String username) {
        this.username = username;
        return this;
    }
}
