<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HealthMonitoringSystem | 健康數據圖表</title>
    <link rel="icon" href="icons/LifeGuard.png" type="image/png" />
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
      crossorigin="anonymous"
    />
    <!-- AdminLTE CSS -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/css/adminlte.min.css"
    />
    <!-- 日期選擇器 Air datepicker Css -->
    <link
      href="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="scss/all.css" />
    <!-- Font Awesome -->
    <script
      src="https://kit.fontawesome.com/d6b833583a.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body class="hold-transition sidebar-mini">
    <div class="wrapper">
      <!-- Navbar -->
      <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"
              ><i class="fas fa-bars"></i
            ></a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="#" role="button"
              ><i class="fas fa-search"></i
            ></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" role="button"
              ><i class="fas fa-bell"></i><span class="red-point"></span
            ></a>
          </li>
          <li class="nav-item d-sm-inline-block">
            <button
              type="button"
              class="btn btn-primary"
              data-bs-toggle="modal"
              data-bs-target="#loginModal"
            >
              登入
            </button>
          </li>
        </ul>
      </nav>
      <!-- 登入彈跳視窗 -->
      <div
        class="modal fade"
        id="loginModal"
        tabindex="-1"
        aria-labelledby="loginModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="loginModalLabel">登入</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <!-- 登入表單 -->
              <form>
                <div class="mb-3">
                  <label for="username" class="form-label">使用者信箱</label>
                  <input
                    type="text"
                    class="form-control"
                    id="username"
                    placeholder="請輸入信箱"
                    required
                  />
                </div>
                <div class="mb-3">
                  <label for="registerPassword" class="form-label">密碼</label>
                  <input
                    id="inputPassword"
                    class="form-control"
                    type="password"
                    pattern="^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$"
                    placeholder="請輸入英數混合的六個字元"
                    required="required"
                    oninput="setCustomValidity('');"
                    oninvalid="setCustomValidity('密碼格式含英數需至少六個字元');"
                  />
                </div>
                <div class="mb-3">
                  <label for="captchaInput" class="form-label">驗證碼</label>
                  <div class="input-group">
                    <div>
                      <input
                        type="text"
                        class="form-control"
                        id="captchaInput"
                        required
                      />
                    </div>
                    <img
                      src="/api/captcha"
                      id="captchaImage"
                      class="ms-4"
                      alt="Captcha"
                    />
                    <button
                      type="button"
                      id="refreshCaptcha"
                      class="btn btn-outline-secondary m-2"
                      style="border: none; background: none"
                    >
                      <i class="fas fa-sync-alt"></i>
                      <!-- 使用 Font Awesome 的刷新符號 -->
                    </button>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary">登入</button>
                <a
                  href="#"
                  class="btn btn-link position-absolute bottom-0 end-0 mb-3 me-3"
                  data-bs-toggle="modal"
                  data-bs-target="#registerModal"
                  data-bs-dismiss="modal"
                  style="position: relative; overflow: hidden"
                  >還沒有帳號嗎?馬上註冊<span class="underline-from-left"></span
                ></a>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- 註冊彈跳視窗 -->
      <div
        class="modal fade"
        id="registerModal"
        tabindex="-1"
        aria-labelledby="registerModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-custom">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="registerModalLabel">註冊</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <!-- 註冊表單 -->
              <form method="post" action="/register">
                <div class="mb-3">
                  <label for="registerEmail" class="form-label"
                    >使用者信箱</label
                  >
                  <input
                    type="email"
                    class="form-control"
                    name="email"
                    placeholder="請輸入要註冊的信箱"
                    required="required"
                    pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"
                  />
                </div>
                <div class="mb-3">
                  <label for="registerUsername" class="form-label"
                    >使用者名稱</label
                  >
                  <input
                    type="text"
                    class="form-control"
                    name="username"
                    placeholder="請輸入使用者名稱"
                    required="required"
                  />
                </div>
                <div class="mb-3">
                  <label for="registerPassword" class="form-label">密碼</label>
                  <input
                    id="inputPassword"
                    class="form-control"
                    type="password"
                    name="password"
                    pattern="^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$"
                    placeholder="請輸入英數混合的六個字元"
                    required="required"
                    oninput="setCustomValidity('');"
                    oninvalid="setCustomValidity('密碼格式含英數需至少六個字元');"
                  />
                </div>
                <div class="mb-3">
                  <label for="confirmPassword" class="form-label"
                    >再次確認密碼</label
                  >
                  <input
                    id="ConfirmPassword"
                    class="form-control"
                    type="password"
                    name="confirmPassword"
                    placeholder="請再次輸入密碼"
                    required="required"
                    oninput="setCustomValidity('');"
                    onchange="if(document.getElementById('inputPassword').value != document.getElementById('ConfirmPassword').value){setCustomValidity('密碼與確認密碼不相同');}"
                  />
                </div>
                <div class="mb-3">
                  <label for="registerGender" class="form-label">性別</label>
                  <select
                    class="form-control"
                    name="gender"
                    required="required"
                  >
                    <option value="male">男</option>
                    <option value="female">女</option>
                    <option value="other">其他</option>
                  </select>
                </div>
                <button type="submit" class="btn btn-primary">註冊</button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Sidebar -->
      <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <a href="#" class="brand-link d-flex align-items-center">
          <img
            src="images/LifeGuard.svg"
            alt="Logo"
            class="brand-image img-circle elevation-3 mt-1 mb-1"
          />
          <span class="brand-text font-weight-light ms-2">Life Guard</span>
        </a>
        <div class="sidebar">
          <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
              <img
                src="images/sticker.jpg"
                class="img-circle elevation-2"
                alt="User Image"
              />
            </div>
            <div class="info">
              <a href="#" class="d-block">Rich Ting</a>
            </div>
          </div>
          <nav class="mt-2">
            <ul
              class="nav nav-pills nav-sidebar flex-column"
              data-widget="treeview"
              role="menu"
            >
              <li class="nav-item">
                <a href="index.jsp" class="nav-link">
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
                <a href="dataAnalysis.jsp" class="nav-link active">
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
                <h1>健康數據圖表</h1>
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
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        var ctx = document.getElementById("healthChart").getContext("2d");
        var chart = new Chart(ctx, {
          type: "line",
          data: {
            labels: [
              <c:forEach var="data" items="${healthDataList}">
                "${data.timestamp}",
              </c:forEach>,
            ],
            datasets: [
              {
                label: "健康數據",
                data: [
                  <c:forEach var="data" items="${healthDataList}">
                    ${data.value},
                  </c:forEach>,
                ],
                borderColor: "rgba(75, 192, 192, 1)",
                borderWidth: 1,
              },
            ],
          },
          options: {
            scales: {
              x: {
                type: "time",
                time: {
                  unit: "day",
                },
              },
              y: {
                beginAtZero: true,
              },
            },
          },
        });
      });
    </script>
    <!-- 日期選擇器 Air datepicker JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
    <script src="scripts/all.js"></script>
  </body>
</html>
