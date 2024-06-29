<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>註冊 | HealthMonitoringSystem</title>
    <!-- 使用上下文路徑引用 favicon 圖標 -->
    <link rel="icon" href="${pageContext.request.contextPath}/static/icons/LifeGuard.png" type="image/png" />
    <!-- 引用 Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- 引用 AdminLTE CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2.0/dist/css/adminlte.min.css" />
    <!-- 使用上下文路徑引用自定義 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/register.css" />
	<!-- 引入 SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.min.css">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.css">
</head>
<body>
    <div class="container">
        <div class="form-wrapper">
            <div class="register-section">
                <div class="register-card">
                    <div class="text-center mb-4">
                        <!-- 使用上下文路徑引用圖片 -->
                        <img src="${pageContext.request.contextPath}/static/icons/LifeGuardWhite.png" alt="Logo" class="img-fluid" />
                    </div>
                    <form method="post" action="${pageContext.request.contextPath}/user/register">
                        <div class="mb-3">
                            <label for="registerUsername" class="form-label">使用者名稱</label>
                            <input type="text" class="form-control" name="username" placeholder="請輸入使用者名稱" required="required" />
                        </div>
                        <div class="mb-3">
                            <label for="registerEmail" class="form-label">使用者信箱</label>
                            <input type="email" class="form-control" name="email" placeholder="請輸入要註冊的信箱" required="required" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" />
                        </div>
                        <div class="mb-3">
                            <label for="registerPassword" class="form-label">密碼</label>
                            <input id="registerPassword" class="form-control" type="password" name="password" pattern="^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$" placeholder="請輸入英數混合的六個字元" required="required" oninput="setCustomValidity('');" oninvalid="setCustomValidity('密碼格式含英數需至少六個字元');" />
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">再次確認密碼</label>
                            <input id="ConfirmPassword" class="form-control" type="password" name="confirmPassword" placeholder="請再次輸入密碼" required="required" oninput="setCustomValidity('');" onchange="if(document.getElementById('registerPassword').value != document.getElementById('ConfirmPassword').value){setCustomValidity('密碼與確認密碼不相同');}" />
                        </div>
                    <div class="mb-3">
                        <label for="registerBirthday" class="form-label">生日</label>
                        <input type="text" class="form-control" id="registerBirthday" name="birthday" placeholder=" 年 / 月 / 日 " required="required" />
                    </div>
                        <div class="mb-3">
                            <label for="registerGender" class="form-label">性別</label>
                            <select class="form-control" name="gender" required="required">
                                <option value="male">男</option>
                                <option value="female">女</option>
                                <option value="other">其他</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">註冊</button>
                    </form>
                    <div class="mt-3 text-center">
                        <!-- 使用上下文路徑來引用登入頁面 -->
                        <a href="${pageContext.request.contextPath}/login">已經有帳號了？立即登入</a>
                    </div>
                </div>
            </div>
            <div class="info-section"></div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
	<!-- 引入 SweetAlert JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.all.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.js"></script>
   <!-- 檢查是否有註冊錯誤或成功信息並顯示 SweetAlert -->
    <script>
    
    // 初始化日期選擇器
    new AirDatepicker('#registerBirthday', {
        locale: {
            days: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
            daysShort: ['日', '一', '二', '三', '四', '五', '六'],
            daysMin: ['日', '一', '二', '三', '四', '五', '六'],
            months: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            monthsShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
            today: '今天',
            clear: '清除',
            dateFormat: 'yyyy/MM/dd',
            timeFormat: 'HH:mm',
            firstDay: 1
        }
    });
        $(document).ready(function() {
            // 當表單提交時，顯示 Loading SweetAlert
            $('form').on('submit', function(event) {
                Swal.fire({
                    title: '<span style="color: #ffffff;">請稍候</span>',
                    html: '<span style="color: #ffffff;">正在處理您的請求...</span>',
                    background: '#343a40',
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading();
                    }
                });
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


            // 檢查是否有註冊錯誤或成功信息並顯示 SweetAlert
            window.onload = function() {
                <c:if test="${not empty registerError}">
                    Swal.fire({
                        icon: 'error',
                        title: '<span style="color: #ffffff;">註冊失敗</span>',
                        html: '<span style="color: #ffffff;">${registerError}</span>',
                        confirmButtonText: '<span style="color: #ffffff;">重試</span>',
                        background: '#343a40'
                    });
                </c:if>

                <c:if test="${not empty emailExists}">
                    Swal.fire({
                        icon: 'warning',
                        title: '<span style="color: #ffffff;">信箱已註冊</span>',
                        html: '<span style="color: #ffffff;">${emailExists}</span>',
                        confirmButtonText: '<span style="color: #ffffff;">重試</span>',
                        background: '#343a40'
                    });
                </c:if>

                <c:if test="${not empty registerSuccess}">
                    Swal.fire({
                        icon: 'success',
                        title: '<span style="color: #ffffff;">註冊成功</span>',
                        html: '<span style="color: #ffffff;">註冊成功，轉跳登入畫面請稍後...</span>',
                        background: '#343a40',
                        timer: 2000, // 設置提示框顯示2秒
                        showConfirmButton: false,
                        willClose: () => {
                            // 當提示框即將關閉時，跳轉到登入頁面
                            window.location.href = '${pageContext.request.contextPath}/login';
                        }
                    });
                </c:if>
            };
        });
    </script>
</body>
</html>
