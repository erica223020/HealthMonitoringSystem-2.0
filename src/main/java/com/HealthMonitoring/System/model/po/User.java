package com.HealthMonitoring.System.model.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer id;         // 用戶的唯一標識符
    private String email;       // 用戶的電子郵件地址
    private String password;    // 用戶的密碼
    private String username;    // 用戶名
    private String status;      // 用戶帳戶的狀態 ('pending', 'active', 'inactive')
    private String gender;
    private Timestamp createdAt;
}
