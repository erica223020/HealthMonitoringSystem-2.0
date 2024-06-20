document.addEventListener("DOMContentLoaded", function () {
  const sidebarToggle = document.getElementById("sidebarToggle");
  const wrapper = document.querySelector(".wrapper");
  const sidebar = document.querySelector(".main-sidebar");

  sidebarToggle.addEventListener("click", function (e) {
    e.preventDefault();
    sidebar.classList.toggle("sidebar-collapse");
    wrapper.classList.toggle("sidebar-collapse");
  });
});

document.addEventListener("DOMContentLoaded", function () {
  var loginButton = document.getElementById("loginButton");
  setTimeout(function () {
    loginButton.classList.add("show");
  }, 500); // 延遲500毫秒後顯示按鈕
});

$(document).ready(function () {
  $('[data-widget="pushmenu"]').PushMenu();
});

