package co.qcsc.spatha.domain.thirdparty;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaEntity
public class Supplier {

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(min = 2)
    private String identification;

    /**
     */
    @NotNull
    @Size(min = 2)
    private String name;

    @Override
    public String toString() {
        return name;
    }

}
