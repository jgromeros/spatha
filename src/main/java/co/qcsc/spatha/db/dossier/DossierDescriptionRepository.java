package co.qcsc.spatha.db.dossier;
import java.util.List;

import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;
import org.springframework.transaction.annotation.Transactional;

import co.qcsc.spatha.domain.dossier.DossierDescription;
import co.qcsc.spatha.domain.thirdparty.Client;

@RooJpaRepository(domainType = DossierDescription.class)
public interface DossierDescriptionRepository {
    
    @Transactional(readOnly = true)
    List<DossierDescription> findDossierDescriptionByClient(@Param("client") Client client);

}
