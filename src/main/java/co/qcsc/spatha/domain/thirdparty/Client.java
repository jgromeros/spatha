package co.qcsc.spatha.domain.thirdparty;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

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
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "client")
	private Set<DossierDescription> dossierDescriptions = new HashSet<DossierDescription>();

	/**
     */
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "client")
	private Set<ProductClient> products = new HashSet<ProductClient>();

}
