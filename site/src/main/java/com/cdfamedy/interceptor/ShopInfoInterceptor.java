package com.cdfamedy.interceptor;

import com.cdfamedy.core.catalog.domain.CustomAddress;
import com.cdfamedy.core.catalog.domain.Shop;
import com.cdfamedy.service.ShopService;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.core.domain.CustomerAddress;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Created by jackie on 4/27/2016.
 */
public class ShopInfoInterceptor implements HandlerInterceptor {
    @Resource(name = "shopService")
    private ShopService shopService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        Customer customer = CustomerState.getCustomer();
        Map<String, Object> model = modelAndView.getModel();
        List<CustomerAddress> addressList = customer.getCustomerAddresses();
        if (Objects.nonNull(addressList) && addressList.size() > 0) {
            Shop defaultShop = null;
            for (CustomerAddress customerAddress : addressList) {
                if (customerAddress.getAddressName().equals("收货地址")) {
                    CustomAddress address = (CustomAddress) customerAddress.getAddress();
                    defaultShop = address.getShop();
                    break;
                }

            }
            //将关注名店设置为默认收货地址
            if (Objects.isNull(defaultShop)) {
                CustomAddress address = (CustomAddress) customer.getCustomerAddresses().get(0).getAddress();
                defaultShop = address.getShop();
            }
            model.put("defaultShop", defaultShop);
            model.put("defaultShopId", defaultShop==null?null:defaultShop.getId());
        }
        //获取门店列表
        Set<Shop> shops = shopService.getAllShop();
        Map<String, Set<Shop>> shopMap = new HashMap<>();
        for (Shop shop : shops) {
            String city = shop.getCity();
            if (!shopMap.containsKey(city)) {
                Set<Shop> set = new HashSet<>();
                shopMap.put(city, set);
                set.add(shop);
            } else {
                shopMap.get(city).add(shop);
            }
        }
        model.put("areas", shopMap);

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
