package co.qcsc.spatha.service.product;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import co.qcsc.spatha.db.product.ProductClientRepository;
import co.qcsc.spatha.db.product.ProductRepository;
import co.qcsc.spatha.domain.product.Product;
import co.qcsc.spatha.domain.product.ProductClient;
import co.qcsc.spatha.domain.thirdparty.Client;

public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductClientRepository productClientRepository;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * co.qcsc.spatha.service.product.ProductService#findProductsByClientId(
	 * co.qcsc.spatha.domain.thirdparty.Client)
	 */
	@Override
	public List<Product> findProductsByClientId(Client client) {
		// usa el repo de ProductosClient
		System.out.println("1 cid:"+client.getId());
		List<ProductClient> productsClient = productClientRepository
				.findByClient(client.getId());
		System.out.println("2");
		List<Product> products = new ArrayList<>();
		System.out.println("3");
		for (ProductClient productClient : productsClient) {
			products.add(productClient.getProduct());
		}
		System.out.println("4");
		return products;

	}
}
