<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>管理員後台 | HealthMonitoringSystem</title>
    <link
      rel="icon"
      href="${pageContext.request.contextPath}/static/icons/LifeGuard.png"
      type="image/png"
    />
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
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/air-datepicker@3.5.3/air-datepicker.min.css"
    />
    <!-- Font Awesome -->
    <script
      src="https://kit.fontawesome.com/d6b833583a.js"
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/static/css/style.css"
    />
    <style>
      body {
        background-color: #fcfaf7;
        color: #222020;
      }
      .container {
        margin: 10px auto;
        padding: 0 15px; /* 為了讓內容不緊貼邊緣，添加水平內邊距 */
      }
      .container-fluid {
        margin: 10px auto;
        padding: 0 15px; /* 為了讓內容不緊貼邊緣，添加水平內邊距 */
      }
      .card {
        background-color: #fff8e860;
        margin-bottom: 20px;
        height: 100%; /* 確保卡片填滿父容器 */
      }
      .card-body {
        padding: 1rem;
      }
      .table {
        background-color: #ffffff;
      }
      .search-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
      }
      .btn-outline-success {
        width: 100px;
      }
      .table .thead-dark th {
        color: #fff;
        background-color: #403734;
        border-color: #383f45;
      }
    </style>
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
          <li class="nav-item d-sm-inline-block">
            <form
              id="logoutForm"
              method="post"
              action="<c:url value='/user/logout' />"
              aria-label="登出"
            >
              <button
                type="button"
                class="btn btn-danger"
                style="font-weight: bold"
                onclick="handleLogout()"
              >
                <i class="fas fa-sign-out-alt"></i> 登出
              </button>
            </form>
          </li>
        </ul>
      </nav>
      <!-- Sidebar -->
      <!-- Sidebar -->
      <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <a href="index" class="brand-link d-flex align-items-center">
          <div class="logo-wrapper">
            <img
              src="${pageContext.request.contextPath}/static/icons/LifeGuardLogo.png"
              alt="Logo"
              class="brand-image img-circle elevation-3 mt-1 mb-1"
            />
          </div>
          <span class="brand-text font-weight-light ms-2">Life Guard</span>
        </a>
        <div class="sidebar">
          <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
              <img
                src="${pageContext.request.contextPath}/static/images/sticker.jpg"
                class="img-circle elevation-2"
                alt="User Image"
              />
            </div>
            <div class="info">
              <a href="#" class="d-block" id="username">Rich Ting</a>
            </div>
          </div>
          <nav class="mt-2">
            <ul
              class="nav nav-pills nav-sidebar flex-column"
              data-widget="treeview"
              role="menu"
            >
              <li class="nav-item">
                <a href="/admin" class="nav-link active">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p>管理員後台</p>
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
                <h1>管理員後台</h1>
              </div>
              <div class="col-sm-6 search-container">
                <form
                  class="d-flex"
                  action="${pageContext.request.contextPath}/admin/search"
                  method="get"
                >
                  <input
                    class="form-control me-2"
                    type="search"
                    placeholder="搜尋用戶信箱"
                    aria-label="Search"
                    name="email"
                  />
                  <button class="btn btn-outline-success" type="submit">
                    搜尋
                  </button>
                </form>
              </div>
            </div>
          </div>
        </section>
        <!-- Main content -->
        <section class="content">
          <div class="container-fluid">
            <div class="card">
              <div class="card-body">
                <table class="table table-striped">
                  <thead class="thead-dark">
                    <tr>
                     <th>信箱</th>
                      <th>用戶名稱</th>
                      <th>年齡</th>
                      <th>性別</th>
                      <th>帳號狀態</th>
                      <th>操作</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="user" items="${users}">
                      <tr>
                        <td>${user.email}</td>
                        <td>${user.username}</td>
                        <td>${user.age}</td>
                        <td>${user.gender}</td>
                        <td>
                          <c:choose>
                            <c:when test="${user.status eq 'active'}"
                              >啟用</c:when
                            >
                            <c:when test="${user.status eq 'inactive'}"
                              >禁用</c:when
                            >
                            <c:otherwise>待審核</c:otherwise>
                          </c:choose>
                        </td>
                        <td>
                          <form
                            action="${pageContext.request.contextPath}/admin/updateStatus"
                            method="post"
                            style="display: inline"
                          >
                            <input
                              type="hidden"
                              name="userId"
                              value="${user.userId}"
                            />
                            <c:choose>
                              <c:when test="${user.status eq 'active'}">
                                <input
                                  type="hidden"
                                  name="status"
                                  value="inactive"
                                />
                                <button
                                  type="button"
                                  class="btn btn-warning"
                                  onclick="confirmStatusChange(this, '禁用')"
                                >
                                  禁用
                                </button>
                              </c:when>
                              <c:when test="${user.status eq 'inactive'}">
                                <input
                                  type="hidden"
                                  name="status"
                                  value="active"
                                />
                                <button
                                  type="button"
                                  class="btn btn-success"
                                  onclick="confirmStatusChange(this, '啟用')"
                                >
                                  啟用
                                </button>
                              </c:when>
                              <c:otherwise>
                                <input
                                  type="hidden"
                                  name="status"
                                  value="active"
                                />
                                <button
                                  type="button"
                                  class="btn btn-secondary"
                                  onclick="confirmStatusChange(this, '啟用')"
                                >
                                  啟用
                                </button>
                              </c:otherwise>
                            </c:choose>
                          </form>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
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

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.2.0/js/adminlte.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    // 處理登出功能
    function handleLogout() {
      Swal.fire({
        title: "確認登出?",
        text: "您確定要登出嗎?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d21f3c", // 紅色確認按鈕
        cancelButtonColor: "#6c757d", // 灰色取消按鈕
        background: "#343a40", // 背景顏色設置為深色
        color: "#ffffff", // 文字顏色設置為白色
        confirmButtonText: "是的, 我要登出!",
        cancelButtonText: "取消",
      }).then((result) => {
        if (result.isConfirmed) {
          // 顯示成功消息並等待轉跳
          Swal.fire({
            icon: "success",
            title: "登出成功",
            text: "轉跳中...",
            background: "#403734", // 背景顏色設置為深色
            color: "#ffffff", // 文字顏色設置為白色
            showConfirmButton: false,
            timer: 1500,
            timerProgressBar: true,
            willClose: () => {
              // 當計時器完成時立即轉跳
              window.location.href =
                "${pageContext.request.contextPath}/login";
            },
          });
        }
      });
    }

    // 初始化 AdminLTE 的 PushMenu 功能
    $(document).ready(function () {
      $('[data-widget="pushmenu"]').PushMenu();
    });

    // 確認狀態更改
    function confirmStatusChange(button, newStatus) {
      Swal.fire({
        title: "確認更改狀態?",
        text: "您確定要將狀態更改為 " + newStatus + " 嗎?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d21f3c", // 紅色確認按鈕
        cancelButtonColor: "#6c757d", // 灰色取消按鈕
        background: "#403734", // 背景顏色設置為深色
        color: "#ffffff", // 文字顏色設置為白色
        confirmButtonText: "是的, 確認更改!",
        cancelButtonText: "取消",
      }).then((result) => {
        if (result.isConfirmed) {
          // 提交表單更改狀態
          var form = button.closest("form");
          var formData = new FormData(form);
          fetch(form.action, {
            method: "POST",
            body: formData,
          })
            .then((response) => response.text())
            .then((result) => {
              if (result === "success") {
                Swal.fire({
                  icon: "success",
                  title: "狀態已更新",
                  text: "用戶狀態已成功更改為 " + newStatus,
                  background: "#403734", // 背景顏色設置為深色
                  color: "#ffffff", // 文字顏色設置為白色
                  showConfirmButton: false,
                  timer: 1500,
                  timerProgressBar: true,
                  willClose: () => {
                    location.reload(); // 重新加載頁面
                  },
                });
              } else {
                Swal.fire({
                  icon: "error",
                  title: "更新失敗",
                  text: "用戶狀態更新失敗，請重試",
                  background: "#403734", // 背景顏色設置為深色
                  color: "#ffffff", // 文字顏色設置為白色
                });
              }
            })
            .catch((error) => {
              console.error("Error:", error);
              Swal.fire({
                icon: "error",
                title: "更新失敗",
                text: "用戶狀態更新失敗，請重試",
                background: "#403734", // 背景顏色設置為深色
                color: "#ffffff", // 文字顏色設置為白色
              });
            });
        }
      });
    }
    </script>
  </body>
</html>