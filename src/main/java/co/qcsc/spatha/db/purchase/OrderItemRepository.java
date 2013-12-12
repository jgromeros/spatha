package co.qcsc.spatha.db.purchase;
import co.qcsc.spatha.domain.purchase.OrderItem;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = OrderItem.class)
public interface OrderItemRepository {
}
