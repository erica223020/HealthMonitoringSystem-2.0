package com.HealthMonitoring.System.controller;

import com.HealthMonitoring.System.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public String login(@RequestParam String email, 
                        @RequestParam String password, 
                        @RequestParam String captcha) {
        boolean success = userService.login(email, password, captcha);
        if (success) {
            return "redirect:/index"; // 登錄成功，重定向到主頁
        } else {
            return "redirect:/login?error"; // 登錄失敗，重定向到登入頁面並顯示錯誤信息
        }
    }
}