package co.qcsc.spatha.db.product;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import co.qcsc.spatha.domain.product.Product;

@RooJpaRepository(domainType = Product.class)
public interface ProductRepository {

}
