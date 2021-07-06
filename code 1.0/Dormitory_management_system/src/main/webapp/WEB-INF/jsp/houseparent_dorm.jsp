<%--
  Created by IntelliJ IDEA.
  User: zjt
  Date: 2021/6/17
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
          + path + "/";
%>

<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8" />
  <title>宿舍楼信息界面</title>
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
      .t{
          display:block;
      }
      .sh{
          display:flex;
      }
      .screen{
          display:block;
      }
      table {
          background-color: #1abc9c;
          margin-left: 20px;
          margin-top: 20px;
          background-color: #1abc9c;
          border-spacing: 10px 10px;
      }
      #筛选信息表{
          width:98%;
          border-collapse:collapse;
      }
      .tr1 td{
          border:1px solid #000000;
          line-height:2;
          text-align:center;
      }
  </style>

  <!-- 查看该宿管管理的宿舍楼基本信息 -->
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
  <script type="text/javascript">
    $(function () {
      // 当前页面dom对象加载后, 执行loadDormitoryInfo()
      loadDormitoryInfo();
    })

    function loadDormitoryInfo() {
      $.ajax({
        url: "houseparent/displayDormitoryInfo",
        data: {
          hID: "${currentHpID}"
        },
        type: "get",
        dataType: "json",
        success: function (info) {
          $("#infoDormID").html("");
          $("#infoDormID").append('<font style="background-color:white;">').append(info[0]).append('</font>');
          $("#infoRoomAmount").html("");
          $("#infoRoomAmount").append('<font style="background-color:white;">').append(info[1]).append('</font>');
          $("#infoFreeRoomAmount").html("");
          $("#infoFreeRoomAmount").append('<font style="background-color:white;">').append(info[2]).append('</font>');
          $("#infoBedAmount").html("");
          $("#infoBedAmount").append('<font style="background-color:white;">').append(info[3]).append('</font>');
          $("#infoCheckInAmount").html("");
          $("#infoCheckInAmount").append('<font style="background-color:white;">').append(info[4]).append('</font>');
        }
      })
    }
  </script>

  <script type="text/javascript">
    $(function () {
      $("#search").click(function () {
        searchStudentInfo();
      })
    })

    function searchStudentInfo() {
      $.ajax({
        url: "houseparent/searchStudentInfo",
        data: {
          sEmail: "${currentHpID}",
          roomID: $("input[id=searchRoomID]").val(),
          sID: $("input[id=searchSID]").val(),
          sEnrollYear: $("select[id=searchEnrollYear]").val(),
          department: $("select[id=searchDepartment]").val(),
          livingState: $("select[id=searchLivingState]").val()
        },
        type: "get",
        dataType: "json",
        success: function (students) {
          // 清除旧的数据
          $("#searchInfo").html("");
          // 添加新的数据
          $.each(students, function (i, student) {
            $("#searchInfo").append('<tr class="tr1">')
                .append('<td align="center">' + student.roomID + '</td>')
                .append('<td align="center">' + student.department + '</td>')
                .append('<td align="center">' + student.sID + '</td>')
                .append('<td align="center">' + student.sName + '</td>')
                .append('<td align="center">' + student.sPhoneNumber + '</td>')
                .append('<td align="center">' + student.livingState + '</td>')
                .append('<tr>')
          })
        }
      })
    }
  </script>
</head>

<body>
  <div class="header">
    <h1>宿舍信息管理页</h1>
  </div>
  <div class="t">
    <div class="sh">
      <!-- 宿舍楼基本信息 -->
      <table id="基本信息展示表" align="left" style="margin-left:20px;background-color:#1abc9c;border-spacing:20px 20px;border-radius:25px;">
        <caption style="border:none;background-color:#1abc9c;margin:20px;font-size:20px;color:white;border-radius:15px;">宿舍楼基本信息: </caption>
        <tr>
          <td>宿舍楼号: </td>
          <td id="infoDormID"></td>
        </tr>
        <tr>
          <td>宿舍间数: </td>
          <td id="infoRoomAmount"></td>
          <td>空闲间数: </td>
          <td id="infoFreeRoomAmount"></td>
        </tr>
        <tr>
          <td>总床位数: </td>
          <td id="infoBedAmount"></td>
          <td>已入住人数: </td>
          <td id="infoCheckInAmount"></td>
        </tr>
      </table>

      <!-- 筛选区 -->
      <div class="screen">
        <h2 style="margin-left:50px;color:#1abc9c;">筛选区: </h2>

        <font style="margin-left:150px;color:#1abc9c;font-size:20px;line-height:3;">宿舍号: </font>
        <input id="searchRoomID" type="text" placeholder="请输入宿舍号" value="" style="height:30px;width:200px;line-height:3;" />
        <font style="margin-left:50px;color:#1abc9c;font-size:20px;line-height:3;">学生学号: </font>
        <input id="searchSID" type="text" placeholder="请输入学生学号" value="" style="height:30px;width:200px;line-height:3;" /><br />

        <font style="margin-left:20px;color:#1abc9c;font-size:20px;line-height:3;">学生年级: </font>
        <select id="searchEnrollYear" style="height:30px;width:200px;line-height:3;">
          <option value="2020">2020级</option>
          <option value="2019">2019级</option>
          <option value="2018">2018级</option>
          <option value="2017">2017级</option>
        </select>

        <font style="margin-left:20px;color:#1abc9c;font-size:20px;line-height:3;">学生学院: </font>
        <select id="searchDepartment" style="height:30px;width:200px;line-height:3;">
          <option value="软件学院">软件学院</option>
          <option value="医学院">医学院</option>
          <option value="计算机科学与工程学院">计算机科学与工程学院</option>
        </select>

        <font style="margin-left:20px;color:#1abc9c;font-size:20px;line-height:3;">入住状态: </font>
        <select id="searchLivingState" style="height:30px;width:200px;line-height:3;">
          <option value="0">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
        </select><br />

        <button id="search" style="margin-left:450px;line-height:1.5;font-size:20px;background-color:#1abc9c;color:white;">
          &nbsp;&nbsp;&nbsp;查询&nbsp;&nbsp;&nbsp;
        </button>
      </div>
    </div>

    <!-- 筛选信息表 -->
    <div class="sh">
      <table id="筛选信息表" align="left">
        <caption style="border:none;font-size:20px;color:#1abc9c;border-radius:15px;width:100px;">筛选信息: </caption>
        <thead>
        <tr class="tr1">
          <td>宿舍号</td>
          <td>学院</td>
          <td>学号</td>
          <td>姓名</td>
          <td>手机号码</td>
          <td>入住状态</td>
        </tr>
        </thead>

        <tbody id="searchInfo">

        </tbody>
      </table>
    </div>
  </div>
</body>
</html>

