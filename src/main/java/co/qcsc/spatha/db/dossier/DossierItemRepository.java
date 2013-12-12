package co.qcsc.spatha.db.dossier;
import co.qcsc.spatha.domain.dossier.DossierItem;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = DossierItem.class)
public interface DossierItemRepository {
}
