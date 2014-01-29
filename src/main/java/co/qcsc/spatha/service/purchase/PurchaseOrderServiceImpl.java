package co.qcsc.spatha.service.purchase;

import java.util.List;

import co.qcsc.spatha.domain.purchase.PurchaseOrder;
import co.qcsc.spatha.domain.thirdparty.Client;

public class PurchaseOrderServiceImpl implements PurchaseOrderService {

    public List<PurchaseOrder> findPurchaseOrderByClient(Client client) {
        return purchaseOrderRepository.findPurchaseOrderByClient(client.getId());
    }

}
