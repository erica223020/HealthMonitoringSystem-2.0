package com.HealthMonitoring.System.model.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Builder;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDate;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    private Integer userId;       // 所屬用戶的唯一標識符
    private String email;       // 用戶的電子郵件地址
    private String password;    // 用戶的密碼
    private String username;    // 用戶名
    private LocalDate birthday;   // 用戶的生日
    private Integer age;          // 用戶的年齡

    @Builder.Default
    private String status = "pending"; // 用戶帳戶的狀態，預設為 'pending'

    private String gender;

    // 使用 Lombok 的 @Builder.Default 設定默認值
    @Builder.Default
    private Timestamp createdAt = Timestamp.from(Instant.now()); // 註冊時間，默認為當前時間
    
    private String resetToken; // 密碼重置 token
    private Timestamp tokenExpiry; // token 過期時間
}
