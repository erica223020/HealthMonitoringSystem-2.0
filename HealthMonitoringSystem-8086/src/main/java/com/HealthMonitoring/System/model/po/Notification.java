package com.HealthMonitoring.System.model.po;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

//Entity
@Data // Lombok註解，用於自動生成 getter、setter、toString 等方法
@NoArgsConstructor // Lombok註解，自動生成無參構造函數
@AllArgsConstructor // Lombok註解，自動生成包含所有字段的構造函數
public class Notification {
	private Long id; // 自動遞增的主鍵，用來唯一標識每條通知
	private Integer userId; // 對應用戶的ID，標識這條通知屬於哪個用戶
	private String message; // 通知的內容，描述具體的消息
	private java.sql.Timestamp sentAt; // 發送時間，默認設置為當前時間，用於記錄通知的發送時間
	private User user; // 關聯到 users 表中的 user_id，用於表示這條通知的接收者
}
