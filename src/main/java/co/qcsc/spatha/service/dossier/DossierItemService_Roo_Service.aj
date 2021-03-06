// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.service.dossier;

import co.qcsc.spatha.domain.dossier.DossierItem;
import co.qcsc.spatha.service.dossier.DossierItemService;
import java.util.List;

privileged aspect DossierItemService_Roo_Service {
    
    public abstract long DossierItemService.countAllDossierItems();    
    public abstract void DossierItemService.deleteDossierItem(DossierItem dossierItem);    
    public abstract DossierItem DossierItemService.findDossierItem(Long id);    
    public abstract List<DossierItem> DossierItemService.findAllDossierItems();    
    public abstract List<DossierItem> DossierItemService.findDossierItemEntries(int firstResult, int maxResults);    
    public abstract void DossierItemService.saveDossierItem(DossierItem dossierItem);    
    public abstract DossierItem DossierItemService.updateDossierItem(DossierItem dossierItem);    
}
