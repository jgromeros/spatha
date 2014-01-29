package co.qcsc.spatha.service.purchase;
import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import co.qcsc.spatha.domain.purchase.PurchaseOrder;
import co.qcsc.spatha.domain.thirdparty.Client;

@RooService(domainTypes = { co.qcsc.spatha.domain.purchase.PurchaseOrder.class })
public interface PurchaseOrderService {

    List<PurchaseOrder> findPurchaseOrderByClient(Client client);

}
