package com.HealthMonitoring.System.model.po;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

//Entity
@Data // Lombok註解，用於自動生成 getter、setter、toString 等方法
@NoArgsConstructor // Lombok註解，自動生成無參構造函數
@AllArgsConstructor // Lombok註解，自動生成包含所有字段的構造函數
public class HealthData {
	 	private Long id; // 自動遞增的主鍵，用來唯一標識每條健康數據
	    private Integer userId; // 對應用戶的ID，標識這條健康數據屬於哪個用戶
	    private String dataType; // 健康數據的類型，如 'weight', 'bloodPressure', 'heartRate', 'steps', 'exercise'
	    private Float value; // 健康數據的具體數值，如體重或心率的數值
	    private java.sql.Date date; // 記錄數據的日期
	    private User user; // 關聯到 users 表中的 user_id，用於表示這條健康數據的所有者
}
