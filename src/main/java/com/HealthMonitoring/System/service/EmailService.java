package com.HealthMonitoring.System.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import freemarker.template.Configuration;
import freemarker.template.Template;
import jakarta.mail.internet.MimeMessage;

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
        model.put("resetToken", token); // 確保這一行存在

        try {
            Template template = freemarkerConfig.getTemplate("reset-password-email.ftl");
            String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, model);

            sendEmail(email, "重設密碼請求", text);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sendVerificationEmail(String email, String username, String token) {
        String verificationUrl = "http://localhost:8086/auth/verify?token=" + token;
        Map<String, Object> model = new HashMap<>();
        model.put("username", username);
        model.put("verificationUrl", verificationUrl);

        try {
            Template template = freemarkerConfig.getTemplate("verification-email.ftl");
            String text = FreeMarkerTemplateUtils.processTemplateIntoString(template, model);

            sendEmail(email, "帳戶驗證請求", text);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void sendEmail(String to, String subject, String text) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text, true);
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
