package co.qcsc.spatha.domain.product;

import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

import co.qcsc.spatha.domain.thirdparty.Client;

@RooJavaBean
@RooToString
@RooJpaEntity
public class ProductClient {

	/**
     */
	@Size(min = 2)
	private String code;

	/**
     */
	@ManyToOne
	private Client client;

	/**
     */
	@ManyToOne
	private Product product;

	/**
	 * Client Desciption from Product
	 */
	private String clientDescription;

	
	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return this.clientDescription;
	}

}
