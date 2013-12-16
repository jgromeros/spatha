package co.qcsc.spatha.db.product;
import co.qcsc.spatha.domain.product.ProductClient;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ProductClient.class)
public interface ProductClientRepository {
}
