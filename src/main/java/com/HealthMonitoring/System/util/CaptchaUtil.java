package com.HealthMonitoring.System.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

public class CaptchaUtil {

    public static String generateCaptchaText() {
        int length = 6;
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder captchaText = new StringBuilder();
        for (int i = 0; length > 0; i++) {
            captchaText.append(chars.charAt(random.nextInt(chars.length())));
            length--;
        }
        return captchaText.toString();
    }

    public static byte[] generateCaptchaImage(String captchaText) throws IOException {
        int width = 110; // 調整寬度
        int height = 40; // 調整高度

        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = bufferedImage.createGraphics();

        // 設置背景顏色
        g2d.setColor(Color.WHITE);
        g2d.fillRect(0, 0, width, height);

        // 設置字體和字體顏色
        g2d.setFont(new Font("Arial", Font.BOLD, 24));
        g2d.setColor(Color.BLACK);
        g2d.drawString(captchaText, 10, 24);

        // 添加一些干擾線
        Random random = new Random();
        g2d.setColor(Color.GRAY);
        for (int i = 0; i < 10; i++) {
            int x1 = random.nextInt(width);
            int y1 = random.nextInt(height);
            int x2 = random.nextInt(width);
            int y2 = random.nextInt(height);
            g2d.drawLine(x1, y1, x2, y2);
        }

        g2d.dispose();

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(bufferedImage, "png", baos);
        return baos.toByteArray();
    }
}