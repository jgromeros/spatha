// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.service.dossier;

import co.qcsc.spatha.db.dossier.DossierDescriptionRepository;
import co.qcsc.spatha.domain.dossier.DossierDescription;
import co.qcsc.spatha.service.dossier.DossierDescriptionServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DossierDescriptionServiceImpl_Roo_Service {
    
    declare @type: DossierDescriptionServiceImpl: @Service;
    
    declare @type: DossierDescriptionServiceImpl: @Transactional;
    
    @Autowired
    DossierDescriptionRepository DossierDescriptionServiceImpl.dossierDescriptionRepository;
    
    public long DossierDescriptionServiceImpl.countAllDossierDescriptions() {
        return dossierDescriptionRepository.count();
    }
    
    public void DossierDescriptionServiceImpl.deleteDossierDescription(DossierDescription dossierDescription) {
        dossierDescriptionRepository.delete(dossierDescription);
    }
    
    public DossierDescription DossierDescriptionServiceImpl.findDossierDescription(Long id) {
        return dossierDescriptionRepository.findOne(id);
    }
    
    public List<DossierDescription> DossierDescriptionServiceImpl.findAllDossierDescriptions() {
        return dossierDescriptionRepository.findAll();
    }
    
    public List<DossierDescription> DossierDescriptionServiceImpl.findDossierDescriptionEntries(int firstResult, int maxResults) {
        return dossierDescriptionRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void DossierDescriptionServiceImpl.saveDossierDescription(DossierDescription dossierDescription) {
        dossierDescriptionRepository.save(dossierDescription);
    }
    
    public DossierDescription DossierDescriptionServiceImpl.updateDossierDescription(DossierDescription dossierDescription) {
        return dossierDescriptionRepository.save(dossierDescription);
    }
    
}
