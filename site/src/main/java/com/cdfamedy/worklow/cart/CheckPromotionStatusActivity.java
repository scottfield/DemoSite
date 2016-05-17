package com.cdfamedy.worklow.cart;

import com.cdfamedy.core.domain.Promotion;
import com.cdfamedy.core.util.HttpUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.order.service.workflow.CartOperationRequest;
import org.broadleafcommerce.core.workflow.BaseActivity;
import org.broadleafcommerce.core.workflow.ProcessContext;

/**
 * Created by jackie on 5/4/2016.
 * 检测活动是否结束
 */
public class CheckPromotionStatusActivity extends BaseActivity<ProcessContext<CartOperationRequest>> {
    private static final Log LOG = LogFactory.getLog(CheckPromotionStatusActivity.class);

    @Override
    public ProcessContext<CartOperationRequest> execute(ProcessContext<CartOperationRequest> context) throws Exception {
        Integer status = HttpUtil.getRequestAttribute("promotionStatus");
        if (status != Promotion.IN_PROCESS) {
            LOG.info("活动不在进行当中,当前活动状态:" + status);
            throw new PromotionException();
        }
        return context;
    }
}
