package co.qcsc.spatha.service.product;

import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import co.qcsc.spatha.domain.product.Product;
import co.qcsc.spatha.domain.thirdparty.Client;

@RooService(domainTypes = { co.qcsc.spatha.domain.product.Product.class })
public interface ProductService {

	/**
	 * Find products by Client ID
	 * 
	 * @return
	 */
	public abstract List<Product> findProductsByClientId(Client client);
}
