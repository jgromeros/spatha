// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.domain.dossier;

import co.qcsc.spatha.domain.dossier.Dossier;
import co.qcsc.spatha.domain.dossier.DossierItem;
import co.qcsc.spatha.domain.product.ProductSpecialty;
import co.qcsc.spatha.domain.purchase.OrderItem;
import java.util.Set;

privileged aspect Dossier_Roo_JavaBean {
    
    public Boolean Dossier.getTemplate() {
        return this.template;
    }
    
    public void Dossier.setTemplate(Boolean template) {
        this.template = template;
    }
    
    public OrderItem Dossier.getOrderItem() {
        return this.orderItem;
    }
    
    public void Dossier.setOrderItem(OrderItem orderItem) {
        this.orderItem = orderItem;
    }
    
    public ProductSpecialty Dossier.getSpecialty() {
        return this.specialty;
    }
    
    public void Dossier.setSpecialty(ProductSpecialty specialty) {
        this.specialty = specialty;
    }
    
    public Set<DossierItem> Dossier.getItems() {
        return this.items;
    }
    
    public void Dossier.setItems(Set<DossierItem> items) {
        this.items = items;
    }
    
}
