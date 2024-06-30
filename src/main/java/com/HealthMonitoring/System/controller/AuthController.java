package com.HealthMonitoring.System.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.HealthMonitoring.System.dao.UserDao;
import com.HealthMonitoring.System.model.po.User;
import com.HealthMonitoring.System.service.EmailService;
import com.HealthMonitoring.System.service.TokenService;
import com.HealthMonitoring.System.service.UserService;

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

    // 忘记密码或激活账户并发送邮件
    @PostMapping("/request-reset")
    public ResponseEntity<?> requestReset(@RequestParam("email") String email) {
        User user = userDao.findByEmail(email);
        if (user != null) {
            tokenService.createToken(email);
            String token = user.getResetToken();
            emailService.sendPasswordResetEmail(email, user.getUsername(), token);
            return ResponseEntity.ok("Reset email sent.");
        } else {
            return ResponseEntity.status(404).body("Email not found.");
        }
    }

    // 处理密码重置和账户激活
    @PostMapping("/reset-password")
    public ResponseEntity<?> resetPassword(@RequestParam("token") String token, @RequestParam("newPassword") String newPassword) {
        if (tokenService.isTokenValid(token)) {
            User user = userDao.findByResetToken(token);
            if (user != null) {
                String encodedPassword = userService.encodePassword(newPassword); // 使用 UserService 进行密码加密
                user.setPassword(encodedPassword);
                user.setResetToken(null);
                user.setTokenExpiry(null);
                user.setStatus("active"); // 激活账户
                userDao.update(user);
                return ResponseEntity.ok("Password reset and account activated successfully.");
            } else {
                return ResponseEntity.status(404).body("Invalid token.");
            }
        } else {
            return ResponseEntity.status(400).body("Invalid or expired token.");
        }
    }
}
