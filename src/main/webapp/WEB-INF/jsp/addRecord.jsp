<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>重設密碼 | HealthMonitoringSystem</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/icons/LifeGuard.png" type="image/png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.0/dist/sweetalert2.min.css">
</head>
<body>
    <div class="container">
        <div class="form-wrapper">
            <div class="login-section">
                <div class="login-card">
                    <div class="text-center mb-4">
                        <img src="${pageContext.request.contextPath}/static/icons/LifeGuardWhite.png" alt="Logo" class="img-fluid">
                    </div>
                    <form id="resetPasswordForm" method="post" action="${pageContext.request.contextPath}/auth/reset-password">
                        <input type="hidden" id="token" name="token" value="${token}">
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">新密碼</label>
                            <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="請輸入新密碼" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">確認新密碼</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="請再次輸入新密碼" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">重設密碼</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.0/dist/sweetalert2.all.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#resetPasswordForm').submit(function(event) {
                event.preventDefault();
                var newPassword = $('#newPassword').val();
                var confirmPassword = $('#confirmPassword').val();

                if (newPassword !== confirmPassword) {
                    Swal.fire({
                        icon: 'error',
                        title: '錯誤',
                        text: '兩次輸入的密碼不一致',
                        background: '#343a40',
                        color: '#ffffff'
                    });
                    return;
                }

                $.ajax({
                    url: '${pageContext.request.contextPath}/auth/reset-password',
                    type: 'POST',
                    data: {
                        token: $('#token').val(),
                        newPassword: newPassword
                    },
                    success: function(response) {
                        Swal.fire({
                            icon: 'success',
                            title: '成功',
                            text: '密碼重設成功',
                            background: '#343a40',
                            color: '#ffffff'
                        }).then(() => {
                            window.location.href = '${pageContext.request.contextPath}/login';
                        });
                    },
                    error: function(xhr, status, error) {
                        Swal.fire({
                            icon: 'error',
                            title: '錯誤',
                            text: '密碼重設失敗，請重試',
                            background: '#343a40',
                            color: '#ffffff'
                        });
                    }
                });
            });
        });
    </script>
</body>
</html>
