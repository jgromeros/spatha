// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.web.mb;

import co.qcsc.spatha.domain.product.Product;
import co.qcsc.spatha.domain.product.ProductClient;
import co.qcsc.spatha.domain.thirdparty.Client;
import co.qcsc.spatha.service.product.ProductClientService;
import co.qcsc.spatha.service.product.ProductService;
import co.qcsc.spatha.service.thirdparty.ClientService;
import co.qcsc.spatha.web.mb.ProductClientMB;
import co.qcsc.spatha.web.mb.converter.ClientConverter;
import co.qcsc.spatha.web.mb.converter.ProductConverter;
import co.qcsc.spatha.web.mb.util.MessageFactory;
import java.util.ArrayList;
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
import javax.faces.validator.LengthValidator;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect ProductClientMB_Roo_ManagedBean {
    
    declare @type: ProductClientMB: @ManagedBean(name = "productClientMB");
    
    declare @type: ProductClientMB: @SessionScoped;
    
    @Autowired
    ProductClientService ProductClientMB.productClientService;
    
    @Autowired
    ClientService ProductClientMB.clientService;
    
    @Autowired
    ProductService ProductClientMB.productService;
    
    private String ProductClientMB.name = "ProductClients";
    
    private ProductClient ProductClientMB.productClient;
    
    private List<ProductClient> ProductClientMB.allProductClients;
    
    private boolean ProductClientMB.dataVisible = false;
    
    private List<String> ProductClientMB.columns;
    
    private HtmlPanelGrid ProductClientMB.createPanelGrid;
    
    private HtmlPanelGrid ProductClientMB.editPanelGrid;
    
    private HtmlPanelGrid ProductClientMB.viewPanelGrid;
    
    private boolean ProductClientMB.createDialogVisible = false;
    
    @PostConstruct
    public void ProductClientMB.init() {
        columns = new ArrayList<String>();
        columns.add("code");
        columns.add("clientDescription");
    }
    
    public String ProductClientMB.getName() {
        return name;
    }
    
    public List<String> ProductClientMB.getColumns() {
        return columns;
    }
    
    public List<ProductClient> ProductClientMB.getAllProductClients() {
        return allProductClients;
    }
    
    public void ProductClientMB.setAllProductClients(List<ProductClient> allProductClients) {
        this.allProductClients = allProductClients;
    }
    
    public String ProductClientMB.findAllProductClients() {
        allProductClients = productClientService.findAllProductClients();
        dataVisible = !allProductClients.isEmpty();
        return null;
    }
    
    public boolean ProductClientMB.isDataVisible() {
        return dataVisible;
    }
    
    public void ProductClientMB.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid ProductClientMB.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void ProductClientMB.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid ProductClientMB.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void ProductClientMB.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid ProductClientMB.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void ProductClientMB.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid ProductClientMB.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel codeCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        codeCreateOutput.setFor("codeCreateInput");
        codeCreateOutput.setId("codeCreateOutput");
        codeCreateOutput.setValue("Code:");
        htmlPanelGrid.getChildren().add(codeCreateOutput);
        
        InputText codeCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        codeCreateInput.setId("codeCreateInput");
        codeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.code}", String.class));
        LengthValidator codeCreateInputValidator = new LengthValidator();
        codeCreateInputValidator.setMinimum(2);
        codeCreateInput.addValidator(codeCreateInputValidator);
        codeCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(codeCreateInput);
        
        Message codeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        codeCreateInputMessage.setId("codeCreateInputMessage");
        codeCreateInputMessage.setFor("codeCreateInput");
        codeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(codeCreateInputMessage);
        
        OutputLabel clientCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        clientCreateOutput.setFor("clientCreateInput");
        clientCreateOutput.setId("clientCreateOutput");
        clientCreateOutput.setValue("Client:");
        htmlPanelGrid.getChildren().add(clientCreateOutput);
        
        AutoComplete clientCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        clientCreateInput.setId("clientCreateInput");
        clientCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.client}", Client.class));
        clientCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{productClientMB.completeClient}", List.class, new Class[] { String.class }));
        clientCreateInput.setDropdown(true);
        clientCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "client", String.class));
        clientCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{client.identification} #{client.name}", String.class));
        clientCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{client}", Client.class));
        clientCreateInput.setConverter(new ClientConverter());
        clientCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(clientCreateInput);
        
        Message clientCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        clientCreateInputMessage.setId("clientCreateInputMessage");
        clientCreateInputMessage.setFor("clientCreateInput");
        clientCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(clientCreateInputMessage);
        
        OutputLabel productCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        productCreateOutput.setFor("productCreateInput");
        productCreateOutput.setId("productCreateOutput");
        productCreateOutput.setValue("Product:");
        htmlPanelGrid.getChildren().add(productCreateOutput);
        
        AutoComplete productCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        productCreateInput.setId("productCreateInput");
        productCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.product}", Product.class));
        productCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{productClientMB.completeProduct}", List.class, new Class[] { String.class }));
        productCreateInput.setDropdown(true);
        productCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "product", String.class));
        productCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{product.name} #{product.size} #{product.type} #{product.schedule}", String.class));
        productCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{product}", Product.class));
        productCreateInput.setConverter(new ProductConverter());
        productCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(productCreateInput);
        
        Message productCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        productCreateInputMessage.setId("productCreateInputMessage");
        productCreateInputMessage.setFor("productCreateInput");
        productCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(productCreateInputMessage);
        
        OutputLabel clientDescriptionCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        clientDescriptionCreateOutput.setFor("clientDescriptionCreateInput");
        clientDescriptionCreateOutput.setId("clientDescriptionCreateOutput");
        clientDescriptionCreateOutput.setValue("Client Description:");
        htmlPanelGrid.getChildren().add(clientDescriptionCreateOutput);
        
        InputText clientDescriptionCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        clientDescriptionCreateInput.setId("clientDescriptionCreateInput");
        clientDescriptionCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.clientDescription}", String.class));
        clientDescriptionCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(clientDescriptionCreateInput);
        
        Message clientDescriptionCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        clientDescriptionCreateInputMessage.setId("clientDescriptionCreateInputMessage");
        clientDescriptionCreateInputMessage.setFor("clientDescriptionCreateInput");
        clientDescriptionCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(clientDescriptionCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ProductClientMB.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel codeEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        codeEditOutput.setFor("codeEditInput");
        codeEditOutput.setId("codeEditOutput");
        codeEditOutput.setValue("Code:");
        htmlPanelGrid.getChildren().add(codeEditOutput);
        
        InputText codeEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        codeEditInput.setId("codeEditInput");
        codeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.code}", String.class));
        LengthValidator codeEditInputValidator = new LengthValidator();
        codeEditInputValidator.setMinimum(2);
        codeEditInput.addValidator(codeEditInputValidator);
        codeEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(codeEditInput);
        
        Message codeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        codeEditInputMessage.setId("codeEditInputMessage");
        codeEditInputMessage.setFor("codeEditInput");
        codeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(codeEditInputMessage);
        
        OutputLabel clientEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        clientEditOutput.setFor("clientEditInput");
        clientEditOutput.setId("clientEditOutput");
        clientEditOutput.setValue("Client:");
        htmlPanelGrid.getChildren().add(clientEditOutput);
        
        AutoComplete clientEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        clientEditInput.setId("clientEditInput");
        clientEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.client}", Client.class));
        clientEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{productClientMB.completeClient}", List.class, new Class[] { String.class }));
        clientEditInput.setDropdown(true);
        clientEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "client", String.class));
        clientEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{client.identification} #{client.name}", String.class));
        clientEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{client}", Client.class));
        clientEditInput.setConverter(new ClientConverter());
        clientEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(clientEditInput);
        
        Message clientEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        clientEditInputMessage.setId("clientEditInputMessage");
        clientEditInputMessage.setFor("clientEditInput");
        clientEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(clientEditInputMessage);
        
        OutputLabel productEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        productEditOutput.setFor("productEditInput");
        productEditOutput.setId("productEditOutput");
        productEditOutput.setValue("Product:");
        htmlPanelGrid.getChildren().add(productEditOutput);
        
        AutoComplete productEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        productEditInput.setId("productEditInput");
        productEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.product}", Product.class));
        productEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{productClientMB.completeProduct}", List.class, new Class[] { String.class }));
        productEditInput.setDropdown(true);
        productEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "product", String.class));
        productEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{product.name} #{product.size} #{product.type} #{product.schedule}", String.class));
        productEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{product}", Product.class));
        productEditInput.setConverter(new ProductConverter());
        productEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(productEditInput);
        
        Message productEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        productEditInputMessage.setId("productEditInputMessage");
        productEditInputMessage.setFor("productEditInput");
        productEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(productEditInputMessage);
        
        OutputLabel clientDescriptionEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        clientDescriptionEditOutput.setFor("clientDescriptionEditInput");
        clientDescriptionEditOutput.setId("clientDescriptionEditOutput");
        clientDescriptionEditOutput.setValue("Client Description:");
        htmlPanelGrid.getChildren().add(clientDescriptionEditOutput);
        
        InputText clientDescriptionEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        clientDescriptionEditInput.setId("clientDescriptionEditInput");
        clientDescriptionEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.clientDescription}", String.class));
        clientDescriptionEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(clientDescriptionEditInput);
        
        Message clientDescriptionEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        clientDescriptionEditInputMessage.setId("clientDescriptionEditInputMessage");
        clientDescriptionEditInputMessage.setFor("clientDescriptionEditInput");
        clientDescriptionEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(clientDescriptionEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ProductClientMB.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText codeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        codeLabel.setId("codeLabel");
        codeLabel.setValue("Code:");
        htmlPanelGrid.getChildren().add(codeLabel);
        
        HtmlOutputText codeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        codeValue.setId("codeValue");
        codeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.code}", String.class));
        htmlPanelGrid.getChildren().add(codeValue);
        
        HtmlOutputText clientLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        clientLabel.setId("clientLabel");
        clientLabel.setValue("Client:");
        htmlPanelGrid.getChildren().add(clientLabel);
        
        HtmlOutputText clientValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        clientValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.client}", Client.class));
        clientValue.setConverter(new ClientConverter());
        htmlPanelGrid.getChildren().add(clientValue);
        
        HtmlOutputText productLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        productLabel.setId("productLabel");
        productLabel.setValue("Product:");
        htmlPanelGrid.getChildren().add(productLabel);
        
        HtmlOutputText productValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        productValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.product}", Product.class));
        productValue.setConverter(new ProductConverter());
        htmlPanelGrid.getChildren().add(productValue);
        
        HtmlOutputText clientDescriptionLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        clientDescriptionLabel.setId("clientDescriptionLabel");
        clientDescriptionLabel.setValue("Client Description:");
        htmlPanelGrid.getChildren().add(clientDescriptionLabel);
        
        HtmlOutputText clientDescriptionValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        clientDescriptionValue.setId("clientDescriptionValue");
        clientDescriptionValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productClientMB.productClient.clientDescription}", String.class));
        htmlPanelGrid.getChildren().add(clientDescriptionValue);
        
        return htmlPanelGrid;
    }
    
    public ProductClient ProductClientMB.getProductClient() {
        if (productClient == null) {
            productClient = new ProductClient();
        }
        return productClient;
    }
    
    public void ProductClientMB.setProductClient(ProductClient productClient) {
        this.productClient = productClient;
    }
    
    public List<Client> ProductClientMB.completeClient(String query) {
        List<Client> suggestions = new ArrayList<Client>();
        for (Client client : clientService.findAllClients()) {
            String clientStr = String.valueOf(client.getIdentification() +  " "  + client.getName());
            if (clientStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(client);
            }
        }
        return suggestions;
    }
    
    public List<Product> ProductClientMB.completeProduct(String query) {
        List<Product> suggestions = new ArrayList<Product>();
        for (Product product : productService.findAllProducts()) {
            String productStr = String.valueOf(product.getName() +  " "  + product.getSize() +  " "  + product.getType() +  " "  + product.getSchedule());
            if (productStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(product);
            }
        }
        return suggestions;
    }
    
    public String ProductClientMB.onEdit() {
        return null;
    }
    
    public boolean ProductClientMB.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void ProductClientMB.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String ProductClientMB.displayList() {
        createDialogVisible = false;
        findAllProductClients();
        return "productClient";
    }
    
    public String ProductClientMB.displayCreateDialog() {
        productClient = new ProductClient();
        createDialogVisible = true;
        return "productClient";
    }
    
    public String ProductClientMB.persist() {
        String message = "";
        if (productClient.getId() != null) {
            productClientService.updateProductClient(productClient);
            message = "message_successfully_updated";
        } else {
            productClientService.saveProductClient(productClient);
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "ProductClient");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllProductClients();
    }
    
    public String ProductClientMB.delete() {
        productClientService.deleteProductClient(productClient);
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "ProductClient");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllProductClients();
    }
    
    public void ProductClientMB.reset() {
        productClient = null;
        createDialogVisible = false;
    }
    
    public void ProductClientMB.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
