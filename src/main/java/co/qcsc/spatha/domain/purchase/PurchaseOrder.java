package co.qcsc.spatha.domain.purchase;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaEntity
public class PurchaseOrder {

    /**
     */
    @NotNull
    private String numberOrder;

    /**
     */
    private String supplierContact;

    /**
     */
    private String clientContact;

    /**
     */
    private String supplierPhone;

    /**
     */
    private String clientPhone;

    /**
     */
    private String supplierEmail;

    /**
     */
    private String clientEmail;
}
