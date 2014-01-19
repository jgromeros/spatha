package co.qcsc.spatha.domain.dossier;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaEntity
public class DocumentType {

    /**
     */
    @NotNull
    @Size(min = 2)
    private String code;

    /**
     */
    @NotNull
    @Size(min = 2)
    private String name;

    /**
     */
    private Integer documentOrder;

    /**
     */
    @ManyToOne
    private DossierDescription dossierDescription;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "documentParent")
    private Set<DocumentType> documentTypes = new HashSet<DocumentType>();

    /**
     */
    @ManyToOne
    private DocumentType documentParent;
}
