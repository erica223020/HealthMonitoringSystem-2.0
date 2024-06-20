package com.HealthMonitoring.System.service;

import com.HealthMonitoring.System.dao.UserDao;
import com.HealthMonitoring.System.model.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // 登錄方法：檢查用戶的 email 和密碼
    public boolean login(String email, String password) {
        User user = userDao.findByEmail(email);
        return user != null && passwordEncoder.matches(password, user.getPassword());
    }

    // 註冊方法：創建新用戶並保存到數據庫
    public boolean register(String email, String username, String password, String gender) {
        // 檢查 email 是否已經被註冊
        if (userDao.findByEmail(email) != null) {
            return false; // Email 已經被註冊
        }

        // 加密密碼
        String encodedPassword = passwordEncoder.encode(password);

        // 創建新用戶對象
        User newUser = new User(null, email, username, encodedPassword, gender, "active", null);

        try {
        	 // 保存用戶到數據庫
            int rowsAffected = userDao.save(newUser);
            if (rowsAffected > 0) {
            	System.out.print("用戶 {} 註冊成功");
                return true;
            } else {
            	System.out.println("用戶 {} 註冊失敗，受影響的行數: {}");
                return false;
            }
        } catch (Exception e) {
            // 處理可能的異常
        	System.out.print("註冊用戶 {} 時出現異常: {}");
            return false;
        }
    }
}
