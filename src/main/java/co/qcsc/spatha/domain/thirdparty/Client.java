package co.qcsc.spatha.domain.thirdparty;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

import co.qcsc.spatha.domain.dossier.DocumentType;
import co.qcsc.spatha.domain.dossier.DossierDescription;
import co.qcsc.spatha.domain.product.ProductClient;

@RooJavaBean
@RooToString
@RooJpaEntity
public class Client {

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

	/**
     */
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "client", fetch = FetchType.LAZY)
	private Set<DossierDescription> dossierDescriptions = new HashSet<DossierDescription>();

	/**
     */
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "client")
	private Set<ProductClient> products = new HashSet<ProductClient>();

    /**
     * Method to return the set of dossierDescriptions as a List (Used for rendering purposes with
     * PrimeFaces components).
     * @return
     */
    public List<DossierDescription> getDossierDescriptionsList() {
        List<DossierDescription> list = new ArrayList<DossierDescription>();
        list.addAll(getDossierDescriptions());
        return list;
    }

    public String toString() {
        return this.getId().toString();
    }

}
