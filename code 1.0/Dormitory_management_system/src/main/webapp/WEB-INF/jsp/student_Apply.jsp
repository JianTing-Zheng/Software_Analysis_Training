<%--
  Created by IntelliJ IDEA.
  User: zjt
  Date: 2021/7/7
  Time: 14:14
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
      .part{
          display:none;
          background-color:white;
          height:150px;
          width:350px;
          position:relative;
          margin:5px;
      }

      .btn_inline{
          display: inline-block;
      }
  </style>

  <!-- 查询该学生发出的请求 -->
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
  <script type="text/javascript">
    $(function() {
      //当前页面加载完后，立即执行loadApplyInfo
      loadApplyInfo();

      $("#btnApplyLoader").click(function () {
        loadApplyInfo();
      })
    })

    function loadApplyInfo() {
      // json日期格式转换为正常格式
      function jsonDateFormat(jsonDate) {
        try {
          let date = new Date(jsonDate);
          let month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1)
              : date.getMonth() + 1;
          let day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
          let hours = date.getHours() < 10 ? "0" + date.getHours() : date
              .getHours();
          ;
          let minutes = date.getMinutes();
          if (minutes < 10) {
            minutes = "0" + minutes
          }
          let seconds = date.getSeconds();
          let milliseconds = date.getMilliseconds();
          // + "分" + ":" + seconds + "." + milliseconds;
          return date.getFullYear() + "-" + month + "-" + day + " " + hours + ":"
              + minutes
        } catch (ex) {
          return "时间错误";
        }
      }

      $.ajax({
        url: "apply/displayApplication",
        data: {
          sID: "${currentStudentID}"
        },
        type: "get",
        dataType: "json",
        success: function(applies) {
          // 清除旧的数据
          $("#applyInfo").html("");
          // 添加新的数据
          $.each(applies, function(i, apply) {
            if(apply.applyState == "0") {
              apply.applyState = "未处理";
              apply.handleTime = "null";
            }

            if(apply.applyType == "0") {
              apply.applyType = "入住申请";
            }
            else if(apply.applyType == "1") {
              apply.applyType = "调宿申请";
            }
            else if(apply.applyType == "2") {
              apply.applyType = "退宿申请";
            }

            $("#applyInfo").append("<tr>")
                .append('<td align="center"><input type="checkbox" name="checkbox" value="checkbox" /></td>')
                .append("<td align='center'>" + apply.applyID + "</td>")
                .append("<td align='center'>" + apply.applyType + "</td>")
                .append("<td align='center'>" + apply.applyIntention + "</td>")
                .append("<td align='center'>" + jsonDateFormat(apply.applyTime) + "</td>")
                .append("<td align='center'>" + apply.applyState + "</td>")
                .append("<td align='center'>" + apply.handleTime + "</td>")
          })
        }
      })
    }
  </script>

  <!-- 提交一个申请 -->
  <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-ui.css">
  <script type="text/javascript">
    $(function () {
      $("#dialog_addApply").dialog({
        autoOpen: false,
        show: "blind",
        hide: "explode",
        modal: true,
        buttons: [
          {
            text: "确定",
            click: function () {
              $.ajax({
                url: "apply/addApplication",
                data: {
                  sID: "${currentStudentID}",
                  applyType: $("input[name=applyType]:checked").val(),
                  applyIntention: $("input[id=applyIntention_add]").val(),
                  applyReason: $("#applyReason_add").val()
                },
                type: "post",
                dataType: "json",
                success: function (res) {
                  alert(res);
                },
                error: function () {
                  alert("申请失败");
                }
              })

              loadApplyInfo();
              $(this).dialog("close");
            }
          },
          {
            text: "取消",
            click: function() {
              $(this).dialog("close");
            }
          }
        ],
        closeOnEscape: false,
        title: "提交申请",
        position: "center",
        width: 500,
        height: 400,
        resizable: false,
      });

      $("#dialog_addApplyBtn").click(function () {
        $("#dialog_addApply").dialog("open");
      });
    });
  </script>

  <!-- 删除一个学生 -->
  <script type="text/javascript">
    $(function () {
      $("#dialog_delApply").dialog({
        autoOpen: false,
        show: "blind",
        hide: "explode",
        modal: true,
        buttons: [
          {
            text: "确定",
            click: function () {
              $.ajax({
                url: "apply/delApplication",
                data: {
                  applyID: $("input[id=del_ApplyID]").val()
                },
                type: "post",
                dataType: "json",
                success: function (res) {
                  alert(res);
                },
                error: function () {
                  alert("取消失败");
                }
              })

              loadApplyInfo();
              $(this).dialog("close");
            }
          },{
            text: "取消",
            click: function() {
              $(this).dialog("close");
            }
          }
        ],
        closeOnEscape: false,
        title: "取消申请",
        position: "center",
        width: 400,
        height: 330,
        resizable: false,
      });

      $("#dialog_delApplyBtn").click(function () {
        $("#dialog_delApply").dialog("open");
      });
    });
  </script>

