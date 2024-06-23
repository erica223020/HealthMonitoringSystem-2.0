package com.HealthMonitoring.System.model.po;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HealthData {
    private Integer id;           // 健康數據的唯一標識符
    private Integer userId;       // 所屬用戶的唯一標識符
    private String dataType;      // 數據類型 ('體重', '血糖', '血壓', '心率')
    private Float value;          // 數據值
    private Timestamp timestamp;  // 數據記錄的時間
}
