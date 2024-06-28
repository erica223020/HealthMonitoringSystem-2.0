<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>健康監控系統</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css">
    <!-- 引入Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- 引入Date Adapter for Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns@3"></script>
</head>
<body>
    <div class="wrapper">
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
                    <button type="button" class="btn btn-primary" onclick="loadCharts()">顯示圖表</button>
                </div>
                <canvas id="lineChart" width="400" height="400"></canvas>
                <canvas id="pieChart" width="400" height="400"></canvas>
                <canvas id="barChart" width="400" height="400"></canvas>
            </div>
        </section>
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

    function loadCharts() {
        const data = [
            { timestamp: '2024-06-01T00:00:00.000Z', value: 75 },
            { timestamp: '2024-06-02T00:00:00.000Z', value: 78 },
            { timestamp: '2024-06-03T00:00:00.000Z', value: 76 },
            { timestamp: '2024-06-04T00:00:00.000Z', value: 77 },
            { timestamp: '2024-06-05T00:00:00.000Z', value: 80 },
            { timestamp: '2024-06-06T00:00:00.000Z', value: 79 }
        ];

        const labels = data.map(item => new Date(item.timestamp));
        const values = data.map(item => item.value);

        const lineCtx = document.getElementById('lineChart').getContext('2d');
        new Chart(lineCtx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: '健康數據',
                    data: values,
                    borderColor: 'rgba(75, 192, 192, 1)',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderWidth: 1,
                    fill: true,
                    tension: 0.4
                }]
            },
            options: {
                scales: {
                    x: {
                        type: 'time',
                        time: {
                            unit: 'day',
                            tooltipFormat: 'yyyy-MM-dd'
                        },
                        title: {
                            display: true,
                            text: '日期'
                        }
                    },
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: '值'
                        }
                    }
                }
            }
        });

        const pieCtx = document.getElementById('pieChart').getContext('2d');
        new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: ['健康數據1', '健康數據2', '健康數據3'],
                datasets: [{
                    label: '健康數據',
                    data: [75, 25, 50],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true
            }
        });

        const barCtx = document.getElementById('barChart').getContext('2d');
        new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: '健康數據',
                    data: values,
                    backgroundColor: 'rgba(153, 102, 255, 0.2)',
                    borderColor: 'rgba(153, 102, 255, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
    </script>
</body>
</html>



