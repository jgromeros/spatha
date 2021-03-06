// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package co.qcsc.spatha.web.mb;

import co.qcsc.spatha.domain.dossier.DossierItem;
import co.qcsc.spatha.domain.dossier.DossierItemFile;
import co.qcsc.spatha.service.dossier.DossierItemFileService;
import co.qcsc.spatha.service.dossier.DossierItemService;
import co.qcsc.spatha.web.mb.DossierItemFileMB;
import co.qcsc.spatha.web.mb.converter.DossierItemConverter;
import co.qcsc.spatha.web.mb.util.MessageFactory;
import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.commandbutton.CommandButton;
import org.primefaces.component.filedownload.FileDownloadActionListener;
import org.primefaces.component.fileupload.FileUpload;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect DossierItemFileMB_Roo_ManagedBean {
    
    declare @type: DossierItemFileMB: @ManagedBean(name = "dossierItemFileMB");
    
    declare @type: DossierItemFileMB: @SessionScoped;
    
    @Autowired
    DossierItemFileService DossierItemFileMB.dossierItemFileService;
    
    @Autowired
    DossierItemService DossierItemFileMB.dossierItemService;
    
    private String DossierItemFileMB.name = "DossierItemFiles";
    
    private DossierItemFile DossierItemFileMB.dossierItemFile;
    
    private List<DossierItemFile> DossierItemFileMB.allDossierItemFiles;
    
    private boolean DossierItemFileMB.dataVisible = false;
    
    private List<String> DossierItemFileMB.columns;
    
    private HtmlPanelGrid DossierItemFileMB.createPanelGrid;
    
    private HtmlPanelGrid DossierItemFileMB.editPanelGrid;
    
    private HtmlPanelGrid DossierItemFileMB.viewPanelGrid;
    
    private boolean DossierItemFileMB.createDialogVisible = false;
    
    @PostConstruct
    public void DossierItemFileMB.init() {
        columns = new ArrayList<String>();
    }
    
    public String DossierItemFileMB.getName() {
        return name;
    }
    
    public List<String> DossierItemFileMB.getColumns() {
        return columns;
    }
    
    public List<DossierItemFile> DossierItemFileMB.getAllDossierItemFiles() {
        return allDossierItemFiles;
    }
    
    public void DossierItemFileMB.setAllDossierItemFiles(List<DossierItemFile> allDossierItemFiles) {
        this.allDossierItemFiles = allDossierItemFiles;
    }
    
    public String DossierItemFileMB.findAllDossierItemFiles() {
        allDossierItemFiles = dossierItemFileService.findAllDossierItemFiles();
        dataVisible = !allDossierItemFiles.isEmpty();
        return null;
    }
    
    public boolean DossierItemFileMB.isDataVisible() {
        return dataVisible;
    }
    
    public void DossierItemFileMB.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid DossierItemFileMB.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void DossierItemFileMB.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid DossierItemFileMB.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void DossierItemFileMB.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid DossierItemFileMB.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void DossierItemFileMB.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid DossierItemFileMB.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel itemFileCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        itemFileCreateOutput.setFor("itemFileCreateInput");
        itemFileCreateOutput.setId("itemFileCreateOutput");
        itemFileCreateOutput.setValue("Item File:");
        htmlPanelGrid.getChildren().add(itemFileCreateOutput);
        
        FileUpload itemFileCreateInput = (FileUpload) application.createComponent(FileUpload.COMPONENT_TYPE);
        itemFileCreateInput.setId("itemFileCreateInput");
        itemFileCreateInput.setFileUploadListener(expressionFactory.createMethodExpression(elContext, "#{dossierItemFileMB.handleFileUploadForItemFile}", void.class, new Class[] { FileUploadEvent.class }));
        itemFileCreateInput.setMode("advanced");
        itemFileCreateInput.setAllowTypes("/(\\.|\\/)([pP][dD][fF])$/");
        itemFileCreateInput.setUpdate(":growlForm:growl");
        itemFileCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(itemFileCreateInput);
        
        Message itemFileCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemFileCreateInputMessage.setId("itemFileCreateInputMessage");
        itemFileCreateInputMessage.setFor("itemFileCreateInput");
        itemFileCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemFileCreateInputMessage);
        
        OutputLabel dossierItemCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        dossierItemCreateOutput.setFor("dossierItemCreateInput");
        dossierItemCreateOutput.setId("dossierItemCreateOutput");
        dossierItemCreateOutput.setValue("Dossier Item:");
        htmlPanelGrid.getChildren().add(dossierItemCreateOutput);
        
        AutoComplete dossierItemCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        dossierItemCreateInput.setId("dossierItemCreateInput");
        dossierItemCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierItemFileMB.dossierItemFile.dossierItem}", DossierItem.class));
        dossierItemCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{dossierItemFileMB.completeDossierItem}", List.class, new Class[] { String.class }));
        dossierItemCreateInput.setDropdown(true);
        dossierItemCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "dossierItem", String.class));
        dossierItemCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{dossierItem.id}", String.class));
        dossierItemCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{dossierItem}", DossierItem.class));
        dossierItemCreateInput.setConverter(new DossierItemConverter());
        dossierItemCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(dossierItemCreateInput);
        
        Message dossierItemCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        dossierItemCreateInputMessage.setId("dossierItemCreateInputMessage");
        dossierItemCreateInputMessage.setFor("dossierItemCreateInput");
        dossierItemCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(dossierItemCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid DossierItemFileMB.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel itemFileEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        itemFileEditOutput.setFor("itemFileEditInput");
        itemFileEditOutput.setId("itemFileEditOutput");
        itemFileEditOutput.setValue("Item File:");
        htmlPanelGrid.getChildren().add(itemFileEditOutput);
        
        FileUpload itemFileEditInput = (FileUpload) application.createComponent(FileUpload.COMPONENT_TYPE);
        itemFileEditInput.setId("itemFileEditInput");
        itemFileEditInput.setFileUploadListener(expressionFactory.createMethodExpression(elContext, "#{dossierItemFileMB.handleFileUploadForItemFile}", void.class, new Class[] { FileUploadEvent.class }));
        itemFileEditInput.setMode("advanced");
        itemFileEditInput.setAllowTypes("/(\\.|\\/)([pP][dD][fF])$/");
        itemFileEditInput.setUpdate(":growlForm:growl");
        itemFileEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(itemFileEditInput);
        
        Message itemFileEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        itemFileEditInputMessage.setId("itemFileEditInputMessage");
        itemFileEditInputMessage.setFor("itemFileEditInput");
        itemFileEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(itemFileEditInputMessage);
        
        OutputLabel dossierItemEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        dossierItemEditOutput.setFor("dossierItemEditInput");
        dossierItemEditOutput.setId("dossierItemEditOutput");
        dossierItemEditOutput.setValue("Dossier Item:");
        htmlPanelGrid.getChildren().add(dossierItemEditOutput);
        
        AutoComplete dossierItemEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        dossierItemEditInput.setId("dossierItemEditInput");
        dossierItemEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierItemFileMB.dossierItemFile.dossierItem}", DossierItem.class));
        dossierItemEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{dossierItemFileMB.completeDossierItem}", List.class, new Class[] { String.class }));
        dossierItemEditInput.setDropdown(true);
        dossierItemEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "dossierItem", String.class));
        dossierItemEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{dossierItem.id}", String.class));
        dossierItemEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{dossierItem}", DossierItem.class));
        dossierItemEditInput.setConverter(new DossierItemConverter());
        dossierItemEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(dossierItemEditInput);
        
        Message dossierItemEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        dossierItemEditInputMessage.setId("dossierItemEditInputMessage");
        dossierItemEditInputMessage.setFor("dossierItemEditInput");
        dossierItemEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(dossierItemEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid DossierItemFileMB.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText itemFileLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        itemFileLabel.setId("itemFileLabel");
        itemFileLabel.setValue("Item File:");
        htmlPanelGrid.getChildren().add(itemFileLabel);
        
        UIComponent itemFileValue;
        if (dossierItemFile != null && dossierItemFile.getItemFile() != null && dossierItemFile.getItemFile().length > 0) {
            itemFileValue = (CommandButton) application.createComponent(CommandButton.COMPONENT_TYPE);
            ((CommandButton) itemFileValue).addActionListener(new FileDownloadActionListener(expressionFactory.createValueExpression(elContext, "#{dossierItemFileMB.itemFileStreamedContent}", StreamedContent.class), null));
            ((CommandButton) itemFileValue).setValue("Download");
            ((CommandButton) itemFileValue).setAjax(false);
        } else {
            itemFileValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
            ((HtmlOutputText) itemFileValue).setValue("");
        }
        htmlPanelGrid.getChildren().add(itemFileValue);
        
        HtmlOutputText dossierItemLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        dossierItemLabel.setId("dossierItemLabel");
        dossierItemLabel.setValue("Dossier Item:");
        htmlPanelGrid.getChildren().add(dossierItemLabel);
        
        HtmlOutputText dossierItemValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        dossierItemValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{dossierItemFileMB.dossierItemFile.dossierItem}", DossierItem.class));
        dossierItemValue.setConverter(new DossierItemConverter());
        htmlPanelGrid.getChildren().add(dossierItemValue);
        
        return htmlPanelGrid;
    }
    
    public DossierItemFile DossierItemFileMB.getDossierItemFile() {
        if (dossierItemFile == null) {
            dossierItemFile = new DossierItemFile();
        }
        return dossierItemFile;
    }
    
    public void DossierItemFileMB.setDossierItemFile(DossierItemFile dossierItemFile) {
        this.dossierItemFile = dossierItemFile;
    }
    
    public void DossierItemFileMB.handleFileUploadForItemFile(FileUploadEvent event) {
        dossierItemFile.setItemFile(event.getFile().getContents());
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_uploaded", event.getFile().getFileName());
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
    }
    
    public StreamedContent DossierItemFileMB.getItemFileStreamedContent() {
        if (dossierItemFile != null && dossierItemFile.getItemFile() != null) {
            return new DefaultStreamedContent(new ByteArrayInputStream(dossierItemFile.getItemFile()), "application/pdf", "itemFile.pdf");
        }
        return new DefaultStreamedContent(new ByteArrayInputStream("".getBytes()));
    }
    
    public List<DossierItem> DossierItemFileMB.completeDossierItem(String query) {
        List<DossierItem> suggestions = new ArrayList<DossierItem>();
        for (DossierItem dossierItem : dossierItemService.findAllDossierItems()) {
            String dossierItemStr = String.valueOf(dossierItem.getId());
            if (dossierItemStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(dossierItem);
            }
        }
        return suggestions;
    }
    
    public String DossierItemFileMB.onEdit() {
        return null;
    }
    
    public boolean DossierItemFileMB.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void DossierItemFileMB.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String DossierItemFileMB.displayList() {
        createDialogVisible = false;
        findAllDossierItemFiles();
        return "dossierItemFile";
    }
    
    public String DossierItemFileMB.displayCreateDialog() {
        dossierItemFile = new DossierItemFile();
        createDialogVisible = true;
        return "dossierItemFile";
    }
    
    public String DossierItemFileMB.persist() {
        String message = "";
        if (dossierItemFile.getId() != null) {
            dossierItemFileService.updateDossierItemFile(dossierItemFile);
            message = "message_successfully_updated";
        } else {
            dossierItemFileService.saveDossierItemFile(dossierItemFile);
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "DossierItemFile");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllDossierItemFiles();
    }
    
    public String DossierItemFileMB.delete() {
        dossierItemFileService.deleteDossierItemFile(dossierItemFile);
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "DossierItemFile");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllDossierItemFiles();
    }
    
    public void DossierItemFileMB.reset() {
        dossierItemFile = null;
        createDialogVisible = false;
    }
    
    public void DossierItemFileMB.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
