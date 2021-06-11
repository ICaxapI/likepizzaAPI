package ru.exsoft.likepizza.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.time.LocalDateTime;

@Entity
@Cacheable()
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "t_prizes")
public class Prize {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty
    private String name;
    @NotEmpty
    @Column(columnDefinition="TEXT")
    private String description;
    @NotNull
    private PrizeRarity rarity;
    private Long piecesLeft;
    @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd'T'HH:mm:ss'Z'")
    private LocalDateTime expiresIn;
    private Boolean enabled = false;
    @Pattern(regexp = "^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]", message = "wrong url")
    private String redirect;

    public Long getId() {
        return id;
    }

    public Prize setId(Long id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Prize setName(String name) {
        this.name = name;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public Prize setDescription(String description) {
        this.description = description;
        return this;
    }

    public PrizeRarity getRarity() {
        return rarity;
    }

    public Prize setRarity(PrizeRarity rarity) {
        this.rarity = rarity;
        return this;
    }

    public LocalDateTime getExpiresIn() {
        return expiresIn;
    }

    public Prize setExpiresIn(LocalDateTime expireIn) {
        this.expiresIn = expireIn;
        return this;
    }

    public Long getPiecesLeft() {
        return piecesLeft;
    }

    public Prize setPiecesLeft(Long piecesLeft) {
        this.piecesLeft = piecesLeft;
        return this;
    }

    public Boolean isEnabled() {
        return enabled;
    }

    public Prize setEnabled(Boolean enabled) {
        this.enabled = enabled;
        return this;
    }

    public String getRedirect() {
        return redirect;
    }

    public Prize setRedirect(String redirect) {
        this.redirect = redirect;
        return this;
    }
}
