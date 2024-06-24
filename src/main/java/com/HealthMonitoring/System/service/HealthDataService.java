package com.HealthMonitoring.System.service;

import com.HealthMonitoring.System.dao.HealthDataDao;
import com.HealthMonitoring.System.model.po.HealthData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

@Service
public class HealthDataService {

	private static final Logger logger = LoggerFactory.getLogger(HealthDataService.class);

    @Autowired
    private HealthDataDao healthDataDao;

    // 保存健康數據的方法
    public void saveHealthData(HealthData healthData) {
        logger.info("Before save: {}", healthData);
        healthData.setId(null);  // 確保 ID 是 null 以便自動生成
        healthDataDao.save(healthData);  // 保存數據
        logger.info("After save: {}", healthData);
        logger.info("Saved health data with ID: {}", healthData.getId());
    }
    
    // 根據用戶 ID 查找所有健康數據
    public List<HealthData> findAllByUserId(Integer userId) {
        return healthDataDao.findAllByUserId(userId);
    }
    
    // 刪除健康數據的方法
    public void deleteHealthDataById(Integer id) {
        healthDataDao.deleteById(id);
    }
    
    // 更新健康數據的方法
    public void updateHealthData(HealthData healthData) {
        if (healthData.getId() != null && healthDataDao.existsById(healthData.getId())) {
            healthDataDao.save(healthData);
        } else {
            throw new IllegalArgumentException("The health data to update does not exist.");
        }
    }
}