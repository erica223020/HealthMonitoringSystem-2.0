// UserServiceImpl.java
package com.HealthMonitoring.System.service;

import com.HealthMonitoring.System.dao.UserDAO;
import com.HealthMonitoring.System.model.dto.UserDto;
import com.HealthMonitoring.System.model.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public List<UserDto> findAllUsers() {
        return userDAO.findAllUsers().stream()
            .map(user -> new UserDto(
                user.getUserId(),
                user.getUsername(),
                user.getEmail(),
                user.getAge(),
                user.getGender(),
                user.getStatus(),
                null, 
                null  
            ))
            .collect(Collectors.toList());
    }

    @Override
    public UserDto findUserById(Integer id) {
        Optional<User> userOpt = userDAO.getUser(id);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            return new UserDto(
                user.getUserId(),
                user.getUsername(),
                user.getEmail(),
                user.getAge(),
                user.getGender(),
                user.getStatus(),
                null,
                null
            );
        }
        return null;
    }

    @Override
    public Long saveUser(UserDto userDto) {
        User user = new User();
        user.setUserId(userDto.getUserId());
        user.setEmail(userDto.getEmail());
        user.setUsername(userDto.getUsername());
        user.setAge(userDto.getAge());
        user.setGender(userDto.getGender());
        user.setCreatedTime(new java.sql.Timestamp(System.currentTimeMillis()));
        user.setStatus("active");
        userDAO.saveUser(user);
        return user.getId();
    }

    @Override
    public boolean deleteUser(Integer id) {
        Optional<User> userOpt = userDAO.getUser(id);
        if (userOpt.isPresent()) {
            userDAO.deleteUser(id);
            return true;
        }
        return false;
    }
}