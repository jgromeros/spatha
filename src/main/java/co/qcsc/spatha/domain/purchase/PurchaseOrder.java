package co.qcsc.spatha.domain.purchase;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
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
     */
    @ManyToOne
    private Client client;

    /**
     */
    @ManyToOne
    private Supplier supplier;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "purchaseOrder")
    private Set<OrderItem> items = new HashSet<OrderItem>();

}
