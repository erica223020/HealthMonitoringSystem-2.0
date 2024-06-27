<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>新增數據 | HealthMonitoringSystem </title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/icons/LifeGuard.png" type="image/png" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous" />
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css" />
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
                            <a href="/addRecord" class="nav-link active">
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
                            <h1>健康數據管理</h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <!-- 新增數據表單 -->
                    <form id="healthDataForm" class="form-custom">
                        <div class="mb-3">
                            <label for="dataType" class="form-label">數據類型</label>
                            <select class="form-select" id="dataType" name="dataType" required>
                                <option value="體重">體重</option>
                                <option value="血糖">血糖</option>
                                <option value="脈壓">脈壓</option>
                                <option value="心率">心率</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="value" class="form-label">數值</label>
                            <input type="text" class="form-control" id="value" name="value" required>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-primary" onclick="submitHealthData()">提交</button>
                        </div>
                    </form>

                    <!-- 數據列表 -->
                    <h2 class="mt-5">健康數據列表</h2>
                    <table class="table table-bordered table-custom">
                        <thead>
                            <tr>
                                <th>日期</th>
                                <th>數據類型</th>
                                <th>數值</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody id="data-table-body">
                            <!-- 動態加載數據 -->
                        </tbody>
                    </table>
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
        let userId;
     // 文档加载完成后的初始化逻辑
        document.addEventListener("DOMContentLoaded", function () {
            console.log("Document loaded");

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
                        loadHealthData(userId); // 使用閉包確保用戶ID在載入健康資料時正確使用
                     	
                        // 提交健康数据的AJAX函數
                       window.submitHealthData = function () {
                        const dataType = document.getElementById('dataType').value;
                        const value = document.getElementById('value').value;
                        const englishType = convertToEnglish(dataType);
                        if (isNaN(value) || parseFloat(value) <= 0) {
                            Swal.fire({
                                icon: 'error',
                                title: '無效的數值',
                                text: '數值必須是數字且不得小於1',
                                background: '#3d454d',
                                color: '#ffffff'
                            });
                            return; // 阻止提交
                        }
                        if (parseFloat(value) <= 0) {
                            Swal.fire({
                                icon: 'error',
                                title: '無效的數值',
                                text: '數值不能為 0 或負數',
                                background: '#3d454d',
                                color: '#ffffff'
                            });
                            return; // 阻止提交
                        }
                        const healthData = {
                        	userId: userId,
                            dataType: englishType,
                            value: parseFloat(value),
                            timestamp: new Date().toISOString()
                        };

                        fetch('/health-data/add', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(healthData)
                        })
                        .then(response => response.text())
                        .then(result => {
                            Swal.fire({
                                icon: 'success',
                                title: '數據新增成功',
                                text: '成功新增了數據',
                                background: '#3d454d',
                                color: '#ffffff'
                            });
                            loadHealthData(userId);
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            Swal.fire({
                                icon: 'error',
                                title: '新增數據失敗',
                                text: '請稍後再試',
                                background: '#3d454d',
                                color: '#ffffff'
                            });
                        });
                    }
                        
                      
                        // 修改健康數據函數
                        window.editHealthData = function (id) {
                            console.log("Editing health data with ID:", id); // 打印ID
                            fetch('/health-data/user/' + userId, {
                                method: 'GET',
                                headers: {
                                    'Content-Type': 'application/json'
                                }
                            })
                            .then(response => response.json())
                            .then(data => {
                                const healthData = data.find(item => item.id == id);
                                console.log("Fetched health data:", healthData); // 打印獲取的健康數據
                                if (healthData) {
                                    const chineseType = convertToChinese(healthData.dataType);

                                    // 創建表單元素
                                    const form = document.createElement('div');
                                    form.innerHTML = `
                                        <div class="mb-3">
                                            <label for="edit-dataType" class="form-label">數據類型</label>
                                            <select class="form-select" id="edit-dataType" required>
                                                <option value="體重" ${chineseType == '體重' ? 'selected' : ''}>體重</option>
                                                <option value="血糖" ${chineseType == '血糖' ? 'selected' : ''}>血糖</option>
                                                <option value="脈壓" ${chineseType == '脈壓' ? 'selected' : ''}>脈壓</option>
                                                <option value="心率" ${chineseType == '心率' ? 'selected' : ''}>心率</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="edit-value" class="form-label">數值</label>
                                            <input type="text" class="form-control" id="edit-value" value="${healthData.value}" required>
                                        </div>
                                    `;

                                    Swal.fire({
                                        title: '修改健康數據',
                                        html: form,
                                        confirmButtonText: '保存',
                                        cancelButtonText: '取消',
                                        showCancelButton: true,
                                        background: '#3d454d',
                                        color: '#ffffff',
                                        preConfirm: () => {
                                            const dataType = form.querySelector('#edit-dataType').value;
                                            const englishType = convertToEnglish(dataType);
                                            const value = form.querySelector('#edit-value').value;

                                            if (isNaN(value) || parseFloat(value) <= 0) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: '無效的數值',
                                                    text: '數值必須是數字且不得小於1',
                                                    background: '#3d454d',
                                                    color: '#ffffff'
                                                });
                                                return; // 阻止提交
                                            }

                                            return {
                                                id: healthData.id, // 直接使用閉包中的 healthData.id
                                                userId: healthData.userId,
                                                dataType: englishType,
                                                value: parseFloat(value),
                                                timestamp: healthData.timestamp // 添加 timestamp
                                            };
                                        }
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            const updatedHealthData = result.value;
                                            console.log("Updated health data:", updatedHealthData); // 打印更新的健康數據
                                            fetch('/health-data/update', {
                                                method: 'PUT',
                                                headers: {
                                                    'Content-Type': 'application/json'
                                                },
                                                body: JSON.stringify(updatedHealthData)
                                            })
                                            .then(response => {
                                                if (!response.ok) {
                                                    return response.text().then(text => { throw new Error(text) });
                                                }
                                                return response.text();
                                            })
                                            .then(result => {
                                                Swal.fire({
                                                    icon: 'success',
                                                    title: '數據修改成功',
                                                    text: '成功更新了數據',
                                                    background: '#3d454d',
                                                    color: '#ffffff'
                                                });
                                                loadHealthData(userId);
                                            })
                                            .catch(error => {
                                                console.error('Error:', error);
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: '修改數據失敗',
                                                    text: '請稍後再試',
                                                    background: '#3d454d',
                                                    color: '#ffffff'
                                                });
                                            });
                                        }
                                    });
                                } else {
                                    console.error('Health data not found for ID:', id);
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                            });
                        };
                    } else {
                        console.error('No current user data received');
                    }
                })
                .catch(error => {
                    console.error('Error fetching user data:', error);
                });

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
    
    //數據轉換英文
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
	
    //數據轉換中文
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

 // 提交健康數據的AJAX函數
    function submitHealthData() {
    const dataType = document.getElementById('dataType').value;
    const value = document.getElementById('value').value;
    const englishType = convertToEnglish(dataType);
    if (isNaN(value) || parseFloat(value) <= 0) {
        Swal.fire({
            icon: 'error',
            title: '無效的數值',
            text: '數值必須是數字且不得小於1',
            background: '#3d454d',
            color: '#ffffff'
        });
        return; // 阻止提交
    }
    if (parseFloat(value) <= 0) {
        Swal.fire({
            icon: 'error',
            title: '無效的數值',
            text: '數值不能為 0 或負數',
            background: '#3d454d',
            color: '#ffffff'
        });
        return; // 阻止提交
    }
    const healthData = {
    	userId: userId,
        dataType: englishType,
        value: parseFloat(value),
        timestamp: new Date().toISOString()
    };

    fetch('/health-data/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(healthData)
    })
    .then(response => response.text())
    .then(result => {
        Swal.fire({
            icon: 'success',
            title: '數據新增成功',
            text: '成功新增了數據',
            background: '#3d454d',
            color: '#ffffff'
        });
        loadHealthData(userId);
    })
    .catch(error => {
        console.error('Error:', error);
        Swal.fire({
            icon: 'error',
            title: '新增數據失敗',
            text: '請稍後再試',
            background: '#3d454d',
            color: '#ffffff'
        });
    });
}

    // 加載健康數據的函數
