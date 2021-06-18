<%--
  Created by IntelliJ IDEA.
  User: zjt
  Date: 2021/6/16
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宿舍管理系统</title>

    <!-- 查看学生信息 -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
    <script type="text/javascript">
      $(function () {
        // 当前页面dom对象加载后, 执行loadStudentData()
        loadStudentData();

        $("#btnLoader").click(function () {
          loadStudentData();
        })
      })

      function loadStudentData() {
        $.ajax({
          url: "admin/displayStudent.do",
          type: "get",
          dataType: "json",
          success: function (data) {
            // 清除旧的数据
            $("#studentInfo").html("");
            // 添加新的数据
            $.each(data, function (i, n) {
              $("#studentInfo").append("<tr>")
                  .append('<td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>')
                  .append('<td bgcolor="#FFFFFF">' + n.sID +"</td>")
                  .append('<td bgcolor="#FFFFFF">' + n.sName + "</td>")
                  .append('<td bgcolor="#FFFFFF">' + n.sSex + "</td>")
                  .append('<td bgcolor="#FFFFFF">' + n.dormID + "</td>")
                  .append('<td bgcolor="#FFFFFF">' + n.roomID + "</td>")
                  .append('<td bgcolor="#FFFFFF"><a href="#" onclick="StudentTarget('+ n.sID +')">详细信息</a></td>')
                  .append("</tr>")
            })
          }
        })
      }
    </script>

    <!-- 添加一个学生 -->
    <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-ui.css">
    <script type="text/javascript">
      $(function (){
        $("#dialog").dialog({
          autoOpen: false,
          show: "blind",
          hide: "explode",
          modal: true,
          buttons: [
            {
              text: "确定",
              click: function (){
                $.ajax({
                  url: "admin/addStudentSeparately.do",
                  data: {
                    sID: $("input[id=add_sID]").val(),
                    sName: $("input[id=add_sName]").val(),
                    sSex: $("input[id=add_sSex]").val(),
                    sIDcardNo: $("input[id=add_sIDcardNo]").val(),
                    sEnrollYear: $("input[id=add_sEnrollYear]").val(),
                    sPassword: $("input[id=add_sPassword]").val(),
                    sPhoneNumber: $("input[id=add_sPhoneNumber]").val(),
                    sEmail: $("input[id=add_sEmail]").val(),
                    dormID: $("input[id=add_dormID]").val(),
                    roomID: $("input[id=add_roomID]").val(),
                    livingState: $("input[id=add_livingState]").val(),
                    schoolState: $("input[id=add_schoolState]").val()
                  },
                  type: "post",
                  dataType: "json",
                  success: function (resp) {

                  }
                })

                loadStudentData();
                $(this).dialog("close");
              }
            },{
              text: "取消",
              click: function(){
                $(this).dialog("close");
              }
            }
          ],
          closeOnEscape: false,
          title: "添加一个学生",
          position: "center",
          width: 400,
          height: 330,
          resizable: false,
        });

        $("#dialog_link").click(function (){
          $("#dialog").dialog("open");
        });
      });
    </script>

    <!-- 删除一个学生 -->
    <script type="text/javascript">
      $(function (){
        $("#dialog_del").dialog({
          autoOpen: false,
          show: "blind",
          hide: "explode",
          modal: true,
          buttons: [
            {
              text: "确定",
              click: function (){
                $.ajax({
                  url: "admin/delStudentSeparately.do",
                  data: {
                    sID: $("input[id=del_id]").val(),
                  },
                  type: "post",
                  dataType: "json",
                  success: function (resp) {

                  }
                })

                loadStudentData();
                $(this).dialog("close");
              }
            },{
              text: "取消",
              click: function(){
                $(this).dialog("close");
              }
            }
          ],
          closeOnEscape: false,
          title: "删除一个学生",
          position: "center",
          width: 400,
          height: 330,
          resizable: false,
        });

        $("#dialog_delBtn").click(function (){
          $("#dialog_del").dialog("open");
        });
      });
    </script>

    <!-- 导入一批学生 -->
    <script type="text/javascript">
      let User = function() {
        this.init = function() {
          //模拟上传excel
          $("#uploadEventBtn").unbind("click").bind("click", function() {
            $("#uploadEventFile").click();
          });
          $("#uploadEventFile").bind("change", function() {
            $("#uploadEventPath").attr("value", $("#uploadEventFile").val());
          });
        };
        //点击上传按钮
        this.uploadBtn = function() {
          let uploadEventFile = $("#uploadEventFile").val();
          if(uploadEventFile == '') {
            alert("请选择Excel文件, 再上传");
          }else if(uploadEventFile.lastIndexOf(".xls") < 0) {
            alert("只能上传Excel文件");
          }else {
            let url =  'admin/uploadStudent.do';
            let formData = new FormData($('form')[0]);
            user.sendAjaxRequest(url, 'POST', formData);
          }
        };
        this.sendAjaxRequest = function(url, type, data) {
          $.ajax({
            url: url,
            type: type,
            data: data,
            success: function(result) {
              loadStudentData();
              alert(result);
            },
            error: function() {
              alert("excel上传失败");
            },
            cache: false,
            contentType: false,
            processData: false
          });
        };
      }
      let user;
      $(function() {
        user = new User();
        user.init();
      });
    </script>

    <!-- 系统管理员修改学生信息 -->
    <script type="text/javascript">
      function ModifyStudentDetail() {
        $.ajax({
          url: "admin/modifyStudentDetail.do",
          type: "post",
          data: {
            sName: document.getElementById("detail_sName").value,
            sID: document.getElementById("detail_sID").value,
            sSex: document.getElementById("detail_sSex").value,
            sIDcardNo: document.getElementById("detail_sIDcardNo").value,
            sEnrollYear: document.getElementById("detail_sEnrollYear").value,
            sPhoneNumber: document.getElementById("detail_sPhoneNumber").value,
            sEmail: document.getElementById("detail_sEmail").value,
            dormID: document.getElementById("detail_dormID").value,
            roomID: document.getElementById("detail_roomID").value,
            livingState: document.getElementById("detail_livingState").value,
            schoolState: document.getElementById("detail_schoolState").value
          },
          success: function (resp) {
            alert(resp);
          },
          error: function () {
            alert("修改失败");
          }
        })
      }
    </script>

    <style>
        *{
            margin: 0%;
            padding: 0%;
        }
        a{
            text-decoration:none;
        }

        #header{
            width:100%;
            height: 90px;
            background-color: #0c7ed9;
        }
        #titleOfSystem{
            width:auto;
            height: 40px;
            position: absolute;
            left:25px;
            top:25px;
            float: right;
        }
        #logOut{
            width:auto;
            height: auto;
            position: absolute;
            right: 0px;
            top: 0px;
            float: right;
        }

        #menu{
            width:150px;
            height:800px;
            border:2px solid black;
            display:block;
            position: absolute;
            left:0px;
            top:90px;
        }
        #image{
            width:1326px;
            height:100px;
            border:2px solid black;
            display:block;
            position: absolute;
            left:154px;
            top:90px;
        }
        #function{
            width:1326px;
            height:700px;
            border:2px solid black;
            position: absolute;
            left:154px;
            top:194px;
        }
        .functDivs{
            width: auto;
            height: auto;
            border:2px solid blue;
            display: none;
        }
        .infoText{
            display:inline-block;
            width: 120px;
            text-align: right;
        }
        .detailDivs{
            width: auto;
            height: auto;
            border:2px solid blue;
            display: none;
        }
    </style>
  </head>

  <body>
  <!-- 头部区域 -->
  <div id = "header">
    <div id = "titleOfSystem">
      <h1 text-align: center;>宿舍管理系统</h1>
    </div>
    <div id = "logOut">
      <a href="#" title="退出登录" target="_self">退出登录</a>
    </div>
  </div>

  <!-- 左侧菜单栏 -->
  <div id="menu">
    <ul>
      <li><a href="#" target="_self">个人信息</a></li>
      <li><a href="#" target="_self">学生管理</a></li>
      <li><a href="#" target="_self">宿管管理</a></li>
      <li><a href="#" target="_self">宿舍楼管理</a></li>
    </ul>
  </div>

  <div id="image"></div>
  <div id="function">
    <!-- 系统管理员个人信息模块 -->
    <div style="border:2px solid blue;" id="nav">个人信息</div>
    <div id = "info" class="functDivs" style="display: block;">
      <div>
        <span class="infoText">姓名：</span><input type="text" name="aName" value="超管" readonly="readonly"><br>
        <span class="infoText">工号：</span><input type="text" name="aID" value="681654182356" readonly="readonly"><br>
        <span class="infoText">性别：</span><input type="text" name="aSex" value="男"  readonly="readonly"><br>
        <span class="infoText">身份证号码：</span><input type="text" name="aIdCard" value="3462631456" readonly="readonly"><br>
        <span class="infoText">手机号码：</span><input type="tel" name="aPhone" value="123456" readonly="readonly"><br>
        <span class="infoText">邮箱地址：</span><input type="email" name="aEmail" value="123@123" readonly="readonly"><br>
        <input type="button" id="aAlter" value="修改">
        <input type="submit" id="aSave" value="保存" disabled="disabled">
      </div>
    </div>

    <!-- 学生模块 -->
    <div id = "stud" class="functDivs">
      <div id="sform" name="sform">
        <table width="698" border="0" cellpadding="0" cellspacing="0" id="studTable">
          <thead>
          <tr>
            <td width="32" align="center" bgcolor="#EFEFEF" Name="Num"><input type="checkbox" name="checkbox" value="checkbox" /></td>
            <td width="186" bgcolor="#EFEFEF" Name="sID" EditType="TextBox">学号</td>
            <td width="186" bgcolor="#EFEFEF" Name="sName" EditType="TextBox">姓名</td>
            <td width="152" bgcolor="#EFEFEF" Name="sSex" EditType="DropDownList" DataItems="{text:'男',value:'男'},{text:'女',value:'女'}">性别</td>
            <td width="103" bgcolor="#EFEFEF" Name="dormID" EditType="DropDownList" DataItems="{text:'A1',value:'A1'},{text:'A2',value:'A2'}">宿舍楼</td>
            <td width="103" bgcolor="#EFEFEF" Name="roomID" EditType="DropDownList" DataItems="{text:'101',value:'101'},{text:'102',value:'102'}">房间号</td>
            <td width="120" bgcolor="#EFEFEF" Name="sDetail" >详细信息</td>
          </tr>
          </thead>

          <tbody id="studentInfo">

          </tbody>
        </table>

        <br />
        <!-- 添加一个学生 -->
        <button id="dialog_link">添加一个学生</button>
        <div id="dialog" align="center">
          <br>
          学号: <input type="text" id="add_sID" name="sID"> <br> <br>
          姓名: <input type="text" id="add_sName" name="sName"> <br> <br>
          性别: <input type="text" id="add_sSex" name="sSex"> <br> <br>
          身份证号: <input type="text" id="add_sIDcardNo" name="sIDcardNo"> <br> <br>
          入学年份: <input type="text" id="add_sEnrollYear" name="sEnrollYear"> <br> <br>
          密码: <input type="text" id="add_sPassword" name="sPassword"> <br> <br>
          手机号码: <input type="text" id="add_sPhoneNumber" name="sPhoneNumber"> <br> <br>
          电子邮箱: <input type="text" id="add_sEmail" name="sEmail"> <br> <br>
          楼栋号: <input type="text" id="add_dormID" name="dormID"> <br> <br>
          房间号: <input type="text" id="add_roomID" name="roomID"> <br> <br>
          在住状态: <input type="text" id="add_livingState" name="livingState"> <br> <br>
          就读状态: <input type="text" id="add_schoolState" name="schoolState"> <br> <br>
        </div>

        <!-- 删除一个学生 -->
        <br> <br>
        <button id="dialog_delBtn">删除一个学生</button>
        <div id="dialog_del" align="center">
          <br>
          学号: <input type="text" id="del_id" name="id"> <br> <br>
        </div>

        <input type="button" name="sSubmit22" value="重置" onclick="window.location.reload()" />

        <!-- 导入一批学生 -->
        <form enctype="multipart/form-data" id="batchUpload"  action="admin/uploadStudent" method="post" class="form-horizontal">
          <button class="btn btn-success btn-xs" id="uploadEventBtn" style="height:26px;"  type="button" >选择文件</button>
          <input type="file" name="file"  style="width:0px;height:0px;" id="uploadEventFile">
          <input id="uploadEventPath"  disabled="disabled"  type="text" >
        </form>
        <button type="button" class="btn btn-success btn-sm"  onclick="user.uploadBtn()" >上传</button>

        <input type="button" id="btnLoader" value="查询所有学生">
      </div>
    </div>

    <!-- 学生详细信息模块 -->
    <div id="studentDetail" class="detailDivs">
      <div>
        <span class="infoText">姓名：</span><input id="detail_sName" type="text" name="sName" value="学生的姓名" readonly><br>
        <span class="infoText">学号：</span><input id="detail_sID" type="number" name="sID" value="学生的学号" readonly><br>
        <span class="infoText">性别：</span><input id="detail_sSex" type="text" name="sSex" value="学生的性别" readonly><br>
        <span class="infoText">身份证号：</span><input id="detail_sIDcardNo" type="number" name="sIDcardNo" value="学生的身份证号码" readonly><br>
        <span class="infoText">入学年份：</span><input id="detail_sEnrollYear" type="text" name="sEnrollYear" value="学生的入学时间" readonly><br>
        <span class="infoText">手机号码：</span><input id="detail_sPhoneNumber" type="tel" name="sPhone" value="学生的手机号码" readonly><br>
        <span class="infoText">邮箱地址：</span><input id="detail_sEmail" type="email" name="sEmail" value="学生的邮箱" readonly><br>
        <span class="infoText">宿舍楼：</span><input id="detail_dormID" type="text" name="dormID" value="学生所在宿舍楼" readonly><br>
        <span class="infoText">房间号：</span><input id="detail_roomID" type="text" name="roomID" value="学生所在的房间号" readonly><br>
        <span class="infoText">在住状态：</span><input id="detail_livingState" type="text" name="livingState" value="学生在住状态" readonly><br>
        <span class="infoText">在校状态：</span><input id="detail_schoolState" type="text" name="schoolState" value="学生在校状态" readonly><br>
        <input type="button" id="sAlter" value="修改">
        <input type="submit" id="sSave" value="保存" disabled="disabled" onclick="ModifyStudentDetail()">
      </div>
    </div>

    <!-- 宿舍管理员模块 -->
    <div id = "hparent" class="functDivs">
      <form id="hform" name="hform" method="post" action="">
        <table width="698" border="0" cellpadding="0" cellspacing="0" id="hparentTable">
          <tr>
            <td width="32" align="center" bgcolor="#EFEFEF" Name="Num"><input type="checkbox" name="checkbox" value="checkbox" /></td>
            <td width="186" bgcolor="#EFEFEF" Name="hID" EditType="TextBox">工号</td>
            <td width="186" bgcolor="#EFEFEF" Name="hName" EditType="TextBox">姓名</td>
            <td width="152" bgcolor="#EFEFEF" Name="hSex" EditType="DropDownList" DataItems="{text:'男',value:'男'},{text:'女',value:'女'}">性别</td>
            <td width="123" bgcolor="#EFEFEF" Name="dormID" EditType="DropDownList" DataItems="{text:'A1',value:'A1'},{text:'A2',value:'A2'}">管理的宿舍楼</td>
            <td width="120" bgcolor="#EFEFEF" Name="hDetail" >详细信息</td>
          </tr>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>
            <td bgcolor="#FFFFFF">109151</td>
            <td bgcolor="#FFFFFF">jiajia</td>
            <td bgcolor="#FFFFFF" Value="男">男</td>
            <td bgcolor="#FFFFFF" Value="A1">A1</td>
            <td bgcolor="#FFFFFF"><a href="#" onclick="HparentTarget()">详细信息</a></td>
          </tr>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>
            <td bgcolor="#FFFFFF">10915134</td>
            <td bgcolor="#FFFFFF">jiajia</td>
            <td bgcolor="#FFFFFF" Value="男">男</td>
            <td bgcolor="#FFFFFF" Value="A1">A1</td>
            <td bgcolor="#FFFFFF"><a href="#" onclick="HparentTarget()">详细信息</a></td>
          </tr>
        </table>

        <br />
        <input type="button" name="hSubmit" value="新增" onclick="AddRow(document.getElementById('hparentTable'),1)" />
        <input type="button" name="hSubmit2" value="删除" onclick="DeleteRow(document.getElementById('hparentTable'),1)" />
        <input type="button" name="hSubmit22" value="重置" onclick="window.location.reload()" />
        <input type="submit" name="hSubmit3" value="提交" onclick="" />
        <input type="file" name="hSubmit4" value="选择文件" accept="*.xls"/>
      </form>
    </div>

    <!-- 宿舍管理员详细信息模块 -->
    <div id="hparentDetail" class="detailDivs">
      <div>
        <span class="infoText">姓名：</span><input type="text" name="hName" placeholder="宿管的姓名" readonly><br>
        <span class="infoText">工号：</span><input type="number" name="hID" placeholder="宿管的工号" readonly><br>
        <span class="infoText">性别：</span><input type="text" name="hSex" placeholder="宿管的性别" readonly><br>
        <span class="infoText">身份证号码：</span><input type="number" name="hIDcardNo" placeholder="宿管的身份证号码" readonly><br>
        <span class="infoText">手机号码：</span><input type="tel" name="hPhone" placeholder="宿管的手机号码" readonly><br>
        <span class="infoText">邮箱地址：</span><input type="email" name="hEmail" placeholder="宿管的邮箱" readonly><br>
        <span class="infoText">管理的宿舍楼：</span><input type="text" name="dormID" placeholder="管理的宿舍楼" readonly><br>
        <input type="button" id="hAlter" value="修改">
        <input type="submit" id="hSave" value="保存" disabled="disabled">
      </div>
    </div>

    <!-- 宿舍楼模块 -->
    <div id = "dorm" class="functDivs">
      <form id="dform" name="dform" method="post" action="">
        <table width="698" border="0" cellpadding="0" cellspacing="0" id="dormTable">
          <tr>
            <td width="32" align="center" bgcolor="#EFEFEF" Name="Num"><input type="checkbox" name="checkbox" value="checkbox" /></td>
            <td width="186" bgcolor="#EFEFEF" Name="dID" EditType="TextBox">宿舍号</td>
            <td width="186" bgcolor="#EFEFEF" Name="numOfFloor" EditType="TextBox">楼层数</td>
            <td width="120" bgcolor="#EFEFEF" Name="dDetail" >详细信息</td>
          </tr>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>
            <td bgcolor="#FFFFFF">1091</td>
            <td bgcolor="#FFFFFF">4</td>
            <td bgcolor="#FFFFFF"><a href="#" onclick="DormTarget()">详细信息</a></td>
          </tr>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>
            <td bgcolor="#FFFFFF">1094</td>
            <td bgcolor="#FFFFFF">8</td>
            <td bgcolor="#FFFFFF"><a href="#" onclick="DormTarget()">详细信息</a></td>
          </tr>
        </table>

        <br />
        <input type="button" name="dSubmit" value="新增" onclick="AddRow(document.getElementById('dormTable'),1)" />
        <input type="button" name="dSubmit2" value="删除" onclick="DeleteRow(document.getElementById('dormTable'),1)" />
        <input type="button" name="dSubmit22" value="重置" onclick="window.location.reload()" />
        <input type="submit" name="dSubmit3" value="提交" onclick="" />
        <input type="file" name="dSubmit4" value="选择文件" accept="*.xls"/>
      </form>
    </div>

    <!-- 宿舍楼详细信息模块 -->
    <div id="dormDetail" class="detailDivs">
      <form id="rform" name="rform" method="post" action="">
        <table width="698" border="0" cellpadding="0" cellspacing="0" id="roomTable">
          <tr>
            <td width="32" align="center" bgcolor="#EFEFEF" Name="Num"><input type="checkbox" name="checkbox" value="checkbox" /></td>
            <td width="186" bgcolor="#EFEFEF" Name="dID" EditType="TextBox">宿舍号</td>
            <td width="186" bgcolor="#EFEFEF" Name="numOfFloor" EditType="TextBox">楼层数</td>
            <td width="186" bgcolor="#EFEFEF" Name="rID" EditType="TextBox">房间号</td>
            <td width="186" bgcolor="#EFEFEF" Name=" roomCapacity" EditType="DropDownList" DataItems="{text:'4',value:'4'},{text:'6',value:'6'}">房间容纳人数</td>
            <td width="186" bgcolor="#EFEFEF" Name="roomState" EditType="DropDownList" DataItems="{text:'已满',value:'已满'},{text:'未满',value:'未满'}">房间状态</td>
          </tr>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>
            <td bgcolor="#FFFFFF">A2</td>
            <td bgcolor="#FFFFFF">4</td>
            <td bgcolor="#FFFFFF">103</td>
            <td bgcolor="#FFFFFF" Value="4">4</td>
            <td bgcolor="#FFFFFF" Value="已满">已满</td>
          </tr>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>
            <td bgcolor="#FFFFFF">A1</td>
            <td bgcolor="#FFFFFF">6</td>
            <td bgcolor="#FFFFFF">103</td>
            <td bgcolor="#FFFFFF" Value="6">6</td>
            <td bgcolor="#FFFFFF" Value="未满">未满</td>
          </tr>
        </table>

        <br />
        <input type="button" name="dSubmit" value="新增" onclick="AddRow(document.getElementById('roomTable'),1)" />
        <input type="button" name="dSubmit2" value="删除" onclick="DeleteRow(document.getElementById('roomTable'),1)" />
        <input type="button" name="dSubmit22" value="重置" onclick="window.location.reload()" />
        <input type="submit" name="dSubmit3" value="提交" onclick="" />
        <input type="file" name="dSubmit4" value="选择文件" accept="*.xls"/>
      </form>
    </div>
  </div>

  </body>

  <script>
    var menuLists = document.querySelector("#menu").querySelectorAll("li");
    var functDivs = document.querySelectorAll(".functDivs");
    var detailDivs = document.querySelectorAll(".detailDivs");
    for(var i = 0;i<menuLists.length;i++)
    {
      menuLists[i].addEventListener("click",function(){
        var j = 0;
        var k = 0;
        for(;j<functDivs.length;j++)
        {
          functDivs[j].style.display = "none";
          if(menuLists[j]==this)
          {
            k = j;
          }
        }
        for(var l = 0;l<detailDivs.length;l++)
        {
          detailDivs[l].style.display="none";
        }
        var nav = document.querySelector("#nav")
        switch(k)
        {
          case 0:{
            nav.innerHTML = "个人信息";
            break;
          }
          case 1:{
            nav.innerHTML = "学生管理";
            break;
          }
          case 2:{
            nav.innerHTML = "宿管管理";
            break;
          }
          case 3:{
            nav.innerHTML = "宿舍楼管理";
            break;
          }
        }
        functDivs[k].style.display = "block";
      })
    }

    var aAlter = document.querySelector("#aAlter");
    var aSave = document.querySelector("#aSave");
    var infoInputs = document.querySelector("#info").querySelectorAll("input");
    aAlter.addEventListener("click",function(){
      this.disabled = true;
      aSave.disabled = false;
      for(var i = 0;i<infoInputs.length-2;i++)
      {
        infoInputs[i].readOnly=false;
      }
    })
    aSave.addEventListener("click",function(){
      this.disabled = true;
      aAlter.disabled = false;
      for(var i = 0;i<infoInputs.length-2;i++)
      {
        infoInputs[i].readOnly=true;
      }
    })

    var sAlter = document.querySelector("#sAlter");
    var sSave = document.querySelector("#sSave");
    var studInputs = document.querySelector("#studentDetail").querySelectorAll("input");
    sAlter.addEventListener("click",function(){
      this.disabled = true;
      sSave.disabled = false;
      for(var i = 0;i<studInputs.length-2;i++)
      {
        studInputs[i].readOnly=false;
      }
    })
    sSave.addEventListener("click",function(){
      this.disabled = true;
      sAlter.disabled = false;
      for(var i = 0;i<studInputs.length-2;i++)
      {
        studInputs[i].readOnly=true;
      }
    })

    var hAlter = document.querySelector("#hAlter");
    var hSave = document.querySelector("#hSave");
    var hparentInputs = document.querySelector("#hparentDetail").querySelectorAll("input");
    hAlter.addEventListener("click",function(){
      this.disabled = true;
      hSave.disabled = false;
      for(var i = 0;i<hparentInputs.length-2;i++)
      {
        hparentInputs[i].readOnly=false;
      }
    })
    hSave.addEventListener("click",function(){
      this.disabled = true;
      hAlter.disabled = false;
      for(var i = 0;i<hparentInputs.length-2;i++)
      {
        hparentInputs[i].readOnly=true;
      }
    })

    // 跳转到学生详细信息界面, 并显示该名学生的详细信息
    let studentDetail = function () {
      this.searchStudentDetail = function (sID) {
        <!-- 进入到学生详细信息界面时, 发起异步请求: 根据学号查询其详细信息 -->
        $.ajax({
          url: "admin/searchStudentDetail.do",
          type: "post",
          dataType: "json",
          data: {
            sID: sID
          },
          success: function (data) {
            let display_sID = document.getElementById("detail_sID");
            display_sID.value = data.sID;
            let display_sName = document.getElementById("detail_sName");
            display_sName.value = data.sName;
            let display_sSex = document.getElementById("detail_sSex");
            display_sSex.value = data.sSex;
            let display_sIDcardNo = document.getElementById("detail_sIDcardNo");
            display_sIDcardNo.value = data.sIDcardNo;
            let display_sEnrollYear = document.getElementById("detail_sEnrollYear");
            display_sEnrollYear.value = data.sEnrollYear;
            let display_sPhoneNumber = document.getElementById("detail_sPhoneNumber");
            display_sPhoneNumber.value = data.sPhoneNumber;
            let display_sEmail = document.getElementById("detail_sEmail");
            display_sEmail.value = data.sEmail;
            let display_dormID = document.getElementById("detail_dormID");
            display_dormID.value = data.dormID;
            let display_roomID = document.getElementById("detail_roomID");
            display_roomID.value = data.roomID;
            let display_livingState = document.getElementById("detail_livingState");
            display_livingState.value = data.livingState;
            let display_schoolState = document.getElementById("detail_schoolState");
            display_schoolState.value = data.schoolState;
          }
        })
      }
    }

    let searchDetail_student;
    $(function () {
      searchDetail_student = new studentDetail();
    });

    function StudentTarget(sID) {
      for(let j = 0; j < functDivs.length; j++) {
        functDivs[j].style.display = "none";
      }
      let studentDetail = document.querySelector("#studentDetail");
      studentDetail.style.display = "block";

      searchDetail_student.searchStudentDetail(sID);
    }

    function HparentTarget()
    {
      for(var j = 0;j<functDivs.length;j++)
      {
        functDivs[j].style.display = "none";
      }
      var hparentDetail = document.querySelector("#hparentDetail");
      hparentDetail.style.display = "block";
    }

    function DormTarget()
    {
      for(var j = 0;j<functDivs.length;j++)
      {
        functDivs[j].style.display = "none";
      }
      var dormDetail = document.querySelector("#dormDetail");
      dormDetail.style.display = "block";
    }
  </script>

  <script language="javascript" src="${pageContext.request.contextPath}/js/Admin/adminModel.js"></script>
  <script language="javascript">
    var studTable = document.getElementById("studTable");
    SetTableCanEdit(studTable);

    var hparentTable = document.getElementById("hparentTable");
    SetTableCanEdit(hparentTable);

    var dormTable = document.getElementById("dormTable");
    SetTableCanEdit(dormTable);

    var roomTable = document.getElementById("roomTable");
    SetTableCanEdit(roomTable);
  </script>

</html>
