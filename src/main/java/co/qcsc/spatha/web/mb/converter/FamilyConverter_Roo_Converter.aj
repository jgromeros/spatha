// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.web.mb.converter;

import co.qcsc.spatha.domain.product.Family;
import co.qcsc.spatha.service.product.FamilyService;
import co.qcsc.spatha.web.mb.converter.FamilyConverter;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect FamilyConverter_Roo_Converter {
    
    declare parents: FamilyConverter implements Converter;
    
    declare @type: FamilyConverter: @FacesConverter("co.qcsc.spatha.web.mb.converter.FamilyConverter");
    
    @Autowired
    FamilyService FamilyConverter.familyService;
    
    public Object FamilyConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return familyService.findFamily(id);
    }
    
    public String FamilyConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof Family ? ((Family) value).getId().toString() : "";
    }
    
}