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

import org.apache.commons.lang3.StringUtils;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.core.web.controller.account.BroadleafLoginController;
import org.broadleafcommerce.core.web.controller.account.ResetPasswordForm;
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

/**
 * The controller responsible for all actions involving logging a customer in
 */
@Controller
public class LoginController extends BroadleafLoginController {
    @Resource(name = "blAuthenticationManager")
    private AuthenticationManager authenticationManager;

    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "redirect:/login/process?openid=oGrpEuFiufUy-G08zvOCs";
    }

    @RequestMapping("/login/process")
    public String loginProcess(HttpServletRequest request, HttpServletResponse response, Model model) {
        //check open id
        String openId = request.getParameter("openid");
        if (StringUtils.isBlank(openId)) {
            return "redirect:/login";
        }
        //register open id if not exist in db
        //login user account
        String username = "scottfield@qq.com";
        String password = "123456";
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
