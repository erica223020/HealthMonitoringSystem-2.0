package com.healthmonitoring.system.controller;

import com.healthmonitoring.system.model.dto.UserDTO;
import com.healthmonitoring.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public String registerUser(@RequestParam("email") String email,
                               @RequestParam("password") String password,
                               @RequestParam("username") String username,
                               @RequestParam("age") Integer age,
                               @RequestParam("gender") String gender) {
        UserDTO userDTO = new UserDTO();
        userDTO.setEmail(email);
        userDTO.setPassword(password);
        userDTO.setUsername(username);
        userDTO.setAge(age);
        userDTO.setGender(gender);

        userService.register(userDTO);

        return "redirect:/"; // 註冊成功後重定向到首頁
    }

    @PostMapping("/perform_login")
    public String loginUser() {
        // Spring Security 會自動處理登入
        return "redirect:/dashboard"; // 登入成功後重定向到儀表板
    }
}

