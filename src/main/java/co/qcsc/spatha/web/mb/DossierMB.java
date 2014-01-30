package co.qcsc.spatha.web.mb;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

import co.qcsc.spatha.domain.dossier.Dossier;
import co.qcsc.spatha.domain.purchase.PurchaseOrder;
import co.qcsc.spatha.domain.thirdparty.Client;
import co.qcsc.spatha.service.purchase.PurchaseOrderService;
import co.qcsc.spatha.service.thirdparty.ClientService;

@RooSerializable
@RooJsfManagedBean(entity = Dossier.class, beanName = "dossierMB")
public class DossierMB {

    @Autowired
    PurchaseOrderService poService;

    @Autowired
    ClientService clientService;

    private Client client;
    private List<PurchaseOrder> purchaseOrders;

    public List<Client> getClients() {
        return clientService.findAllClients();
    }

    public String displayConsultPO() {
        return "consultPO";
    }

    public String findPurchaseOrders() {
        purchaseOrders = poService.findPurchaseOrderByClient(client);
        return "consultPO";
    }

    public String viewPO() {
        return "purchaseOrder";
    }

    public String viewIndex() {
        return "dossierIndex";
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public List<PurchaseOrder> getPurchaseOrders() {
        return purchaseOrders;
    }

    public void setPurchaseOrders(List<PurchaseOrder> purchaseOrders) {
        this.purchaseOrders = purchaseOrders;
    }

}
