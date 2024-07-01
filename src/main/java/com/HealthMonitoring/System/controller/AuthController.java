package com.HealthMonitoring.System.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.HealthMonitoring.System.dao.UserDao;
import com.HealthMonitoring.System.model.po.User;
import com.HealthMonitoring.System.service.EmailService;
import com.HealthMonitoring.System.service.TokenService;
import com.HealthMonitoring.System.service.UserService;
import org.springframework.ui.Model;

@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private TokenService tokenService;

    @Autowired
    private UserDao userDao;

    @Autowired
    private EmailService emailService;

    @Autowired
    private UserService userService;

    // 忘記密碼或啟用帳號並發送郵件
    @PostMapping("/request-reset")
    public ResponseEntity<?> requestReset(@RequestParam("email") String email) {
        User user = userDao.findByEmail(email);
        if (user != null) {
            tokenService.createToken(email);
            String token = user.getResetToken();
            emailService.sendPasswordResetEmail(email, user.getUsername(), token);
            return ResponseEntity.ok("重設郵件已發送.");
        } else {
        	 return ResponseEntity.status(404).body("郵件未找到.");
        }
    }

    // 處理重設密碼和照護啟用
    @PostMapping("/verify")
    public ResponseEntity<?> verifyAccount(@RequestParam("email") String email) {
        User user = userDao.findByEmail(email);
        if (user != null) {
            tokenService.createToken(email);
            String token = user.getResetToken();
            emailService.sendVerificationEmail(email, user.getUsername(), token);
            return ResponseEntity.ok("驗證郵件已發送.");
        } else {
            return ResponseEntity.status(404).body("郵件未找到.");
        }
    }

    @PostMapping("/reset-password")
    public ResponseEntity<?> resetPassword(@RequestParam("token") String token, @RequestParam("newPassword") String newPassword) {
        if (tokenService.isTokenValid(token)) {
            User user = userDao.findByResetToken(token);
            if (user != null) {
                String encodedPassword = userService.encodePassword(newPassword);
                user.setPassword(encodedPassword);
                user.setResetToken(null);
                user.setTokenExpiry(null);
                user.setStatus("active");
                userDao.update(user);
                return ResponseEntity.ok("密碼重設且帳戶啟用成功.");
            } else {
                return ResponseEntity.status(404).body("無效的 token.");
            }
        } else {
            return ResponseEntity.status(400).body("無效或過期的 token.");
        }
    }

    @GetMapping("/reset-password")
    public String showResetPasswordPage(@RequestParam("token") String token, Model model) {
        model.addAttribute("token", token);
        return "resetPassword"; // 返回JSP頁面的名
    }

}