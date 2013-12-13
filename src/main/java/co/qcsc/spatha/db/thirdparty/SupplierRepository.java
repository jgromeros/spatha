package co.qcsc.spatha.db.thirdparty;
import co.qcsc.spatha.domain.thirdparty.Supplier;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Supplier.class)
public interface SupplierRepository {
}
