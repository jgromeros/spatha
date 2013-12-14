package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.purchase.PurchaseOrder;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = PurchaseOrder.class, beanName = "purchaseOrderMB")
public class PurchaseOrderMB {
}
