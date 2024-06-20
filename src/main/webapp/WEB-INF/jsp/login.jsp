<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>註冊 | HealthMonitoringSystem</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/icons/LifeGuard.png" type="image/png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2.0/dist/css/adminlte.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css" />
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.0/dist/sweetalert2.min.css">
</head>
<body>
    <div class="container">
        <div class="form-wrapper">
            <div class="login-section">
                <div class="login-card">
                    <div class="text-center mb-4">
                        <img src="${pageContext.request.contextPath}/static/icons/LifeGuardWhite.png" alt="Logo" class="img-fluid" />
                    </div>
                    <c:if test="${not empty registerError}">
                        <div class="alert alert-danger">${registerError}</div>
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
                        <div class="mb-3">
                            <label for="captcha" class="form-label">驗證碼</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="captcha" name="captcha" placeholder="請輸入驗證碼" required />
                                <div class="input-group-append">
                                     <img src="${pageContext.request.contextPath}/captcha" alt="Captcha Image" style="height: 30px; width: 100px;"/>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">註冊</button>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary w-100 mt-2">登入</a>
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
    <!-- SweetAlert JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.0/dist/sweetalert2.all.min.js"></script>
    <script>
        // 使用SweetAlert顯示註冊錯誤消息
        <c:if test="${not empty registerError}">
            Swal.fire({
                icon: 'error',
                title: '錯誤',
                text: '${registerError}',
            });
        </c:if>
    </script>
</body>
</html>