</head>

<body>
  <!-- 顶部标题 -->
  <div class="header">
    <h1>学生宿舍管理系统(学生版)</h1>
  </div>

  <!-- 导航栏 -->
  <div class="navbar">
    <a href="page_student_Information">查看信息</a>
    <a href="page_student_MoveInOrOut">办理入住/离校</a>
    <a href="page_student_Apply">相关申请</a>
  </div>

  <div class="main" style="background-image: url(${pageContext.request.contextPath}/img/bg.jpg);background-size: 100% 100%;">
    <table align="center" style="background-color: white ;border-radius: 25px;opacity: 0.4;">
      <thead>
      <tr>
        <th>&nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox" />&nbsp;</th>
        <th align="center" Name="applyID" EditType="TextBox">&nbsp;申请编号&nbsp;</th>
        <th align="center" Name="applyType" EditType="TextBox">&nbsp;申请类型&nbsp;</th>
        <th align="center" Name="applyIn" EditType="TextBox">&nbsp;申请意向&nbsp;</th>
        <th align="center" Name="applyTime" EditType="DropDownList">&nbsp;申请时间&nbsp;</th>
        <th align="center" Name="applyState" EditType="DropDownList">&nbsp;申请状态&nbsp;</th>
        <th align="center" Name="handleTime" EditType="DropDownList">&nbsp;处理时间&nbsp;&nbsp;&nbsp;</th>
      </tr>
      </thead>

      <tbody id="applyInfo">

      </tbody>
    </table>

    <!-- 提交一个申请 -->
    <br>
    <button id="dialog_addApplyBtn" class="btn_inline">提交申请</button>
    <div id="dialog_addApply" align="center">
      <br> 申请类型 <br> <br>
      <input type="radio" name="applyType" value="0" checked /> 入住申请
      <input type="radio" name="applyType" value="1" /> 调宿申请
      <input type="radio" name="applyType" value="2" /> 退宿申请
      <br> <br>
      申请意向 (如C10-001) <br> <br>
      <input id="applyIntention_add" type="text" name="applyIntention"/> <br> <br>
      申请原因 <br> <br>
      <textarea id="applyReason_add" rows="" cols="" name="applyReason" style="margin: 0px;width: 211px;height: 53px;"></textarea> <br> <br>
    </div>

    <!-- 取消一个申请 -->
    <button id="dialog_delApplyBtn" class="btn_inline">取消申请</button>
    <div id="dialog_delApply" align="center">
      <br>
      申请编号: <input type="text" id="del_ApplyID"> <br> <br>
    </div>

    <!-- 查询所有申请 -->
    <input type="button" id="btnApplyLoader" value="查询所有申请" class="btn_inline">
  </div>

  <div class="footer">
    这里是底线
  </div>
</body>
</html>