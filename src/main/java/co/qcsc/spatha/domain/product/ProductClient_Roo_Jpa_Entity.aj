// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.domain.product;

import co.qcsc.spatha.domain.product.ProductClient;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect ProductClient_Roo_Jpa_Entity {
    
    declare @type: ProductClient: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ProductClient.id;
    
    @Version
    @Column(name = "version")
    private Integer ProductClient.version;
    
    public Long ProductClient.getId() {
        return this.id;
    }
    
    public void ProductClient.setId(Long id) {
        this.id = id;
    }
    
    public Integer ProductClient.getVersion() {
        return this.version;
    }
    
    public void ProductClient.setVersion(Integer version) {
        this.version = version;
    }
    
}
