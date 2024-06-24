package com.HealthMonitoring.System.dao;

import com.HealthMonitoring.System.model.po.HealthData;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HealthDataDao extends CrudRepository<HealthData, Integer> {
    
    @Query("SELECT * FROM health_data WHERE user_id = :userId")
    List<HealthData> findAllByUserId(Integer userId);
}