package com.HealthMonitoring.System.controller;

import com.HealthMonitoring.System.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginPage(Model model, @RequestParam(value = "error", required = false) String error) {
        if (error != null) {
            model.addAttribute("loginError", "無效的用戶名或密碼");
        }
        return "login"; // 返回 login.jsp
    }

    @GetMapping({"/", "/index"})
    public String showIndexPage() {
        return "index"; // 返回 index.jsp
    }
    @GetMapping("/addRecord")
    public String showAddRecordPage() {
        return "addRecord"; // 返回 addRecord.jsp
    }
    @GetMapping("/register")
    public String showRegister() {
        return "register"; 
    }
    // 添加訪問 dataAnalysis 頁面的映射
    @GetMapping("/dataAnalysis")
    public String showDataAnalysisPage() {
        return "dataAnalysis"; // 返回 dataAnalysis.jsp
    }

    @PostMapping("/user/register")
    public String register(@RequestParam("email") String email,
                           @RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("confirmPassword") String confirmPassword,
                           @RequestParam("gender") String gender,
                           Model model) {
    	
    	// 日誌記錄
        System.out.println("Received registration request with email: " + email);
    	// 1. 檢查密碼是否匹配
        if (!password.equals(confirmPassword)) {
            model.addAttribute("registerError", "密碼不匹配");
            return "register";
        }
        // 2. 檢查信箱是否已存在
        if (userService.emailExists(email)) { // 假設 userService 有一個方法來檢查信箱是否存在
            model.addAttribute("emailExists", "這個信箱已被註冊");
            return "register";
        }

        // 3. 調用服務層進行註冊處理
        boolean success = userService.register(email, username, password, gender);
        if (success) {
        	model.addAttribute("registerSuccess", true);
        	return "register"; // 註冊成功，返回註冊頁面
        } else {
            model.addAttribute("registerError", "註冊失敗，請重試");
            return "register";
        }
    }
}