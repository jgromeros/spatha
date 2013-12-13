package co.qcsc.spatha.domain.product;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
public class Family {

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(min = 2)
    private String name;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "family")
    private Set<Product> products = new HashSet<Product>();

}
