package com.HealthMonitoring.System.dao;

import com.HealthMonitoring.System.model.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<User> findAllUsers() {
        // 查詢所有用戶
        String sql = "SELECT id, user_id, email, password, username, age, gender, createdTime, status FROM users";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
    }

    @Override
    public Optional<User> getUser(Integer id) {
        // 根據 ID 查詢用戶
        String sql = "SELECT id, user_id, email, password, username, age, gender, createdTime, status FROM users WHERE id=?";
        try {
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), id);
            return Optional.of(user);
        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }

    @Override
    public void saveUser(User user) {
        if (user.getId() == null) {
            // 新增用戶
            String sql = "INSERT INTO users (user_id, email, password, username, age, gender, created_time, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            jdbcTemplate.update(sql, user.getUserId(), user.getEmail(), user.getPassword(), user.getUsername(), user.getAge(), user.getGender(), user.getCreatedTime(), user.getStatus());
        } else {
            // 更新用戶
            String sql = "UPDATE users SET user_id=?, email=?, password=?, username=?, age=?, gender=?, created_time=?, status=? WHERE id=?";
            jdbcTemplate.update(sql, user.getUserId(), user.getEmail(), user.getPassword(), user.getUsername(), user.getAge(), user.getGender(), user.getCreatedTime(), user.getStatus(), user.getId());
        }
    }

    @Override
    public void deleteUser(Integer id) {
        // 刪除用戶
        String sql = "DELETE FROM users WHERE id=?";
        jdbcTemplate.update(sql, id);
    }

    @Override
    public Optional<User> findUserByEmail(String email) {
        // 根據 email 查找用戶
        String sql = "SELECT id, user_id, email, password, username, age, gender, created_time, status FROM users WHERE email=?";
        try {
            User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), email);
            return Optional.of(user);
        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }
}
