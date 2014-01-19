package co.qcsc.spatha.web.mb;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.context.FacesContext;
import org.primefaces.component.menuitem.MenuItem;
import org.primefaces.component.submenu.Submenu;
import org.primefaces.model.DefaultMenuModel;
import org.primefaces.model.MenuModel;
import org.springframework.roo.addon.jsf.application.RooJsfApplicationBean;

@RooJsfApplicationBean
public class ApplicationBean {
	
	private MenuModel menuModel;

    public String getColumnName(String column) {
        if (column == null || column.length() == 0) {
            return column;
        }
        final Pattern p = Pattern.compile("[A-Z][^A-Z]*");
        final Matcher m = p.matcher(Character.toUpperCase(column.charAt(0)) + column.substring(1));
        final StringBuilder builder = new StringBuilder();
        while (m.find()) {
            builder.append(m.group()).append(" ");
        }
        return builder.toString().trim();
    }

	
	
	

	@PostConstruct
    public void init() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        menuModel = new DefaultMenuModel();
        Submenu submenu;
        MenuItem item;
        
        submenu = new Submenu();
        submenu.setId("clientSubmenu");
        submenu.setLabel("Client");
        item = new MenuItem();
        item.setId("createClientMenuItem");
        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{clientMB.displayCreateDialog}", String.class, new Class[0]));
        item.setIcon("ui-icon ui-icon-document");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.getChildren().add(item);
        item = new MenuItem();
        item.setId("listClientMenuItem");
        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{clientMB.displayList}", String.class, new Class[0]));
        item.setIcon("ui-icon ui-icon-folder-open");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.getChildren().add(item);
        menuModel.addSubmenu(submenu);
        
//        submenu = new Submenu();
//        submenu.setId("documentTypeSubmenu");
//        submenu.setLabel("DocumentType");
//        item = new MenuItem();
//        item.setId("createDocumentTypeMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{documentTypeMB.displayCreateDialog}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-document");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        item = new MenuItem();
//        item.setId("listDocumentTypeMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{documentTypeMB.displayList}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-folder-open");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        menuModel.addSubmenu(submenu);
//        
//        submenu = new Submenu();
//        submenu.setId("dossierItemFileSubmenu");
//        submenu.setLabel("DossierItemFile");
//        item = new MenuItem();
//        item.setId("createDossierItemFileMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{dossierItemFileMB.displayCreateDialog}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-document");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        item = new MenuItem();
//        item.setId("listDossierItemFileMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{dossierItemFileMB.displayList}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-folder-open");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        menuModel.addSubmenu(submenu);
//        
//        submenu = new Submenu();
//        submenu.setId("dossierItemSubmenu");
//        submenu.setLabel("DossierItem");
//        item = new MenuItem();
//        item.setId("createDossierItemMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{dossierItemMB.displayCreateDialog}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-document");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        item = new MenuItem();
//        item.setId("listDossierItemMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{dossierItemMB.displayList}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-folder-open");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        menuModel.addSubmenu(submenu);
//        
        submenu = new Submenu();
        submenu.setId("dossierSubmenu");
        submenu.setLabel("Dossier");
        item = new MenuItem();
        item.setId("createDossierMenuItem");
        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{dossierMB.displayCreateDialog}", String.class, new Class[0]));
        item.setIcon("ui-icon ui-icon-document");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.getChildren().add(item);
        item = new MenuItem();
        item.setId("listDossierMenuItem");
        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{dossierMB.displayList}", String.class, new Class[0]));
        item.setIcon("ui-icon ui-icon-folder-open");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.getChildren().add(item);
        menuModel.addSubmenu(submenu);
        
//        submenu = new Submenu();
//        submenu.setId("familySubmenu");
//        submenu.setLabel("Family");
//        item = new MenuItem();
//        item.setId("createFamilyMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{familyMB.displayCreateDialog}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-document");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        item = new MenuItem();
//        item.setId("listFamilyMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{familyMB.displayList}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-folder-open");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        menuModel.addSubmenu(submenu);
//        
//        submenu = new Submenu();
//        submenu.setId("productClientSubmenu");
//        submenu.setLabel("ProductClient");
//        item = new MenuItem();
//        item.setId("createProductClientMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{productClientMB.displayCreateDialog}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-document");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        item = new MenuItem();
//        item.setId("listProductClientMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{productClientMB.displayList}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-folder-open");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        menuModel.addSubmenu(submenu);
        
        submenu = new Submenu();
        submenu.setId("productSubmenu");
        submenu.setLabel("Product");
        item = new MenuItem();
        item.setId("createProductMenuItem");
        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{productMB.displayCreateDialog}", String.class, new Class[0]));
        item.setIcon("ui-icon ui-icon-document");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.getChildren().add(item);
        item = new MenuItem();
        item.setId("listProductMenuItem");
        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{productMB.displayList}", String.class, new Class[0]));
        item.setIcon("ui-icon ui-icon-folder-open");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.getChildren().add(item);
        menuModel.addSubmenu(submenu);
        
//        submenu = new Submenu();
//        submenu.setId("productSpecialtySubmenu");
//        submenu.setLabel("ProductSpecialty");
//        item = new MenuItem();
//        item.setId("createProductSpecialtyMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{productSpecialtyMB.displayCreateDialog}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-document");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        item = new MenuItem();
//        item.setId("listProductSpecialtyMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{productSpecialtyMB.displayList}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-folder-open");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        menuModel.addSubmenu(submenu);
        
        submenu = new Submenu();
        submenu.setId("purchaseOrderSubmenu");
        submenu.setLabel("PurchaseOrder");
        item = new MenuItem();
        item.setId("createPurchaseOrderMenuItem");
        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{purchaseOrderMB.displayCreateDialog}", String.class, new Class[0]));
        item.setIcon("ui-icon ui-icon-document");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.getChildren().add(item);
        item = new MenuItem();
        item.setId("listPurchaseOrderMenuItem");
        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{purchaseOrderMB.displayList}", String.class, new Class[0]));
        item.setIcon("ui-icon ui-icon-folder-open");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.getChildren().add(item);
        menuModel.addSubmenu(submenu);
        
//        submenu = new Submenu();
//        submenu.setId("specialtySubmenu");
//        submenu.setLabel("Specialty");
//        item = new MenuItem();
//        item.setId("createSpecialtyMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{specialtyMB.displayCreateDialog}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-document");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        item = new MenuItem();
//        item.setId("listSpecialtyMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{specialtyMB.displayList}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-folder-open");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        menuModel.addSubmenu(submenu);
        
        submenu = new Submenu();
        submenu.setId("supplierSubmenu");
        submenu.setLabel("Supplier");
        item = new MenuItem();
        item.setId("createSupplierMenuItem");
        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{supplierMB.displayCreateDialog}", String.class, new Class[0]));
        item.setIcon("ui-icon ui-icon-document");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.getChildren().add(item);
        item = new MenuItem();
        item.setId("listSupplierMenuItem");
        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{supplierMB.displayList}", String.class, new Class[0]));
        item.setIcon("ui-icon ui-icon-folder-open");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.getChildren().add(item);
        menuModel.addSubmenu(submenu);
    }
}