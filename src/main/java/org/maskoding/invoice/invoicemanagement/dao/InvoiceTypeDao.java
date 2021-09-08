package org.maskoding.invoice.invoicemanagement.dao;

import org.maskoding.invoice.invoicemanagement.entity.InvoiceType;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface InvoiceTypeDao extends PagingAndSortingRepository<InvoiceType,String>{
    
}
