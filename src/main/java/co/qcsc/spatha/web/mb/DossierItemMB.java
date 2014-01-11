package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.dossier.DossierItem;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = DossierItem.class, beanName = "dossierItemMB")
public class DossierItemMB {
}
