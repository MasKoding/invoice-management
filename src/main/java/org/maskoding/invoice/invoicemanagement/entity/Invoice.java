package org.maskoding.invoice.invoicemanagement.entity;

import java.math.BigDecimal;
import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import lombok.Data;

@Entity 
@Data
@SQLDelete(sql = "UPDATE invoice SET status_record = 'INACTIVE' WHERE id=?")
@Where(clause = "status_record='ACTIVE'")
public class Invoice extends BaseEntity{
    
    @NotNull
    @ManyToOne @JoinColumn(name = "id_invoice_type")
    private InvoiceType invoiceType;
    @NotNull @NotEmpty @Size(min=3, max = 100)
    private String invoiceNumber;
    @NotNull
    private Boolean paid = false;
    @NotNull @NotEmpty
    private LocalDate dueDate;
    @NotNull @NotEmpty @Size(min = 3, max = 255)
    private String description;
    @NotNull @Min(0)
    private BigDecimal amount;

}
