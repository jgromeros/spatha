package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.purchase.OrderItem;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = OrderItem.class, beanName = "orderItemMB")
public class OrderItemMB {
}
