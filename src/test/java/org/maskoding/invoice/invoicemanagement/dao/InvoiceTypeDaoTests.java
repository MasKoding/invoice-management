package org.maskoding.invoice.invoicemanagement.dao;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.maskoding.invoice.invoicemanagement.entity.InvoiceType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class InvoiceTypeDaoTests {
    
    @Autowired InvoiceTypeDao invoiceTypeDao;


    @Test
    public void testInvoiceType(){

        InvoiceType it = new InvoiceType();
        it.setCode("IT-001");
        it.setName("Test 123");
        
        Assertions.assertNull(it.getId());
        invoiceTypeDao.save(it);
        
        Assertions.assertNotNull(it.getId());

    }
}
