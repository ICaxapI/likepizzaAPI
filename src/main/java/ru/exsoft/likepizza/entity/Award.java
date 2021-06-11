package ru.exsoft.likepizza.entity;

import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.time.LocalDateTime;

@Entity
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "t_awards" ,
        indexes = {
            @Index(columnList = "id", name = "award_id_idx"),
            @Index(columnList = "phone", name = "award_phone_idx"),
            @Index(columnList = "created", name = "award_created_idx")
        })
public class Award {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Pattern(regexp="^(?:8|\\+7)[9][0-9]{9}$", message="Wrong mobile phone")
    private String phone;
    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    private Prize prize;
    private LocalDateTime created;
    private AwardStatus status = AwardStatus.AVAILABLE;

    public Long getId() {
        return id;
    }

    public Award setId(Long id) {
        this.id = id;
        return this;
    }

    public String getPhone() {
        return phone;
    }

    public Award setPhone(String phone) {
        this.phone = phone;
        return this;
    }

    public Prize getPrize() {
        return prize;
    }

    public Award setPrize(Prize prize) {
        this.prize = prize;
        return this;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public Award setCreated(LocalDateTime dateTime) {
        this.created = dateTime;
        return this;
    }

    public AwardStatus getStatus() {
        return status;
    }

    public Award setStatus(AwardStatus status) {
        this.status = status;
        return this;
    }
}
