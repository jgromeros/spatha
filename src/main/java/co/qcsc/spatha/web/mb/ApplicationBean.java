package co.qcsc.spatha.web.mb;

import java.awt.MenuItem;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.ValueExpression;
import javax.faces.application.Application;
import javax.faces.context.FacesContext;

import org.primefaces.model.menu.DefaultMenuItem;
import org.primefaces.model.menu.DefaultMenuModel;
import org.primefaces.model.menu.DefaultSubMenu;
import org.primefaces.model.menu.MenuModel;
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
        DefaultSubMenu submenu;
        DefaultMenuItem item;
        
        submenu = new DefaultSubMenu();
        submenu.setId("clientSubmenu");
        submenu.setLabel("Cliente");
        item = new DefaultMenuItem();
        item.setId("createClientMenuItem");
        ValueExpression valueExpression = expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class);
        item.setValue(valueExpression.getValue(elContext));
        item.setCommand("#{clientMB.displayCreateDialog}");
        item.setIcon("ui-icon ui-icon-document");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.addElement(item);
        item = new DefaultMenuItem();
        item.setId("listClientMenuItem");
        valueExpression = expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class);
        item.setValue(valueExpression.getValue(elContext));
        item.setCommand("#{clientMB.displayList}");
        item.setIcon("ui-icon ui-icon-folder-open");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.addElement(item);
        menuModel.addElement(submenu);
        
        submenu = new DefaultSubMenu();
        submenu.setId("dossierSubmenu");
        submenu.setLabel("Dossier");
        item = new DefaultMenuItem();
        valueExpression = expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class);
        item.setValue(valueExpression.getValue(elContext));
        item.setCommand("#{dossierMB.displayConsultPO}");
        item.setIcon("ui-icon ui-icon-document");
        item.setAjax(false);
        item.setAsync(false);
        item.setUpdate(":dataForm:data");
        submenu.addElement(item);

//        item = new DefaultMenuItem();
//        item.setId("consultPOMenuItem");
//        valueExpression = expressionFactory.createValueExpression(elContext, "#{messages.label_consult}", String.class);
//        item.setValue(valueExpression.getValue(elContext));
//        item.setCommand("#{dossierMB.displayCreateDialog}");
//        item.setIcon("ui-icon ui-icon-document");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.addElement(item);
        menuModel.addElement(submenu);

//        submenu = new Submenu();
//        submenu.setId("productSubmenu");
//        submenu.setLabel("Product");
//        item = new MenuItem();
//        item.setId("createProductMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{productMB.displayCreateDialog}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-document");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        item = new MenuItem();
//        item.setId("listProductMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{productMB.displayList}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-folder-open");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        menuModel.addSubmenu(submenu);
//        
//        submenu = new Submenu();
//        submenu.setId("purchaseOrderSubmenu");
//        submenu.setLabel("PurchaseOrder");
//        item = new MenuItem();
//        item.setId("createPurchaseOrderMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{purchaseOrderMB.displayCreateDialog}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-document");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        item = new MenuItem();
//        item.setId("listPurchaseOrderMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{purchaseOrderMB.displayList}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-folder-open");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        menuModel.addSubmenu(submenu);
        
//        submenu = new Submenu();
//        submenu.setId("supplierSubmenu");
//        submenu.setLabel("Supplier");
//        item = new MenuItem();
//        item.setId("createSupplierMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_create}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{supplierMB.displayCreateDialog}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-document");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        item = new MenuItem();
//        item.setId("listSupplierMenuItem");
//        item.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{messages.label_list}", String.class));
//        item.setActionExpression(expressionFactory.createMethodExpression(elContext, "#{supplierMB.displayList}", String.class, new Class[0]));
//        item.setIcon("ui-icon ui-icon-folder-open");
//        item.setAjax(false);
//        item.setAsync(false);
//        item.setUpdate(":dataForm:data");
//        submenu.getChildren().add(item);
//        menuModel.addSubmenu(submenu);
    }

	public MenuModel getMenuModel() {
        return menuModel;
    }

}