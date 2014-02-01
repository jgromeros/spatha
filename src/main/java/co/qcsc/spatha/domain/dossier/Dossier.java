package co.qcsc.spatha.domain.dossier;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

import co.qcsc.spatha.domain.product.Specialty;
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
    private Specialty specialty;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "dossier")
    private Set<DossierItem> items = new HashSet<DossierItem>();

    /**
     * To know the name of the dossier it uses the items. Since the items are one-to-one related
     * to sons of dossierDescriptions, the description of the dossier is known this way.
     * @return
     */
    public String getName() {
        if (items != null){
            for (DossierItem item : items){
                return item.getDocumentType().getDossierDescription().getName();
            }
        }
        return null;
    }

    /**
     * Method to return the set of dossierItems as a List (Used for rendering purposes with
     * PrimeFaces components).
     * @return
     */
    public List<DossierItem> getItemsList() {
        List<DossierItem> list = new ArrayList<DossierItem>();
        list.addAll(getItems());
        return list;
    }

}
