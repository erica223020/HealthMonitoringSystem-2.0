package com.HealthMonitoring.System.controller;

import com.HealthMonitoring.System.model.po.User;
import com.HealthMonitoring.System.service.UserService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @GetMapping("/admin")
    public String adminDashboard(Model model) {
        User currentUser = userService.getCurrentUser();
        if (currentUser == null || !"root@gmail.com".equals(currentUser.getEmail())) {
            return "redirect:/login"; // 如果不是管理員，重定向到登入頁面
        }
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin";
    }

    @GetMapping("/admin/search")
    public String searchUsers(@RequestParam("email") String email, Model model) {
        User currentUser = userService.getCurrentUser();
        if (currentUser == null || !"root@gmail.com".equals(currentUser.getEmail())) {
            return "redirect:/login"; // 如果不是管理員，重定向到登入頁面
        }
        List<User> users = userService.searchUsersByEmail(email);
        model.addAttribute("users", users);
        return "admin";
    }

    @PostMapping("/admin/updateStatus")
    public @ResponseBody String updateUserStatus(@RequestParam("userId") int userId, @RequestParam("status") String status) {
        User currentUser = userService.getCurrentUser();
        if (currentUser == null || !"root@gmail.com".equals(currentUser.getEmail())) {
            return "failure"; // 如果不是管理員，返回失敗
        }
        if (userService.updateUserStatus(userId, status)) {
            return "success";
        } else {
            return "failure";
        }
    }


}
