package com.healthmonitoring.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

	@GetMapping("/")
	public String index() {
	    return "index"; // 對應到 /WEB-INF/jsp/index.jsp
	}

    @GetMapping("/dashboard")
    public String dashboard() {
        return "dashboard"; // 對應到 WEB-INF/jsp/dashboard.jsp
    }
}
