// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.web.mb;

import co.qcsc.spatha.domain.product.Product;
import co.qcsc.spatha.domain.product.ProductSpecialty;
import co.qcsc.spatha.domain.product.Specialty;
import co.qcsc.spatha.service.product.ProductService;
import co.qcsc.spatha.service.product.ProductSpecialtyService;
import co.qcsc.spatha.service.product.SpecialtyService;
import co.qcsc.spatha.web.mb.ProductSpecialtyMB;
import co.qcsc.spatha.web.mb.converter.ProductConverter;
import co.qcsc.spatha.web.mb.converter.SpecialtyConverter;
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
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect ProductSpecialtyMB_Roo_ManagedBean {
    
    declare @type: ProductSpecialtyMB: @ManagedBean(name = "productSpecialtyMB");
    
    declare @type: ProductSpecialtyMB: @SessionScoped;
    
    @Autowired
    ProductSpecialtyService ProductSpecialtyMB.productSpecialtyService;
    
    @Autowired
    ProductService ProductSpecialtyMB.productService;
    
    @Autowired
    SpecialtyService ProductSpecialtyMB.specialtyService;
    
    private String ProductSpecialtyMB.name = "ProductSpecialtys";
    
    private ProductSpecialty ProductSpecialtyMB.productSpecialty;
    
    private List<ProductSpecialty> ProductSpecialtyMB.allProductSpecialtys;
    
    private boolean ProductSpecialtyMB.dataVisible = false;
    
    private List<String> ProductSpecialtyMB.columns;
    
    private HtmlPanelGrid ProductSpecialtyMB.createPanelGrid;
    
    private HtmlPanelGrid ProductSpecialtyMB.editPanelGrid;
    
    private HtmlPanelGrid ProductSpecialtyMB.viewPanelGrid;
    
    private boolean ProductSpecialtyMB.createDialogVisible = false;
    
    @PostConstruct
    public void ProductSpecialtyMB.init() {
        columns = new ArrayList<String>();
    }
    
    public String ProductSpecialtyMB.getName() {
        return name;
    }
    
    public List<String> ProductSpecialtyMB.getColumns() {
        return columns;
    }
    
    public List<ProductSpecialty> ProductSpecialtyMB.getAllProductSpecialtys() {
        return allProductSpecialtys;
    }
    
    public void ProductSpecialtyMB.setAllProductSpecialtys(List<ProductSpecialty> allProductSpecialtys) {
        this.allProductSpecialtys = allProductSpecialtys;
    }
    
    public String ProductSpecialtyMB.findAllProductSpecialtys() {
        allProductSpecialtys = productSpecialtyService.findAllProductSpecialtys();
        dataVisible = !allProductSpecialtys.isEmpty();
        return null;
    }
    
    public boolean ProductSpecialtyMB.isDataVisible() {
        return dataVisible;
    }
    
    public void ProductSpecialtyMB.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid ProductSpecialtyMB.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void ProductSpecialtyMB.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid ProductSpecialtyMB.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void ProductSpecialtyMB.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid ProductSpecialtyMB.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void ProductSpecialtyMB.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid ProductSpecialtyMB.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel productCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        productCreateOutput.setFor("productCreateInput");
        productCreateOutput.setId("productCreateOutput");
        productCreateOutput.setValue("Product:");
        htmlPanelGrid.getChildren().add(productCreateOutput);
        
        AutoComplete productCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        productCreateInput.setId("productCreateInput");
        productCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productSpecialtyMB.productSpecialty.product}", Product.class));
        productCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{productSpecialtyMB.completeProduct}", List.class, new Class[] { String.class }));
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
        
        OutputLabel specialtyCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        specialtyCreateOutput.setFor("specialtyCreateInput");
        specialtyCreateOutput.setId("specialtyCreateOutput");
        specialtyCreateOutput.setValue("Specialty:");
        htmlPanelGrid.getChildren().add(specialtyCreateOutput);
        
        AutoComplete specialtyCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        specialtyCreateInput.setId("specialtyCreateInput");
        specialtyCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productSpecialtyMB.productSpecialty.specialty}", Specialty.class));
        specialtyCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{productSpecialtyMB.completeSpecialty}", List.class, new Class[] { String.class }));
        specialtyCreateInput.setDropdown(true);
        specialtyCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "specialty", String.class));
        specialtyCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{specialty.name}", String.class));
        specialtyCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{specialty}", Specialty.class));
        specialtyCreateInput.setConverter(new SpecialtyConverter());
        specialtyCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(specialtyCreateInput);
        
        Message specialtyCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        specialtyCreateInputMessage.setId("specialtyCreateInputMessage");
        specialtyCreateInputMessage.setFor("specialtyCreateInput");
        specialtyCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(specialtyCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ProductSpecialtyMB.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel productEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        productEditOutput.setFor("productEditInput");
        productEditOutput.setId("productEditOutput");
        productEditOutput.setValue("Product:");
        htmlPanelGrid.getChildren().add(productEditOutput);
        
        AutoComplete productEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        productEditInput.setId("productEditInput");
        productEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productSpecialtyMB.productSpecialty.product}", Product.class));
        productEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{productSpecialtyMB.completeProduct}", List.class, new Class[] { String.class }));
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
        
        OutputLabel specialtyEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        specialtyEditOutput.setFor("specialtyEditInput");
        specialtyEditOutput.setId("specialtyEditOutput");
        specialtyEditOutput.setValue("Specialty:");
        htmlPanelGrid.getChildren().add(specialtyEditOutput);
        
        AutoComplete specialtyEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        specialtyEditInput.setId("specialtyEditInput");
        specialtyEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productSpecialtyMB.productSpecialty.specialty}", Specialty.class));
        specialtyEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{productSpecialtyMB.completeSpecialty}", List.class, new Class[] { String.class }));
        specialtyEditInput.setDropdown(true);
        specialtyEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "specialty", String.class));
        specialtyEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{specialty.name}", String.class));
        specialtyEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{specialty}", Specialty.class));
        specialtyEditInput.setConverter(new SpecialtyConverter());
        specialtyEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(specialtyEditInput);
        
        Message specialtyEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        specialtyEditInputMessage.setId("specialtyEditInputMessage");
        specialtyEditInputMessage.setFor("specialtyEditInput");
        specialtyEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(specialtyEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ProductSpecialtyMB.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText productLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        productLabel.setId("productLabel");
        productLabel.setValue("Product:");
        htmlPanelGrid.getChildren().add(productLabel);
        
        HtmlOutputText productValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        productValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productSpecialtyMB.productSpecialty.product}", Product.class));
        productValue.setConverter(new ProductConverter());
        htmlPanelGrid.getChildren().add(productValue);
        
        HtmlOutputText specialtyLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        specialtyLabel.setId("specialtyLabel");
        specialtyLabel.setValue("Specialty:");
        htmlPanelGrid.getChildren().add(specialtyLabel);
        
        HtmlOutputText specialtyValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        specialtyValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{productSpecialtyMB.productSpecialty.specialty}", Specialty.class));
        specialtyValue.setConverter(new SpecialtyConverter());
        htmlPanelGrid.getChildren().add(specialtyValue);
        
        return htmlPanelGrid;
    }
    
    public ProductSpecialty ProductSpecialtyMB.getProductSpecialty() {
        if (productSpecialty == null) {
            productSpecialty = new ProductSpecialty();
        }
        return productSpecialty;
    }
    
    public void ProductSpecialtyMB.setProductSpecialty(ProductSpecialty productSpecialty) {
        this.productSpecialty = productSpecialty;
    }
    
    public List<Product> ProductSpecialtyMB.completeProduct(String query) {
        List<Product> suggestions = new ArrayList<Product>();
        for (Product product : productService.findAllProducts()) {
            String productStr = String.valueOf(product.getName() +  " "  + product.getSize() +  " "  + product.getType() +  " "  + product.getSchedule());
            if (productStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(product);
            }
        }
        return suggestions;
    }
    
    public List<Specialty> ProductSpecialtyMB.completeSpecialty(String query) {
        List<Specialty> suggestions = new ArrayList<Specialty>();
        for (Specialty specialty : specialtyService.findAllSpecialtys()) {
            String specialtyStr = String.valueOf(specialty.getName());
            if (specialtyStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(specialty);
            }
        }
        return suggestions;
    }
    
    public String ProductSpecialtyMB.onEdit() {
        return null;
    }
    
    public boolean ProductSpecialtyMB.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void ProductSpecialtyMB.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String ProductSpecialtyMB.displayList() {
        createDialogVisible = false;
        findAllProductSpecialtys();
        return "productSpecialty";
    }
    
    public String ProductSpecialtyMB.displayCreateDialog() {
        productSpecialty = new ProductSpecialty();
        createDialogVisible = true;
        return "productSpecialty";
    }
    
    public String ProductSpecialtyMB.persist() {
        String message = "";
        if (productSpecialty.getId() != null) {
            productSpecialtyService.updateProductSpecialty(productSpecialty);
            message = "message_successfully_updated";
        } else {
            productSpecialtyService.saveProductSpecialty(productSpecialty);
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "ProductSpecialty");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllProductSpecialtys();
    }
    
    public String ProductSpecialtyMB.delete() {
        productSpecialtyService.deleteProductSpecialty(productSpecialty);
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "ProductSpecialty");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllProductSpecialtys();
    }
    
    public void ProductSpecialtyMB.reset() {
        productSpecialty = null;
        createDialogVisible = false;
    }
    
    public void ProductSpecialtyMB.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
