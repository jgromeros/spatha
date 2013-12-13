package co.qcsc.spatha.db.dossier;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import co.qcsc.spatha.domain.dossier.DossierItemFile;

@RooJpaRepository(domainType = DossierItemFile.class)
public interface DossierItemFileRepository {
}
