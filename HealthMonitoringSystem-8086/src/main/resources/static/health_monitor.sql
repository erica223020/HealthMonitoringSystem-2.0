-- 刪除已存在的表以避免衝突
DROP TABLE IF EXISTS health_data;
DROP TABLE IF EXISTS notifications;
DROP TABLE IF EXISTS users;

-- 建立 users 表
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- 主鍵，自動遞增
    user_id INT UNIQUE NOT NULL,        -- 用戶的唯一ID
    username VARCHAR(50),               -- 用戶名
    password VARCHAR(255) NOT NULL,     -- 密碼
    email VARCHAR(100) UNIQUE NOT NULL, -- 電子郵件，必須唯一且不得為空
    age INT,                            -- 年齡
    gender ENUM('male', 'female', 'other'), -- 性別，限定為 'male', 'female' 或 'other'
    createdTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 創建時間，默認當前時間
    status ENUM('pending', 'active', 'inactive') DEFAULT 'pending' -- 用戶狀態，默認為 'pending'
);

-- 建立 health_data 表
CREATE TABLE health_data (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- 主鍵，自動遞增
    user_id INT NOT NULL,               -- 對應的用戶ID
    data_type ENUM('weight', 'bloodPressure', 'heartRate', 'steps', 'exercise') NOT NULL, -- 數據類型
    value FLOAT NOT NULL,               -- 數據值
    date DATE NOT NULL,                 -- 記錄日期
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE -- 外鍵，關聯到 users 表的 user_id
);

-- 建立 notifications 表
CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- 主鍵，自動遞增
    user_id INT NOT NULL,               -- 對應的用戶ID
    message TEXT NOT NULL,              -- 通知內容
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 發送時間，默認當前時間
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE -- 外鍵，關聯到 users 表的 user_id
);

-- 插入範例資料到 users 表
INSERT INTO users (user_id, username, password, email, age, gender, status) 
VALUES (1, 'john', 'password123', 'john@example.com', 30, 'male', 'active');

-- 插入範例資料到 health_data 表
INSERT INTO health_data (user_id, data_type, value, date) 
VALUES (1, 'weight', 72, '2023-12-04');

-- 插入範例資料到 notifications 表
INSERT INTO notifications (user_id, message) 
VALUES (1, 'Heart rate updated.');

