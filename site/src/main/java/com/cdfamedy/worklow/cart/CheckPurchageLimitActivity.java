package com.cdfamedy.worklow.cart;

import com.cdfamedy.core.domain.CustomProduct;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.order.service.call.OrderItemRequestDTO;
import org.broadleafcommerce.core.order.service.workflow.CartOperationRequest;
import org.broadleafcommerce.core.workflow.BaseActivity;
import org.broadleafcommerce.core.workflow.ProcessContext;

import javax.annotation.Resource;
import java.util.Objects;

/**
 * Created by jackie on 5/4/2016.
 */
public class CheckPurchageLimitActivity extends BaseActivity<ProcessContext<CartOperationRequest>> {
    @Resource(name = "blCatalogService")
    private CatalogService catalogService;
    @Override
    public ProcessContext<CartOperationRequest> execute(ProcessContext<CartOperationRequest> context) throws Exception {
        CartOperationRequest request = context.getSeedData();
        OrderItemRequestDTO itemRequest = request.getItemRequest();
        Long productId = itemRequest.getProductId();
        CustomProduct product = (CustomProduct) catalogService.findProductById(productId);
        Integer quantityRequested = itemRequest.getQuantity();

        Integer maxQuantityLimit = product.getLimit();
        if (Objects.nonNull(maxQuantityLimit) && quantityRequested > maxQuantityLimit) {
            throw new ExceededMaxPurchaseQuantityLimitException(productId, maxQuantityLimit, quantityRequested);
        }
        return context;
    }
}
