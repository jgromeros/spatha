package co.qcsc.spatha.db.product;
import co.qcsc.spatha.domain.product.Family;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Family.class)
public interface FamilyRepository {
}
