package ru.exsoft.likepizza.apidao;

import ru.exsoft.likepizza.entity.PrizeRarity;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.time.LocalDateTime;

public class UpdatePrizeRequest {
    @NotEmpty
    private String name;
    @NotEmpty
    private String description;
    @NotNull
    private PrizeRarity rarity;
    private Long piecesLeft;
    private LocalDateTime expireIn;
    private boolean enabled = true;
    @Pattern(regexp = "^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]", message = "wrong url")
    private String redirect;

    public String getName() {
        return name;
    }

    public UpdatePrizeRequest setName(String name) {
        this.name = name;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public UpdatePrizeRequest setDescription(String description) {
        this.description = description;
        return this;
    }

    public PrizeRarity getRarity() {
        return rarity;
    }

    public UpdatePrizeRequest setRarity(PrizeRarity rarity) {
        this.rarity = rarity;
        return this;
    }

    public Long getPiecesLeft() {
        return piecesLeft;
    }

    public UpdatePrizeRequest setPiecesLeft(Long piecesLeft) {
        this.piecesLeft = piecesLeft;
        return this;
    }

    public LocalDateTime getExpireIn() {
        return expireIn;
    }

    public UpdatePrizeRequest setExpireIn(LocalDateTime expireIn) {
        this.expireIn = expireIn;
        return this;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public UpdatePrizeRequest setEnabled(boolean enabled) {
        this.enabled = enabled;
        return this;
    }

    public String getRedirect() {
        return redirect;
    }

    public UpdatePrizeRequest setRedirect(String redirect) {
        this.redirect = redirect;
        return this;
    }
}
