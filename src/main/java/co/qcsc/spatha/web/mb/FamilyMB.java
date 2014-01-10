package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.product.Family;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Family.class, beanName = "familyMB")
public class FamilyMB {
}
