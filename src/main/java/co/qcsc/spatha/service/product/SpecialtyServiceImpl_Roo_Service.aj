// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.service.product;

import co.qcsc.spatha.db.product.SpecialtyRepository;
import co.qcsc.spatha.domain.product.Specialty;
import co.qcsc.spatha.service.product.SpecialtyServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SpecialtyServiceImpl_Roo_Service {
    
    declare @type: SpecialtyServiceImpl: @Service;
    
    declare @type: SpecialtyServiceImpl: @Transactional;
    
    @Autowired
    SpecialtyRepository SpecialtyServiceImpl.specialtyRepository;
    
    public long SpecialtyServiceImpl.countAllSpecialtys() {
        return specialtyRepository.count();
    }
    
    public void SpecialtyServiceImpl.deleteSpecialty(Specialty specialty) {
        specialtyRepository.delete(specialty);
    }
    
    public Specialty SpecialtyServiceImpl.findSpecialty(Long id) {
        return specialtyRepository.findOne(id);
    }
    
    public List<Specialty> SpecialtyServiceImpl.findAllSpecialtys() {
        return specialtyRepository.findAll();
    }
    
    public List<Specialty> SpecialtyServiceImpl.findSpecialtyEntries(int firstResult, int maxResults) {
        return specialtyRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void SpecialtyServiceImpl.saveSpecialty(Specialty specialty) {
        specialtyRepository.save(specialty);
    }
    
    public Specialty SpecialtyServiceImpl.updateSpecialty(Specialty specialty) {
        return specialtyRepository.save(specialty);
    }
    
}
