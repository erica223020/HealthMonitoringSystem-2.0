package com.HealthMonitoring.System.controller;

import com.HealthMonitoring.System.model.po.User;
import com.HealthMonitoring.System.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
    public String showIndexPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            // 如果沒有登錄，重定向到登錄頁面
            return "redirect:/login";
        }
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
    
    @GetMapping("/dataAnalysis")
    public String showDataAnalysisPage() {
        logger.debug("Accessing dataAnalysis page");
        return "dataAnalysis"; // 返回 dataAnalysis.jsp
    }
    
    @GetMapping("/goals")
    public String showGoalsPage() {
        logger.debug("Accessing goals page");
        return "goals"; // 返回 dataAnalysis.jsp
    }
    
    @GetMapping("/faq")
    public String showFaqPage() {
        logger.debug("Accessing Faq page");
        return "faq"; // 返回 dataAnalysis.jsp
    }

    @PostMapping("/user/register")
    public String register(@RequestParam("email") String email,
                           @RequestParam("username") String username,
                           @RequestParam("password") String password,
                           @RequestParam("confirmPassword") String confirmPassword,
                           @RequestParam("gender") String gender,
                           @RequestParam("birthday") @DateTimeFormat(pattern = "yyyy/MM/dd") LocalDate birthday,
                           Model model) {

        logger.info("Received registration request with email: {}", email);

        // 1. 檢查密碼是否匹配
        if (!password.equals(confirmPassword)) {
            logger.info("Registration error: 密碼不匹配 for email: {}", email);
            model.addAttribute("registerError", "密碼不匹配");
            return "register";
        }

        // 2. 檢查信箱是否已存在
        if (userService.emailExists(email)) {
            logger.info("Registration error: 信箱已被註冊 for email: {}", email);
            model.addAttribute("emailExists", "這個信箱已被註冊");
            return "register";
        }

        // 3. 調用服務層進行註冊處理
        boolean success = userService.register(email, username, password, gender, birthday);
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
                        Model model,
                        HttpServletRequest request) {

        if (!userService.validateCaptcha(captcha)) {
            logger.info("captchaError: 驗證碼錯誤 for email: {}", email);
            model.addAttribute("captchaError", "驗證碼錯誤");
            return "login"; // 返回登录页面，显示验证码错误
        }

        boolean success = userService.login(email, password, captcha);
        if (success) {
            // 登錄成功，設置 session 中的當前用戶
            HttpSession session = request.getSession();
            User user = userService.findUserByEmail(email);
            session.setAttribute("currentUser", user);
            model.addAttribute("loginSuccess", true);
            return "login"; // 登入成功，返回登入頁面等前端轉跳
        } else {
            logger.info("Login error: 無效的用戶名或密碼 for email: {}", email);
            model.addAttribute("loginError", "無效的用戶名或密碼");
            return "login"; // 登录失败，返回登录页面
        }
    }

    @PostMapping("/user/logout")
    public String logout(HttpServletRequest request, Model model) {
        // 清除session中的用户信息
        HttpSession session = request.getSession();
        session.invalidate();
        model.addAttribute("logoutSuccess", true);
        return "redirect:/login"; // 返回登录页面
    }
    
    @GetMapping("/user/current")
    @ResponseBody
    public Map<String, Object> getCurrentUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");
        Map<String, Object> response = new HashMap<>();
        if (user != null) {
            response.put("userId", user.getUserId());
            response.put("email", user.getEmail());
            response.put("username", user.getUsername());
            logger.info("Current user - email={}, userId={}, username={}", user.getEmail(), user.getUserId(), user.getUsername());
        } else {
            logger.info("No authenticated user found in session");
            response.put("error", "No authenticated user found");
        }
        return response;
    }
}
