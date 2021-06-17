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
  <title>学生界面</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style type="text/css">
      * {
          box-sizing: border-box;
      }

      /* body 样式 */
      body {
          font-family: Arial;
          margin: 0;
      }

      /* 标题 */
      .header {
          padding: 80px;
          text-align: center;
          background: #9acffa;
          color: white;
      }

      /* 标题字体加大 */
      .header h1 {
          font-size: 40px;
      }

      /* 导航 */
      .navbar {
          overflow: hidden;
          background-color: white;

      }

      /* 导航栏样式 */
      .navbar a {
          float: left;
          display: block;
          color: rgb(138, 169, 255);
          text-align: center;
          padding: 14px 20px;
          text-decoration: none;
      }

      /* 右侧链接*/
      .navbar a.right {
          float: right;
      }

      /* 鼠标移动到链接的颜色 */
      .navbar a:hover {
          background-color: #ddd;
          color: black;
      }
      .main {
          background-color:white;
          width: 100%;
          height: 700px;
          /* background: url(/html/华工背景.png); */

          text-align: center;

      }
      /*修改按钮*/
      .button{
          background: white
      }
      /*按钮样式*/
      .button a {
          float: left;
          /* display:block; */
          position:absolute;
          left: 50%;
          transform: translate(-50);
          color: black;
          width: 70;
          margin: 0,auto;
          text-align: center;
          text-decoration: none;
      }
      /* 鼠标移动到链接的颜色 */
      .button a:hover {
          background-color: white;
          color: black;
      }
      /* 底部 */
      .footer {
          padding: 20px;
          text-align: center;
          background: #ddd;
      }

  </style>
</head>
<body>
<!--顶部标题-->
<div class="header">
  <h1>学生宿舍管理系统(学生版)</h1>
  <!--导航栏-->
</div>
<div class="navbar">
  <a href="infromation.html">查看信息</a>
  <a href="moveInOrOut.html">办理入住</a>
  <a href="moveInOrOut.html">办理离校</a>
  <a href="changeDorm.html">申请换宿</a>
  <a href="checkOut.html">申请退宿</a>
</div>
<div class="main" style="background-image: url(${pageContext.request.contextPath}/img/bg.jpg);background-size: 100% 100%;">
  <br> <br> <br> <br>
  <table  width=30% height=350px align="center" style="background-color: white ;border-radius: 25px;opacity: 0.4;">
    <caption style="background-color: white; font-size: 30px ;color:grey;margin: 20px; ">学生个人信息</caption>
    <tbody style="font-size:25px; color:#808080; font-weight: 400">
    <tr>
      <td align="center" width=40%>学号</td>
      <td width=60%> <input type="text"  align="left" width="95%" height="95%" value="等待后端传数据"></td>
    </tr>
    <tr>
      <td align="center" width=30%>姓名</td>
      <td><input type="text"  align="left" width="95%" height="95%" value="等待后端传数据"></td>
    </tr>
    <tr>
      <td align="center" width=30%>性别</td>
      <td><input type="text"  align="left" width="95%" height="95%" value="等待后端传数据"></td>
    </tr>
    <tr>
      <td align="center" width=30%>联系方式</td>
      <td><input type="text"  align="left" width="95%" height="95%" value="等待后端传数据"></td>
    </tr>
    <tr>
      <td align="center" width=30%>宿舍楼</td>
      <td><input type="text"  align="left" width="95%" height="95%" value="等待后端传数据"></td>
    </tr><tr>
      <td align="center" width=30%>宿舍号</td>
      <td><input type="text"  align="left" width="95%" height="955" value="等待后端传数据"></td>
    </tr><tr>
      <td align="center" width=30%>在校状态</td>
      <td><input type="text"  align="left" width="95%" height="95%" value="等待后端传数据"></td>
    </tr>
    </tbody>
  </table>
  <div align=center>
                <span class="button" >
                    <a href="updateInfo.html"> 修改</a>
                 </span>
  </div>
</div>
<div class="footer">
  这里是底线
</div>
</body>
</html>
