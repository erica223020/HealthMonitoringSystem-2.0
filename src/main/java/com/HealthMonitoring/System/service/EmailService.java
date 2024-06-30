package com.HealthMonitoring.System.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private Configuration freemarkerConfig;

    public void sendPasswordResetEmail(String email, String username, String token) {
        String resetUrl = "http://localhost:8086/auth/reset-password?token=" + token;
        Map<String, Object> model = new HashMap<>();
        model.put("username", username);
        model.put("resetUrl", resetUrl);

        try {
            Template template = freemarkerConfig.getTemplate("reset-password-email.ftl");
            String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, model);

            sendEmail(email, "Password Reset Request", text);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void sendEmail(String to, String subject, String text) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(to);
        email.setSubject(subject);
        email.setText(text);
        mailSender.send(email);
    }
}
