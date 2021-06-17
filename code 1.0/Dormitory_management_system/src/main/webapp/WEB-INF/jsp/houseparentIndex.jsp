<%--
  Created by IntelliJ IDEA.
  User: zjt
  Date: 2021/6/12
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>宿舍管理员信息管理系统</title>
  <style type="text/css">
      * {
          box-sizing: border-box;
      }

      body {
          font-family: Arial;
          margin: 0;
      }

      .header {
          padding: 8px;
          text-align: center;
          background: #1abc9c;
          color: white;
      }

      .header h1 {
          font-size: 40px;
      }
      /*标题字体加大*/
      /*wrap表示包括按钮和跳转界面在内的整个框*/
      .wrap {
          background-color: black;
          margin: 0;
          position: relative;
      }

      .nav {
          width: 100%;
          height: 30px;
      }

      .nav a {
          width: auto;
          height: 30px;
          margin-left:400px;
          text-align: center;
          line-height: 30px;
          border: 1px solid white;
          float: left;
          text-decoration: none;
          color: white;
      }

      .sh {
          width: 100%;
          height: 480px;
          position: absolute;
          left: 0;
          top: 31px;
          background: #eeeeee;
      }

      .sh div {
          /*display: none;*/
          text-align: center;
      }

      .sh div:target {
          display: flex;
      }

      #firstPage div {
          display: block;
          height: 460px;
          width: 15%;
          margin-top: 10px;
          margin-left: 150px;
          background-color: #1abc9c;
          border: 2px solid white;
          border-radius: 25px;
          text-align: center;
      }

      .Page1 button {
          margin-top: 120px;
          font-size: 18px;
          color: white;
          background-color: #1abc9c;
          border: 1px solid white;
      }

      .Page1 button:active {
          background-color: black;
      }

      /*底部*/
      .footer {
          margin-top: 480px;
          padding: 18px;
          text-align: center;
          background: black;
      }
  </style>
</head>

<script language="javascript">
  function firstPageButton() {
    var firstP = document.getElementById("firstPage");
    var secondP = document.getElementById("secondPage");
    if (firstP.style.display == "none") {
      firstP.style.display = "flex";
    }
    if (secondP.style.display == "flex") {
      secondP.style.display = "none";
    }
  }
  function secondPageButton() {
    var firstP = document.getElementById("firstPage");
    var secondP = document.getElementById("secondPage");
    if (firstP.style.display == "flex") {
      firstP.style.display = "none";
    }
    if (secondP.style.display == "none") {
      secondP.style.display = "flex";
    }
  }

  var nameInit = document.getElementById("nameInput").Value;
  var phoneInit = document.getElementById("phoneInput").Value;
  function changeButton() {
    /*显示修改界面的按钮 */
    var order = document.getElementById("order");
    if (order.style.display == "none") {
      order.style.display = "block";
    }
    /*将input框变为可编辑*/
    document.getElementById("nameInput").disabled = false;
    document.getElementById("phoneInput").disabled = false;
  }
  function OKButton() {
    /*修改界面的按钮隐藏*/
    var order = document.getElementById("order");
    if (order.style.display == "block") {
      order.style.display = "none";
    }
    /*将input框变为可编辑*/
    document.getElementById("nameInput").disabled = true;
    document.getElementById("phoneInput").disabled = true;
  }
  function CancelButton() {
    /*修改界面的按钮隐藏*/
    var order = document.getElementById("order");
    if (order.style.display == "block") {
      order.style.display = "none";
    }
    /*将input框变为可编辑*/
    document.getElementById("nameInput").disabled = true;
    document.getElementById("phoneInput").disabled = true;
    document.getElementById("nameInput").Value = nameInit;
    document.getElementById("phoneInput").Value = phoneInit;
  }
</script>

<body>
<!--页面总标题框-->
<div class="header">
  <h1>宿舍管理员信息管理系统</h1>
</div>

