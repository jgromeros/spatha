package co.qcsc.spatha.domain.purchase;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderItem", fetch = FetchType.LAZY)
    private Set<Dossier> dossiers = new HashSet<Dossier>();

    /**
     * Method to return the set of dossiers as a List (Used for rendering purposes with
     * PrimeFaces components).
     * @return
     */
    public List<Dossier> getDossiersList() {
        List<Dossier> list = new ArrayList<Dossier>();
        list.addAll(getDossiers());
        return list;
    }

}
