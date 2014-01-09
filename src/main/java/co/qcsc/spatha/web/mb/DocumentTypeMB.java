package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.dossier.DocumentType;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = DocumentType.class, beanName = "documentTypeMB")
public class DocumentTypeMB {
}
