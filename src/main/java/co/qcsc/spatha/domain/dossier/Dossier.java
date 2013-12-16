package co.qcsc.spatha.domain.dossier;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

import co.qcsc.spatha.domain.product.ProductSpecialty;
import co.qcsc.spatha.domain.purchase.OrderItem;

@RooJavaBean
@RooToString
@RooJpaEntity
public class Dossier {

    /**
     */
    private Boolean template;

    /**
     */
    @ManyToOne
    private OrderItem orderItem;

    /**
     */
    @ManyToOne
    private ProductSpecialty specialty;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "dossier")
    private Set<DossierItem> items = new HashSet<DossierItem>();

}
