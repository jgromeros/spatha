package co.qcsc.spatha.domain.purchase;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import java.math.BigDecimal;
import javax.validation.constraints.Digits;

@RooJavaBean
@RooToString
@RooJpaEntity
public class OrderItem {

    /**
     */
    @Digits(integer = 12, fraction = 2)
    private BigDecimal quantity;
}
