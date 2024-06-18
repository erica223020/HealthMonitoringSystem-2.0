<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>登入 | HealthMonitoringSystem</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">登入</div>
                    <div class="card-body">
                        <c:if test="${not empty loginError}">
                            <div class="alert alert-danger">${loginError}</div>
                        </c:if>
                        <form method="post" action="/user/login">
                            <div class="mb-3">
                                <label for="email" class="form-label">使用者信箱</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="請輸入信箱" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">密碼</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="請輸入密碼" required>
                            </div>
                            <button type="submit" class="btn btn-primary">登入</button>
                        </form>
                        <div class="mt-3">
                            <a href="/register">還沒有帳號嗎？馬上註冊</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
