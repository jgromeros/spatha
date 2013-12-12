package co.qcsc.spatha.domain.dossier;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

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

}
