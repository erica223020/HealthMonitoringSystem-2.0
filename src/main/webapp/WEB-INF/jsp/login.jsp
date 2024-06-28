<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <form method="post" action="${pageContext.request.contextPath}/user/login" autocomplete="on">
                        <div class="mb-3">
                            <label for="email" class="form-label">使用者信箱</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="請輸入信箱" required autocomplete="username"/>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">密碼</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="請輸入密碼" required autocomplete="current-password" />
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
                        <button type="submit" class="btn btn-primary w-100">登入</button>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary w-100 mt-2">註冊</a>
                    </form>
                                <div class="mt-3 text-center">
              <a href="#" id="forgotLink">忘記密碼或帳號？</a>
            </div>
                </div>
            </div>
            <div class="info-section"></div>
        </div>
            <div id="forgotModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; border: 1px solid black;">
        忘記密碼或帳號了嗎？請重新註冊。
        <br><br>
        <button id="closeModal">確定</button>
    </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
    <!-- SweetAlert JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.0/dist/sweetalert2.all.min.js"></script>
 <script>
 $(document).ready(function() {
     // 檢查是否有錯誤信息並顯示警告
     <c:if test="${not empty captchaError}">
         Swal.fire({
             icon: 'error',
             title: '驗證碼錯誤',
             text: '${captchaError}',
             background: '#343a40', // 背景顏色設置為深色
             color: '#ffffff' // 文字顏色設置為白色
         });
     </c:if>
     <c:if test="${not empty loginError}">
         Swal.fire({
             icon: 'error',
             title: '登入失敗',
             text: '${loginError}',
             background: '#343a40', // 背景顏色設置為深色
             color: '#ffffff' // 文字顏色設置為白色
         });
     </c:if>
     <c:if test="${not empty loginSuccess}">
         Swal.fire({
             icon: 'success',
             title: '登入成功',
             text: '轉跳中...',
             background: '#343a40', // 背景顏色設置為深色
             color: '#ffffff', // 文字顏色設置為白色
             showConfirmButton: false,
             timer: 1500,
             timerProgressBar: true,
             willClose: () => {
                 window.location.href = '${pageContext.request.contextPath}/index';
             }
         });
     </c:if>
 });
 
 // 當鏈接點擊時，顯示深色Loading SweetAlert
 $('a').on('click', function(event) {
     var target = $(this).attr('href');
     if (target && target[0] === '#') return;
     event.preventDefault();
     Swal.fire({
     	title: '<span style="color: #ffffff;">請稍候</span>',
         html: '<span style="color: #ffffff;">正在轉跳中...</span>',
         background: '#343a40', // 背景顏色設置為深色
         color: '#ffffff', // 文字顏色設置為白色
         allowOutsideClick: false,
         didOpen: () => {
             Swal.showLoading();
         }
     });
     setTimeout(function() {
         window.location.href = target;
     }, 1000); // 延遲1秒以顯示loading效果
 });
 
 document.getElementById('forgotLink').addEventListener('click', function(event) {
     event.preventDefault();
     document.getElementById('forgotModal').style.display = 'block';
 });

 document.getElementById('closeModal').addEventListener('click', function() {
     document.getElementById('forgotModal').style.display = 'none';
 });
    </script>
</body>
</html>