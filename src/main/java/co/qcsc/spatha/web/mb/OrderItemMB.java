package co.qcsc.spatha.web.mb;
import co.qcsc.spatha.domain.product.ProductClient;
import co.qcsc.spatha.domain.purchase.OrderItem;
import co.qcsc.spatha.domain.purchase.PurchaseOrder;
import co.qcsc.spatha.web.mb.converter.ProductClientConverter;
import co.qcsc.spatha.web.mb.converter.PurchaseOrderConverter;
import java.math.BigDecimal;
import java.util.List;
import java.util.Set;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = OrderItem.class, beanName = "orderItemMB")
public class OrderItemMB {

	private HtmlPanelGrid createPanelGrid;
	
	public HtmlPanelGrid populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel quantityCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        quantityCreateOutput.setFor("quantityCreateInput");
        quantityCreateOutput.setId("quantityCreateOutput");
        quantityCreateOutput.setValue("Quantity:");
        htmlPanelGrid.getChildren().add(quantityCreateOutput);
        
        InputText quantityCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        quantityCreateInput.setId("quantityCreateInput");
        quantityCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{orderItemMB.orderItem.quantity}", BigDecimal.class));
        quantityCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(quantityCreateInput);
        
        Message quantityCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        quantityCreateInputMessage.setId("quantityCreateInputMessage");
        quantityCreateInputMessage.setFor("quantityCreateInput");
        quantityCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(quantityCreateInputMessage);
        
        OutputLabel purchaseOrderCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        purchaseOrderCreateOutput.setFor("purchaseOrderCreateInput");
        purchaseOrderCreateOutput.setId("purchaseOrderCreateOutput");
        purchaseOrderCreateOutput.setValue("Purchase Order:");
        htmlPanelGrid.getChildren().add(purchaseOrderCreateOutput);
        
        AutoComplete purchaseOrderCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        purchaseOrderCreateInput.setId("purchaseOrderCreateInput");
        purchaseOrderCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{orderItemMB.orderItem.purchaseOrder}", PurchaseOrder.class));
        purchaseOrderCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{orderItemMB.completePurchaseOrder}", List.class, new Class[] { String.class }));
        purchaseOrderCreateInput.setDropdown(true);
        purchaseOrderCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "purchaseOrder", String.class));
        purchaseOrderCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{purchaseOrder.numberOrder} #{purchaseOrder.supplierContact} #{purchaseOrder.clientContact} #{purchaseOrder.supplierPhone}", String.class));
        purchaseOrderCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{purchaseOrder}", PurchaseOrder.class));
        purchaseOrderCreateInput.setConverter(new PurchaseOrderConverter());
        purchaseOrderCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(purchaseOrderCreateInput);
        
        Message purchaseOrderCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        purchaseOrderCreateInputMessage.setId("purchaseOrderCreateInputMessage");
        purchaseOrderCreateInputMessage.setFor("purchaseOrderCreateInput");
        purchaseOrderCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(purchaseOrderCreateInputMessage);
        
        OutputLabel productCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        productCreateOutput.setFor("productCreateInput");
        productCreateOutput.setId("productCreateOutput");
        productCreateOutput.setValue("Product:");
        htmlPanelGrid.getChildren().add(productCreateOutput);
        
        AutoComplete productCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        productCreateInput.setId("productCreateInput");
        productCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{orderItemMB.orderItem.product}", ProductClient.class));
        productCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{orderItemMB.completeProduct}", List.class, new Class[] { String.class }));
        productCreateInput.setDropdown(true);
        productCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "product", String.class));
        productCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{product.code}", String.class));
        productCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{product}", ProductClient.class));
        productCreateInput.setConverter(new ProductClientConverter());
        productCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(productCreateInput);
        
        Message productCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        productCreateInputMessage.setId("productCreateInputMessage");
        productCreateInputMessage.setFor("productCreateInput");
        productCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(productCreateInputMessage);
        
        return htmlPanelGrid;
    }

	

	public HtmlPanelGrid getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
}
