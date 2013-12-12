// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.domain.dossier;

import co.qcsc.spatha.db.dossier.DossierItemRepository;
import co.qcsc.spatha.domain.dossier.DocumentTypeDataOnDemand;
import co.qcsc.spatha.domain.dossier.DossierDataOnDemand;
import co.qcsc.spatha.domain.dossier.DossierItem;
import co.qcsc.spatha.domain.dossier.DossierItemDataOnDemand;
import co.qcsc.spatha.service.dossier.DossierItemService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect DossierItemDataOnDemand_Roo_DataOnDemand {
    
    declare @type: DossierItemDataOnDemand: @Component;
    
    private Random DossierItemDataOnDemand.rnd = new SecureRandom();
    
    private List<DossierItem> DossierItemDataOnDemand.data;
    
    @Autowired
    DocumentTypeDataOnDemand DossierItemDataOnDemand.documentTypeDataOnDemand;
    
    @Autowired
    DossierDataOnDemand DossierItemDataOnDemand.dossierDataOnDemand;
    
    @Autowired
    DossierItemService DossierItemDataOnDemand.dossierItemService;
    
    @Autowired
    DossierItemRepository DossierItemDataOnDemand.dossierItemRepository;
    
    public DossierItem DossierItemDataOnDemand.getNewTransientDossierItem(int index) {
        DossierItem obj = new DossierItem();
        return obj;
    }
    
    public DossierItem DossierItemDataOnDemand.getSpecificDossierItem(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        DossierItem obj = data.get(index);
        Long id = obj.getId();
        return dossierItemService.findDossierItem(id);
    }
    
    public DossierItem DossierItemDataOnDemand.getRandomDossierItem() {
        init();
        DossierItem obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return dossierItemService.findDossierItem(id);
    }
    
    public boolean DossierItemDataOnDemand.modifyDossierItem(DossierItem obj) {
        return false;
    }
    
    public void DossierItemDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = dossierItemService.findDossierItemEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'DossierItem' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<DossierItem>();
        for (int i = 0; i < 10; i++) {
            DossierItem obj = getNewTransientDossierItem(i);
            try {
                dossierItemService.saveDossierItem(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            dossierItemRepository.flush();
            data.add(obj);
        }
    }
    
}
