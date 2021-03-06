// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.service.thirdparty;

import co.qcsc.spatha.db.thirdparty.SupplierRepository;
import co.qcsc.spatha.domain.thirdparty.Supplier;
import co.qcsc.spatha.service.thirdparty.SupplierServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SupplierServiceImpl_Roo_Service {
    
    declare @type: SupplierServiceImpl: @Service;
    
    declare @type: SupplierServiceImpl: @Transactional;
    
    @Autowired
    SupplierRepository SupplierServiceImpl.supplierRepository;
    
    public long SupplierServiceImpl.countAllSuppliers() {
        return supplierRepository.count();
    }
    
    public void SupplierServiceImpl.deleteSupplier(Supplier supplier) {
        supplierRepository.delete(supplier);
    }
    
    public Supplier SupplierServiceImpl.findSupplier(Long id) {
        return supplierRepository.findOne(id);
    }
    
    public List<Supplier> SupplierServiceImpl.findAllSuppliers() {
        return supplierRepository.findAll();
    }
    
    public List<Supplier> SupplierServiceImpl.findSupplierEntries(int firstResult, int maxResults) {
        return supplierRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void SupplierServiceImpl.saveSupplier(Supplier supplier) {
        supplierRepository.save(supplier);
    }
    
    public Supplier SupplierServiceImpl.updateSupplier(Supplier supplier) {
        return supplierRepository.save(supplier);
    }
    
}
