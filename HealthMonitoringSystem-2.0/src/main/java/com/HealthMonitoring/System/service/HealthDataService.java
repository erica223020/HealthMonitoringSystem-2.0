package com.HealthMonitoring.System.service;

import com.HealthMonitoring.System.dao.HealthDataDao;
import com.HealthMonitoring.System.model.po.HealthData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HealthDataService {

    @Autowired
    private HealthDataDao healthDataDao;

    // 保存健康數據的方法
    public void saveHealthData(HealthData healthData) {
        healthDataDao.save(healthData);
    }

    // 更新健康數據的方法
    public void updateHealthData(HealthData healthData) {
        // 假設更新操作是通過 save 方法完成的，如果該記錄已經存在，save 方法會進行更新操作
        healthDataDao.save(healthData);
    }

    // 根據 ID 查找健康數據的方法
    public HealthData findHealthDataById(int id) {
        return healthDataDao.findById(id).orElse(null);
    }

    // 根據用戶 ID 查找所有健康數據
    public List<HealthData> findAllByUserId(int userId) {
        return healthDataDao.findAllByUserId(userId);
    }

    // 刪除健康數據的方法
    public void deleteHealthDataById(int id) {
        healthDataDao.deleteById(id);
    }
}
