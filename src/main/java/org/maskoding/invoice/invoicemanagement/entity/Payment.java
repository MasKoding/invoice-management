package org.maskoding.invoice.invoicemanagement.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Entity
@Data
public class Payment extends BaseEntity{
    @NotNull
    @NotEmpty
    @ManyToOne @JoinColumn(name="id_virtual_account")
    private VirtualAccount virtualAccount;

    @NotNull
    private LocalDateTime transactionTime;
    
    @NotNull @NotEmpty
    private String providerReference;

    @NotNull @Min(1)
    private BigDecimal amount;
    
    @NotNull @Enumerated(EnumType.STRING)
    private VirtualType virtualType =  VirtualType.CLOSED;

}
