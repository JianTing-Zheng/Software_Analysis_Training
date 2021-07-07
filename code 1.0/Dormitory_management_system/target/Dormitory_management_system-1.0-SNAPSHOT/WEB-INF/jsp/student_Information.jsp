<%--
  Created by IntelliJ IDEA.
  User: zjt
  Date: 2021/7/7
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
  <script type="text/javascript">
    $(function(){
      //当前页面加载完后, 立即执行loadInfo
      loadInfo();
    })

    function loadInfo() {
      $.ajax({
        url: "apply/displayStudentOwn.do",
        data: {
          sID: "${currentStudentID}"
        },
        type: "get",
        dataType: "json",
        success: function (student) {
          document.getElementById("sID").value = student.sID;
          document.getElementById("sName").value = student.sName;
          if(student.sSex == "0") {
            document.getElementById("sSex").value = "女";
          }
          else if(student.sSex == "1") {
            document.getElementById("sSex").value = "男";
          }
          document.getElementById("sPhoneNumber").value = student.sPhoneNumber;
          document.getElementById("sEmail").value = student.sEmail;
          document.getElementById("dormID").value = student.dormID;
          document.getElementById("roomID").value = student.roomID;
          document.getElementById("schoolState").value = student.schoolState;
          document.getElementById("livingState").value = student.livingState;
          if (student.livingState == "0") {
            document.getElementById("livingState").value = "离校";
          }
          else if(student.livingState == "1") {
            document.getElementById("livingState").value = "已入住";
          }
        }
      })
    }
  </script>

  <script type="text/javascript">
    function changeInput() {
      /*将input改为可编辑的*/
      document.getElementById("sPhoneNumber").disabled = false;
      document.getElementById("sEmail").disabled = false;
    }

    function changeStuInfo(){//提交修改后的学生信息
      $.ajax({
        url: "apply/chaStudentOwn.do",
        type: "post",
        data:{
          sID: document.getElementById("sID").value,
          sPhoneNumber: document.getElementById("sPhoneNumber").value,
          sEmail: document.getElementById("sEmail").value
        },
        success: function(res) {
          alert(res);
        },
        error: function() {
          alert("修改失败");
        }
      })
    }
  </script>
</head>

<body>
  <!--顶部标题-->
  <div class="header">
    <h1>学生宿舍管理系统(学生版)</h1>
    <!--导航栏-->
  </div>

  <div class="navbar">
    <a href="page_student_Information">查看信息</a>
    <a href="page_student_MoveInOrOut">办理入住/离校</a>
    <a href="page_student_Apply">相关申请</a>
  </div>

  <div class="main" style="background-image: url(${pageContext.request.contextPath}/img/bg.jpg);background-size: 100% 100%;">
    <br> <br> <br> <br>
    <table  width=30% height=350px align="center" style="background-color: white ;border-radius: 25px;opacity: 0.4;">
      <caption style="background-color: white; font-size: 30px ;color:grey;margin: 20px; ">学生个人信息</caption>
      <tbody style="font-size:25px; color:#808080; font-weight: 400">
      <tr>
        <td align="center" width=40%>学号</td>
        <td width=60%> <input id="sID" type="text"  align="left" width="95%" height="95%" value="" disabled></td>
      </tr>
      <tr>
        <td align="center" width=30%>姓名</td>
        <td><input id="sName" type="text"  align="left" width="95%" height="95%" value="" disabled></td>
      </tr>
      <tr>
        <td align="center" width=30%>性别</td>
        <td><input id="sSex" type="text"  align="left" width="95%" height="95%" value="" disabled></td>
      </tr>
      <tr>
        <td align="center" width=30%>手机号码</td>
        <td><input id="sPhoneNumber" type="text"  align="left" width="95%" height="95%" value="" disabled></td>
      </tr>
      <tr>
        <td align="center" width=30%>邮箱</td>
        <td><input id="sEmail" type="text"  align="left" width="95%" height="95%" value="" disabled></td>
      </tr>
      <tr>
        <td align="center" width=30%>宿舍楼</td>
        <td><input id="dormID" type="text"  align="left" width="95%" height="95%" value="" disabled></td>
      </tr>
      <tr>
        <td align="center" width=30%>宿舍号</td>
        <td><input id="roomID" type="text"  align="left" width="95%" height="955" value="" disabled></td>
      </tr>
      <tr>
        <td align="center" width=30%>在校状态</td>
        <td><input id="schoolState" type="text"  align="left" width="95%" height="95%" value="" disabled></td>
      </tr>
      <tr>
        <td align="center" width=30%>入住状态</td>
        <td><input id="livingState" type="text"  align="left" width="95%" height="95%" value="" disabled></td>
      </tr>
      </tbody>
    </table>

    <div align=center>
      <span class="button" >
        <button id="modifyStuIn" onclick="changeInput()">修改</button>
        <button id="ok" onclick="changeStuInfo()">保存</button>
      </span>
    </div>
  </div>
  <div class="footer">
    这里是底线
  </div>
</body>
</html>
