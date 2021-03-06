// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.service.product;

import co.qcsc.spatha.db.product.ProductSpecialtyRepository;
import co.qcsc.spatha.domain.product.ProductSpecialty;
import co.qcsc.spatha.service.product.ProductSpecialtyServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProductSpecialtyServiceImpl_Roo_Service {
    
    declare @type: ProductSpecialtyServiceImpl: @Service;
    
    declare @type: ProductSpecialtyServiceImpl: @Transactional;
    
    @Autowired
    ProductSpecialtyRepository ProductSpecialtyServiceImpl.productSpecialtyRepository;
    
    public long ProductSpecialtyServiceImpl.countAllProductSpecialtys() {
        return productSpecialtyRepository.count();
    }
    
    public void ProductSpecialtyServiceImpl.deleteProductSpecialty(ProductSpecialty productSpecialty) {
        productSpecialtyRepository.delete(productSpecialty);
    }
    
    public ProductSpecialty ProductSpecialtyServiceImpl.findProductSpecialty(Long id) {
        return productSpecialtyRepository.findOne(id);
    }
    
    public List<ProductSpecialty> ProductSpecialtyServiceImpl.findAllProductSpecialtys() {
        return productSpecialtyRepository.findAll();
    }
    
    public List<ProductSpecialty> ProductSpecialtyServiceImpl.findProductSpecialtyEntries(int firstResult, int maxResults) {
        return productSpecialtyRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void ProductSpecialtyServiceImpl.saveProductSpecialty(ProductSpecialty productSpecialty) {
        productSpecialtyRepository.save(productSpecialty);
    }
    
    public ProductSpecialty ProductSpecialtyServiceImpl.updateProductSpecialty(ProductSpecialty productSpecialty) {
        return productSpecialtyRepository.save(productSpecialty);
    }
    
}
