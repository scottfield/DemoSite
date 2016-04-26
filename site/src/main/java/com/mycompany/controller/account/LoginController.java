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

import com.mycompany.sample.core.WeiXinConstants;
import com.mycompany.sample.service.CustomerAttributeService;
import com.mycompany.sample.service.WeixinService;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.common.persistence.EntityConfiguration;
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
import java.util.Set;

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
    private String retUrl = "http://discount.lzzyad.com";
    @Resource(name = "blEntityConfiguration")
    private EntityConfiguration entityConfiguration;
    @Resource
    private WeixinService weixinService;

    /**
     * 发起微信授权
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, Model model) {

        LOG.info("original url==>" + retUrl);
        String encodedUrl = null;
        try {
            encodedUrl = URLEncoder.encode(retUrl, "UTF-8");
            LOG.info("encoded url==>" + retUrl);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String queryStr = "app_key=" + WeiXinConstants.APP_KEY + "&ret_uri=" + encodedUrl;
//        return "redirect:http://weixin.cplotus.com/weixin/trans_auth.ashx?" + queryStr;
        return "redirect:/?openid=o1Py0t7UnGihjJqCfZz2bigtkTu5";
    }

    /**
     * 处理用户授权(微信的回调地址)
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/ ")
    public String loginProcess(HttpServletRequest request, HttpServletResponse response, Model model) {
        //检测请求参数中是否包含open id
        String openId = request.getParameter("openid");
        if (StringUtils.isBlank(openId)) {
            return "redirect:/login";
        }
        //检测open ID是否已经注册
        CustomerAttribute customerAttribute = attributeService.readCustomerByOpenId(openId);
        if (Objects.isNull(customerAttribute)) {
            Customer customer = (Customer) entityConfiguration.createEntityInstance("org.broadleafcommerce.profile.core.domain.Customer");
            Map<String, Object> userInfo = weixinService.getUserInfo(openId);
            //重新授权
            if (!userInfo.get("errcode").equals(0)) {
                return "redirect:/login";
            }
            customer.setUsername(openId);
            Object nickname = userInfo.get("nickname");
            customer.setFirstName(nickname == null ? " " : nickname.toString());
            customer.setLastName(openId);
            customer.setPassword(openId);
            customer.setRegistered(true);
            customer.setEmailAddress("default");
            Map<String, CustomerAttribute> customerAttributes = customer.getCustomerAttributes();
            userInfo.remove("errcode");
            userInfo.remove("errmsg");
            userInfo.remove("nonce");
            userInfo.remove("app_key");
            userInfo.remove("stat_src");
            userInfo.remove("timestamp");
            userInfo.remove("queryStr");
            Set<String> keySet = userInfo.keySet();
            for (String key : keySet) {
                CustomerAttribute attribute = new CustomerAttributeImpl();
                attribute.setName(key);
                Object value = userInfo.get(key);
                if (Objects.nonNull(value)) {
                    attribute.setValue(value.toString());
                }
                attribute.setCustomer(customer);
                customerAttributes.put(key, attribute);
            }

            customerService.registerCustomer(customer, openId, openId);
        }
        //将用户自动登录
        String username = openId;
        String password = openId;
        Authentication authentication = new UsernamePasswordAuthenticationToken(username, password);
        authenticationManager.authenticate(authentication);
        SecurityContext securityContext = SecurityContextHolder.getContext();
        securityContext.setAuthentication(authentication);
        HttpSession session = request.getSession(true);
        session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
        //检测用户是否是通过分享页面访问网站
        Object referrer = session.getAttribute("referrer");
        if (Objects.nonNull(referrer)) {
            return "redirect:/fiveCard/issue";
        }
        return "redirect:/index";
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
