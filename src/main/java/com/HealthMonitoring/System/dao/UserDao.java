package com.HealthMonitoring.System.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.HealthMonitoring.System.model.po.User;

@Repository
public class UserDao {
    private final JdbcTemplate jdbcTemplate;

    public UserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public User findByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{email}, new BeanPropertyRowMapper<>(User.class));
        } catch (Exception e) {
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