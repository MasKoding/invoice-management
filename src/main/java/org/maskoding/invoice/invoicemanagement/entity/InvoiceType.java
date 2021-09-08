package org.maskoding.invoice.invoicemanagement.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import lombok.Data;


@Entity @Data
@SQLDelete(sql = "UPDATE invoice_type SET status_record = 'INACTIVE' WHERE id=?")
@Where(clause = "status_record='ACTIVE'")
public class InvoiceType extends BaseEntity{
    @NotNull @NotEmpty @Size(min=3, max=100)
    private String code;
    @NotNull @NotEmpty @Size(min=3, max = 100)
    private String name;

    @ManyToMany
    @JoinTable(
        name = "invoice_payment_provider",
        
        joinColumns = @JoinColumn(name="id_invoice_type"),
        inverseJoinColumns = @JoinColumn(name="id_payment_provider")
    )
    private Set<PaymentProvider> paymentProviders = new HashSet<>();
}
