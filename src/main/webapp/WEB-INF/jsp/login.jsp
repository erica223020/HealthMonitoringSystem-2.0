<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>登入 | HealthMonitoringSystem</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/icons/LifeGuard.png" type="image/png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2.0/dist/css/adminlte.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css" />
</head>
<body>
    <div class="container">
        <div class="form-wrapper">
            <div class="login-section">
                <div class="login-card">
                    <div class="text-center mb-4">
                        <img src="${pageContext.request.contextPath}/static/icons/LifeGuardWhite.png" alt="Logo" class="img-fluid" />
                    </div>
                    <c:if test="${not empty loginError}">
                        <div class="alert alert-danger">${loginError}</div>
                    </c:if>
                    <form method="post" action="/user/login">
                        <div class="mb-3">
                            <label for="email" class="form-label">使用者信箱</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="請輸入信箱" required />
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">密碼</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="請輸入密碼" required />
                        </div>
                        <button type="submit" class="btn btn-primary w-100">登入</button>
                        <a href="/register" class="btn btn-secondary w-100 mt-2">註冊</a>
                    </form>
                    <div class="mt-3 text-center">
                        <a href="#">忘記密碼或帳號？</a>
                    </div>
                </div>
            </div>
            <div class="info-section"></div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
