package com.HealthMonitoring.System.model.dto;

import com.HealthMonitoring.System.model.po.User;
import com.HealthMonitoring.System.model.po.HealthData;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserHealthDataDto {
    private User user;
    private List<HealthData> healthDataList;
}
