package com.HealthMonitoring.System.service;

import com.HealthMonitoring.System.dao.UserDao;
import com.HealthMonitoring.System.model.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.ObjectFactory;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ObjectFactory<HttpServletRequest> requestFactory;
    

    // 登錄方法：檢查用戶的 email 和密碼，並驗證驗證碼
    public boolean login(String email, String password, String captcha) {
        HttpServletRequest request = requestFactory.getObject();
        String sessionCaptcha = (String) request.getSession().getAttribute("captcha");
        if (sessionCaptcha == null || !sessionCaptcha.equalsIgnoreCase(captcha)) {
            return false; // 驗證碼錯誤
        }

        User user = userDao.findByEmail(email);
        return user != null && passwordEncoder.matches(password, user.getPassword());
    } 
    
    public boolean emailExists(String email) {
        return userDao.findByEmail(email) != null;
    }


    // 註冊方法：創建新用戶並保存到數據庫
    public boolean register(String email, String username, String password, String gender) {
        // 檢查 email 是否已經被註冊
        if (userDao.findByEmail(email) != null) {
            return false; // Email 已經被註冊
        }

        // 加密密碼
        String encodedPassword = passwordEncoder.encode(password);

        // 創建新用戶對象，使用建造者模式
        User newUser = User.builder()
                           .email(email)
                           .username(username)
                           .password(encodedPassword)
                           .gender(gender)
                           .build();

        try {
            // 保存用戶到數據庫
            int rowsAffected = userDao.save(newUser);
            return rowsAffected > 0;
        } catch (Exception e) {
            // 處理可能的異常
            return false;
        }
    }
}