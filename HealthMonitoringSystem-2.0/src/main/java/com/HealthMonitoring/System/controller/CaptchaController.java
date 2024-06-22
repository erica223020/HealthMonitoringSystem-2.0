package com.HealthMonitoring.System.controller;

import com.HealthMonitoring.System.util.CaptchaUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
public class CaptchaController {

	 // 創建 Logger 實例
    private static final Logger logger = LoggerFactory.getLogger(CaptchaController.class);
    
    @GetMapping("/captcha")
    public void getCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String captchaText = CaptchaUtil.generateCaptchaText();
        request.getSession().setAttribute("captcha", captchaText);

        byte[] captchaImage = CaptchaUtil.generateCaptchaImage(captchaText);

        response.setContentType("image/png");
        response.getOutputStream().write(captchaImage);
        // 在控制台顯示生成的驗證碼
        logger.info("Generated captcha: {}", captchaText);
        
    }
}