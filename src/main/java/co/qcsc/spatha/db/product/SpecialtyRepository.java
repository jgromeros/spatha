package co.qcsc.spatha.db.product;
import co.qcsc.spatha.domain.product.Specialty;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Specialty.class)
public interface SpecialtyRepository {
}
