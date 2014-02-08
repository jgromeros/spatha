package co.qcsc.spatha.service.dossier;

import java.util.List;

import co.qcsc.spatha.domain.dossier.DossierDescription;
import co.qcsc.spatha.domain.thirdparty.Client;

public class DossierDescriptionServiceImpl implements DossierDescriptionService {

    public List<DossierDescription> findDossierDescriptionByClient(Client client) {
        return dossierDescriptionRepository.findDossierDescriptionByClient(client);
    }

}
