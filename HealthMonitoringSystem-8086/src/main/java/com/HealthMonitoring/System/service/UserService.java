package com.HealthMonitoring.System.service;

import com.HealthMonitoring.System.model.dto.UserDto;
import java.util.List;

public interface UserService {
    // 查找所有用戶並返回用戶的簡單信息 (UserDto)
    List<UserDto> findAllUsers();

    // 根據用戶ID查找特定用戶並返回用戶的簡單信息 (UserDto)
    UserDto findUserById(Integer id);

    // 保存用戶信息
    Long saveUser(UserDto userDto);

    // 刪除用戶
    boolean deleteUser(Integer id);
}
