<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HealthMonitoringSystem | 健康監控系統</title>
    <meta name="description" content="HealthMonitoringSystem 提供健康數據監控和管理功能，幫助您保持健康生活。" />
    <link rel="icon" href="${pageContext.request.contextPath}/static/icons/LifeGuard.png" type="image/png" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous" />
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css" />
    <!-- 日期選擇器 Air datepicker Css -->
    <link href="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
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
                            <a href="addRecord.jsp" class="nav-link">
                                <i class="nav-icon fas fa-plus"></i>
                                <p>新增紀錄</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="dataAnalysis.jsp" class="nav-link">
                                <i class="nav-icon fas fa-chart-line"></i>
                                <p>數據分析</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="goals.jsp" class="nav-link">
                                <i class="nav-icon fas fa-bullseye"></i>
                                <p>健康目標</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="faq.jsp" class="nav-link">
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
                            <h1>首頁</h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <!-- Info boxes -->
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="info-box">
                                <span class="info-box-icon bg-info elevation-1"><i class="fas fa-weight"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">體重</span>
                                    <span class="info-box-number">${latestWeight} kg</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="info-box mb-3">
                                <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-tint"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">血糖</span>
                                    <span class="info-box-number">${latestBloodSugar} mg/dL</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="info-box mb-3">
                                <span class="info-box-icon bg-success elevation-1"><i class="fas fa-heartbeat"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">血壓</span>
                                    <span class="info-box-number">${latestBloodPressure} mmHg</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="info-box mb-3">
                                <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-heart"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">心率</span>
                                    <span class="info-box-number">${latestHeartRate} bpm</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->

                                        <!-- Recent Activities -->
                    <div class="row">
                        <div class="col-12 col-md-6 mb-4">
                            <div class="card shadow-sm">
                                <div class="card-header bg-primary text-white">
                                    <h3 class="card-title">最近活動</h3>
                                </div>
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">
                                            您於 2024/06/17 增加了新的體重紀錄。
                                        </li>
                                        <li class="list-group-item">
                                            您於 2024/06/16 測量了心率：75 bpm。
                                        </li>
                                        <li class="list-group-item">
                                            系統提醒：記得明天測量血壓。
                                        </li>
                                        <li class="list-group-item">
                                            您於 2024/06/15 更新了血糖紀錄。
                                        </li>
                                        <li class="list-group-item">
                                            系統提醒：您已完成本週的運動目標！
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- Health Tips -->
                        <div class="col-12 col-md-6 mb-4">
                            <div class="card shadow-sm">
                                <div class="card-header bg-success text-white">
                                    <h3 class="card-title">健康小貼士</h3>
                                </div>
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">
                                            保持每天的飲水量，有助於身體代謝。
                                        </li>
                                        <li class="list-group-item">
                                            規律運動可以降低心血管疾病的風險。
                                        </li>
                                        <li class="list-group-item">
                                            每天保持8小時的睡眠，有助於身心健康。
                                        </li>
                                        <li class="list-group-item">
                                            多吃水果和蔬菜，保持均衡的飲食。
                                        </li>
                                        <li class="list-group-item">
                                            避免過量攝取糖分，保持血糖穩定。
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->

                    <!-- Health News -->
                    <div class="row">
                        <div class="col-12 mb-4">
                            <div class="card shadow-sm">
                                <div class="card-header bg-info text-white">
                                    <h3 class="card-title">健康新聞</h3>
                                </div>
                                <div class="card-body p-0">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">
                                            最新研究表明，每天步行有助於降低心臟病風險。
                                        </li>
                                        <li class="list-group-item">
                                            世界衛生組織發佈了新的飲食指南。
                                        </li>
                                        <li class="list-group-item">
                                            運動與睡眠的關聯：如何在日常生活中保持健康。
                                        </li>
                                        <li class="list-group-item">
                                            健康飲食對心理健康的重要性。
                                        </li>
                                        <li class="list-group-item">
                                            新冠疫情後的健康管理：專家建議。
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

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
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="<c:url value='/scripts/all.js' />"></script>
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
                    background: '#343a40', // 背景顏色設置為深色
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