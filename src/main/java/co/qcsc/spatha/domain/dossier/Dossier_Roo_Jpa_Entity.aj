// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.domain.dossier;

import co.qcsc.spatha.domain.dossier.Dossier;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Dossier_Roo_Jpa_Entity {
    
    declare @type: Dossier: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Dossier.id;
    
    @Version
    @Column(name = "version")
    private Integer Dossier.version;
    
    public Long Dossier.getId() {
        return this.id;
    }
    
    public void Dossier.setId(Long id) {
        this.id = id;
    }
    
    public Integer Dossier.getVersion() {
        return this.version;
    }
    
    public void Dossier.setVersion(Integer version) {
        this.version = version;
    }
    
}