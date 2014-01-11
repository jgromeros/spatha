package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.dossier.Dossier;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Dossier.class, beanName = "dossierMB")
public class DossierMB {
}
