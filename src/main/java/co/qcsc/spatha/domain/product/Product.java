package co.qcsc.spatha.domain.product;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

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
    private String size;

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

    /**
     */
    @ManyToOne
    private Family family;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private Set<ProductClient> clientProducts = new HashSet<ProductClient>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private Set<ProductSpecialty> specialties = new HashSet<ProductSpecialty>();

}
