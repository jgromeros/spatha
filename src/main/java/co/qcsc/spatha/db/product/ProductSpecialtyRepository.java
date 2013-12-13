package co.qcsc.spatha.db.product;
import co.qcsc.spatha.domain.product.ProductSpecialty;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ProductSpecialty.class)
public interface ProductSpecialtyRepository {
}
