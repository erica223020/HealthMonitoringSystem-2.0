package com.HealthMonitoring.System.dao;

import java.util.List;
import java.util.Optional;

import com.HealthMonitoring.System.model.po.User;

public interface UserDAO {
    List<User> findAllUsers();
    Optional<User> getUser(Integer id);
    void saveUser(User user); // 保存用戶
    void deleteUser(Integer id); // 刪除用戶
    Optional<User> findUserByEmail(String email); // 根據 email 查找用戶
}
