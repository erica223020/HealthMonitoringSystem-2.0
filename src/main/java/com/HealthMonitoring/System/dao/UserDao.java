package com.HealthMonitoring.System.dao;

import com.HealthMonitoring.System.model.po.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class UserDao {

    private final JdbcTemplate jdbcTemplate;

    public UserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public User findByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{email}, new UserRowMapper());
    }

    public int save(User user) {
        String sql = "INSERT INTO users (email, username, password, gender) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, user.getEmail(), user.getUsername(), user.getPassword(), user.getGender());
    }

    private static class UserRowMapper implements RowMapper<User> {
        @Override
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setEmail(rs.getString("email"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setGender(rs.getString("gender"));
            user.setStatus(rs.getString("status"));
            user.setCreatedAt(rs.getTimestamp("created_at"));
            return user;
        }
    }
}
