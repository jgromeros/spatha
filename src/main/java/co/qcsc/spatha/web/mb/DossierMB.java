package co.qcsc.spatha.web.mb;
import java.util.List;

import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

import co.qcsc.spatha.domain.dossier.Dossier;
import co.qcsc.spatha.domain.thirdparty.Client;

@RooSerializable
@RooJsfManagedBean(entity = Dossier.class, beanName = "dossierMB")
public class DossierMB {

    private Client client;

    public List<Client> getClients() {
        return dossierService.findAllClients();
    }

    public String displayConsultPO() {
        return "consultPO";
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

}
