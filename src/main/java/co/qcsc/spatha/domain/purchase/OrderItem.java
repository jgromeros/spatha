package co.qcsc.spatha.domain.purchase;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Digits;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

import co.qcsc.spatha.domain.dossier.Dossier;
import co.qcsc.spatha.domain.product.ProductClient;

@RooJavaBean
@RooToString
@RooJpaEntity
public class OrderItem {

    /**
     */
    @Digits(integer = 12, fraction = 2)
    private BigDecimal quantity;

    /**
     */
    @ManyToOne
    private PurchaseOrder purchaseOrder;

    /**
     */
    @ManyToOne
    private ProductClient product;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderItem")
    private Set<Dossier> dossier = new HashSet<Dossier>();

}
