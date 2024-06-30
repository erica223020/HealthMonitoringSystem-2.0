package com.HealthMonitoring.System.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import com.HealthMonitoring.System.dao.UserDao;
import com.HealthMonitoring.System.model.po.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class TokenService {

    private static final Logger logger = LoggerFactory.getLogger(TokenService.class);

    @Autowired
    private UserDao userDao;

    public void createToken(String email) {
        User user = userDao.findByEmail(email);
        if (user != null) {
            String token = UUID.randomUUID().toString();
            user.setResetToken(token);
            Date expiryDate = calculateExpiryDate();
            user.setTokenExpiry(new Timestamp(expiryDate.getTime()));
            userDao.update(user);

            logger.debug("Token: {}, Expiry Date: {}", token, expiryDate);
        }
    }

    public boolean isTokenValid(String token) {
        User user = userDao.findByResetToken(token);
        return user != null && user.getTokenExpiry().after(new Timestamp(System.currentTimeMillis()));
    }

    private Date calculateExpiryDate() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.HOUR, 24); // 24小時有效期
        return calendar.getTime();
    }
}
