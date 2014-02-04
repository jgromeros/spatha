package co.qcsc.spatha.domain.dossier;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaEntity
public class DossierItem {

    /**
     */
    @ManyToOne
    private DocumentType documentType;

    /**
     */
    @ManyToOne
    private Dossier dossier;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "dossierItem")
    private Set<DossierItemFile> files = new HashSet<DossierItemFile>();

    /**
     */
    @NotNull
    private Boolean added;

    /**
     */
    @Size(max = 2048)
    private String comment;
}
