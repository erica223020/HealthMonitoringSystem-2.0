<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>註冊 | HealthMonitoringSystem</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">註冊</div>
                    <div class="card-body">
                        <c:if test="${not empty registerError}">
                            <div class="alert alert-danger">${registerError}</div>
                        </c:if>
                        <form method="post" action="/user/register">
                            <div class="mb-3">
                                <label for="registerEmail" class="form-label">使用者信箱</label>
                                <input type="email" class="form-control" name="email" placeholder="請輸入要註冊的信箱" required="required" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"/>
                            </div>
                            <div class="mb-3">
                                <label for="registerUsername" class="form-label">使用者名稱</label>
                                <input type="text" class="form-control" name="username" placeholder="請輸入使用者名稱" required="required"/>
                            </div>
                            <div class="mb-3">
                                <label for="registerPassword" class="form-label">密碼</label>
                                <input id="registerPassword" class="form-control" type="password" name="password" pattern="^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$" placeholder="請輸入英數混合的六個字元" required="required" oninput="setCustomValidity('');" oninvalid="setCustomValidity('密碼格式含英數需至少六個字元');"/>
                            </div>
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">再次確認密碼</label>
                                <input id="ConfirmPassword" class="form-control" type="password" name="confirmPassword" placeholder="請再次輸入密碼" required="required" oninput="setCustomValidity('');" onchange="if(document.getElementById('registerPassword').value != document.getElementById('ConfirmPassword').value){setCustomValidity('密碼與確認密碼不相同');}"/>
                            </div>
                            <div class="mb-3">
                                <label for="registerGender" class="form-label">性別</label>
                                <select class="form-control" name="gender" required="required">
                                    <option value="male">男</option>
                                    <option value="female">女</option>
                                    <option value="other">其他</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">註冊</button>
                        </form>
                        <div class="mt-3">
                            <a href="/login">已經有帳號了？立即登入</a>
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
