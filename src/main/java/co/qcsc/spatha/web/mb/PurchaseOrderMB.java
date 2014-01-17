package co.qcsc.spatha.web.mb;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.FacesMessage;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;

import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.context.RequestContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

import co.qcsc.spatha.domain.product.ProductClient;
import co.qcsc.spatha.domain.purchase.OrderItem;
import co.qcsc.spatha.domain.purchase.PurchaseOrder;
import co.qcsc.spatha.domain.thirdparty.Client;
import co.qcsc.spatha.domain.thirdparty.Supplier;
import co.qcsc.spatha.service.product.ProductClientService;
import co.qcsc.spatha.web.mb.converter.ClientConverter;
import co.qcsc.spatha.web.mb.converter.ProductClientConverter;
import co.qcsc.spatha.web.mb.converter.SupplierConverter;
import co.qcsc.spatha.web.mb.util.MessageFactory;

/**
 * Managed Bean de Order para el manejo de la pantalla
 * 
 * @author jorge
 * 
 */
@RooSerializable
@RooJsfManagedBean(entity = PurchaseOrder.class, beanName = "purchaseOrderMB")
public class PurchaseOrderMB {

	private OrderItem orderItem;

	private PurchaseOrder purchaseOrder;
	private List<String> columns;
	private List<String> orderItemColumns;

	@Autowired
	ProductClientService productClientService;

	@PostConstruct
	public void init() {
		columns = new ArrayList<String>();
		columns.add("numberOrder");
		columns.add("supplierContact");
		columns.add("clientContact");
		columns.add("supplierPhone");
		columns.add("clientPhone");
		orderItemColumns = new ArrayList<String>();
		orderItemColumns.add("quantity");
	}

