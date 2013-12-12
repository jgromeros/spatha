package co.qcsc.spatha.domain.dossier;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

import co.qcsc.spatha.domain.thirdparty.Client;

@RooJavaBean
@RooToString
@RooJpaEntity
public class DossierDescription {

    /**
     */
    @NotNull
    @Size(min = 2)
    private String name;

    /**
     */
    @ManyToOne
    private Client client;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "dossierDescription")
    private Set<DocumentType> documentTypes = new HashSet<DocumentType>();

}
