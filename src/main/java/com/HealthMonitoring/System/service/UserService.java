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

    public boolean login(String email, String password) {
        User user = userDao.findByEmail(email);
        return user != null && passwordEncoder.matches(password, user.getPassword());
    }

    public boolean register(String email, String username, String password, String gender) {
        if (userDao.findByEmail(email) != null) {
            return false; // Email 已經被註冊
        }
        String encodedPassword = passwordEncoder.encode(password);
        User newUser = new User(null, email, username, encodedPassword, gender, "active", null);
        return userDao.save(newUser) > 0;
    }
}