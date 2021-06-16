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
<div id = "header">
  <div id = "titleOfSystem">
    <h1 text-align: center;>宿舍管理系统</h1>
  </div>
  <div id = "logOut">
    <a href="#" title="退出登录" target="_self">退出登录</a>
  </div>
</div>
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
  <div style="border:2px solid blue;" id="nav">个人信息</div>
  <div id = "info" class="functDivs" style="display: block;">
    <form>
      <span class="infoText">姓名：</span><input type="text" name="aName" value="超管" readonly="readonly"><br>
      <span class="infoText">工号：</span><input type="text" name="aID" value="681654182356" readonly="readonly"><br>
      <span class="infoText">性别：</span><input type="text" name="aSex" value="男"  readonly="readonly"><br>
      <span class="infoText">身份证号码：</span><input type="text" name="aIdCard" value="3462631456" readonly="readonly"><br>
      <span class="infoText">手机号码：</span><input type="tel" name="aPhone" value="123456" readonly="readonly"><br>
      <span class="infoText">邮箱地址：</span><input type="email" name="aEmail" value="123@123" readonly="readonly"><br>
      <input type="button" id="aAlter" value="修改">
      <input type="submit" id="aSave" value="保存" disabled="disabled">
    </form>
  </div>
  <div id = "stud" class="functDivs">
    <form id="sform" name="sform" method="post" action="">
      <table width="698" border="0" cellpadding="0" cellspacing="0" id="studTable">
        <tr>
          <td width="32" align="center" bgcolor="#EFEFEF" Name="Num"><input type="checkbox" name="checkbox" value="checkbox" /></td>
          <td width="186" bgcolor="#EFEFEF" Name="sID" EditType="TextBox">学号</td>
          <td width="186" bgcolor="#EFEFEF" Name="sName" EditType="TextBox">姓名</td>
          <td width="152" bgcolor="#EFEFEF" Name="sSex" EditType="DropDownList" DataItems="{text:'男',value:'男'},{text:'女',value:'女'}">性别</td>
          <td width="103" bgcolor="#EFEFEF" Name="dormID" EditType="DropDownList" DataItems="{text:'A1',value:'A1'},{text:'A2',value:'A2'}">宿舍楼</td>
          <td width="103" bgcolor="#EFEFEF" Name="roomID" EditType="DropDownList" DataItems="{text:'101',value:'101'},{text:'102',value:'102'}">房间号</td>
          <td width="120" bgcolor="#EFEFEF" Name="sDetail" >详细信息</td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>
          <td bgcolor="#FFFFFF">10915134</td>
          <td bgcolor="#FFFFFF">jiajia</td>
          <td bgcolor="#FFFFFF" Value="男">男</td>
          <td bgcolor="#FFFFFF" Value="A1">A1</td>
          <td bgcolor="#FFFFFF" Value="101">101</td>
          <td bgcolor="#FFFFFF"><a href="#" onclick="StudentTarget()">详细信息</a></td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>
          <td bgcolor="#FFFFFF">10915134</td>
          <td bgcolor="#FFFFFF">jiajia</td>
          <td bgcolor="#FFFFFF" Value="男">男</td>
          <td bgcolor="#FFFFFF" Value="A1">A1</td>
          <td bgcolor="#FFFFFF" Value="101">101</td>
          <td bgcolor="#FFFFFF"><a href="#" onclick="StudentTarget()">详细信息</a></td>
        </tr>
      </table>

      <br />
      <input type="button" name="sSubmit" value="新增" onclick="AddRow(document.getElementById('studTable'),1)" />
      <input type="button" name="sSubmit2" value="删除" onclick="DeleteRow(document.getElementById('studTable'),1)" />
      <input type="button" name="sSubmit22" value="重置" onclick="window.location.reload()" />
      <input type="submit" name="sSubmit3" value="提交" onclick="" />
      <input type="file" name="sSubmit4" value="选择文件" accept="*.xls"/>
    </form>
  </div>
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



  <div id="studentDetail" class="detailDivs">
    <form>
      <span class="infoText">姓名：</span><input type="text" name="sName" placeholder="学生的姓名" readonly><br>
      <span class="infoText">学号：</span><input type="number" name="sID" placeholder="学生的学号" readonly><br>
      <span class="infoText">性别：</span><input type="text" name="sSex" placeholder="学生的性别" readonly><br>
      <span class="infoText">身份证号码：</span><input type="number" name="sIDcardNo" placeholder="学生的身份证号码" readonly><br>
      <span class="infoText">入学年时间：</span><input type="month" name="sEnrollYear" placeholder="学生的入学时间" readonly><br>
      <span class="infoText">手机号码：</span><input type="tel" name="sPhone" placeholder="学生的手机号码" readonly><br>
      <span class="infoText">邮箱地址：</span><input type="email" name="aEmail" placeholder="学生的邮箱" readonly><br>
      <span class="infoText">宿舍楼：</span><input type="text" name="dormID" placeholder="学生所在宿舍楼" readonly><br>
      <span class="infoText">房间号：</span><input type="text" name="roomID" placeholder="学生所在的房间号" readonly><br>
      <span class="infoText">在住状态：</span><input type="text" name=" livingState" placeholder="学生在住状态" readonly><br>
      <span class="infoText">在校状态：</span><input type="text" name="schoolState" placeholder="学生在校状态" readonly><br>
      <input type="button" id="sAlter" value="修改">
      <input type="submit" id="sSave" value="保存" disabled="disabled">
    </form>
  </div>
  <div id="hparentDetail" class="detailDivs">
    <form>
      <span class="infoText">姓名：</span><input type="text" name="hName" placeholder="宿管的姓名" readonly><br>
      <span class="infoText">工号：</span><input type="number" name="hID" placeholder="宿管的工号" readonly><br>
      <span class="infoText">性别：</span><input type="text" name="hSex" placeholder="宿管的性别" readonly><br>
      <span class="infoText">身份证号码：</span><input type="number" name="hIDcardNo" placeholder="宿管的身份证号码" readonly><br>
      <span class="infoText">手机号码：</span><input type="tel" name="hPhone" placeholder="宿管的手机号码" readonly><br>
      <span class="infoText">邮箱地址：</span><input type="email" name="hEmail" placeholder="宿管的邮箱" readonly><br>
      <span class="infoText">管理的宿舍楼：</span><input type="text" name="dormID" placeholder="管理的宿舍楼" readonly><br>
      <input type="button" id="hAlter" value="修改">
      <input type="submit" id="hSave" value="保存" disabled="disabled">
    </form>
  </div>
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

  function StudentTarget()
  {
    for(var j = 0;j<functDivs.length;j++)
    {
      functDivs[j].style.display = "none";
    }
    var studentDetail = document.querySelector("#studentDetail");
    studentDetail.style.display = "block";
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
<script language="javascript" src="../../js/Admin/adminModel.js">
</script>
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
