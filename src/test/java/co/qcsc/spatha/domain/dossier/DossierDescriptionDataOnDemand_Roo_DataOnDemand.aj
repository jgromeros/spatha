// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.domain.dossier;

import co.qcsc.spatha.db.dossier.DossierDescriptionRepository;
import co.qcsc.spatha.domain.dossier.DossierDescription;
import co.qcsc.spatha.domain.dossier.DossierDescriptionDataOnDemand;
import co.qcsc.spatha.domain.thirdparty.ClientDataOnDemand;
import co.qcsc.spatha.service.dossier.DossierDescriptionService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect DossierDescriptionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: DossierDescriptionDataOnDemand: @Component;
    
    private Random DossierDescriptionDataOnDemand.rnd = new SecureRandom();
    
    private List<DossierDescription> DossierDescriptionDataOnDemand.data;
    
    @Autowired
    ClientDataOnDemand DossierDescriptionDataOnDemand.clientDataOnDemand;
    
    @Autowired
    DossierDescriptionService DossierDescriptionDataOnDemand.dossierDescriptionService;
    
    @Autowired
    DossierDescriptionRepository DossierDescriptionDataOnDemand.dossierDescriptionRepository;
    
    public DossierDescription DossierDescriptionDataOnDemand.getNewTransientDossierDescription(int index) {
        DossierDescription obj = new DossierDescription();
        setName(obj, index);
        setValid(obj, index);
        return obj;
    }
    
    public void DossierDescriptionDataOnDemand.setName(DossierDescription obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void DossierDescriptionDataOnDemand.setValid(DossierDescription obj, int index) {
        Boolean valid = Boolean.TRUE;
        obj.setValid(valid);
    }
    
    public DossierDescription DossierDescriptionDataOnDemand.getSpecificDossierDescription(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        DossierDescription obj = data.get(index);
        Long id = obj.getId();
        return dossierDescriptionService.findDossierDescription(id);
    }
    
    public DossierDescription DossierDescriptionDataOnDemand.getRandomDossierDescription() {
        init();
        DossierDescription obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return dossierDescriptionService.findDossierDescription(id);
    }
    
    public boolean DossierDescriptionDataOnDemand.modifyDossierDescription(DossierDescription obj) {
        return false;
    }
    
    public void DossierDescriptionDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = dossierDescriptionService.findDossierDescriptionEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'DossierDescription' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<DossierDescription>();
        for (int i = 0; i < 10; i++) {
            DossierDescription obj = getNewTransientDossierDescription(i);
            try {
                dossierDescriptionService.saveDossierDescription(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            dossierDescriptionRepository.flush();
            data.add(obj);
        }
    }
    
}
