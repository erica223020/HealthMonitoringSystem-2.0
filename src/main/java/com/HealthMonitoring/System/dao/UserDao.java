package com.HealthMonitoring.System.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.HealthMonitoring.System.model.po.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class UserDao {
	private static final Logger logger = LoggerFactory.getLogger(UserDao.class);
	
    private final JdbcTemplate jdbcTemplate;

    public UserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public User findByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";
        try {
        	// 添加日誌，打印查詢的 SQL 和參數
            logger.debug("Executing query: {} with parameter: {}", sql, email);
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), email);
            // 如果查詢成功，打印用戶信息
            logger.debug("Found user: {}", user);
            return user;
        } catch (Exception e) {
            // 如果查找失敗，打印異常信息
            logger.error("Failed to find user by email: {}", email, e);
            return null; // 如果沒有找到，返回 null
        }
    }
    

    public int save(User user) {
        String sql = "INSERT INTO users (email, username, password, gender, status, created_at) VALUES (?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, 
                                   user.getEmail(), 
                                   user.getUsername(), 
                                   user.getPassword(), 
                                   user.getGender(), 
                                   user.getStatus(), 
                                   user.getCreatedAt());
    }
}