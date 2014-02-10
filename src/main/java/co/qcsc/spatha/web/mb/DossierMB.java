package co.qcsc.spatha.web.mb;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;

import org.primefaces.context.RequestContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

import co.qcsc.spatha.domain.dossier.DocumentType;
import co.qcsc.spatha.domain.dossier.Dossier;
import co.qcsc.spatha.domain.dossier.DossierDescription;
import co.qcsc.spatha.domain.dossier.DossierItem;
import co.qcsc.spatha.domain.product.Specialty;
import co.qcsc.spatha.domain.purchase.OrderItem;
import co.qcsc.spatha.domain.purchase.PurchaseOrder;
import co.qcsc.spatha.domain.thirdparty.Client;
import co.qcsc.spatha.service.dossier.DossierDescriptionService;
import co.qcsc.spatha.service.product.SpecialtyService;
import co.qcsc.spatha.service.purchase.PurchaseOrderService;
import co.qcsc.spatha.service.thirdparty.ClientService;
import co.qcsc.spatha.web.mb.util.MessageFactory;

@RooSerializable
@RooJsfManagedBean(entity = Dossier.class, beanName = "dossierMB")
public class DossierMB {

    @Autowired
    PurchaseOrderService poService;

    @Autowired
    ClientService clientService;
    
    @Autowired
    SpecialtyService specialtyService;

    @Autowired
    DossierDescriptionService dossierDescriptionService;

    private Client client;
    private List<PurchaseOrder> purchaseOrders;
    private PurchaseOrder purchaseOrder;
    private List<Dossier> dossiers;
    private OrderItem orderItem;
    private DossierItem dossierItem;

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

    /**
     * Creates a new list of empty dossiers, assigning it to the orderItem selected.
     * Each documentType that is part of the correspondant dossierDescription is created
     * and defaulted to added true. This way, every document is initially part of the dossier
     * index.
     * @return
     */
    public String displayCreateDialog() {
        orderItem.setDossiers(new HashSet<Dossier>());
        dossiers = new ArrayList<Dossier>();
        for (DossierDescription dossierDescription : dossierDescriptionService.
                findDossierDescriptionByClient(client)){
            Dossier dossier = new Dossier();
            dossier.setOrderItem(orderItem);
            dossier.setItems(new HashSet<DossierItem>());
            for (DocumentType documentType : dossierDescription.getDocumentTypes()){
                DossierItem dossierItem = new DossierItem();
                dossierItem.setDocumentType(documentType);
                dossierItem.setDossier(dossier);
                dossierItem.setAdded(Boolean.TRUE);
                dossier.getItems().add(dossierItem);
            }
            getDossiers().add(dossier);
        }
        return "dossier";
    }

    public String displayEditDialog() {
        dossiers = orderItem.getDossiersList();
        for (Dossier dossierTmp : getDossiers()){
            getDossier().setSpecialty(dossierTmp.getSpecialty());
            dossierTmp.getItemsList();
        }
        return "dossier";
    }

    /**
     * Navigates to dossier
     * @return
     */
    public String displayOrderItem() {
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

    public String persist() {
        String message = "";
        for (Dossier dossierTmp : getDossiers()){
            dossierTmp.setSpecialty(getDossier().getSpecialty());
        }
        orderItem.getDossiers().addAll(getDossiers());
        orderItemService.updateOrderItem(orderItem);
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("dossierDialogWidget.hide()");
        FacesMessage facesMessage = MessageFactory.getMessage(message, "Dossier");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return "dossier";
    }

    public boolean isCreateEnabled() {
        purchaseOrder = poService.findPurchaseOrder(purchaseOrder.getId());
        orderItem = orderItemService.findOrderItem(orderItem.getId());
        if (orderItem.getDossiers().size() > 0){
            return Boolean.FALSE;
        }
        return Boolean.TRUE;
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

    public List<Dossier> getDossiers() {
        return dossiers;
    }

    public void setDossiers(List<Dossier> dossiers) {
        this.dossiers = dossiers;
    }

    public DossierItem getDossierItem() {
        return dossierItem;
    }

    public void setDossierItem(DossierItem dossierItem) {
        this.dossierItem = dossierItem;
    }

}
