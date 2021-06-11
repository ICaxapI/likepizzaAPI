package ru.exsoft.likepizza.apidao;

import ru.exsoft.likepizza.entity.Prize;

import javax.validation.constraints.*;
import java.util.ArrayList;

public class RollRequest {

    @NotNull
    @Pattern(regexp="^(?:8|\\+7)[9][0-9]{9}$", message="Wrong number format")
    private String phone;

    @Positive(message="Must be greater then 0")
    @DecimalMax("1")
        private Float strength;

    @NotNull
    private Long seed;

    @NotNull
    private Long hash;

    public String getPhone() {
        return phone;
    }

    public RollRequest setPhone(String phone) {
        this.phone = phone;
        return this;
    }

    public Float getStrength() {
        return strength;
    }

    public RollRequest setStrength(Float strength) {
        this.strength = strength;
        return this;
    }

    public Long getSeed() {
        return seed;
    }

    public RollRequest setSeed(Long seed) {
        this.seed = seed;
        return this;
    }

    public Long getHash() {
        return hash;
    }

    public RollRequest setHash(Long hash) {
        this.hash = hash;
        return this;
    }
}
