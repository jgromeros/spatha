// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.domain.dossier;

import co.qcsc.spatha.domain.dossier.DocumentType;
import co.qcsc.spatha.domain.dossier.DossierDescription;

privileged aspect DocumentType_Roo_JavaBean {
    
    public String DocumentType.getCode() {
        return this.code;
    }
    
    public void DocumentType.setCode(String code) {
        this.code = code;
    }
    
    public String DocumentType.getName() {
        return this.name;
    }
    
    public void DocumentType.setName(String name) {
        this.name = name;
    }
    
    public Integer DocumentType.getDocumentOrder() {
        return this.documentOrder;
    }
    
    public void DocumentType.setDocumentOrder(Integer documentOrder) {
        this.documentOrder = documentOrder;
    }
    
    public DossierDescription DocumentType.getDossierDescription() {
        return this.dossierDescription;
    }
    
    public void DocumentType.setDossierDescription(DossierDescription dossierDescription) {
        this.dossierDescription = dossierDescription;
    }
    
}
