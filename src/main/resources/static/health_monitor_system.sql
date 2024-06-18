-- 重新建立名為 health_monitoring_system 的資料庫
CREATE DATABASE health_monitoring_system;

-- 使用新的資料庫
USE health_monitoring_system;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- 用戶的唯一標識符，自動遞增
    email VARCHAR(100) UNIQUE NOT NULL,  -- 用戶的電子郵件地址，必須唯一且不得為空
    password VARCHAR(255) NOT NULL,  -- 用戶的密碼，不得為空
    username VARCHAR(50) NOT NULL,  -- 用戶名，非空
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 用戶註冊的時間，自動設置為當前時間
    status ENUM('pending', 'active', 'inactive') DEFAULT 'pending'  -- 用戶帳戶的狀態，預設為 'pending'
);

CREATE TABLE health_data (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- 每條健康數據的唯一標識符，自動遞增
    user_id INT NOT NULL,  -- 這條數據所屬的用戶ID，對應users表的id
    data_type ENUM('weight', 'blood_sugar', 'blood_pressure', 'heart_rate') NOT NULL,  -- 數據類型
    value FLOAT NOT NULL,  -- 數據值，不得為空
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 數據記錄的時間，自動設置為當前時間
    FOREIGN KEY (user_id) REFERENCES users(id)  -- 外鍵，關聯到users表的id
);

