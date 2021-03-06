// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.web.mb;

import co.qcsc.spatha.domain.dossier.Dossier;
import co.qcsc.spatha.domain.dossier.DossierItem;
import co.qcsc.spatha.domain.product.ProductSpecialty;
import co.qcsc.spatha.domain.purchase.OrderItem;
import co.qcsc.spatha.service.dossier.DossierService;
import co.qcsc.spatha.service.product.ProductSpecialtyService;
import co.qcsc.spatha.service.purchase.OrderItemService;
import co.qcsc.spatha.web.mb.DossierMB;
import co.qcsc.spatha.web.mb.converter.OrderItemConverter;
import co.qcsc.spatha.web.mb.converter.ProductSpecialtyConverter;
import co.qcsc.spatha.web.mb.util.MessageFactory;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.component.selectbooleancheckbox.SelectBooleanCheckbox;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect DossierMB_Roo_ManagedBean {
    
    declare @type: DossierMB: @ManagedBean(name = "dossierMB");
    
    declare @type: DossierMB: @SessionScoped;
    
    @Autowired
    DossierService DossierMB.dossierService;
    
    @Autowired
    OrderItemService DossierMB.orderItemService;
    
    @Autowired
    ProductSpecialtyService DossierMB.productSpecialtyService;
    
    private String DossierMB.name = "Dossiers";
    
    private Dossier DossierMB.dossier;
    
    private List<Dossier> DossierMB.allDossiers;
    
    private boolean DossierMB.dataVisible = false;
    
    private List<String> DossierMB.columns;
    
    private HtmlPanelGrid DossierMB.createPanelGrid;
    
    private HtmlPanelGrid DossierMB.editPanelGrid;
    
    private HtmlPanelGrid DossierMB.viewPanelGrid;
    
    private boolean DossierMB.createDialogVisible = false;
    
    private List<DossierItem> DossierMB.selectedItems;
    
    @PostConstruct
    public void DossierMB.init() {
        columns = new ArrayList<String>();
    }
    
    public String DossierMB.getName() {
        return name;
    }
    
    public List<String> DossierMB.getColumns() {
        return columns;
    }
    
    public List<Dossier> DossierMB.getAllDossiers() {
        return allDossiers;
    }
    
    public void DossierMB.setAllDossiers(List<Dossier> allDossiers) {
        this.allDossiers = allDossiers;
    }
    
    public String DossierMB.findAllDossiers() {
        allDossiers = dossierService.findAllDossiers();
        dataVisible = !allDossiers.isEmpty();
        return null;
    }
    
    public boolean DossierMB.isDataVisible() {
        return dataVisible;
    }
    
    public void DossierMB.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid DossierMB.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void DossierMB.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid DossierMB.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void DossierMB.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid DossierMB.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void DossierMB.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid DossierMB.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel templateCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        templateCreateOutput.setFor("templateCreateInput");
        templateCreateOutput.setId("templateCreateOutput");
        templateCreateOutput.setValue("Template:");
        htmlPanelGrid.getChildren().add(templateCreateOutput);
        
        SelectBooleanCheckbox templateCreateInput = (SelectBooleanCheckbox) application.createComponent(SelectBooleanCheckbox.COMPONENT_TYPE);
        templateCreateInput.setId("templateCreateInput");
        templateCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierMB.dossier.template}", Boolean.class));
        templateCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(templateCreateInput);
        
        Message templateCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        templateCreateInputMessage.setId("templateCreateInputMessage");
        templateCreateInputMessage.setFor("templateCreateInput");
        templateCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(templateCreateInputMessage);
        
        OutputLabel orderItemCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        orderItemCreateOutput.setFor("orderItemCreateInput");
        orderItemCreateOutput.setId("orderItemCreateOutput");
        orderItemCreateOutput.setValue("Order Item:");
        htmlPanelGrid.getChildren().add(orderItemCreateOutput);
        
        AutoComplete orderItemCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        orderItemCreateInput.setId("orderItemCreateInput");
        orderItemCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierMB.dossier.orderItem}", OrderItem.class));
        orderItemCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{dossierMB.completeOrderItem}", List.class, new Class[] { String.class }));
        orderItemCreateInput.setDropdown(true);
        orderItemCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "orderItem", String.class));
        orderItemCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{orderItem.quantity}", String.class));
        orderItemCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{orderItem}", OrderItem.class));
        orderItemCreateInput.setConverter(new OrderItemConverter());
        orderItemCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(orderItemCreateInput);
        
        Message orderItemCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        orderItemCreateInputMessage.setId("orderItemCreateInputMessage");
        orderItemCreateInputMessage.setFor("orderItemCreateInput");
        orderItemCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(orderItemCreateInputMessage);
        
        OutputLabel specialtyCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        specialtyCreateOutput.setFor("specialtyCreateInput");
        specialtyCreateOutput.setId("specialtyCreateOutput");
        specialtyCreateOutput.setValue("Specialty:");
        htmlPanelGrid.getChildren().add(specialtyCreateOutput);
        
        AutoComplete specialtyCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        specialtyCreateInput.setId("specialtyCreateInput");
        specialtyCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierMB.dossier.specialty}", ProductSpecialty.class));
        specialtyCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{dossierMB.completeSpecialty}", List.class, new Class[] { String.class }));
        specialtyCreateInput.setDropdown(true);
        specialtyCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "specialty", String.class));
        specialtyCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{specialty.id}", String.class));
        specialtyCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{specialty}", ProductSpecialty.class));
        specialtyCreateInput.setConverter(new ProductSpecialtyConverter());
        specialtyCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(specialtyCreateInput);
        
        Message specialtyCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        specialtyCreateInputMessage.setId("specialtyCreateInputMessage");
        specialtyCreateInputMessage.setFor("specialtyCreateInput");
        specialtyCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(specialtyCreateInputMessage);
        
        HtmlOutputText itemsCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemsCreateOutput.setId("itemsCreateOutput");
        itemsCreateOutput.setValue("Items:");
        htmlPanelGrid.getChildren().add(itemsCreateOutput);
        
        HtmlOutputText itemsCreateInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemsCreateInput.setId("itemsCreateInput");
        itemsCreateInput.setValue("This relationship is managed from the DossierItem side");
        htmlPanelGrid.getChildren().add(itemsCreateInput);
        
        Message itemsCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemsCreateInputMessage.setId("itemsCreateInputMessage");
        itemsCreateInputMessage.setFor("itemsCreateInput");
        itemsCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemsCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid DossierMB.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel templateEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        templateEditOutput.setFor("templateEditInput");
        templateEditOutput.setId("templateEditOutput");
        templateEditOutput.setValue("Template:");
        htmlPanelGrid.getChildren().add(templateEditOutput);
        
        SelectBooleanCheckbox templateEditInput = (SelectBooleanCheckbox) application.createComponent(SelectBooleanCheckbox.COMPONENT_TYPE);
        templateEditInput.setId("templateEditInput");
        templateEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierMB.dossier.template}", Boolean.class));
        templateEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(templateEditInput);
        
        Message templateEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        templateEditInputMessage.setId("templateEditInputMessage");
        templateEditInputMessage.setFor("templateEditInput");
        templateEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(templateEditInputMessage);
        
        OutputLabel orderItemEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        orderItemEditOutput.setFor("orderItemEditInput");
        orderItemEditOutput.setId("orderItemEditOutput");
        orderItemEditOutput.setValue("Order Item:");
        htmlPanelGrid.getChildren().add(orderItemEditOutput);
        
        AutoComplete orderItemEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        orderItemEditInput.setId("orderItemEditInput");
        orderItemEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierMB.dossier.orderItem}", OrderItem.class));
        orderItemEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{dossierMB.completeOrderItem}", List.class, new Class[] { String.class }));
        orderItemEditInput.setDropdown(true);
        orderItemEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "orderItem", String.class));
        orderItemEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{orderItem.quantity}", String.class));
        orderItemEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{orderItem}", OrderItem.class));
        orderItemEditInput.setConverter(new OrderItemConverter());
        orderItemEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(orderItemEditInput);
        
        Message orderItemEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        orderItemEditInputMessage.setId("orderItemEditInputMessage");
        orderItemEditInputMessage.setFor("orderItemEditInput");
        orderItemEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(orderItemEditInputMessage);
        
        OutputLabel specialtyEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        specialtyEditOutput.setFor("specialtyEditInput");
        specialtyEditOutput.setId("specialtyEditOutput");
        specialtyEditOutput.setValue("Specialty:");
        htmlPanelGrid.getChildren().add(specialtyEditOutput);
        
        AutoComplete specialtyEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        specialtyEditInput.setId("specialtyEditInput");
        specialtyEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierMB.dossier.specialty}", ProductSpecialty.class));
        specialtyEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{dossierMB.completeSpecialty}", List.class, new Class[] { String.class }));
        specialtyEditInput.setDropdown(true);
        specialtyEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "specialty", String.class));
        specialtyEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{specialty.id}", String.class));
        specialtyEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{specialty}", ProductSpecialty.class));
        specialtyEditInput.setConverter(new ProductSpecialtyConverter());
        specialtyEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(specialtyEditInput);
        
        Message specialtyEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        specialtyEditInputMessage.setId("specialtyEditInputMessage");
        specialtyEditInputMessage.setFor("specialtyEditInput");
        specialtyEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(specialtyEditInputMessage);
        
        HtmlOutputText itemsEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemsEditOutput.setId("itemsEditOutput");
        itemsEditOutput.setValue("Items:");
        htmlPanelGrid.getChildren().add(itemsEditOutput);
        
        HtmlOutputText itemsEditInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemsEditInput.setId("itemsEditInput");
        itemsEditInput.setValue("This relationship is managed from the DossierItem side");
        htmlPanelGrid.getChildren().add(itemsEditInput);
        
        Message itemsEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemsEditInputMessage.setId("itemsEditInputMessage");
        itemsEditInputMessage.setFor("itemsEditInput");
        itemsEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemsEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid DossierMB.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText templateLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        templateLabel.setId("templateLabel");
        templateLabel.setValue("Template:");
        htmlPanelGrid.getChildren().add(templateLabel);
        
        HtmlOutputText templateValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        templateValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierMB.dossier.template}", String.class));
        htmlPanelGrid.getChildren().add(templateValue);
        
        HtmlOutputText orderItemLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        orderItemLabel.setId("orderItemLabel");
        orderItemLabel.setValue("Order Item:");
        htmlPanelGrid.getChildren().add(orderItemLabel);
        
        HtmlOutputText orderItemValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        orderItemValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierMB.dossier.orderItem}", OrderItem.class));
        orderItemValue.setConverter(new OrderItemConverter());
        htmlPanelGrid.getChildren().add(orderItemValue);
        
        HtmlOutputText specialtyLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        specialtyLabel.setId("specialtyLabel");
        specialtyLabel.setValue("Specialty:");
        htmlPanelGrid.getChildren().add(specialtyLabel);
        
        HtmlOutputText specialtyValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        specialtyValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierMB.dossier.specialty}", ProductSpecialty.class));
        specialtyValue.setConverter(new ProductSpecialtyConverter());
        htmlPanelGrid.getChildren().add(specialtyValue);
        
        HtmlOutputText itemsLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemsLabel.setId("itemsLabel");
        itemsLabel.setValue("Items:");
        htmlPanelGrid.getChildren().add(itemsLabel);
        
        HtmlOutputText itemsValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemsValue.setId("itemsValue");
        itemsValue.setValue("This relationship is managed from the DossierItem side");
        htmlPanelGrid.getChildren().add(itemsValue);
        
        return htmlPanelGrid;
    }
    
    public Dossier DossierMB.getDossier() {
        if (dossier == null) {
            dossier = new Dossier();
        }
        return dossier;
    }
    
    public void DossierMB.setDossier(Dossier dossier) {
        this.dossier = dossier;
    }
    
    public List<OrderItem> DossierMB.completeOrderItem(String query) {
        List<OrderItem> suggestions = new ArrayList<OrderItem>();
        for (OrderItem orderItem : orderItemService.findAllOrderItems()) {
            String orderItemStr = String.valueOf(orderItem.getQuantity());
            if (orderItemStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(orderItem);
            }
        }
        return suggestions;
    }
    
    public List<ProductSpecialty> DossierMB.completeSpecialty(String query) {
        List<ProductSpecialty> suggestions = new ArrayList<ProductSpecialty>();
        for (ProductSpecialty productSpecialty : productSpecialtyService.findAllProductSpecialtys()) {
            String productSpecialtyStr = String.valueOf(productSpecialty.getId());
            if (productSpecialtyStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(productSpecialty);
            }
        }
        return suggestions;
    }
    
    public List<DossierItem> DossierMB.getSelectedItems() {
        return selectedItems;
    }
    
    public void DossierMB.setSelectedItems(List<DossierItem> selectedItems) {
        if (selectedItems != null) {
            dossier.setItems(new HashSet<DossierItem>(selectedItems));
        }
        this.selectedItems = selectedItems;
    }
    
    public String DossierMB.onEdit() {
        if (dossier != null && dossier.getItems() != null) {
            selectedItems = new ArrayList<DossierItem>(dossier.getItems());
        }
        return null;
    }
    
    public boolean DossierMB.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void DossierMB.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String DossierMB.displayList() {
        createDialogVisible = false;
        findAllDossiers();
        return "dossier";
    }
    
    public String DossierMB.displayCreateDialog() {
        dossier = new Dossier();
        createDialogVisible = true;
        return "dossier";
    }
    
    public String DossierMB.persist() {
        String message = "";
        if (dossier.getId() != null) {
            dossierService.updateDossier(dossier);
            message = "message_successfully_updated";
        } else {
            dossierService.saveDossier(dossier);
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "Dossier");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllDossiers();
    }
    
    public String DossierMB.delete() {
        dossierService.deleteDossier(dossier);
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "Dossier");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllDossiers();
    }
    
    public void DossierMB.reset() {
        dossier = null;
        selectedItems = null;
        createDialogVisible = false;
    }
    
    public void DossierMB.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
