/*
 * Copyright 2008-2012 the original author or authors.
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

package com.mycompany.controller.catalog;

import com.mycompany.controller.wrapper.ProductWrapper;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.web.controller.catalog.BroadleafProductController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * This class works in combination with the CategoryHandlerMapping which finds a category based upon
 * the passed in URL.
 */
@Controller("blProductController")
public class ProductController extends BroadleafProductController {
    @Resource
    private CatalogService catalogService;

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return super.handleRequest(request, response);
    }

    @RequestMapping("/product/{id}")
    @ResponseBody
    public ProductWrapper findProductById(@PathVariable Long id) {
        ProductWrapper wrapper = new ProductWrapper();
        wrapper.setLimit(1);
        return wrapper;
    }

    @RequestMapping("/product/all")
    @ResponseBody
    public Object getAllProducts() {
        List<Product> productList = catalogService.findAllProducts();
        return productList;
    }

}
