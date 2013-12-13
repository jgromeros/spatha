package co.qcsc.spatha.domain.product;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
public class ProductSpecialty {

    /**
     */
    @ManyToOne
    private Product product;

    /**
     */
    @ManyToOne
    private Specialty specialty;

}
