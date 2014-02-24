// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.domain.dossier;

import co.qcsc.spatha.db.dossier.DossierItemFileRepository;
import co.qcsc.spatha.domain.dossier.DossierItemDataOnDemand;
import co.qcsc.spatha.domain.dossier.DossierItemFile;
import co.qcsc.spatha.domain.dossier.DossierItemFileDataOnDemand;
import co.qcsc.spatha.service.dossier.DossierItemFileService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect DossierItemFileDataOnDemand_Roo_DataOnDemand {
    
    declare @type: DossierItemFileDataOnDemand: @Component;
    
    private Random DossierItemFileDataOnDemand.rnd = new SecureRandom();
    
    private List<DossierItemFile> DossierItemFileDataOnDemand.data;
    
    @Autowired
    DossierItemDataOnDemand DossierItemFileDataOnDemand.dossierItemDataOnDemand;
    
    @Autowired
    DossierItemFileService DossierItemFileDataOnDemand.dossierItemFileService;
    
    @Autowired
    DossierItemFileRepository DossierItemFileDataOnDemand.dossierItemFileRepository;
    
    public DossierItemFile DossierItemFileDataOnDemand.getNewTransientDossierItemFile(int index) {
        DossierItemFile obj = new DossierItemFile();
        setItemFile(obj, index);
        setName(obj, index);
        setSystemVersion(obj, index);
        setUserVersion(obj, index);
        return obj;
    }
    
    public void DossierItemFileDataOnDemand.setItemFile(DossierItemFile obj, int index) {
        byte[] itemFile = String.valueOf(index).getBytes();
        obj.setItemFile(itemFile);
    }
    
    public void DossierItemFileDataOnDemand.setName(DossierItemFile obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void DossierItemFileDataOnDemand.setSystemVersion(DossierItemFile obj, int index) {
        Long systemVersion = new Integer(index).longValue();
        obj.setSystemVersion(systemVersion);
    }
    
    public void DossierItemFileDataOnDemand.setUserVersion(DossierItemFile obj, int index) {
        String userVersion = "userVersion_" + index;
        obj.setUserVersion(userVersion);
    }
    
    public DossierItemFile DossierItemFileDataOnDemand.getSpecificDossierItemFile(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        DossierItemFile obj = data.get(index);
        Long id = obj.getId();
        return dossierItemFileService.findDossierItemFile(id);
    }
    
    public DossierItemFile DossierItemFileDataOnDemand.getRandomDossierItemFile() {
        init();
        DossierItemFile obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return dossierItemFileService.findDossierItemFile(id);
    }
    
    public boolean DossierItemFileDataOnDemand.modifyDossierItemFile(DossierItemFile obj) {
        return false;
    }
    
    public void DossierItemFileDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = dossierItemFileService.findDossierItemFileEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'DossierItemFile' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<DossierItemFile>();
        for (int i = 0; i < 10; i++) {
            DossierItemFile obj = getNewTransientDossierItemFile(i);
            try {
                dossierItemFileService.saveDossierItemFile(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            dossierItemFileRepository.flush();
            data.add(obj);
        }
    }
    
}