function loadHealthData(userId) {
    if (!userId) {
        console.error("User ID is not set.");
        return;
    }
    const url = '/health-data/user/' + userId;
    console.log("Fetching health data from URL:", url); // 打印生成的URL
    fetch(url, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        console.log("Fetching health data response:", response);
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        // 按時間排序，從新到舊
        data.sort((a, b) => new Date(b.timestamp) - new Date(a.timestamp));
        const tbody = document.getElementById('data-table-body');
        tbody.innerHTML = ''; // 清空當前的數據列表
        data.forEach(item => {
            console.log("Processing item ID:", item.id); // 打印每個數據項的ID
            const chineseType = convertToChinese(item.dataType); // 將英文轉換為中文
            const date = new Date(item.timestamp);
            const formattedDate = date.toLocaleString('zh-TW', { 
                timeZone: 'Asia/Taipei', 
                hour12: false, 
                year: 'numeric', 
                month: '2-digit', 
                day: '2-digit', 
                hour: '2-digit', 
                minute: '2-digit', 
                second: '2-digit' 
            });

            const row = document.createElement('tr');

            // 創建每個單元格並設置文本內容
            const timestampCell = document.createElement('td');
            timestampCell.textContent = formattedDate;
            row.appendChild(timestampCell);

            const typeCell = document.createElement('td');
            typeCell.textContent = chineseType;
            row.appendChild(typeCell);

            const valueCell = document.createElement('td');
            valueCell.textContent = item.value;
            row.appendChild(valueCell);

            // 判斷數據值並改變整行顏色
            if (item.dataType === 'weight') {
                const weightValue = parseFloat(item.value);
                console.log("Weight value:", weightValue); // 打印體重值
                if (weightValue > 70 * 1.2) {
                    row.classList.add('table-danger');
                } else if (weightValue > 70 * 1.1) {
                    row.classList.add('table-warning');
                }
            } else if (item.dataType === 'blood_sugar') {
                const bloodSugarValue = parseFloat(item.value);
                console.log("Blood sugar value:", bloodSugarValue); // 打印血糖值
                if (bloodSugarValue > 126) {
                    row.classList.add('table-danger');
                } else if (bloodSugarValue > 100) {
                    row.classList.add('table-warning');
                }
            } else if (item.dataType === 'blood_pressure') {
            	const pulsePressure = parseFloat(item.value);
                console.log("Blood sugar value:", pulsePressure); // 打印脈壓
                
                if (pulsePressure > 60) {
                    row.classList.add('table-danger');
                } else if (pulsePressure > 50) {
                    row.classList.add('table-warning');
                }
            } else if (item.dataType === 'heart_rate') {
                const heartRateValue = parseFloat(item.value);
                console.log("Heart rate value:", heartRateValue); // 打印心率值
                if (heartRateValue > 120) {
                    row.classList.add('table-danger');
                } else if (heartRateValue > 100) {
                    row.classList.add('table-warning');
                }
            }

            const actionsCell = document.createElement('td');
            // 創建修改按鈕
            const editButton = document.createElement('button');
            editButton.type = 'button';
            editButton.className = 'btn btn-warning btn-sm';
            editButton.textContent = '修改';
            editButton.addEventListener('click', () => editHealthData(item.id));
            actionsCell.appendChild(editButton);

            // 創建刪除按鈕
            const deleteButton = document.createElement('button');
            deleteButton.type = 'button';
            deleteButton.className = 'btn btn-danger btn-sm';
            deleteButton.textContent = '刪除';
            deleteButton.addEventListener('click', () => deleteHealthData(item.id));
            actionsCell.appendChild(deleteButton);

            row.appendChild(actionsCell);

            tbody.appendChild(row);
        });
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

//修改健康數據的函數（可以用來加載編輯頁面或顯示編輯表單）
function editHealthData(id) {
    console.log("Editing health data with ID:", id); // 打印ID
    console.log("Editing health data with userID:", userId); // 打印ID
    fetch('/health-data/user/'+userId,{
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        const healthData = data.find(item => item.id == id);
        console.log("Fetched health data:", healthData); // 打印獲取的健康數據
        if (healthData) {
            const chineseType = convertToChinese(healthData.dataType);

            // 創建表單元素
            const form = document.createElement('div');
            form.innerHTML = `
                <div class="mb-3">
                    <label for="edit-dataType" class="form-label">數據類型</label>
                    <select class="form-select" id="edit-dataType" required>
                        <option value="體重" ${chineseType == '體重' ? 'selected' : ''}>體重</option>
                        <option value="血糖" ${chineseType == '血糖' ? 'selected' : ''}>血糖</option>
                        <option value="脈壓" ${chineseType == '脈壓' ? 'selected' : ''}>脈壓</option>
                        <option value="心率" ${chineseType == '心率' ? 'selected' : ''}>心率</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="edit-value" class="form-label">數值</label>
                    <input type="text" class="form-control" id="edit-value" value="${healthData.value}" required>
                </div>
            `;

            Swal.fire({
                title: '修改健康數據',
                html: form,
                confirmButtonText: '保存',
                cancelButtonText: '取消',
                showCancelButton: true,
                background: '#3d454d',
                color: '#ffffff',
                preConfirm: () => {
                    const dataType = form.querySelector('#edit-dataType').value;
                    const englishType = convertToEnglish(dataType);
                    const value = form.querySelector('#edit-value').value;
					
                    if (isNaN(value) || parseFloat(value) <= 0) {
                        Swal.fire({
                            icon: 'error',
                            title: '無效的數值',
                            text: '數值必須是數字且不得小於1',
                            background: '#3d454d',
                            color: '#ffffff'
                        });
                        return; // 阻止提交
                    }

                    return {
                        id: healthData.id, // 直接使用閉包中的 healthData.id
                        userId: healthData.userId,
                        dataType: englishType,
                        value: parseFloat(value),
                        timestamp: healthData.timestamp // 添加 timestamp
                    };
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    const updatedHealthData = result.value;
                    console.log("Updated health data:", updatedHealthData); // 打印更新的健康數據
                    fetch('/health-data/update', {
                        method: 'PUT',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(updatedHealthData)
                    })
                    .then(response => {
                        if (!response.ok) {
                            return response.text().then(text => { throw new Error(text) });
                        }
                        return response.text();
                    })
                    .then(result => {
                        Swal.fire({
                            icon: 'success',
                            title: '數據修改成功',
                            text: '成功更新了數據',
                            background: '#3d454d',
                            color: '#ffffff'
                        });
                        loadHealthData();
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        Swal.fire({
                            icon: 'error',
                            title: '修改數據失敗',
                            text: '數值不能為 0 或負數',
                            background: '#3d454d',
                            color: '#ffffff'
                        });
                    });
                }
            });
        } else {
            console.error('Health data not found for ID:', id);
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}
// 刪除健康數據的AJAX函數
function deleteHealthData(id) {
    console.log("Deleting health data with ID:", id); // 打印ID
    Swal.fire({
        title: '確定要刪除這條數據嗎？',
        text: "數據刪除後將無法恢復!",
        icon: 'warning',
        background: '#3d454d',
        color: '#ffffff',
        showCancelButton: true,
        confirmButtonColor: '#d21f3c',
        cancelButtonColor: '#6c757d',
        confirmButtonText: '確定',
        cancelButtonText: '取消'
    }).then((result) => {
        if (result.isConfirmed) {
            fetch('/health-data/delete/' + id, {
                method: 'DELETE'
            })
            .then(response => response.text())
            .then(result => {
                Swal.fire({
                    icon: 'success',
                    title: '刪除成功',
                    text: '數據刪除成功',
                    background: '#3d454d',
                    color: '#ffffff'
                });
                loadHealthData(userId);
            })
            .catch(error => {
                console.error('Error:', error);
                Swal.fire({
                    icon: 'error',
                    title: '刪除失敗',
                    text: '數據刪除失敗',
                    background: '#3d454d',
                    color: '#ffffff'
                });
            });
        }
    });
}
</script>
</body>
</html>
