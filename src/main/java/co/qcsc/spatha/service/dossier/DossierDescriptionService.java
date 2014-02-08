package co.qcsc.spatha.service.dossier;
import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import co.qcsc.spatha.domain.dossier.DossierDescription;
import co.qcsc.spatha.domain.thirdparty.Client;

@RooService(domainTypes = { co.qcsc.spatha.domain.dossier.DossierDescription.class })
public interface DossierDescriptionService {

    List<DossierDescription> findDossierDescriptionByClient(Client client);

}
