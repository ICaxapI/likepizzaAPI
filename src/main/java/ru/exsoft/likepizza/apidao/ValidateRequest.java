package ru.exsoft.likepizza.apidao;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class ValidateRequest {

    @NotNull
    @Pattern(regexp="^(?:8|\\+7)[9][0-9]{9}$", message="Wrong number format")
    String phone;

    public String getPhone() {
        return phone;
    }

    public ValidateRequest setPhone(String phone) {
        this.phone = phone;
        return this;
    }
}