	public HtmlPanelGrid populateCreatePanel() {
		FacesContext facesContext = FacesContext.getCurrentInstance();
		javax.faces.application.Application application = facesContext
				.getApplication();
		ExpressionFactory expressionFactory = application
				.getExpressionFactory();
		ELContext elContext = facesContext.getELContext();

		HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application
				.createComponent(HtmlPanelGrid.COMPONENT_TYPE);

		OutputLabel numberOrderCreateOutput = (OutputLabel) application
				.createComponent(OutputLabel.COMPONENT_TYPE);
		numberOrderCreateOutput.setFor("numberOrderCreateInput");
		numberOrderCreateOutput.setId("numberOrderCreateOutput");
		numberOrderCreateOutput.setValue("Number Order:");
		htmlPanelGrid.getChildren().add(numberOrderCreateOutput);

		InputText numberOrderCreateInput = (InputText) application
				.createComponent(InputText.COMPONENT_TYPE);
		numberOrderCreateInput.setId("numberOrderCreateInput");
		numberOrderCreateInput.setValueExpression("value", expressionFactory
				.createValueExpression(elContext,
						"#{purchaseOrderMB.purchaseOrder.numberOrder}",
						String.class));
		numberOrderCreateInput.setRequired(true);
		htmlPanelGrid.getChildren().add(numberOrderCreateInput);

		Message numberOrderCreateInputMessage = (Message) application
				.createComponent(Message.COMPONENT_TYPE);
		numberOrderCreateInputMessage.setId("numberOrderCreateInputMessage");
		numberOrderCreateInputMessage.setFor("numberOrderCreateInput");
		numberOrderCreateInputMessage.setDisplay("icon");
		htmlPanelGrid.getChildren().add(numberOrderCreateInputMessage);

		OutputLabel supplierContactCreateOutput = (OutputLabel) application
				.createComponent(OutputLabel.COMPONENT_TYPE);
		supplierContactCreateOutput.setFor("supplierContactCreateInput");
		supplierContactCreateOutput.setId("supplierContactCreateOutput");
		supplierContactCreateOutput.setValue("Supplier Contact:");
		htmlPanelGrid.getChildren().add(supplierContactCreateOutput);

		InputText supplierContactCreateInput = (InputText) application
				.createComponent(InputText.COMPONENT_TYPE);
		supplierContactCreateInput.setId("supplierContactCreateInput");
		supplierContactCreateInput.setValueExpression("value",
				expressionFactory.createValueExpression(elContext,
						"#{purchaseOrderMB.purchaseOrder.supplierContact}",
						String.class));
		supplierContactCreateInput.setRequired(false);
		htmlPanelGrid.getChildren().add(supplierContactCreateInput);

		Message supplierContactCreateInputMessage = (Message) application
				.createComponent(Message.COMPONENT_TYPE);
		supplierContactCreateInputMessage
				.setId("supplierContactCreateInputMessage");
		supplierContactCreateInputMessage.setFor("supplierContactCreateInput");
		supplierContactCreateInputMessage.setDisplay("icon");
		htmlPanelGrid.getChildren().add(supplierContactCreateInputMessage);

		OutputLabel clientContactCreateOutput = (OutputLabel) application
				.createComponent(OutputLabel.COMPONENT_TYPE);
		clientContactCreateOutput.setFor("clientContactCreateInput");
		clientContactCreateOutput.setId("clientContactCreateOutput");
		clientContactCreateOutput.setValue("Client Contact:");
		htmlPanelGrid.getChildren().add(clientContactCreateOutput);

		InputText clientContactCreateInput = (InputText) application
				.createComponent(InputText.COMPONENT_TYPE);
		clientContactCreateInput.setId("clientContactCreateInput");
		clientContactCreateInput.setValueExpression("value", expressionFactory
				.createValueExpression(elContext,
						"#{purchaseOrderMB.purchaseOrder.clientContact}",
						String.class));
		clientContactCreateInput.setRequired(false);
		htmlPanelGrid.getChildren().add(clientContactCreateInput);

		Message clientContactCreateInputMessage = (Message) application
				.createComponent(Message.COMPONENT_TYPE);
		clientContactCreateInputMessage
				.setId("clientContactCreateInputMessage");
		clientContactCreateInputMessage.setFor("clientContactCreateInput");
		clientContactCreateInputMessage.setDisplay("icon");
		htmlPanelGrid.getChildren().add(clientContactCreateInputMessage);

		OutputLabel supplierPhoneCreateOutput = (OutputLabel) application
				.createComponent(OutputLabel.COMPONENT_TYPE);
		supplierPhoneCreateOutput.setFor("supplierPhoneCreateInput");
		supplierPhoneCreateOutput.setId("supplierPhoneCreateOutput");
		supplierPhoneCreateOutput.setValue("Supplier Phone:");
		htmlPanelGrid.getChildren().add(supplierPhoneCreateOutput);

		InputText supplierPhoneCreateInput = (InputText) application
				.createComponent(InputText.COMPONENT_TYPE);
		supplierPhoneCreateInput.setId("supplierPhoneCreateInput");
		supplierPhoneCreateInput.setValueExpression("value", expressionFactory
				.createValueExpression(elContext,
						"#{purchaseOrderMB.purchaseOrder.supplierPhone}",
						String.class));
		supplierPhoneCreateInput.setRequired(false);
		htmlPanelGrid.getChildren().add(supplierPhoneCreateInput);

		Message supplierPhoneCreateInputMessage = (Message) application
				.createComponent(Message.COMPONENT_TYPE);
		supplierPhoneCreateInputMessage
				.setId("supplierPhoneCreateInputMessage");
		supplierPhoneCreateInputMessage.setFor("supplierPhoneCreateInput");
		supplierPhoneCreateInputMessage.setDisplay("icon");
		htmlPanelGrid.getChildren().add(supplierPhoneCreateInputMessage);

		OutputLabel clientPhoneCreateOutput = (OutputLabel) application
				.createComponent(OutputLabel.COMPONENT_TYPE);
		clientPhoneCreateOutput.setFor("clientPhoneCreateInput");
		clientPhoneCreateOutput.setId("clientPhoneCreateOutput");
		clientPhoneCreateOutput.setValue("Client Phone:");
		htmlPanelGrid.getChildren().add(clientPhoneCreateOutput);

		InputText clientPhoneCreateInput = (InputText) application
				.createComponent(InputText.COMPONENT_TYPE);
		clientPhoneCreateInput.setId("clientPhoneCreateInput");
		clientPhoneCreateInput.setValueExpression("value", expressionFactory
				.createValueExpression(elContext,
						"#{purchaseOrderMB.purchaseOrder.clientPhone}",
						String.class));
		clientPhoneCreateInput.setRequired(false);
		htmlPanelGrid.getChildren().add(clientPhoneCreateInput);

		Message clientPhoneCreateInputMessage = (Message) application
				.createComponent(Message.COMPONENT_TYPE);
		clientPhoneCreateInputMessage.setId("clientPhoneCreateInputMessage");
		clientPhoneCreateInputMessage.setFor("clientPhoneCreateInput");
		clientPhoneCreateInputMessage.setDisplay("icon");
		htmlPanelGrid.getChildren().add(clientPhoneCreateInputMessage);

		OutputLabel supplierEmailCreateOutput = (OutputLabel) application
				.createComponent(OutputLabel.COMPONENT_TYPE);
		supplierEmailCreateOutput.setFor("supplierEmailCreateInput");
		supplierEmailCreateOutput.setId("supplierEmailCreateOutput");
		supplierEmailCreateOutput.setValue("Supplier Email:");
		htmlPanelGrid.getChildren().add(supplierEmailCreateOutput);

		InputText supplierEmailCreateInput = (InputText) application
				.createComponent(InputText.COMPONENT_TYPE);
		supplierEmailCreateInput.setId("supplierEmailCreateInput");
		supplierEmailCreateInput.setValueExpression("value", expressionFactory
				.createValueExpression(elContext,
						"#{purchaseOrderMB.purchaseOrder.supplierEmail}",
						String.class));
		supplierEmailCreateInput.setRequired(false);
		htmlPanelGrid.getChildren().add(supplierEmailCreateInput);

		Message supplierEmailCreateInputMessage = (Message) application
				.createComponent(Message.COMPONENT_TYPE);
		supplierEmailCreateInputMessage
				.setId("supplierEmailCreateInputMessage");
		supplierEmailCreateInputMessage.setFor("supplierEmailCreateInput");
		supplierEmailCreateInputMessage.setDisplay("icon");
		htmlPanelGrid.getChildren().add(supplierEmailCreateInputMessage);

		OutputLabel clientEmailCreateOutput = (OutputLabel) application
				.createComponent(OutputLabel.COMPONENT_TYPE);
		clientEmailCreateOutput.setFor("clientEmailCreateInput");
		clientEmailCreateOutput.setId("clientEmailCreateOutput");
		clientEmailCreateOutput.setValue("Client Email:");
		htmlPanelGrid.getChildren().add(clientEmailCreateOutput);

		InputText clientEmailCreateInput = (InputText) application
				.createComponent(InputText.COMPONENT_TYPE);
		clientEmailCreateInput.setId("clientEmailCreateInput");
		clientEmailCreateInput.setValueExpression("value", expressionFactory
				.createValueExpression(elContext,
						"#{purchaseOrderMB.purchaseOrder.clientEmail}",
						String.class));
		clientEmailCreateInput.setRequired(false);
		htmlPanelGrid.getChildren().add(clientEmailCreateInput);

		Message clientEmailCreateInputMessage = (Message) application
				.createComponent(Message.COMPONENT_TYPE);
		clientEmailCreateInputMessage.setId("clientEmailCreateInputMessage");
		clientEmailCreateInputMessage.setFor("clientEmailCreateInput");
		clientEmailCreateInputMessage.setDisplay("icon");
		htmlPanelGrid.getChildren().add(clientEmailCreateInputMessage);

		OutputLabel clientCreateOutput = (OutputLabel) application
				.createComponent(OutputLabel.COMPONENT_TYPE);
		clientCreateOutput.setFor("clientCreateInput");
		clientCreateOutput.setId("clientCreateOutput");
		clientCreateOutput.setValue("Client:");
		htmlPanelGrid.getChildren().add(clientCreateOutput);

		AutoComplete clientCreateInput = (AutoComplete) application
				.createComponent(AutoComplete.COMPONENT_TYPE);
		clientCreateInput.setId("clientCreateInput");
		clientCreateInput.setValueExpression("value",
				expressionFactory
						.createValueExpression(elContext,
								"#{purchaseOrderMB.purchaseOrder.client}",
								Client.class));
		clientCreateInput.setCompleteMethod(expressionFactory
				.createMethodExpression(elContext,
						"#{purchaseOrderMB.completeClient}", List.class,
						new Class[] { String.class }));
		clientCreateInput.setDropdown(true);
		clientCreateInput.setValueExpression("var", expressionFactory
				.createValueExpression(elContext, "client", String.class));
		clientCreateInput.setValueExpression("itemLabel",
				expressionFactory
						.createValueExpression(elContext,
								"#{client.identification} #{client.name}",
								String.class));
		clientCreateInput.setValueExpression("itemValue", expressionFactory
				.createValueExpression(elContext, "#{client}", Client.class));
		clientCreateInput.setConverter(new ClientConverter());
		clientCreateInput.setRequired(false);
		htmlPanelGrid.getChildren().add(clientCreateInput);

		Message clientCreateInputMessage = (Message) application
				.createComponent(Message.COMPONENT_TYPE);
		clientCreateInputMessage.setId("clientCreateInputMessage");
		clientCreateInputMessage.setFor("clientCreateInput");
		clientCreateInputMessage.setDisplay("icon");
		htmlPanelGrid.getChildren().add(clientCreateInputMessage);

		OutputLabel supplierCreateOutput = (OutputLabel) application
				.createComponent(OutputLabel.COMPONENT_TYPE);
		supplierCreateOutput.setFor("supplierCreateInput");
		supplierCreateOutput.setId("supplierCreateOutput");
		supplierCreateOutput.setValue("Supplier:");
		htmlPanelGrid.getChildren().add(supplierCreateOutput);

		AutoComplete supplierCreateInput = (AutoComplete) application
				.createComponent(AutoComplete.COMPONENT_TYPE);
		supplierCreateInput.setId("supplierCreateInput");
		supplierCreateInput.setValueExpression("value", expressionFactory
				.createValueExpression(elContext,
						"#{purchaseOrderMB.purchaseOrder.supplier}",
						Supplier.class));
		supplierCreateInput.setCompleteMethod(expressionFactory
				.createMethodExpression(elContext,
						"#{purchaseOrderMB.completeSupplier}", List.class,
						new Class[] { String.class }));
		supplierCreateInput.setDropdown(true);
		supplierCreateInput.setValueExpression("var", expressionFactory
				.createValueExpression(elContext, "supplier", String.class));
		supplierCreateInput.setValueExpression("itemLabel", expressionFactory
				.createValueExpression(elContext,
						"#{supplier.identification} #{supplier.name}",
						String.class));
		supplierCreateInput.setValueExpression("itemValue",
				expressionFactory.createValueExpression(elContext,
						"#{supplier}", Supplier.class));
		supplierCreateInput.setConverter(new SupplierConverter());
		supplierCreateInput.setRequired(false);
		htmlPanelGrid.getChildren().add(supplierCreateInput);

		Message supplierCreateInputMessage = (Message) application
				.createComponent(Message.COMPONENT_TYPE);
		supplierCreateInputMessage.setId("supplierCreateInputMessage");
		supplierCreateInputMessage.setFor("supplierCreateInput");
		supplierCreateInputMessage.setDisplay("icon");
		htmlPanelGrid.getChildren().add(supplierCreateInputMessage);

		HtmlOutputText itemsCreateOutput = (HtmlOutputText) application
				.createComponent(HtmlOutputText.COMPONENT_TYPE);
		itemsCreateOutput.setId("itemsCreateOutput");
		itemsCreateOutput.setValue("Items:");
		htmlPanelGrid.getChildren().add(itemsCreateOutput);
		return htmlPanelGrid;
	}

