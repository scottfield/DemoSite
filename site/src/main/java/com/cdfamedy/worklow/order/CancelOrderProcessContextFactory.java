package com.cdfamedy.worklow.order;

import org.broadleafcommerce.core.workflow.DefaultProcessContextImpl;
import org.broadleafcommerce.core.workflow.ProcessContext;
import org.broadleafcommerce.core.workflow.ProcessContextFactory;
import org.broadleafcommerce.core.workflow.WorkflowException;

/**
 * Created by jackie on 4/20/2016.
 */
public class CancelOrderProcessContextFactory implements ProcessContextFactory<CancelOrderSeed, CancelOrderSeed> {
    @Override
    public ProcessContext<CancelOrderSeed> createContext(CancelOrderSeed preSeedData) throws WorkflowException {
        ProcessContext<CancelOrderSeed> context = new DefaultProcessContextImpl();
        context.setSeedData(preSeedData);
        return context;
    }
}
