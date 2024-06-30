<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>健康數據分析 | HealthMonitoringSystem </title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/icons/LifeGuard.png" type="image/png" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous" />
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.css">
    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/d6b833583a.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- 引入Date Adapter for Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns@3"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/addRecord.css" />
   <style>
      body {
        background-color: #fcfaf7;
        color: #222020;
      }
      .container {
         margin: 10px auto;
         padding: 0 15px;  /* 為了讓內容不緊貼邊緣，添加水平內邊距 */
      }
      .container-fluid{
       margin: 10px auto;
         padding: 0 15px;  /* 為了讓內容不緊貼邊緣，添加水平內邊距 */
      }
      
      .card {
        background-color: #fff8e860;
        margin-bottom: 20px;
        height: 100%; /* 確保卡片填滿父容器 */
      }
      .card-body {
        padding: 1rem;
      }
      .chart-container {
        position: relative;
        height: 300px;
      }
      .user-container {
        margin-top: 20px;
      }
      .user-container img {
        margin-bottom: 10px;
      }
      .col-md-6{
      padding: 1rem;
      }
    </style>
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
                        <a href="#" class="d-block" id="username"> Rich Ting</a>
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
                            <a href="/dataAnalysis" class="nav-link active">
                                <i class="nav-icon fas fa-chart-line"></i>
                                <p>數據分析</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/goals" class="nav-link">
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
                            <h1>健康數據分析</h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="startDate" class="form-label">開始日期</label>
                        <input type="text" class="form-control" id="startDate" name="startDate" required>
                    </div>
                    <div class="col-md-6">
                        <label for="endDate" class="form-label">結束日期</label>
                        <input type="text" class="form-control" id="endDate" name="endDate" required>
                    </div>
                </div>
                <div class="text-end mb-3">
                    <button type="button" class="btn btn-info" onclick="loadCharts()">顯示圖表</button>
                </div>
<div class=".container-fluid">
      <div class="row">
        <!-- 主圖表 -->
        <div class="col-md-6">
          <div class="card">
            <div class="card-body">
              <div class="chart-container">
                <canvas id="mainChart"></canvas>
              </div>
            </div>
          </div>
        </div>
        <!-- 堆疊柱狀圖 -->
        <div class="col-md-6">
          <div class="card">
            <div class="card-body">
              <div class="chart-container">
                <canvas id="stackedBarChart"></canvas>
              </div>
            </div>
          </div>
        </div>
        <!-- 雷達圖 -->
        <div class="col-md-6">
          <div class="card">
            <div class="card-body">
              <div class="chart-container">
                <canvas id="radarChart"></canvas>
              </div>
            </div>
          </div>
        </div>
        <!-- 餅圖 -->
        <div class="col-md-6">
          <div class="card">
            <div class="card-body">
              <div class="chart-container">
                <canvas id="pieChart"></canvas>
              </div>
            </div>
          </div>
        </div>
        <!-- 前三名用戶 -->
       <div class="container">
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card text-center">
                <div class="card-body">
                    <img
                        src="${pageContext.request.contextPath}/static/images/man1.jpg"
                        alt="User 1"
                        class="rounded-circle mb-2"
                        width="100"
                    />
                    <p class="card-text">Allen</p>
                    <p class="card-text">65筆資料</p> <!-- 添加成績 -->
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card text-center">
                <div class="card-body">
                    <img
                        src="${pageContext.request.contextPath}/static/images/man2.jpg"
                        alt="User 2"
                        class="rounded-circle mb-2"
                        width="100"
                    />
                    <p class="card-text">David</p>
                    <p class="card-text">47筆資料</p> <!-- 添加成績 -->
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card text-center">
                <div class="card-body">
                    <img
                        src="${pageContext.request.contextPath}/static/images/man3.jpg"
                        alt="User 3"
                        class="rounded-circle mb-2"
                        width="100"
                    />
                    <p class="card-text">Ivy</p>
                    <p class="card-text">36筆資料</p> <!-- 添加成績 -->
                </div>
            </div>
        </div>
    </div>
