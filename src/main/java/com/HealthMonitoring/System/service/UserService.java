package com.HealthMonitoring.System.service;

import com.HealthMonitoring.System.dao.UserDao;
import com.HealthMonitoring.System.model.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.ObjectFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserDao userDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ObjectFactory<HttpServletRequest> requestFactory;
    

    // 檢查驗證碼是否正確
    public boolean validateCaptcha(String captcha) {
        HttpServletRequest request = requestFactory.getObject();
        String sessionCaptcha = (String) request.getSession().getAttribute("captcha");
        
        if (sessionCaptcha == null || !sessionCaptcha.equalsIgnoreCase(captcha)) {
            logger.info("驗證碼錯誤。用戶輸入: {}, session中的驗證碼: {}", captcha, sessionCaptcha);
            return false; // 驗證碼錯誤
        }
        return true;
    }

    // 登錄方法：檢查用戶的 email 和密碼，並驗證驗證碼
    public boolean login(String email, String password, String captcha) {
        if (!validateCaptcha(captcha)) {
            return false; // 驗證碼錯誤
        }

        User user = userDao.findByEmail(email);
        if (user == null) {
        	logger.info("用户不存在: {}", email);
            return false; // 用戶不存在
        }
        
        // 如果用戶狀態不是 active，拒絕登錄
        if (user.getStatus() != null && !"active".equalsIgnoreCase(user.getStatus())) {
        	logger.info("用戶狀態不允許登錄: {}", user.getStatus());
            return false; // 用戶狀態不允許登錄
        }
        
        // 驗證密碼
        boolean passwordMatch = passwordEncoder.matches(password, user.getPassword());
        logger.debug("密码匹配: {}", passwordMatch);
        return passwordMatch;
    }
    
 // 檢查 Email 是否已經存在
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
                           .status("pending")
                           .build();

        try {
        	 // 保存用戶到數據庫
            int rowsAffected = userDao.save(newUser);
            logger.info("New user registered with email: {}", email);
            return rowsAffected > 0;
        } catch (Exception e) {
            logger.error("Error registering user with email: {}", email, e);
            return false;
        }
    }
}