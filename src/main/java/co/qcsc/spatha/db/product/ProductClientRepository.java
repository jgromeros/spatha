package co.qcsc.spatha.db.product;

import java.util.List;

import co.qcsc.spatha.domain.product.ProductClient;
import co.qcsc.spatha.domain.thirdparty.Client;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ProductClient.class)
public interface ProductClientRepository {

	/**
	 * Find all ProductClient by ClientId
	 * 
	 * @param client
	 * @return
	 */

	public List<ProductClient> findByClient(long client);
}
