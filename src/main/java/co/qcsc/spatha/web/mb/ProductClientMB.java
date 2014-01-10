package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.product.ProductClient;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = ProductClient.class, beanName = "productClientMB")
public class ProductClientMB {
}
