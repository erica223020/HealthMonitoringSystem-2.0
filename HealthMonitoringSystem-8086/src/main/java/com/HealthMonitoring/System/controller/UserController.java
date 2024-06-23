package com.HealthMonitoring.System.controller;

import com.HealthMonitoring.System.model.dto.UserDto;
import com.HealthMonitoring.System.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    // 查詢所有用戶的基本信息
    @GetMapping
    public List<UserDto> getAllUsers() {
        return userService.findAllUsers();
    }

    // 根據ID查詢單個用戶的基本信息
    @GetMapping("/{id}")
    public UserDto getUserById(@PathVariable Integer id) {
        return userService.findUserById(id);
    }

    // 其他用戶相關操作的API可以在這裡添加
}
