package com.HealthMonitoring.System.model.dto;

import java.util.List;
import com.HealthMonitoring.System.model.po.HealthData;
import com.HealthMonitoring.System.model.po.Notification;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
    private Integer userId; // 用戶的唯一ID
    private String username; // 用戶名
    private String email; // 用戶的電子郵件地址
    private Integer age; // 用戶的年齡
    private String gender; // 用戶的性別
    private String status; // 用戶帳戶的狀態

    // 構造函數，只包含基本用戶信息
    public UserDto(Integer userId, String username, String email, Integer age, String gender) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.age = age;
        this.gender = gender;
    }

}
