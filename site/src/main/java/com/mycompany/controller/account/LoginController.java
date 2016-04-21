/*
 * Copyright 2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.mycompany.controller.account;

import com.mycompany.sample.service.CustomerAttributeService;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.core.web.controller.account.BroadleafLoginController;
import org.broadleafcommerce.core.web.controller.account.ResetPasswordForm;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.core.domain.CustomerAttribute;
import org.broadleafcommerce.profile.core.domain.CustomerAttributeImpl;
import org.broadleafcommerce.profile.core.service.CustomerService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Objects;
import java.util.logging.Logger;

/**
 * The controller responsible for all actions involving logging a customer in
 */
@Controller
public class LoginController extends BroadleafLoginController {
    private static final Log LOG = LogFactory.getLog(LoginController.class);
    @Resource(name = "blAuthenticationManager")
    private AuthenticationManager authenticationManager;
    @Resource
    private CustomerAttributeService attributeService;
    @Resource(name = "blCustomerService")
    private CustomerService customerService;

    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
        String appKey = "5539851609";
        String retUrl = "http://discount.lzzyad.com/index.php";
        LOG.info("original url==>" + retUrl);
        try {
            retUrl = URLEncoder.encode(retUrl, "UTF-8");
            LOG.info("encoded url==>" + retUrl);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String queryStr = "app_key=" + appKey + "&ret_uri=" + retUrl;
        return "redirect:http://weixin.cplotus.com/weixin/trans_auth.ashx?" + queryStr;
//        return "redirect:/login/process?openid=oGrpEuFiufUy-G08zvOCs";
    }


    @RequestMapping("/login/process")
    public String loginProcess(HttpServletRequest request, HttpServletResponse response, Model model) {
        //check open id
        String openId = request.getParameter("openid");
        if (StringUtils.isBlank(openId)) {
            return "redirect:/login";
        }
        //register open id if not exist in db
        CustomerAttribute customerAttribute = attributeService.readCustomerByOpenId(openId);
        if (Objects.isNull(customerAttribute)) {
            Customer customer = customerService.createCustomer();
            customer.setFirstName(openId);
            customer.setLastName(openId);
            customer.setPassword(openId);
            customer.setRegistered(true);
            customer.setEmailAddress("default");
            Map<String, CustomerAttribute> customerAttributes = customer.getCustomerAttributes();
            CustomerAttribute attribute = new CustomerAttributeImpl();
            attribute.setName("openid");
            attribute.setValue(openId);
            customerAttributes.put("openid", attribute);
            customerService.saveCustomer(customer);
        }
        //login user account
        String username = openId;
        String password = openId;
        Authentication authentication = new UsernamePasswordAuthenticationToken(username, password);
        authenticationManager.authenticate(authentication);
        SecurityContext securityContext = SecurityContextHolder.getContext();
        securityContext.setAuthentication(authentication);
        HttpSession session = request.getSession(true);
        session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
        return "redirect:/";
    }

    @RequestMapping(value = "/login/forgotPassword", method = RequestMethod.GET)
    public String forgotPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.forgotPassword(request, response, model);
    }

    @RequestMapping(value = "/login/forgotPassword", method = RequestMethod.POST)
    public String processForgotPassword(@RequestParam("emailAddress") String emailAddress, HttpServletRequest request, Model model) {
        return super.processForgotPassword(emailAddress, request, model);
    }

    @RequestMapping(value = "/login/resetPassword", method = RequestMethod.GET)
    public String resetPassword(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.resetPassword(request, response, model);
    }

    @RequestMapping(value = "/login/resetPassword", method = RequestMethod.POST)
    public String processResetPassword(@ModelAttribute("resetPasswordForm") ResetPasswordForm resetPasswordForm, HttpServletRequest request, HttpServletResponse response, Model model, BindingResult errors) throws ServiceException {
        return super.processResetPassword(resetPasswordForm, request, response, model, errors);
    }

    @Override
    public String getResetPasswordUrl(HttpServletRequest request) {
        String url = request.getScheme() + "://" + request.getServerName() + getResetPasswordPort(request, request.getScheme() + "/");

        if (request.getContextPath() != null && !"".equals(request.getContextPath())) {
            url = url + request.getContextPath() + "/login/resetPassword";
        } else {
            url = url + "/login/resetPassword";
        }
        return url;
    }
}
