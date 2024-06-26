package com.HealthMonitoring.System.controller;

import com.HealthMonitoring.System.model.po.User;
import com.HealthMonitoring.System.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.security.core.userdetails.UserDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginPage(Model model, @RequestParam(value = "error", required = false) String error) {
        if (error != null) {
            model.addAttribute("loginError", "無效的用戶名或密碼");
            logger.info("Login error: 無效的用戶名或密碼");
        }
        return "login"; // 返回 login.jsp
    }

    @GetMapping({"/", "/index"})
    public String showIndexPage() {
    	 logger.debug("Accessing index page");
        return "index"; // 返回 index.jsp
    }
    @GetMapping("/addRecord")
    public String showAddRecordPage() {
    	logger.debug("Accessing addRecord page");
        return "addRecord"; // 返回 addRecord.jsp
    }
    @GetMapping("/register")
    public String showRegister() {
    	logger.debug("Accessing register page");
        return "register"; 
    }
    // 添加訪問 dataAnalysis 頁面的映射
    @GetMapping("/dataAnalysis")
    public String showDataAnalysisPage() {
    	logger.debug("Accessing dataAnalysis page");
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
    	logger.info("Received registration request with email: {}", email);
    	// 1. 檢查密碼是否匹配
        if (!password.equals(confirmPassword)) {
            model.addAttribute("registerError", "密碼不匹配");
            logger.info("Registration error: 密碼不匹配 for email: {}", email);
            return "register";
        }
        // 2. 檢查信箱是否已存在
        if (userService.emailExists(email)) { // 假設 userService 有一個方法來檢查信箱是否存在
            model.addAttribute("emailExists", "這個信箱已被註冊");
            logger.info("Registration error: 信箱已被註冊 for email: {}", email);
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
 // 添加 POST /user/login 的處理方法
    @PostMapping("/user/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        @RequestParam("captcha") String captcha,
                        Model model) {

        if (!userService.validateCaptcha(captcha)) {
            model.addAttribute("captchaError", "驗證碼錯誤");
            logger.info("Login error: 驗證碼錯誤 for email: {}", email);
            return "login"; // 返回登录页面，显示验证码错误
        }

        boolean success = userService.login(email, password, captcha);
        if (success) {
            model.addAttribute("loginSuccess", true); // 登錄成功，添加成功標誌
            return "login"; // 登入成功，返回登入頁面
        } else {
            model.addAttribute("loginError", "無效的用戶名或密碼");
            logger.info("Login error: 無效的用戶名或密碼 for email: {}", email);
            return "login"; // 登录失败，返回登录页面
        }
    }
    
    @PostMapping("/user/logout")
    public String logout() {
        // 重定向到登入頁面
        return "redirect:/login";
    }
    
    // 新增的方法來根據 email 獲取用戶資料
    @GetMapping("/user/getUserByEmail")
    @ResponseBody
    public User getUserByEmail(@RequestParam("email") String email) {
        logger.info("Fetching user details for email: {}", email);
        User user = userService.findUserByEmail(email);
        if (user != null) {
            logger.info("User details - ID: {}, Username: {}", user.getUserId(), user.getUsername());
        } else {
            logger.info("No user found with email: {}", email);
        }
        return user;
    }
    }