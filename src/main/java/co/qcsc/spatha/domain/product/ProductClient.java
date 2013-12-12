package co.qcsc.spatha.domain.product;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaEntity
public class ProductClient {

    /**
     */
    @Size(min = 2)
    private String code;
}
