package com.HealthMonitoring.System.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.HealthMonitoring.System.model.po.HealthData;
import com.HealthMonitoring.System.service.HealthDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import java.sql.Timestamp;

import java.util.List;

@RestController
@RequestMapping("/health-data")
public class HealthDataController {
	 private static final Logger logger = LoggerFactory.getLogger(HealthDataController.class);

    @Autowired
    private HealthDataService healthDataService;

    // 保存健康數據的控制器方法，支持 application/json
    @PostMapping("/add")
    public ResponseEntity<String> saveHealthData(@RequestBody HealthData healthData) {
        try {
            // 設置當前時間戳
            healthData.setTimestamp(new Timestamp(System.currentTimeMillis()));
            logger.info("Received data: {}", healthData); // 日誌記錄接收到的數據
            healthDataService.saveHealthData(healthData);
            return new ResponseEntity<>("Data saved successfully", HttpStatus.OK);
        } catch (Exception e) {
        	 logger.error("Error saving data: {}", e.getMessage(), e); // 日誌記錄錯誤信息
            return new ResponseEntity<>("Error saving data: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    // 查找某用戶的所有健康數據的方法
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<HealthData>> getAllHealthDataByUserId(@PathVariable int userId) {
        try {
            List<HealthData> healthDataList = healthDataService.findAllByUserId(userId);
            return new ResponseEntity<>(healthDataList, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 刪除健康數據的方法
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteHealthData(@PathVariable int id) {
        try {
            healthDataService.deleteHealthDataById(id);
            return new ResponseEntity<>("Data deleted successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error deleting data: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 修改健康數據的方法
    @PutMapping("/update")
    public ResponseEntity<String> updateHealthData(@RequestBody HealthData healthData) {
        try {
            System.out.println("Updating data: " + healthData);
            healthDataService.updateHealthData(healthData);
            return new ResponseEntity<>("Data updated successfully", HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>("Invalid request: " + e.getMessage(), HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            return new ResponseEntity<>("Error updating data: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}