<div class="wrap">
  <div class="nav">
    <a href="#firstPage" onclick="firstPageButton();">&nbsp;&nbsp;&nbsp;我的主页&nbsp;&nbsp;&nbsp;</a>
    <a href="#secondPage" onclick="secondPageButton();">&nbsp;&nbsp;&nbsp;点击查看我的信息&nbsp;&nbsp;&nbsp;</a>
  </div>
  <div class="sh">
    <div id="firstPage" action="/firstPage.action" style="background-image:url(${pageContext.request.contextPath}/img/华工背景.png);height:480px;background-size:100% 100%;display:flex;">
      <div class="Page1" align="left">
        <a href="https://my.scut.edu.cn/up/view?m=up#act=portal/viewhome">
          <button>&nbsp;&nbsp;&nbsp;统一门户&nbsp;&nbsp;&nbsp;</button>
        </a><br>
        <a href="page_houseparent_dorm.do">
          <button>&nbsp;&nbsp;&nbsp;点击查看宿舍楼信息&nbsp;&nbsp;&nbsp;</button>
        </a><br>
      </div>
      <p style="margin-left:110px;color:#808080;font-size:25px;background-color:white;height:35px;border-radius:15px;">&nbsp;最新资讯：</p>
      <img src="${pageContext.request.contextPath}/img/资讯.png" style="margin-top:60px;margin-left:50px;height:400px;width:45%;border-radius:25px;" />
    </div>
    <div id="secondPage" action="/secondPage.action" style="background-image:url(${pageContext.request.contextPath}/img/华工背景.png);height:480px;background-size:100% 100%;display:none;">
      <table id="宿管信息表" align="center" style="border-spacing:10px 20px;background-color:rgba(255,255,254,0.8);border-radius:25px;">
        <caption style="border:none;background-color:#1abc9c;margin:20px;font-size:25px;color:white">我的个人信息</caption>
        <tr>
          <td style="font-size:18px;color:#808080;font-weight:600;">工&nbsp;号：</td>
          <td><input type="text" style="width:95%;text-align:center;" value="这里要调用后端" disabled></td>
        </tr>
        <tr>
          <td style="font-size:18px;color:#808080;font-weight:600;">姓&nbsp;名：</td>
          <td><input id="nameInput" action="/nameInput.action" type="text" style="width:95%;text-align:center;" value="这里要调用后端"disabled></td>
        </tr>
        <tr style="margin-top:20px;">
          <td style="font-size:18px;color:#808080;font-weight:600;">性&nbsp;别：</td>
          <td><input type="text" style="width:95%;text-align:center;" value="这里要调用后端" disabled></td>
        </tr>
        <tr style="margin-top:20px;">
          <td style="font-size:18px;color:#808080;font-weight:600;">联&nbsp;系&nbsp;方&nbsp;式：</td>
          <td><input id="phoneInput" action="/phoneInput.action" type="text" style="width:95%;text-align:center;" value="这里要调用后端"disabled></td>
        </tr>
        <tr style="margin-top:20px;">
          <td style="font-size:18px;color:#808080;font-weight:600;">我&nbsp;管&nbsp;理&nbsp;的&nbsp;宿&nbsp;舍&nbsp;楼：</td>
          <td><input type="text" style="width:95%;text-align:center;" value="这里要调用后端" disabled></td>
        </tr>
        <tr style="margin-top:20px;">
          <td style="font-size:18px;color:#808080;font-weight:600;">月&nbsp;薪：</td>
          <td><input type="text" style="width:95%;text-align:center;" value="这里要调用后端" disabled></td>
        </tr>
        <tr style="margin-top:20px;">
          <td style="font-size:18px;color:#808080;font-weight:600;">入&nbsp;职&nbsp;时&nbsp;间：</td>
          <td><input type="text" style="width:95%;text-align:center;" value="这里要调用后端" disabled></td>
        </tr>
      </table>
      <button id="修改" onclick="changeButton();" style="font-size:20px;height:30px;margin-top:10px;margin-right:30px;background-color:black;border-radius:15px;color:white;">&nbsp;点击修改个人信息&nbsp;</button>
      <form id="order" action="/order.action" style="display:none;">
        <button id="确定" onclick="OKButton();" style="font-size:20px;height:30px;margin-top:10px;margin-right:30px;background-color:black;border-radius:15px;color:white;">&nbsp;确认修改&nbsp;</button>
        <button id="取消" onclick="CancelButton();" style="font-size:20px;height:30px;margin-top:10px;margin-right:30px;background-color:black;border-radius:15px;color:white;">&nbsp;取消修改&nbsp;</button>
      </form>
    </div>
  </div>
</div>

<div class="footer">
  <h2 style="color:white;">底部内容</h2>
</div>
</body>

</html>
