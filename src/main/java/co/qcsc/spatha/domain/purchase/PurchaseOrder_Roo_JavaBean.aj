// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.domain.purchase;

import co.qcsc.spatha.domain.purchase.OrderItem;
import co.qcsc.spatha.domain.purchase.PurchaseOrder;
import co.qcsc.spatha.domain.thirdparty.Client;
import co.qcsc.spatha.domain.thirdparty.Supplier;
import java.util.Set;

privileged aspect PurchaseOrder_Roo_JavaBean {
    
    public String PurchaseOrder.getNumberOrder() {
        return this.numberOrder;
    }
    
    public void PurchaseOrder.setNumberOrder(String numberOrder) {
        this.numberOrder = numberOrder;
    }
    
    public String PurchaseOrder.getSupplierContact() {
        return this.supplierContact;
    }
    
    public void PurchaseOrder.setSupplierContact(String supplierContact) {
        this.supplierContact = supplierContact;
    }
    
    public String PurchaseOrder.getClientContact() {
        return this.clientContact;
    }
    
    public void PurchaseOrder.setClientContact(String clientContact) {
        this.clientContact = clientContact;
    }
    
    public String PurchaseOrder.getSupplierPhone() {
        return this.supplierPhone;
    }
    
    public void PurchaseOrder.setSupplierPhone(String supplierPhone) {
        this.supplierPhone = supplierPhone;
    }
    
    public String PurchaseOrder.getClientPhone() {
        return this.clientPhone;
    }
    
    public void PurchaseOrder.setClientPhone(String clientPhone) {
        this.clientPhone = clientPhone;
    }
    
    public String PurchaseOrder.getSupplierEmail() {
        return this.supplierEmail;
    }
    
    public void PurchaseOrder.setSupplierEmail(String supplierEmail) {
        this.supplierEmail = supplierEmail;
    }
    
    public String PurchaseOrder.getClientEmail() {
        return this.clientEmail;
    }
    
    public void PurchaseOrder.setClientEmail(String clientEmail) {
        this.clientEmail = clientEmail;
    }
    
    public String PurchaseOrder.getState() {
        return this.state;
    }
    
    public void PurchaseOrder.setState(String state) {
        this.state = state;
    }
    
    public Client PurchaseOrder.getClient() {
        return this.client;
    }
    
    public void PurchaseOrder.setClient(Client client) {
        this.client = client;
    }
    
    public Supplier PurchaseOrder.getSupplier() {
        return this.supplier;
    }
    
    public void PurchaseOrder.setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }
    
    public Set<OrderItem> PurchaseOrder.getItems() {
        return this.items;
    }
    
    public void PurchaseOrder.setItems(Set<OrderItem> items) {
        this.items = items;
    }
    
}