</div>
            </div>
        </section>
        </div>
        <!-- Footer -->
        <footer class="main-footer">
            <div class="float-right d-none d-sm-inline">版本 1.0</div>
            <strong>版權所有 &copy; 2024 Ting健康監控系統</strong> 保留所有權利.
        </footer>
    </div>

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
    // 數據轉換英文
    function convertToEnglish(dataType) {
        switch (dataType) {
            case "體重":
                return "weight";
            case "血糖":
                return "blood_sugar";
            case "脈壓":
                return "blood_pressure";
            case "心率":
                return "heart_rate";
            default:
                return dataType;
        }
    }

    // 數據轉換中文
    function convertToChinese(dataType) {
        switch (dataType) {
            case "weight":
                return "體重";
            case "blood_sugar":
                return "血糖";
            case "blood_pressure":
                return "脈壓";
            case "heart_rate":
                return "心率";
            default:
                return dataType;
        }
    }
    document.addEventListener("DOMContentLoaded", function () {
        // 初始化 AdminLTE 的 PushMenu 功能
        if (typeof $ !== 'undefined' && $.fn.PushMenu) {
            $('[data-widget="pushmenu"]').PushMenu();
        }
        


        // 初始化日期選擇器
        const startDatePicker = new AirDatepicker('#startDate', {
            locale: {
                days: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
                daysShort: ['日', '一', '二', '三', '四', '五', '六'],
                daysMin: ['日', '一', '二', '三', '四', '五', '六'],
                months: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
                monthsShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                today: '今天',
                clear: '清除',
                dateFormat: 'yyyy-MM-dd',
                timeFormat: 'HH:mm',
                firstDay: 1
            }
        });

        const endDatePicker = new AirDatepicker('#endDate', {
            locale: {
                days: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
                daysShort: ['日', '一', '二', '三', '四', '五', '六'],
                daysMin: ['日', '一', '二', '三', '四', '五', '六'],
                months: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
                monthsShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                today: '今天',
                clear: '清除',
                dateFormat: 'yyyy-MM-dd',
                timeFormat: 'HH:mm',
                firstDay: 1
            }
        });
    });

    // 获取当前登录用户的ID
    fetch('/user/current')
        .then(response => {
            console.log("Fetching current user data...");
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log("Returned data:", data); // 打印完整返回数据以确保数据格式正确
            if (data && data.userId) {
                userId = data.userId;
                console.log("Current user ID:", userId);
            }
        })
        .catch(error => {
            console.error('Error fetching user data:', error);
        });

    function loadCharts() {
        const startDate = document.getElementById('startDate').value;
        const endDate = document.getElementById('endDate').value;

        if (!startDate || !endDate) {
            alert("請選擇開始和結束日期");
            return;
        }
        
        console.log("Selected start date:", startDate);
        console.log("Selected end date:", endDate);
        
        // 顯示圖表
        $(".chart-section").show();
        
     // 發出請求獲取健康數據
        fetch('/health-data/chart?start='+startDate+'&end='+endDate)
        .then(response => response.json())
        .then(data => {
            // 處理返回的數據並繪製圖表
            drawCharts(data);
        })
        .catch(error => {
            console.error('Error fetching health data:', error);
        });
}
    
    function drawCharts(data) {
    	
        console.log("Drawing charts with data:", data);
        
        // 將數據按日期分組
        const groupedData = {};
        data.forEach(item => {
            const date = new Date(item.timestamp).toLocaleDateString();
            if (!groupedData[date]) {
                groupedData[date] = {};
            }
            groupedData[date][convertToEnglish(item.dataType)] = item.value;
        });
        
        // 提取標籤和數據集
        const labels = Object.keys(groupedData);
        const weightData = labels.map(date => groupedData[date].weight || 0);
        const bloodSugarData = labels.map(date => groupedData[date].blood_sugar || 0);
        const pulsePressureData = labels.map(date => groupedData[date].blood_pressure || 0);
        const heartRateData = labels.map(date => groupedData[date].heart_rate || 0);

        console.log("Labels:", labels);
        console.log("Weight Data:", weightData);
        console.log("Blood Sugar Data:", bloodSugarData);
        console.log("Pulse Pressure Data:", pulsePressureData);
        console.log("Heart Rate Data:", heartRateData);
        
     // 初始化主圖表
        var ctxMain = document.getElementById("mainChart").getContext("2d");
        var mainChart = new Chart(ctxMain, {
        type: "line",
        data: {
            labels: labels,
            datasets: [
            {
              label: "體重(kg)",
              data: weightData,
              borderColor: "rgba(255, 99, 132, 1)",
              backgroundColor: "rgba(255, 99, 132, 0.6)",
      		},
            {
              label: "血糖(mg/dL)",
              data: bloodSugarData,
              borderColor: "rgba(54, 162, 235, 1)",
              backgroundColor: "rgba(54, 162, 235, 0.6)",
            },
            {
                label: "脈壓(mmHg)",
                data: pulsePressureData,
              borderColor: "rgba(75, 192, 192, 1)",
              backgroundColor: "rgba(75, 192, 192, 0.6)",
            },
            {
              label: "心率(bpm)",
              data: heartRateData,
              borderColor: "rgba(153, 102, 255, 1)",
              backgroundColor: "rgba(153, 102, 255, 0.6)",
            },
          ],
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
        },
      });

      // 初始化堆疊柱狀圖
       //年齡資料數比較
      var ctxStacked = document
        .getElementById("stackedBarChart")
        .getContext("2d");
      var stackedBarChart = new Chart(ctxStacked, {
        type: "bar",
        data: {
          labels: ["18歲以下", "18-34歲", "35-50 歲", "51-64 歲", "65 歲以上"],
          datasets: [
              {
                label: "男性",
                data: [4, 59, 55, 71,8],
                backgroundColor: "rgba(255, 99, 132, 0.5)",
                borderColor: "rgba(255, 99, 132, 1)",
                borderWidth: 2,
              },
              {
                label: "女性",
                data: [10, 48, 60, 75,12],
                backgroundColor: "rgba(54, 162, 235, 0.5)",
                borderColor: "rgba(54, 162, 235, 1)",
                borderWidth: 2,
              },
              {
                label: "其他",
                data: [1, 12, 32, 45,1],
                backgroundColor: "rgba(153, 102, 255, 0.5)",
                borderColor: "rgba(153, 102, 255, 1)",
                borderWidth: 2,
              },
          ],
        },
        options: {
          scales: {
            x: {
              stacked: true,
            },
            y: {
              stacked: true,
            },
          },
          responsive: true,
          maintainAspectRatio: false,
        },
      });

      // 初始化雷達圖
      var ctxRadar = document.getElementById("radarChart").getContext("2d");
      var radarChart = new Chart(ctxRadar, {
        type: "radar",
        data: {
          labels: ["體重", "血糖", "脈壓", "心率"],
          datasets: [
            {
                label: "男性",
                data: [65, 59, 90, 81],
                backgroundColor: "rgba(255, 99, 132, 0.2)",
                borderColor: "rgba(255, 99, 132, 1)",
                pointBackgroundColor: "rgba(255, 99, 132, 1)",
                borderWidth: 2
            },
            {
                label: "女性",
                data: [28, 48, 40, 19],
                backgroundColor: "rgba(54, 162, 235, 0.2)",
                borderColor: "rgba(54, 162, 235, 1)",
                pointBackgroundColor: "rgba(54, 162, 235, 1)",
                borderWidth: 2
            },
            {
                label: "其他",
                data: [12, 55, 78, 34],
                backgroundColor: "rgba(153, 102, 255, 0.2)",
                borderColor: "rgba(153, 102, 255, 1)",
                pointBackgroundColor: "rgba(153, 102, 255, 1)",
                borderWidth: 2
            },
          ],
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
        },
      });

      // 初始化餅圖
      var ctxPie = document.getElementById("pieChart").getContext("2d");
      var pieChart = new Chart(ctxPie, {
        type: "pie",
        data: {
          labels: ["男性", "女性", "其他"],
          datasets: [
            {
              data: [65, 35, 15],
              backgroundColor: [
                "rgba(255, 99, 132, 0.5)",
                "rgba(54, 162, 235, 0.5)",
                "rgba(153, 102, 255, 0.5)",
              ],
              borderColor: [
                "rgba(255, 99, 132, 1)",
                "rgba(54, 162, 235, 1)",
                "rgba(153, 102, 255, 1)",
              ],
              borderWidth: 2,
            },
          ],
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
        },
      });
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

    // 获取当前登录用户的ID
    fetch('/user/current')
        .then(response => {
            console.log("Fetching current user data...");
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
        	console.log("Returned data:", data); // 打印完整返回数据以确保数据格式正确
            if (data && data.userId) {
                userId = data.userId;
                console.log("Current user ID:", userId);
                
                // 更新用户名
                if (data.username) {
                    document.getElementById('username').textContent = ' '+data.username;
                }

                // 使用获取到的 userId 调用 loadHealthData
                loadHealthData(userId);
            }
        })
        .catch(error => {
            console.error('Error fetching user data:', error);
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
                background: '#403734', // 背景顏色設置為深色
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



