package co.qcsc.spatha.web.mb;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

import co.qcsc.spatha.domain.dossier.Dossier;
import co.qcsc.spatha.domain.product.Specialty;
import co.qcsc.spatha.domain.purchase.OrderItem;
import co.qcsc.spatha.domain.purchase.PurchaseOrder;
import co.qcsc.spatha.domain.thirdparty.Client;
import co.qcsc.spatha.service.product.SpecialtyService;
import co.qcsc.spatha.service.purchase.PurchaseOrderService;
import co.qcsc.spatha.service.thirdparty.ClientService;

@RooSerializable
@RooJsfManagedBean(entity = Dossier.class, beanName = "dossierMB")
public class DossierMB {

    @Autowired
    PurchaseOrderService poService;

    @Autowired
    ClientService clientService;
    
    @Autowired
    SpecialtyService specialtyService;

    private Client client;
    private List<PurchaseOrder> purchaseOrders;
    private PurchaseOrder purchaseOrder;
    private Dossier dossier;
    private OrderItem orderItem;

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

    public String displayCreateDialog() {
        if (orderItem.getDossiers() == null){
            orderItem.setDossiers(new HashSet<Dossier>());
        }
        dossier = new Dossier();
        return "dossier";
    }

    /**
     * Autocomplete method for returning the list of specialties matching the query for an
     * autocomplete component 
     * @param query
     * @return
     */
    public List<Specialty> completeSpecialty(String query) {
        List<Specialty> suggestions = new ArrayList<Specialty>();
        for (Specialty specialty : specialtyService.findAllSpecialtys()) {
            String specialtyStr = String.valueOf(specialty.getName());
            if (specialtyStr.toLowerCase().contains(query.toLowerCase())) {
                suggestions.add(specialty);
            }
        }
        return suggestions;
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

    public PurchaseOrder getPurchaseOrder() {
        return purchaseOrder;
    }

    public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
        this.purchaseOrder = purchaseOrder;
    }

    public OrderItem getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderItem orderItem) {
        this.orderItem = orderItem;
    }
}
