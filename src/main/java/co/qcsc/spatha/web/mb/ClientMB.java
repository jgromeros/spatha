package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.thirdparty.Client;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Client.class, beanName = "clientMB")
public class ClientMB {
}
