package co.qcsc.spatha.domain.dossier;

import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.classpath.operations.jsr303.RooUploadedFile;

@RooJavaBean
@RooToString
@RooJpaEntity
public class DossierItemFile {

	/**
     */
	@RooUploadedFile(contentType = "application/pdf")
	@Lob
	private byte[] itemFile;

	/**
	 * Name from file
	 */
	private String name;

	/**
	 * Version given by user
	 */
	private String userVersion;

	/**
	 * Version given by system
	 */
	private Long systemVersion;

	/**
     */
	@ManyToOne
	private DossierItem dossierItem;

}
