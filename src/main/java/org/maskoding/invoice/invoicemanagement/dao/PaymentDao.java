package org.maskoding.invoice.invoicemanagement.dao;

import org.maskoding.invoice.invoicemanagement.entity.Payment;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface PaymentDao extends PagingAndSortingRepository<Payment, String>{
    
}
