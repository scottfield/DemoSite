package com.famedy.openadmin.web.controller.entity;

import com.mycompany.sample.core.catalog.domain.CustomProductImpl;
import org.broadleafcommerce.openadmin.dto.ClassTree;
import org.broadleafcommerce.openadmin.web.controller.entity.AdminBasicEntityController;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by jackie on 4/7/2016.
 */
public class CustomAdminBasicEntityController extends AdminBasicEntityController {
    @Override
    public String viewEntityList(HttpServletRequest request, HttpServletResponse response, Model model, @PathVariable Map<String, String> pathVars, @RequestParam MultiValueMap<String, String> requestParams) throws Exception {
        return super.viewEntityList(request, response, model, pathVars, requestParams);
    }

    @Override
    protected String getDefaultEntityType() {
        return CustomProductImpl.class.getName();
    }
}
