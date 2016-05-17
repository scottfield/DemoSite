package com.cdfamedy.controller.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by jackie on 4/25/2016.
 */
@Controller
@RequestMapping("/promotion")
public class PromotionInfoController {
    @RequestMapping("/countdown")
    public String getCountDownPage() {
        return "daojishi";
    }

}
