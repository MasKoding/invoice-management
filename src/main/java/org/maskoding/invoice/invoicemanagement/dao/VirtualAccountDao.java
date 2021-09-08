package org.maskoding.invoice.invoicemanagement.dao;

import org.maskoding.invoice.invoicemanagement.entity.VirtualAccount;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface VirtualAccountDao extends PagingAndSortingRepository<VirtualAccount,String> {
    
}
