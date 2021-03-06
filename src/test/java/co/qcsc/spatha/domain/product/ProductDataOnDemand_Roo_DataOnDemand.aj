// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.domain.product;

import co.qcsc.spatha.db.product.ProductRepository;
import co.qcsc.spatha.domain.product.FamilyDataOnDemand;
import co.qcsc.spatha.domain.product.Product;
import co.qcsc.spatha.domain.product.ProductDataOnDemand;
import co.qcsc.spatha.service.product.ProductService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ProductDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProductDataOnDemand: @Component;
    
    private Random ProductDataOnDemand.rnd = new SecureRandom();
    
    private List<Product> ProductDataOnDemand.data;
    
    @Autowired
    FamilyDataOnDemand ProductDataOnDemand.familyDataOnDemand;
    
    @Autowired
    ProductService ProductDataOnDemand.productService;
    
    @Autowired
    ProductRepository ProductDataOnDemand.productRepository;
    
    public Product ProductDataOnDemand.getNewTransientProduct(int index) {
        Product obj = new Product();
        setBrand(obj, index);
        setEnding(obj, index);
        setManufacturer(obj, index);
        setMaterial(obj, index);
        setName(obj, index);
        setOrigin(obj, index);
        setSchedule(obj, index);
        setSize(obj, index);
        setType(obj, index);
        return obj;
    }
    
    public void ProductDataOnDemand.setBrand(Product obj, int index) {
        String brand = "brand_" + index;
        obj.setBrand(brand);
    }
    
    public void ProductDataOnDemand.setEnding(Product obj, int index) {
        String ending = "ending_" + index;
        obj.setEnding(ending);
    }
    
    public void ProductDataOnDemand.setManufacturer(Product obj, int index) {
        String manufacturer = "manufacturer_" + index;
        obj.setManufacturer(manufacturer);
    }
    
    public void ProductDataOnDemand.setMaterial(Product obj, int index) {
        String material = "material_" + index;
        obj.setMaterial(material);
    }
    
    public void ProductDataOnDemand.setName(Product obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void ProductDataOnDemand.setOrigin(Product obj, int index) {
        String origin = "origin_" + index;
        obj.setOrigin(origin);
    }
    
    public void ProductDataOnDemand.setSchedule(Product obj, int index) {
        String schedule = "schedule_" + index;
        obj.setSchedule(schedule);
    }
    
    public void ProductDataOnDemand.setSize(Product obj, int index) {
        String size = "size_" + index;
        obj.setSize(size);
    }
    
    public void ProductDataOnDemand.setType(Product obj, int index) {
        String type = "type_" + index;
        obj.setType(type);
    }
    
    public Product ProductDataOnDemand.getSpecificProduct(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Product obj = data.get(index);
        Long id = obj.getId();
        return productService.findProduct(id);
    }
    
    public Product ProductDataOnDemand.getRandomProduct() {
        init();
        Product obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return productService.findProduct(id);
    }
    
    public boolean ProductDataOnDemand.modifyProduct(Product obj) {
        return false;
    }
    
    public void ProductDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = productService.findProductEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Product' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Product>();
        for (int i = 0; i < 10; i++) {
            Product obj = getNewTransientProduct(i);
            try {
                productService.saveProduct(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            productRepository.flush();
            data.add(obj);
        }
    }
    
}
