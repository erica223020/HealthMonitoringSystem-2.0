package com.healthmonitoring.system.service;

import com.healthmonitoring.system.dao.UserRepository;
import com.healthmonitoring.system.model.dto.UserDTO;
import com.healthmonitoring.system.model.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder; // 確保這裡使用的是 PasswordEncoder 接口
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder; // 使用 PasswordEncoder 接口

    public void register(UserDTO userDTO) {
        User user = new User();
        user.setEmail(userDTO.getEmail());
        user.setPassword(passwordEncoder.encode(userDTO.getPassword())); // 加密密碼
        user.setUsername(userDTO.getUsername());
        user.setAge(userDTO.getAge());
        user.setGender(User.Gender.valueOf(userDTO.getGender().toUpperCase()));
        user.setStatus(User.Status.PENDING);

        userRepository.save(user); // 保存用戶到數據庫
    }

    public boolean authenticate(UserDTO userDTO) {
        User user = userRepository.findByEmail(userDTO.getEmail());
        if (user != null && passwordEncoder.matches(userDTO.getPassword(), user.getPassword())) {
            // 檢查用戶狀態是否為 ACTIVE
            return user.getStatus() == User.Status.ACTIVE;
        }
        return false;
    }
}
