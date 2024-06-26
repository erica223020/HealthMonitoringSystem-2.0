package com.HealthMonitoring.System;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.HealthMonitoring.System.dao.UserDao;
import com.HealthMonitoring.System.model.po.User;
import com.HealthMonitoring.System.service.UserService;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.test.web.servlet.request.RequestPostProcessor;

@SpringBootTest
@AutoConfigureMockMvc
class HealthMonitoringSystem8086ApplicationTests {

	 @Autowired
	    private MockMvc mockMvc;

	    @Autowired
	    private UserDao userDao;

	    @Autowired
	    private PasswordEncoder passwordEncoder;

	    @BeforeEach
	    void setUp() {
	        // 清理數據庫中的測試用戶
	        User existingUser = userDao.findByEmail("bobo1@gmail.com");
	        if (existingUser != null) {
	            userDao.delete(existingUser);
	        }
	        
	        // 插入一個真實的測試用戶
	        User user = User.builder()
	                .email("bobo1@gmail.com")
	                .username("bobo")
	                .password(passwordEncoder.encode("password"))
	                .gender("male")
	                .status("active")
	                .build();
	        userDao.save(user);
	    }

	    @Test
	    @WithMockUser(username = "bobo1@gmail.com", roles = "USER")
	    void testGetCurrentUser() throws Exception {
	        mockMvc.perform(get("/user/current")
	                .with(csrf()))
	                .andExpect(status().isOk())
	                .andExpect(jsonPath("$.username").value("bobo1"))
	                .andExpect(jsonPath("$.email").value("bobo1@gmail.com"))
	        		.andExpect(jsonPath("$.user_id").exists());
}
}