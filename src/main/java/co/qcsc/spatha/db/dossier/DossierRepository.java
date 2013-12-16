package co.qcsc.spatha.db.dossier;
import co.qcsc.spatha.domain.dossier.Dossier;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Dossier.class)
public interface DossierRepository {
}
