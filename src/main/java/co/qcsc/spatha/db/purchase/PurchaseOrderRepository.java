package co.qcsc.spatha.db.purchase;
import co.qcsc.spatha.domain.purchase.PurchaseOrder;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = PurchaseOrder.class)
public interface PurchaseOrderRepository {
}
