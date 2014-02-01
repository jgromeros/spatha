package co.qcsc.spatha.domain.dossier;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "dossierDescription", fetch = FetchType.EAGER)
    private Set<DocumentType> documentTypes = new HashSet<DocumentType>();

    /**
     */
    @NotNull
    private Boolean valid;

//    /**
//     * Method to return the set of documentTypes as a List (Used for rendering purposes with
//     * PrimeFaces components).
//     * @return
//     */
//    public List<DocumentType> getDocumentTypesList() {
//        List<DocumentType> list = new ArrayList<DocumentType>();
//        list.addAll(getDocumentTypes());
//        return list;
//    }

}
