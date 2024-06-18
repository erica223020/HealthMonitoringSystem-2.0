package com.HealthMonitoring.System.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorize -> authorize
                .anyRequest().permitAll() // 允許所有請求
            )
            .formLogin(formLogin -> formLogin
                .loginPage("/login")                      // 1. 設置自定義的登錄頁面 URL。
                .loginProcessingUrl("/user/login")        // 2. 指定處理登錄請求的 URL。
                .defaultSuccessUrl("/", true)             // 3. 指定登錄成功後的重定向 URL。
                .failureUrl("/login?error=true")          // 4. 設置登錄失敗後的重定向 URL。
                .permitAll()                              // 5. 允許所有用戶訪問這些登錄相關的 URL。
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout=true")
                .permitAll()
            )
            .csrf(csrf -> csrf.disable()); // 禁用 CSRF 保護以避免測試期間的問題

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}