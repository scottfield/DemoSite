package com.mycompany.controller.account;

import com.mycompany.sample.core.catalog.domain.QRCode;
import com.mycompany.sample.service.QRCodeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jackie on 4/21/2016.
 */
@Controller
@RequestMapping("/qr")
public class QRCodeController {
    @Resource
    private QRCodeService qrCodeService;

    @RequestMapping(value = "/verify/{code}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> verifyCode(@PathVariable("code") String code) {
        Map<String, Object> result = new HashMap<>();
        result.put("code", 1000);
        result.put("message", "二维码有效");
        boolean isAvailable = qrCodeService.verifyCode(code);
        if (!isAvailable) {
            result.put("code", -1000);
            result.put("message", "二维码无效");
        }
        return result;
    }

    /**
     * 核销二维码
     *
     * @param code
     * @return
     */
    @RequestMapping(value = "/exchange/{code}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> consumeQRCode(@PathVariable("code") String code) {
        Map<String, Object> result = new HashMap<>();
        result.put("code", 1000);
        result.put("message", "二维码有效");
        boolean isAvailable = qrCodeService.verifyCode(code);
        if (!isAvailable) {
            result.put("message", "该二维码已核销");
            return result;
        }
        QRCode qrCode = qrCodeService.readByCode(code);
        qrCode.setStatus(1);
        qrCodeService.updateQRCode(qrCode);
        return result;
    }
}
