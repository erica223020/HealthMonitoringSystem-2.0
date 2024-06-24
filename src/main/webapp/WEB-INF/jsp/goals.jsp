<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>健康目標 | HealthMonitoringSystem </title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/icons/LifeGuard.png" type="image/png" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous" />
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css" />
    <!-- 日期選擇器 Air datepicker Css -->
    <link href="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/addRecord.css" />
    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/d6b833583a.js" crossorigin="anonymous"></script>
</head>
  <body class="hold-transition sidebar-mini">
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" role="button"><i class="fas fa-search"></i></a>
                </li>
                <li class="nav-item dropdown position-relative">
                    <a class="nav-link" id="notificationDropdown" href="#">
                        <i class="fas fa-bell position-relative">
                            <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle" style="width: 10px; height: 10px" id="notificationBadge"></span>
                        </i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" aria-labelledby="notificationDropdown">
                        <span class="dropdown-item dropdown-header">系統通知</span>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item notification-item">您有新的健康數據待查看。</a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item notification-item">系統更新：新增了健康指標分析功能。</a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item notification-item">您的資料已成功備份。</a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item notification-item">即將進行系統維護，請注意使用時間。</a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item notification-item">提醒：更新您的健康目標。</a>
                    </div>
                </li>
                <li class="nav-item d-sm-inline-block">
<form id="logoutForm" method="post" action="<c:url value='/user/logout' />" aria-label="登出">
    <button type="button" class="btn btn-danger" style="font-weight: bold" onclick="handleLogout()">
        <i class="fas fa-sign-out-alt"></i> 登出
    </button>
</form>
                </li>
            </ul>
        </nav>
        <!-- Sidebar -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <a href="index" class="brand-link d-flex align-items-center">
                <div class="logo-wrapper">
                    <img src="${pageContext.request.contextPath}/static/icons/LifeGuardLogo.png" alt="Logo" class="brand-image img-circle elevation-3 mt-1 mb-1" />
                </div>
                <span class="brand-text font-weight-light ms-2">Life Guard</span>
            </a>
            <div class="sidebar">
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="${pageContext.request.contextPath}/static/images/sticker.jpg" class="img-circle elevation-2" alt="User Image" />
                    </div>
                    <div class="info">
                        <a href="#" class="d-block">Rich Ting</a>
                    </div>
                </div>
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu">
                        <li class="nav-item">
                            <a href="/addRecord" class="nav-link">
                                <i class="nav-icon fas fa-plus"></i>
                                <p>新增紀錄</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/dataAnalysis" class="nav-link">
                                <i class="nav-icon fas fa-chart-line"></i>
                                <p>數據分析</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/goals" class="nav-link active">
                                <i class="nav-icon fas fa-bullseye"></i>
                                <p>健康目標</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/faq" class="nav-link">
                                <i class="nav-icon fas fa-question-circle"></i>
                                <p>常見問題</p>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
      <!-- Content Wrapper -->
      <div class="content-wrapper">
        <!-- Content Header -->
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h1>健康目標</h1>
              </div>
            </div>
          </div>
        </section>
        <!-- Main content -->
        <section class="content">
          <div class="container-fluid">
            <canvas id="healthChart"></canvas>
          </div>
        </section>
      </div>
      <!-- Footer -->
        <footer class="main-footer">
            <div class="float-right d-none d-sm-inline">版本 1.0</div>
            <strong>版權所有 &copy; 2024 Ting健康監控系統</strong> 保留所有權利.
        </footer>
    </div>
    <!-- ./wrapper -->

    <!-- 日期選擇器 Air datepicker JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
    document.addEventListener("DOMContentLoaded", function () {
        // 初始化 AdminLTE 的 PushMenu 功能
        if (typeof $ !== 'undefined' && $.fn.PushMenu) {
            $('[data-widget="pushmenu"]').PushMenu();
        }

        // 處理通知項目，初始化時檢查已讀狀態
        const notificationItems = document.querySelectorAll(".notification-item");
        notificationItems.forEach((item) => {
            const notificationText = item.textContent.trim();
            if (localStorage.getItem("read-" + notificationText)) {
                item.classList.add("read");
            }

            // 點擊後標記為已讀
            item.addEventListener("click", function () {
                this.classList.add("read");
                localStorage.setItem("read-" + notificationText, "true");
                // 這裡可以添加代碼來通知伺服器該通知已讀
                // markAsReadOnServer(this); // 假設有一個函數用來通知伺服器已讀狀態
            });
        });

        // 處理通知鈴鐺的點擊事件
        const notificationDropdown = document.getElementById("notificationDropdown");
        const dropdownMenu = document.querySelector(".dropdown-menu");
        const notificationBadge = document.getElementById("notificationBadge");

        if (notificationDropdown && dropdownMenu && notificationBadge) {
            // 檢查是否有新通知
            function checkNewNotifications() {
                const hasNewNotifications = true; // 模擬有新消息，實際應根據後端狀態來設置
                if (hasNewNotifications) {
                    notificationBadge.style.display = "block";
                } else {
                    notificationBadge.style.display = "none";
                }
            }

            // 點擊鈴鐺顯示或隱藏通知
            notificationDropdown.addEventListener("click", function (event) {
                event.preventDefault();
                if (dropdownMenu.classList.contains("show")) {
                    dropdownMenu.classList.remove("show");
                    // 使用 requestAnimationFrame 确保过渡效果触发
                    requestAnimationFrame(() => {
                        dropdownMenu.style.opacity = "0";
                    });
                    setTimeout(() => {
                        dropdownMenu.style.display = "none";
                    }, 500); // 讓transition生效
                } else {
                    dropdownMenu.style.display = "block";
                    // 使用 requestAnimationFrame 确保过渡效果触发
                    requestAnimationFrame(() => {
                        dropdownMenu.classList.add("show");
                        dropdownMenu.style.opacity = "1";
                        dropdownMenu.style.maxHeight = "500px"; // 设置最大高度为内容的估计高度
                    });
                    notificationBadge.style.display = "none"; // 点击后隐藏红点
                }
            });


            // 點擊頁面其他部分時隱藏通知
            document.addEventListener("click", function (event) {
                if (
                    !notificationDropdown.contains(event.target) &&
                    !dropdownMenu.contains(event.target)
                ) {
                    dropdownMenu.classList.remove("show");
                    requestAnimationFrame(() => {
                        dropdownMenu.style.opacity = "0";
                    });
                    setTimeout(() => {
                        dropdownMenu.style.display = "none";
                    }, 500);
                }
            });

            checkNewNotifications(); // 初始化檢查通知
        }
    });
    function handleLogout() {
        Swal.fire({
            title: '確認登出?',
            text: "您確定要登出嗎?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d21f3c', // 紅色確認按鈕
            cancelButtonColor: '#6c757d', // 灰色取消按鈕
            background: '#343a40', // 背景顏色設置為深色
            color: '#ffffff', // 文字顏色設置為白色
            confirmButtonText: '是的, 我要登出!',
            cancelButtonText: '取消'
        }).then((result) => {
            if (result.isConfirmed) {
                // 顯示成功消息並等待轉跳
                Swal.fire({
                    icon: 'success',
                    title: '登出成功',
                    text: '轉跳中...',
                    background: '#3d454d', // 背景顏色設置為深色
                    color: '#ffffff', // 文字顏色設置為白色
                    showConfirmButton: false,
                    timer: 1500,
                    timerProgressBar: true,
                    willClose: () => {
                        // 當計時器完成時立即轉跳
                        window.location.href = '${pageContext.request.contextPath}/login';
                    }
                });
            }
        });
    }
	</script>
</body>
</html>