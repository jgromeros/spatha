package co.qcsc.spatha.domain.purchase;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.HashSet;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

import co.qcsc.spatha.domain.thirdparty.Client;
import co.qcsc.spatha.domain.thirdparty.Supplier;

@RooJavaBean
@RooToString
@RooJpaEntity
public class PurchaseOrder {

	/**
     */
	@NotNull
	private String numberOrder;

	/**
     */
	private String supplierContact;

	/**
     */
	private String clientContact;

	/**
     */
	private String supplierPhone;

	/**
     */
	private String clientPhone;

	/**
     */
	private String supplierEmail;

	/**
     */
	private String clientEmail;

	/**
	 * Actual state of PO
	 */
	private String state;

	/**
     */
	@ManyToOne
	private Client client;

	/**
     */
	@ManyToOne
	private Supplier supplier;

	/**
     */
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "purchaseOrder", fetch = FetchType.EAGER)
	private Set<OrderItem> items = new HashSet<OrderItem>();

	/**
	 * Method to return the set of orderItems as a List (Used for rendering
	 * purposes with PrimeFaces components).
	 * 
	 * @return
	 */
	public List<OrderItem> getOrderItemList() {
		List<OrderItem> list = new ArrayList<OrderItem>();
		list.addAll(getItems());
		return list;
	}

}
