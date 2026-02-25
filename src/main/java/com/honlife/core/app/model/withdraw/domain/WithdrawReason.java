package com.honlife.core.app.model.withdraw.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;
import com.honlife.core.app.model.withdraw.code.WithdrawType;


@Entity
@Getter
@Setter
public class WithdrawReason {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    @Enumerated(EnumType.STRING)
    private WithdrawType type;

    @Column(columnDefinition = "text")
    private String reason;

    @Column
    private LocalDateTime createdAt;

}
