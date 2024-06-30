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
    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/d6b833583a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/addRecord.css" />
    <style>
body {
    margin: 0;
    height: 100vh;
}

.content-wrapper {
    background-color: #fcfaf7;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.userpanel{
	text-decoration-color: rgba(255, 128, 128, 0.5)!important;
}
.main-sidebar{
	background-color: #403734 !important;
}

.nav-item p,.nav-icon{
	color:#fff;
}

.active{
	background-color: #a6452b !important; /* 橙色 */
    color: #3d322f !important; /* 深棕色文字 */
	
}
.navbar{
	background-color: #f5f4f0 !important;
}
.content-header {
    margin-bottom: 20px;
}

h1 {
    font-size: 2em;
    color: #333;
}

.goal {
    margin-bottom: 60px;
    text-align: center;
}

h2 {
    font-size: 1.5em;
    margin-bottom: 10px;
    color: #555;
}

.progress-container {
    width: 100%;
    background-color: #e0e0e0;
    border-radius: 25px;
    overflow: hidden;
    margin-bottom: 10px;
    position: relative;
}

.progress-bar {
    height: 30px;
    width: 0;
    border-radius: 25px;
    transition: width 0.5s ease;
    position: relative;
}

.water {
    background-color: #76c7c0;
}

.steps {
    background-color: #f76c6c;
}

.sleep {
    background-color: #6c76f7;
}

.progress-text {
    position: absolute;
    width: 100%;
    text-align: center;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
}

button {
    padding: 10px 20px;
    border: none;
    color: white;
    border-radius: 25px;
    cursor: pointer;

}

.bt{
    margin: 15px 20px;
}
.water-btn {
    background-color: #76c7c0;
}

.water-btn:hover {
    background-color: #5a9d99;
}

.steps-btn {
    background-color: #f76c6c;
}

.steps-btn:hover {
    background-color: #d55b5b;
}

.sleep-btn {
    background-color: #6c76f7;
}

.sleep-btn:hover {
    background-color: #565edf;
}
.modal-footer {
    text-align: right; /* 使按钮在模态框的右下角 */
    border:none;
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
          <div class="goal">
            <h2>喝水目標</h2>
            <div class="progress-container">
              <div class="progress-bar water" id="waterProgressBar">
                <span class="progress-text" id="waterProgressText">0%(0/3000 ml)</span>
              </div>
            </div>
            <button class="water-btn bt" onclick="showUpdateModal('water', 'waterProgressBar', 'waterProgressText', 1000, 3000, 'ml')">更新喝水目標</button>
          </div>
          <div class="goal">
            <h2>每日步數</h2>
            <div class="progress-container">
              <div class="progress-bar steps" id="stepsProgressBar">
                <span class="progress-text" id="stepsProgressText">0%(0/10000 steps)</span>
              </div>
            </div>
            <button class="steps-btn bt" onclick="showUpdateModal('steps', 'stepsProgressBar', 'stepsProgressText', 5000, 10000, '步數')">更新步數目標</button>
          </div>
          <div class="goal">
            <h2>睡眠目標</h2>
            <div class="progress-container">
              <div class="progress-bar sleep" id="sleepProgressBar">
                <span class="progress-text" id="sleepProgressText">0%(0/8 hours)</span>
              </div>
            </div>
            <button class="sleep-btn bt" onclick="showUpdateModal('sleep', 'sleepProgressBar', 'sleepProgressText', 6, 8, '小時')">更新睡眠目標</button>
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

    <!-- Goal Modal -->
   <div class="modal fade" id="goalModal" tabindex="-1" aria-labelledby="goalModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="goalModalLabel">設定目標</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="goalForm">
              <div class="mb-3">
                <label for="currentValue" class="form-label">目前數值</label>
                <input type="number" class="form-control" id="currentValue" name="currentValue" required>
              </div>
              <div class="mb-3">
                <label for="goalValue" class="form-label">目標數值</label>
                <input type="number" class="form-control" id="goalValue" name="goalValue" required>
              </div>
              <div class="modal-footer">
              <button type="submit" class="btn btn-info">保存</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        // 初始化 AdminLTE 的 PushMenu 功能
        if (typeof $ !== 'undefined' && $.fn.PushMenu) {
          $('[data-widget="pushmenu"]').PushMenu();
        }
        // 獲取當前登入用戶的ID
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
    });
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
          });
        });

        // 處理通知鈴鐺的點擊事件
        const notificationDropdown = document.getElementById("notificationDropdown");
        const dropdownMenu = document.querySelector(".dropdown-menu");
        const notificationBadge = document.getElementById("notificationBadge");

        if (notificationDropdown && dropdownMenu && notificationBadge) {
          // 檢查是否有新通知
          function checkNewNotifications() {
            const hasNewNotifications = true;
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
              requestAnimationFrame(() => {
                dropdownMenu.style.opacity = "0";
              });
              setTimeout(() => {
                dropdownMenu.style.display = "none";
              }, 500);
            } else {
              dropdownMenu.style.display = "block";
              requestAnimationFrame(() => {
                dropdownMenu.classList.add("show");
                dropdownMenu.style.opacity = "1";
                dropdownMenu.style.maxHeight = "500px";
              });
              notificationBadge.style.display = "none";
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

          checkNewNotifications();
        }


      function handleLogout() {
        Swal.fire({
          title: '確認登出?',
          text: "您確定要登出嗎?",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#d21f3c',
          cancelButtonColor: '#6c757d',
          background: '#343a40',
          color: '#ffffff',
          confirmButtonText: '是的, 我要登出!',
          cancelButtonText: '取消'
        }).then((result) => {
          if (result.isConfirmed) {
            Swal.fire({
              icon: 'success',
              title: '登出成功',
              text: '轉跳中...',
              background: '#403734',
              color: '#ffffff',
              showConfirmButton: false,
              timer: 1500,
              timerProgressBar: true,
              willClose: () => {
                window.location.href = '${pageContext.request.contextPath}/login';
              }
            });
          }
        });
      }

      function updateProgress(barId, textId, current, goal, unit) {
          var progress = (current / goal) * 100;
          var progressBar = document.getElementById(barId);
          var progressText = document.getElementById(textId);
          progressBar.style.width = progress + '%';
          progressText.textContent = Math.round(progress) + '% (' + current + ' / ' + goal + ' ' + unit + ')';
        }

        function showUpdateModal(goalType, barId, textId, current, goal, unit) {
          $('#goalModal').modal('show');
          $('#currentValue').val(current);
          $('#goalValue').val(goal);

          $('#goalForm').off('submit').on('submit', function (event) {
            event.preventDefault();
            var newCurrent = parseInt($('#currentValue').val());
            var newGoal = parseInt($('#goalValue').val());
            updateProgress(barId, textId, newCurrent, newGoal, unit);
            $('#goalModal').modal('hide');
          });
        }
    </script>
  </body>
</html>