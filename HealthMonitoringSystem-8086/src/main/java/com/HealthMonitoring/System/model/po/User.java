package com.HealthMonitoring.System.model.po;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

//Entity
@Data // Lombok註解，用於自動生成 getter、setter、toString 等方法
@NoArgsConstructor // Lombok註解，自動生成無參構造函數
@AllArgsConstructor // Lombok註解，自動生成包含所有字段的構造函數
public class User {
	private Long id; // 自動遞增的主鍵
	private Integer userId; // 用戶的唯一ID
    private String email; // 電子郵件，作為登入憑證，不可更改
    private String password; // 密碼
	private String username; // 可選的用戶名，可以更改
    private Integer age; // 年齡
    private String gender; // 性別
    private java.sql.Timestamp createdTime; // 註冊時間，不可更改
    private String status; //啟用狀態
}
