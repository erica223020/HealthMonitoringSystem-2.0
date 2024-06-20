package com.healthmonitoring.system.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable()) // 禁用 CSRF 保護
            .authorizeRequests(auth -> auth
                .antMatchers("/", "/register", "/static/**").permitAll() // 允許匿名訪問的 URL
                .anyRequest().authenticated() // 其他所有請求需要認證
            )
            .formLogin(form -> form
                .loginPage("/") // 自定義的登入頁面
                .loginProcessingUrl("/perform_login") // 登入表單提交的 URL
                .defaultSuccessUrl("/dashboard", true) // 登入成功後跳轉的 URL
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/") // 登出成功後跳轉的 URL
                .permitAll()
            );

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(); // 設置密碼編碼器
    }
}