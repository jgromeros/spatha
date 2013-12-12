package co.qcsc.spatha.db.dossier;
import co.qcsc.spatha.domain.dossier.DocumentType;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = DocumentType.class)
public interface DocumentTypeRepository {
}
