package com.HealthMonitoring.System.controller;

import com.HealthMonitoring.System.util.CaptchaUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
public class CaptchaController {

    @GetMapping("/captcha")
    public void getCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String captchaText = CaptchaUtil.generateCaptchaText();
        request.getSession().setAttribute("captcha", captchaText);

        byte[] captchaImage = CaptchaUtil.generateCaptchaImage(captchaText);

        response.setContentType("image/png");
        response.getOutputStream().write(captchaImage);
    }
}