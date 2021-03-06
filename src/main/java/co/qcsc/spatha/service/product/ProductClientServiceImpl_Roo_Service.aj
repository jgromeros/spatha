// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.service.product;

import co.qcsc.spatha.db.product.ProductClientRepository;
import co.qcsc.spatha.domain.product.ProductClient;
import co.qcsc.spatha.service.product.ProductClientServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProductClientServiceImpl_Roo_Service {
    
    declare @type: ProductClientServiceImpl: @Service;
    
    declare @type: ProductClientServiceImpl: @Transactional;
    
    @Autowired
    ProductClientRepository ProductClientServiceImpl.productClientRepository;
    
    public long ProductClientServiceImpl.countAllProductClients() {
        return productClientRepository.count();
    }
    
    public void ProductClientServiceImpl.deleteProductClient(ProductClient productClient) {
        productClientRepository.delete(productClient);
    }
    
    public ProductClient ProductClientServiceImpl.findProductClient(Long id) {
        return productClientRepository.findOne(id);
    }
    
    public List<ProductClient> ProductClientServiceImpl.findAllProductClients() {
        return productClientRepository.findAll();
    }
    
    public List<ProductClient> ProductClientServiceImpl.findProductClientEntries(int firstResult, int maxResults) {
        return productClientRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void ProductClientServiceImpl.saveProductClient(ProductClient productClient) {
        productClientRepository.save(productClient);
    }
    
    public ProductClient ProductClientServiceImpl.updateProductClient(ProductClient productClient) {
        return productClientRepository.save(productClient);
    }
    
}
