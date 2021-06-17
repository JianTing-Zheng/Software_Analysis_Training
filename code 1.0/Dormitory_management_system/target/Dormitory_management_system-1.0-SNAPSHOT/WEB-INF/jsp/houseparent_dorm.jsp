<%--
  Created by IntelliJ IDEA.
  User: zjt
  Date: 2021/6/17
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head >
<body>
<div class="header">
  <h1> 宿舍信息管理页</h1>
</div>
<div class="t">
  <div class="sh">
    <table id="基本信息展示表" align="left" style="margin-left:20px;background-color:#1abc9c;border-spacing:20px 20px;border-radius:25px;">
      <caption style="border:none;background-color:#1abc9c;margin:20px;font-size:20px;color:white;border-radius:15px;">宿舍楼基本信息：</caption>
      <tr>
        <td>宿舍楼号：</td>
        <td><font style="background-color:white;">这里要调用后端</font></td>
      </tr>
      <tr>
        <td>宿舍间数：</td>
        <td><font style="background-color:white;">这里要调用后端</font></td>
        <td>空闲间数：</td>
        <td><font style="background-color:white;">这里要调用后端</font></td>
      </tr>
      <tr>
        <td>总床位数：</td>
        <td><font style="background-color:white;">这里要调用后端</font></td>
        <td>已入住人数：</td>
        <td><font style="background-color:white;">这里要调用后端</font></td>
      </tr>
    </table>
    <div class="screen">
      <h2 style="margin-left:50px;color:#1abc9c;">筛选区：</h2>

      <font style="margin-left:150px;color:#1abc9c;font-size:20px;line-height:3;">宿舍号：</font>
      <input type="text" value="这里是输入框" style="height:30px;width:200px;line-height:3;" />
      <font style="margin-left:50px;color:#1abc9c;font-size:20px;line-height:3;">学生学号：</font>
      <input type="text" value="这里是输入框" style="height:30px;width:200px;line-height:3;" /><br />

      <font style="margin-left:20px;color:#1abc9c;font-size:20px;line-height:3;">学生年级：</font>
      <select style="height:30px;width:200px;line-height:3;">
        <option value="年级1">年级1</option>
        <option value="年级2">年级2</option>
        <option value="年级3">年级3</option>
      </select>
      <font style="margin-left:20px;color:#1abc9c;font-size:20px;line-height:3;">学生学院：</font>
      <select style="height:30px;width:200px;line-height:3;">
        <option value="学院1">学院1</option>
        <option value="学院2">学院2</option>
        <option value="学院3">学院3</option>
      </select>
      <font style="margin-left:20px;color:#1abc9c;font-size:20px;line-height:3;">入住状态：</font>
      <select style="height:30px;width:200px;line-height:3;">
        <option value="状态1">状态1</option>
        <option value="状态2">状态2</option>
        <option value="状态3">状态3</option>
      </select><br />

      <button id="search" style="margin-left:450px;line-height:1.5;font-size:20px;background-color:#1abc9c;color:white;">
        &nbsp;&nbsp;&nbsp;查询&nbsp;&nbsp;&nbsp;
      </button>
    </div>
  </div>
  <div class="sh">
    <table id="筛选信息表" align="left">
      <caption style="border:none;font-size:20px;color:#1abc9c;border-radius:15px;width:100px;">筛选信息：</caption>
      <tr class="tr1">
        <td>宿舍号</td>
        <td>学院</td>
        <td>学号</td>
        <td>姓名</td>
        <td>联系方式</td>
        <td>入住状态</td>
      </tr>
      <tr class="tr1">
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>6</td>
      </tr>
      <tr class="tr1">
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>6</td>
      </tr>
      <tr class="tr1">
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>6</td>
      </tr>
      <tr class="tr1">
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td>5</td>
        <td>6</td>
      </tr>
    </table>
  </div>
</div>
</body>
</html >

