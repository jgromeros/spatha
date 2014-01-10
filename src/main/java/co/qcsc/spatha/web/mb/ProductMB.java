package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.product.Product;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Product.class, beanName = "productMB")
public class ProductMB {
}
