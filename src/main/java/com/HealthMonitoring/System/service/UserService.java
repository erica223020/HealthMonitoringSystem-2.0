package com.HealthMonitoring.System.service;

import com.HealthMonitoring.System.dao.UserDao;
import com.HealthMonitoring.System.model.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.ObjectFactory;

import java.time.LocalDate;
import java.time.Period;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserDao userDao;

    @Autowired
    private ObjectFactory<HttpServletRequest> requestFactory;

    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

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
            return false; // 验证码错误
        }

        User user = userDao.findByEmail(email);
        if (user == null) {
            logger.info("用户不存在: {}", email);
            return false; // 用户不存在
        }

        // 如果用戶狀態不是 active，拒绝登录
        if (user.getStatus() != null && !"active".equalsIgnoreCase(user.getStatus())) {
            logger.info("用户状态不允许登录: {}", user.getStatus());
            return false; // 用户状态不允许登录
        }

        // 驗證密碼
        boolean passwordMatch = passwordEncoder.matches(password, user.getPassword());
        logger.debug("密码匹配: {}", passwordMatch);
        if (passwordMatch) {
            // 设置session中的当前用户
            HttpSession session = requestFactory.getObject().getSession();
            session.setAttribute("currentUser", user);
        }
        return passwordMatch;
    }

    // 检查 Email 是否已经存在
    public boolean emailExists(String email) {
        return userDao.findByEmail(email) != null;
    }

    // 註冊方法：創建新用戶並保存到數據庫
    public boolean register(String email, String username, String password, String gender, LocalDate birthday) {
    	// 檢查 email 是否已經被註冊
        if (emailExists(email)) {
        	logger.info("Email already registered: {}", email);
            return false; // Email 已經被註冊
        }
        
        // 加密密码
        String encodedPassword = passwordEncoder.encode(password);
        
        // 計算年齡
        int age = calculateAge(birthday);

        // 創建新用戶，使用建造者模式
        User newUser = User.builder()
                .email(email)
                .username(username)
                .password(encodedPassword)
                .gender(gender)
                .birthday(birthday)
                .age(age)
                .status("pending")
                .build();

        try {
            // 保存用戶到資料庫
            int rowsAffected = userDao.save(newUser);
            return rowsAffected > 0;
        } catch (Exception e) {
            return false;
        }
    }
    
    // 計算年齡方法
    private int calculateAge(LocalDate birthday) {
        return Period.between(birthday, LocalDate.now()).getYears();
    }

    // 獲取當前用戶訊息
    public User getCurrentUser() {
        HttpServletRequest request = requestFactory.getObject();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");
        if (user != null) {
            return user;
        }
        throw new IllegalStateException("No authenticated user found");
    }

    public User findUserByEmail(String email) {
        User user = userDao.findByEmail(email);
        if (user != null) {
            logger.debug("Found user: email={}, userId={}, username={}, age={}", user.getEmail(), user.getUserId(), user.getAge());
            return user;
        }
        logger.info("No user found with email: {}", email);
        return null;
    }
    // 添加加密密码的方法
    public String encodePassword(String password) {
        return passwordEncoder.encode(password);
    }
}
