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

package com.cdfamedy.worklow.checkout;

import com.cdfamedy.worklow.order.CancelOrderSeed;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.inventory.service.InventoryService;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.workflow.BaseActivity;
import org.broadleafcommerce.core.workflow.ProcessContext;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 增加商品库存数量
 */
public class IncrementInventoryActivity extends BaseActivity<ProcessContext<CancelOrderSeed>> {

    protected static final Log LOG = LogFactory.getLog(IncrementInventoryActivity.class);
    @Resource(name = "blInventoryService")
    private InventoryService inventoryService;


    @Override
    public ProcessContext<CancelOrderSeed> execute(ProcessContext<CancelOrderSeed> context) throws Exception {
        Order order = context.getSeedData().getOrder();
        List<DiscreteOrderItem> orderItems = order.getDiscreteOrderItems();
        Map<Sku, Integer> skuQuantities = new HashMap<>();
        for (DiscreteOrderItem orderItem : orderItems) {
            Sku sku = orderItem.getSku();
            skuQuantities.put(sku, orderItem.getQuantity());
        }
        inventoryService.incrementInventory(skuQuantities);
        return context;
    }

}

