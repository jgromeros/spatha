package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.thirdparty.Supplier;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Supplier.class, beanName = "supplierMB")
public class SupplierMB {
}
