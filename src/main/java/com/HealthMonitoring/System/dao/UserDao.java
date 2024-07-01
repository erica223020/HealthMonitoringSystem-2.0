package com.HealthMonitoring.System.dao;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.HealthMonitoring.System.model.po.User;

import java.util.List;

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
        } catch (EmptyResultDataAccessException e) {
            // 如果查詢結果為空，記錄警告
            logger.warn("No user found with email: {}", email);
            return null;
        } catch (Exception e) {
            // 如果查找失敗，打印異常信息
            logger.error("Failed to find user by email: {}", email, e);
            return null; // 如果沒有找到，返回 null
        }
    }
    public User findByResetToken(String resetToken) {
        String sql = "SELECT * FROM users WHERE reset_token = ?";
        try {
            logger.debug("Executing query: {} with parameter: {}", sql, resetToken);
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), resetToken);
            logger.debug("Found user: {}", user);
            return user;
        } catch (EmptyResultDataAccessException e) {
            logger.warn("No user found with reset token: {}", resetToken);
            return null;
        } catch (Exception e) {
            logger.error("Failed to find user by reset token: {}", resetToken, e);
            return null;
        }
    }

    public int save(User user) {
        String sql = "INSERT INTO users (email, username, password, gender, birthday, age, status, created_at, reset_token, token_expiry) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, 
                                   user.getEmail(), 
                                   user.getUsername(), 
                                   user.getPassword(), 
                                   user.getGender(), 
                                   user.getBirthday(), 
                                   user.getAge(),     
                                   user.getStatus(), 
                                   user.getCreatedAt(),
                                   user.getResetToken(),
                                   user.getTokenExpiry());
    }

    public int update(User user) {
        String sql = "UPDATE users SET email = ?, username = ?, password = ?, gender = ?, birthday = ?, age = ?, status = ?, created_at = ?, reset_token = ?, token_expiry = ? WHERE user_id = ?";
        return jdbcTemplate.update(sql,
                                   user.getEmail(),
                                   user.getUsername(),
                                   user.getPassword(),
                                   user.getGender(),
                                   user.getBirthday(),
                                   user.getAge(),
                                   user.getStatus(),
                                   user.getCreatedAt(),
                                   user.getResetToken(),
                                   user.getTokenExpiry(),
                                   user.getUserId());
    }
    
 // 添加查找所有用戶的方法
    public List<User> findAll() {
        String sql = "SELECT * FROM users";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
    }

    // 添加按 email 模糊搜索用戶的方法
    public List<User> findByEmailContaining(String email) {
        String sql = "SELECT * FROM users WHERE email LIKE ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class), "%" + email + "%");
    }

    // 添加更新用戶狀態的方法
    public int updateUserStatus(int userId, String status) {
        String sql = "UPDATE users SET status = ? WHERE user_id = ?";
        return jdbcTemplate.update(sql, status, userId);
    }
}