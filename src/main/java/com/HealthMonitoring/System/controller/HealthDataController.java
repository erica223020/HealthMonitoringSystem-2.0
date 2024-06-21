package com.HealthMonitoring.System.controller;

import com.HealthMonitoring.System.model.po.HealthData;
import com.HealthMonitoring.System.service.HealthDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/health-data")
public class HealthDataController {

    @Autowired
    private HealthDataService healthDataService;

    // 保存健康數據的控制器方法
    @PostMapping("/add")
    public void saveHealthData(@RequestBody HealthData healthData) {
        healthDataService.saveHealthData(healthData);
    }

    // 更新健康數據的控制器方法
    @PostMapping("/update")
    public void updateHealthData(@RequestBody HealthData healthData) {
        healthDataService.updateHealthData(healthData);
    }

    // 查找健康數據的方法
    @GetMapping("/{id}")
    public HealthData getHealthDataById(@PathVariable int id) {
        return healthDataService.findHealthDataById(id);
    }

    // 查找某用戶的所有健康數據的方法
    @GetMapping("/user/{userId}")
    public List<HealthData> getAllHealthDataByUserId(@PathVariable int userId) {
        return healthDataService.findAllByUserId(userId);
    }

    // 刪除健康數據的方法
    @DeleteMapping("/delete/{id}")
    public void deleteHealthData(@PathVariable int id) {
        healthDataService.deleteHealthDataById(id);
    }
}
