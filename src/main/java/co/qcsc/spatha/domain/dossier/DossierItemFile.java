package co.qcsc.spatha.domain.dossier;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Lob;
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
}
