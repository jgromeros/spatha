package co.qcsc.spatha.db.dossier;
import co.qcsc.spatha.domain.dossier.DossierDescription;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = DossierDescription.class)
public interface DossierDescriptionRepository {
}
