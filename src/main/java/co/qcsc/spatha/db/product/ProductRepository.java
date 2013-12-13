package co.qcsc.spatha.db.product;
import co.qcsc.spatha.domain.product.Product;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Product.class)
public interface ProductRepository {
}
