package ru.exsoft.likepizza.apidao;

import ru.exsoft.likepizza.entity.PrizeRarity;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.time.LocalDateTime;

public class AddPrizeRequest {
    @NotEmpty
    private String name;
    @NotEmpty
    private String description;
    @NotNull
    private PrizeRarity rarity;
    private Long piecesLeft = -1L;
    private LocalDateTime expiresIn;
    private boolean enabled = false;
    @Pattern(regexp = "^(https?)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]", message = "wrong url")
    private String redirect;

    public String getName() {
        return name;
    }

    public AddPrizeRequest setName(String name) {
        this.name = name;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public AddPrizeRequest setDescription(String description) {
        this.description = description;
        return this;
    }

    public PrizeRarity getRarity() {
        return rarity;
    }

    public AddPrizeRequest setRarity(PrizeRarity rarity) {
        this.rarity = rarity;
        return this;
    }

    public Long getPiecesLeft() {
        return piecesLeft;
    }

    public AddPrizeRequest setPiecesLeft(Long piecesLeft) {
        this.piecesLeft = piecesLeft;
        return this;
    }

    public LocalDateTime getExpiresIn() {
        return expiresIn;
    }

    public AddPrizeRequest setExpiresIn(LocalDateTime expiresIn) {
        this.expiresIn = expiresIn;
        return this;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public AddPrizeRequest setEnabled(boolean enabled) {
        this.enabled = enabled;
        return this;
    }

    public String getRedirect() {
        return redirect;
    }

    public AddPrizeRequest setRedirect(String redirect) {
        this.redirect = redirect;
        return this;
    }
}
