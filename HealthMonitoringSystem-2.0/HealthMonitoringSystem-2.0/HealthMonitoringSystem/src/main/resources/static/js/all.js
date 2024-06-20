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

// $(function () {
//   var ctx = document.getElementById("exampleChart").getContext("2d");
//   var chart = new Chart(ctx, {
//     type: "bar",
//     data: {
//       labels: ["一月", "二月", "三月", "四月", "五月", "六月", "七月"],
//       datasets: [
//         {
//           label: "步數",
//           backgroundColor: "rgba(60,141,188,0.9)",
//           borderColor: "rgba(60,141,188,0.8)",
//           data: [5000, 6000, 5500, 7000, 6500, 7200, 6800],
//         },
//       ],
//     },
//     options: {
//       responsive: true,
//       maintainAspectRatio: false,
//       datasetFill: false,
//     },
//   });

//   const zh = {
//     days: [
//       "星期日",
//       "星期一",
//       "星期二",
//       "星期三",
//       "星期四",
//       "星期五",
//       "星期六",
//     ],
//     daysShort: ["日", "一", "二", "三", "四", "五", "六"],
//     daysMin: ["日", "一", "二", "三", "四", "五", "六"],
//     months: [
//       "一月",
//       "二月",
//       "三月",
//       "四月",
//       "五月",
//       "六月",
//       "七月",
//       "八月",
//       "九月",
//       "十月",
//       "十一月",
//       "十二月",
//     ],
//     monthsShort: [
//       "一月",
//       "二月",
//       "三月",
//       "四月",
//       "五月",
//       "六月",
//       "七月",
//       "八月",
//       "九月",
//       "十月",
//       "十一月",
//       "十二月",
//     ],
//     today: "今天",
//     clear: "清除",
//     dateFormat: "yyyy/MM/dd",
//     firstday: 0,
//   };

//   const datepicker = new AirDatepicker("#myDatepicker", {
//     locale: zh,
//     range: true,
//     buttons: ["today", "clear"],
//     multipleDatesSeparator: " - ",
//   });
//   // 函數：點擊日期選擇器 ICON 顯示日期選擇器
//   window.showDatepicker = () => {
//     datepicker.show();
//   };
//   //如果不是點擊日期選擇器或ICON則隱藏日期選擇器
//   $(document).on("mousedown", function (e) {
//     //當用戶點擊頁面上的任意地方時，檢查點擊位置是否在日期選擇器或日期選擇器圖標內，是就不執行任何操作
//     if (
//       $(e.target).closest(".air-datepicker").length ||
//       $(e.target).closest(".datepicker-icon").length
//     ) {
//       return;
//     }
//     // 否則隱藏
//     datepicker.hide();
//   });
// });
