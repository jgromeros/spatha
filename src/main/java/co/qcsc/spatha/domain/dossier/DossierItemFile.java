package co.qcsc.spatha.domain.dossier;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.classpath.operations.jsr303.RooUploadedFile;

@RooJavaBean
@RooToString
@RooJpaEntity
public class DossierItemFile {

    /**
     */
    @RooUploadedFile(contentType = "application/pdf")
    @Lob
    private byte[] itemFile;

    /**
     */
    @ManyToOne
    private DossierItem dossierItem;

}
