//處理健康數據的CRUD
//package com.HealthMonitoring.System.controller;
//
//import com.HealthMonitoring.System.model.dto.HealthDataDto;
//import com.HealthMonitoring.System.service.HealthDataService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@RestController
//@RequestMapping("/healthData")
//public class HealthDataController {
//
//    @Autowired
//    private HealthDataService healthDataService;
//
//    // 查詢所有健康數據
//    @GetMapping
//    public List<HealthDataDto> getAllHealthData() {
//        return healthDataService.findAllHealthData();
//    }
//
//    // 根據用戶 ID 查詢健康數據
//    @GetMapping("/user/{userId}")
//    public List<HealthDataDto> getHealthDataByUserId(@PathVariable Integer userId) {
//        return healthDataService.findHealthDataByUserId(userId);
//    }
//
//    // 記錄新的健康數據
//    @PostMapping("/record")
//    public Long recordHealthData(@RequestBody HealthDataDto healthDataDto) {
//        return healthDataService.saveHealthData(healthDataDto);
//    }
//
//    // 根據數據 ID 刪除健康數據
//    @DeleteMapping("/{id}")
//    public String deleteHealthData(@PathVariable Integer id) {
//        boolean isDeleted = healthDataService.deleteHealthData(id);
//        return isDeleted ? "Health data deleted successfully" : "Health data not found";
//    }
//}
//
