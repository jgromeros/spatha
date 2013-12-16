package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.product.Specialty;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Specialty.class, beanName = "specialtyMB")
public class SpecialtyMB {
}
