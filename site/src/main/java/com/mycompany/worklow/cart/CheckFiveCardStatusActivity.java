package com.mycompany.worklow.cart;

import com.mycompany.sample.core.catalog.domain.CustomProduct;
import com.mycompany.sample.util.HttpUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.order.service.call.OrderItemRequestDTO;
import org.broadleafcommerce.core.order.service.workflow.CartOperationRequest;
import org.broadleafcommerce.core.workflow.BaseActivity;
import org.broadleafcommerce.core.workflow.ProcessContext;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.annotation.Resource;
import java.util.Objects;

/**
 * Created by jackie on 5/4/2016.
 * 检测五折卡是否解锁
 */
public class CheckFiveCardStatusActivity extends BaseActivity<ProcessContext<CartOperationRequest>> {
    private static final Log LOG = LogFactory.getLog(CheckFiveCardStatusActivity.class);
    @Resource(name = "blCatalogService")
    private CatalogService catalogService;

    @Override
    public ProcessContext<CartOperationRequest> execute(ProcessContext<CartOperationRequest> context) throws Exception {
        CartOperationRequest request = context.getSeedData();
        OrderItemRequestDTO itemRequest = request.getItemRequest();
        Long productId = itemRequest.getProductId();
        CustomProduct product = (CustomProduct) catalogService.findProductById(productId);
        Object isUnlocked = HttpUtil.getRequest().getAttribute("isUnlocked");
        //如果是爆品并且五折卡未激活
        if (product.isFeaturedProduct() && Boolean.FALSE.equals(isUnlocked)) {
            LOG.warn("当前五折卡状态==>" + isUnlocked);
            throw new FiveCardUnlockException(false);
        }
        return context;
    }
}
