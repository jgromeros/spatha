// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.domain.product;

import co.qcsc.spatha.db.product.ProductClientRepository;
import co.qcsc.spatha.domain.product.ProductClient;
import co.qcsc.spatha.domain.product.ProductClientDataOnDemand;
import co.qcsc.spatha.domain.product.ProductDataOnDemand;
import co.qcsc.spatha.domain.thirdparty.Client;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ProductClientDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProductClientDataOnDemand: @Component;
    
    private Random ProductClientDataOnDemand.rnd = new SecureRandom();
    
    private List<ProductClient> ProductClientDataOnDemand.data;
    
    @Autowired
    ProductDataOnDemand ProductClientDataOnDemand.productDataOnDemand;
    
    @Autowired
    ProductClientRepository ProductClientDataOnDemand.productClientRepository;
    
    public ProductClient ProductClientDataOnDemand.getNewTransientProductClient(int index) {
        ProductClient obj = new ProductClient();
        setClient(obj, index);
        setCode(obj, index);
        return obj;
    }
    
    public void ProductClientDataOnDemand.setClient(ProductClient obj, int index) {
        Client client = null;
        obj.setClient(client);
    }
    
    public void ProductClientDataOnDemand.setCode(ProductClient obj, int index) {
        String code = "code_" + index;
        obj.setCode(code);
    }
    
    public ProductClient ProductClientDataOnDemand.getSpecificProductClient(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ProductClient obj = data.get(index);
        Long id = obj.getId();
        return productClientRepository.findOne(id);
    }
    
    public ProductClient ProductClientDataOnDemand.getRandomProductClient() {
        init();
        ProductClient obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return productClientRepository.findOne(id);
    }
    
    public boolean ProductClientDataOnDemand.modifyProductClient(ProductClient obj) {
        return false;
    }
    
    public void ProductClientDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = productClientRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ProductClient' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ProductClient>();
        for (int i = 0; i < 10; i++) {
            ProductClient obj = getNewTransientProductClient(i);
            try {
                productClientRepository.save(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            productClientRepository.flush();
            data.add(obj);
        }
    }
    
}
