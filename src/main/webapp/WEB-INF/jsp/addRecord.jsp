<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HealthMonitoringSystem | 新增數據</title>
    <link rel="icon" href="/icons/LifeGuard.png" type="image/png" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous" />
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css" />
    <!-- 日期選擇器 Air datepicker Css -->
    <link href="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="scss/all.css" />
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
                <li class="nav-item">
                    <a class="nav-link" href="#" role="button"><i class="fas fa-bell"></i><span class="red-point"></span></a>
                </li>
                <li class="nav-item d-sm-inline-block">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">登入</button>
                </li>
            </ul>
        </nav>
        <!-- Sidebar -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <a href="#" class="brand-link d-flex align-items-center">
                <img src="/images/LifeGuard.svg" alt="Logo" class="brand-image img-circle elevation-3 mt-1 mb-1" />
                <span class="brand-text font-weight-light ms-2">Life Guard</span>
            </a>
            <div class="sidebar">
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="images/sticker.jpg" class="img-circle elevation-2" alt="User Image" />
                    </div>
                    <div class="info">
                        <a href="#" class="d-block">Rich Ting</a>
                    </div>
                </div>
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu">
                        <li class="nav-item">
                            <a href="index.jsp" class="nav-link">
                                <i class="nav-icon fas fa-home"></i>
                                <p>首頁</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="addRecord.jsp" class="nav-link active">
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
                            <h1>新增健康數據</h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <!-- 新增數據表單 -->
                    <h2>新增健康數據</h2>
                    <form method="post" action="/health-data/add">
                        <div class="mb-3">
                            <label for="dataType" class="form-label">數據類型</label>
                            <select class="form-select" id="dataType" name="dataType" required>
                                <option value="體重">體重</option>
                                <option value="血糖">血糖</option>
                                <option value="血壓">血壓</option>
                                <option value="心率">心率</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="value" class="form-label">數值</label>
                            <input type="text" class="form-control" id="value" name="value" required>
                        </div>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </form>
                    <!-- 數據列表 -->
                    <h2 class="mt-5">健康數據列表</h2>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>日期</th>
                                <th>數據類型</th>
                                <th>數值</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="data" items="${healthDataList}">
                                <tr>
                                    <td>${data.timestamp}</td>
                                    <td>${data.dataType}</td>
                                    <td>${data.value}</td>
                                    <td>
                                        <form method="post" action="/health-data/delete/${data.id}" style="display:inline;">
                                            <button type="submit" class="btn btn-danger btn-sm">刪除</button>
                                        </form>
                                        <form method="get" action="/health-data/edit/${data.id}" style="display:inline;">
                                            <button type="submit" class="btn btn-warning btn-sm">修改</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
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
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="/js/scripts.js"></script>
</body>
</html>