	private HtmlPanelGrid createOrderItemPanelGrid;

	public HtmlPanelGrid populateOrderItemCreatePanel() {
		FacesContext facesContext = FacesContext.getCurrentInstance();
		javax.faces.application.Application application = facesContext
				.getApplication();
		ExpressionFactory expressionFactory = application
				.getExpressionFactory();
		ELContext elContext = facesContext.getELContext();

		HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application
				.createComponent(HtmlPanelGrid.COMPONENT_TYPE);

		OutputLabel quantityCreateOutput = (OutputLabel) application
				.createComponent(OutputLabel.COMPONENT_TYPE);
		quantityCreateOutput.setFor("quantityCreateInput");
		quantityCreateOutput.setId("quantityCreateOutput");
		quantityCreateOutput.setValue("Quantity:");
		htmlPanelGrid.getChildren().add(quantityCreateOutput);

		InputText quantityCreateInput = (InputText) application
				.createComponent(InputText.COMPONENT_TYPE);
		quantityCreateInput.setId("quantityCreateInput");
		quantityCreateInput.setValueExpression("value", expressionFactory
				.createValueExpression(elContext,
						"#{purchaseOrderMB.orderItem.quantity}",
						BigDecimal.class));
		quantityCreateInput.setRequired(false);
		htmlPanelGrid.getChildren().add(quantityCreateInput);

		Message quantityCreateInputMessage = (Message) application
				.createComponent(Message.COMPONENT_TYPE);
		quantityCreateInputMessage.setId("quantityCreateInputMessage");
		quantityCreateInputMessage.setFor("quantityCreateInput");
		quantityCreateInputMessage.setDisplay("icon");
		htmlPanelGrid.getChildren().add(quantityCreateInputMessage);

		OutputLabel productCreateOutput = (OutputLabel) application
				.createComponent(OutputLabel.COMPONENT_TYPE);
		productCreateOutput.setFor("productCreateInput");
		productCreateOutput.setId("productCreateOutput");
		productCreateOutput.setValue("Product:");
		htmlPanelGrid.getChildren().add(productCreateOutput);

		AutoComplete productCreateInput = (AutoComplete) application
				.createComponent(AutoComplete.COMPONENT_TYPE);
		productCreateInput.setId("productCreateInput");
		productCreateInput.setValueExpression("value", expressionFactory
				.createValueExpression(elContext,
						"#{purchaseOrderMB.orderItem.product}",
						ProductClient.class));
		productCreateInput.setCompleteMethod(expressionFactory
				.createMethodExpression(elContext,
						"#{purchaseOrderMB.completeProduct}", List.class,
						new Class[] { String.class }));
		productCreateInput.setDropdown(true);
		productCreateInput.setValueExpression("var", expressionFactory
				.createValueExpression(elContext, "product", String.class));
		productCreateInput.setValueExpression("itemLabel", expressionFactory
				.createValueExpression(elContext, "#{product.code}",
						String.class));
		productCreateInput.setValueExpression("itemValue", expressionFactory
				.createValueExpression(elContext, "#{product}",
						ProductClient.class));
		productCreateInput.setConverter(new ProductClientConverter());
		productCreateInput.setRequired(false);
		htmlPanelGrid.getChildren().add(productCreateInput);

		Message productCreateInputMessage = (Message) application
				.createComponent(Message.COMPONENT_TYPE);
		productCreateInputMessage.setId("productCreateInputMessage");
		productCreateInputMessage.setFor("productCreateInput");
		productCreateInputMessage.setDisplay("icon");
		htmlPanelGrid.getChildren().add(productCreateInputMessage);

		return htmlPanelGrid;
	}

