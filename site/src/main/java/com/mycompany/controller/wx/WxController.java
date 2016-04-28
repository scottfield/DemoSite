package com.mycompany.controller.wx;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by jackie on 4/28/2016.
 */
@Controller
@RequestMapping("/wx")
public class WxController {
    @RequestMapping("/subscribe")
    public String subscribe() {
        return "guide";
    }
}
