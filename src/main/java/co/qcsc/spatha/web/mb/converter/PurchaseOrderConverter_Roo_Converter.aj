// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.web.mb.converter;

import co.qcsc.spatha.domain.purchase.PurchaseOrder;
import co.qcsc.spatha.service.purchase.PurchaseOrderService;
import co.qcsc.spatha.web.mb.converter.PurchaseOrderConverter;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect PurchaseOrderConverter_Roo_Converter {
    
    declare parents: PurchaseOrderConverter implements Converter;
    
    declare @type: PurchaseOrderConverter: @FacesConverter("co.qcsc.spatha.web.mb.converter.PurchaseOrderConverter");
    
    @Autowired
    PurchaseOrderService PurchaseOrderConverter.purchaseOrderService;
    
    public Object PurchaseOrderConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return purchaseOrderService.findPurchaseOrder(id);
    }
    
    public String PurchaseOrderConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof PurchaseOrder ? ((PurchaseOrder) value).getId().toString() : "";
    }
    
}
