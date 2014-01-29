package co.qcsc.spatha.db.purchase;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;
import org.springframework.transaction.annotation.Transactional;

import co.qcsc.spatha.domain.purchase.PurchaseOrder;

@RooJpaRepository(domainType = PurchaseOrder.class)
public interface PurchaseOrderRepository {

    @Query("select po from PurchaseOrder po where po.client.id = :clientId")
    @Transactional(readOnly = true)
    List<PurchaseOrder> findPurchaseOrderByClient(@Param("clientId") Long clientId);

}
