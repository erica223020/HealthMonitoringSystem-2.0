package com.HealthMonitoring.System.model.dto;

import java.util.List;
// 日期和時間 API
import java.time.LocalDateTime;
import com.HealthMonitoring.System.model.po.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//DTO
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HealthDataDto {
	// 一般欄位資料
	private Long id; // 自動遞增的主鍵，用來唯一標識每條健康數據
    private Integer userId; // 對應用戶的ID，標識這條健康數據屬於哪個用戶
    private String dataType; // 健康數據的類型，如 'weight', 'bloodPressure', 'heartRate', 'steps', 'exercise'
    private Float value; // 健康數據的具體數值，如體重或心率的數值
    private java.sql.Date date; // 記錄數據的日期
    
    private UserDto user; // 關聯的用戶信息
}
