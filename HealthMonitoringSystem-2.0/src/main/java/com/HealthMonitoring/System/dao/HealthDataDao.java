package com.HealthMonitoring.System.dao;

import com.HealthMonitoring.System.model.po.HealthData;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HealthDataDao extends CrudRepository<HealthData, Integer> {
    List<HealthData> findAllByUserId(int userId); // 查找某用戶所有的健康數據
}