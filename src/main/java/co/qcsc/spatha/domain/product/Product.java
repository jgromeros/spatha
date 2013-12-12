package co.qcsc.spatha.domain.product;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaEntity
public class Product {

    /**
     */
    @NotNull
    @Size(min = 2)
    private String name;

    /**
     */
    private String type;

    /**
     */
    private String schedule;

    /**
     */
    private String material;

    /**
     */
    private String ending;

    /**
     */
    private String manufacturer;

    /**
     */
    private String origin;

    /**
     */
    private String brand;
}
