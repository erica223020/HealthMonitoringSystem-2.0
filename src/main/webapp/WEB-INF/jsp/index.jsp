<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>首頁 | 健康監控系統</title>
    <meta name="descriptioncontent="HealthMonitoringSystem 提供健康數據監控和管理功能，幫助您保持健康生活。" />
    <link rel="icon" href="/icons/LifeGuard.png" type="image/png" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
                    <a href="login.jsp" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">登入</a>
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
                        <img src="/images/sticker.jpg" class="img-circle elevation-2" alt="User Image" />
                    </div>
                    <div class="info">
                        <a href="#" class="d-block">Rich Ting</a>
                    </div>
                </div>
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu">
                        <li class="nav-item">
                            <a href="index.jsp" class="nav-link active">
                                <i class="nav-icon fas fa-home"></i>
                                <p>首頁</p>
                            </a>
                        </li>
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
                                    <span class="info-box-number">
                                        <c:out value="${latestData.weight}" default="N/A" /> kg
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="info-box mb-3">
                                <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-tint"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">血糖</span>
                                    <span class="info-box-number">
                                        <c:out value="${latestData.bloodSugar}" default="N/A" /> mg/dL
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="info-box mb-3">
                                <span class="info-box-icon bg-success elevation-1"><i class="fas fa-heartbeat"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">血壓</span>
                                    <span class="info-box-number">
                                        <c:out value="${latestData.bloodPressure}" default="N/A" /> mmHg
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="info-box mb-3">
                                <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-heart"></i></span>
                                <div class="info-box-content">
                                    <span class="info-box-text">心率</span>
                                    <span class="info-box-number">
                                        <c:out value="${latestData.heartRate}" default="N/A" /> bpm
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!-- ./col -->
                    </div>
                    <!-- /.row -->
                </div>
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
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
    