	public String addOrderItem() {
		String message = "";
		if (purchaseOrder.getItems() == null) {
			purchaseOrder.setItems(new HashSet<OrderItem>());
		}
		orderItem.setPurchaseOrder(this.getPurchaseOrder());
		purchaseOrder.getItems().add(orderItem);
		orderItem = new OrderItem();
		message = "message_successfully_updated";
		RequestContext context = RequestContext.getCurrentInstance();

		FacesMessage facesMessage = MessageFactory.getMessage(message,
				"OrderItem");
		FacesContext.getCurrentInstance().addMessage(null, facesMessage);
		reset();
		return null;
	}

	public HtmlPanelGrid getCreateOrderItemPanelGrid() {
		if (createOrderItemPanelGrid == null) {
			createOrderItemPanelGrid = populateOrderItemCreatePanel();
		}
		return createOrderItemPanelGrid;
	}

	public void setCreateOrderItemPanelGrid(
			HtmlPanelGrid createOrderItemPanelGrid) {
		this.createOrderItemPanelGrid = createOrderItemPanelGrid;
	}

	public List<ProductClient> completeProduct(String query) {
		List<ProductClient> suggestions = new ArrayList<ProductClient>();
		for (ProductClient productClient : productClientService
				.findAllProductClients()) {
			String productClientStr = String.valueOf(productClient.getCode());
			if (productClientStr.toLowerCase().startsWith(query.toLowerCase())) {
				suggestions.add(productClient);
			}
		}
		return suggestions;
	}

	/**
	 * @return the purchaseOrder
	 */
	public PurchaseOrder getPurchaseOrder() {
		return purchaseOrder;
	}

	/**
	 * @param purchaseOrder
	 *            the purchaseOrder to set
	 */
	public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}

	/**
	 * @return the orderItemColumns
	 */
	public List<String> getOrderItemColumns() {
		return orderItemColumns;
	}

	/**
	 * @param orderItemColumns
	 *            the orderItemColumns to set
	 */
	public void setOrderItemColumns(List<String> orderItemColumns) {
		orderItemColumns = orderItemColumns;
	}

	/**
	 * @return the columns
	 */
	public List<String> getColumns() {
		return columns;
	}

	/**
	 * @param columns
	 *            the columns to set
	 */
	public void setColumns(List<String> columns) {
		this.columns = columns;
	}

	/**
	 * @return
	 */
	public OrderItem getOrderItem() {
		if (orderItem == null) {
			orderItem = new OrderItem();
		}
		return orderItem;
	}

	/**
	 * @param orderItem
	 */
	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}
	
	public List<OrderItem> getPurchaseOrderItemList(){
		List<OrderItem> list = new ArrayList<OrderItem>();
		list.addAll(this.purchaseOrder.getItems());
		return list;
	}
}
