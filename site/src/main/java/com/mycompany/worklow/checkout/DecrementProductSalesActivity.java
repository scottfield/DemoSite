/*
 * Copyright 2008-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.mycompany.worklow.checkout;

import com.mycompany.sample.core.catalog.domain.CustomProduct;
import com.mycompany.worklow.cancelOrder.CancelOrderSeed;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.workflow.BaseActivity;
import org.broadleafcommerce.core.workflow.ProcessContext;

import javax.annotation.Resource;
import java.util.List;

/**
 * 减少商品销售数量
 */
public class DecrementProductSalesActivity extends BaseActivity<ProcessContext<CancelOrderSeed>> {

    protected static final Log LOG = LogFactory.getLog(DecrementProductSalesActivity.class);
    @Resource(name = "blCatalogService")
    private CatalogService catalogService;


    @Override
    public ProcessContext<CancelOrderSeed> execute(ProcessContext<CancelOrderSeed> context) throws Exception {
        LOG.info("----减少商品销售数量开始----");
        Order order = context.getSeedData().getOrder();
        List<DiscreteOrderItem> orderItems = order.getDiscreteOrderItems();
        for (DiscreteOrderItem orderItem : orderItems) {
            CustomProduct product = (CustomProduct) orderItem.getProduct();
            Integer sales = product.getSales();
            LOG.debug("产品[" + product.getName() + "]原有销量为" + sales + "");
            product.setSales(sales - orderItem.getQuantity());
            LOG.debug("更新产品[" + product.getName() + "]的销量为" + product.getSales());
            catalogService.saveProduct(product);
        }
        LOG.info("----减少商品销售数量结束----");
        return context;
    }

}

