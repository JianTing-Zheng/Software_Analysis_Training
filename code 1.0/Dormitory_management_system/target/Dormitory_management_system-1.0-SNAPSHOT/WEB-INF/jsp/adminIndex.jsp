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
                  .append('<td bgcolor="#FFFFFF">' + n.sID + "</td>")
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
      $(function () {
        $("#dialog").dialog({
          autoOpen: false,
          show: "blind",
          hide: "explode",
          modal: true,
          buttons: [
            {
              text: "确定",
              click: function () {
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
                  success: function (res) {

                  }
                })

                loadStudentData();
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
          title: "添加一个学生",
          position: "center",
          width: 400,
          height: 330,
          resizable: false,
        });

        $("#dialog_link").click(function () {
          $("#dialog").dialog("open");
        });
      });
    </script>

    <!-- 删除一个学生 -->
    <script type="text/javascript">
      $(function () {
        $("#dialog_del").dialog({
          autoOpen: false,
          show: "blind",
          hide: "explode",
          modal: true,
          buttons: [
            {
              text: "确定",
              click: function () {
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
              click: function() {
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

        $("#dialog_delBtn").click(function () {
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
            let url = 'admin/uploadStudent.do';
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
          success: function (res) {
            alert(res);
          },
          error: function () {
            alert("修改失败");
          }
        })
      }
    </script>

    <!-- 查看系统管理员信息 -->
    <script type="text/javascript">
      $(function () {
        $.ajax({
          url: "admin/searchAdminDetail.do",
          type: "get",
          dataType: "json",
          success: function (admin) {
            document.getElementById("admin_detail_aName").value = admin.aName;
            document.getElementById("admin_detail_aID").value = admin.aID;
            document.getElementById("admin_detail_aSex").value = admin.aSex;
            document.getElementById("admin_detail_aIDcardNo").value = admin.aIDcardNo;
            document.getElementById("admin_detail_aPhoneNumber").value = admin.aPhoneNumber;
            document.getElementById("admin_detail_aEmail").value = admin.aEmail;
          }
        })
      })
    </script>

    <!-- 系统管理员修改个人信息 -->
    <script type="text/javascript">
      function ModifyAdminDetail() {
        $.ajax({
          url: "admin/modifyAdminDetail.do",
          type: "post",
          data: {
            aName: document.getElementById("admin_detail_aName").value,
            aID: document.getElementById("admin_detail_aID").value,
            aSex: document.getElementById("admin_detail_aSex").value,
            aIDcardNo: document.getElementById("admin_detail_aIDcardNo").value,
            aPhoneNumber: document.getElementById("admin_detail_aPhoneNumber").value,
            aEmail: document.getElementById("admin_detail_aEmail").value
          },
          success: function (res) {
            alert(res);
          },
          error: function () {
            alert("修改失败");
          }
        })
      }
    </script>

    <!-- 查看宿舍管理员信息 -->
    <script type="text/javascript">
      $(function () {
        // 当前页面dom对象加载后, 执行loadHouseparentData()
        loadHouseparentData();

        $("#houseparentInfoLoader").click(function () {
          loadHouseparentData();
        })
      })

      function loadHouseparentData() {
        $.ajax({
          url: "admin/displayHouseparent.do",
          type: "get",
          dataType: "json",
          success: function (houseparents) {
            // 清除旧的数据
            $("#houseparentInfo").html("");
            // 添加新的数据
            $.each(houseparents, function (i, houseparent) {
              $("#houseparentInfo").append("<tr>")
                  .append('<td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>')
                  .append('<td bgcolor="#FFFFFF">' + houseparent.hID + '</td>')
                  .append('<td bgcolor="#FFFFFF">' + houseparent.hName + '</td>')
                  .append('<td bgcolor="#FFFFFF">' + houseparent.hSex + '</td>')
                  .append('<td bgcolor="#FFFFFF">' + houseparent.dormID + '</td>')
                  .append('<td bgcolor="#FFFFFF"><a href="#" onclick="HparentTarget(\''+ houseparent.hID +'\')">详细信息</a></td>')
                  .append("</tr>")
            })
          }
        })
      }
    </script>

    <!-- 添加一个宿舍管理员 -->
    <script type="text/javascript">
      $(function () {
        $("#houseparent_dialog").dialog({
          autoOpen: false,
          show: "blind",
          hide: "explode",
          modal: true,
          buttons: [
            {
              text: "确定",
              click: function () {
                $.ajax({
                  url: "admin/addHouseparentSeparately.do",
                  data: {
                    hID: $("input[id=add_hID]").val(),
                    hName: $("input[id=add_hName]").val(),
                    hSex: $("input[id=add_hSex]").val(),
                    hIDcardNo: $("input[id=add_hIDcardNo]").val(),
                    hPassword: $("input[id=add_hPassword]").val(),
                    hPhoneNumber: $("input[id=add_hPhoneNumber]").val(),
                    hEmail: $("input[id=add_hEmail]").val(),
                    dormID: $("input[id=add_hdormID]").val()
                  },
                  type: "post",
                  // dataType: "json",
                  success: function (res) {
                    alert(res[0]);
                  },
                  error: function () {
                    alert("添加失败");
                  }
                })

                loadHouseparentData();
                $(this).dialog("close");
              }
            },
            {
              text: "取消",
              click: function () {
                $(this).dialog("close");
              }
            }
          ],
          closeOnEscape: false,
          title: "添加一个宿舍管理员",
          position: "center",
          width: 400,
          height: 330,
          resizable: false
        });

        $("#houseparent_dialog_link").click(function () {
          $("#houseparent_dialog").dialog("open");
        });
      })
    </script>

    <!-- 删除一个宿舍管理员 -->
    <script type="text/javascript">
      $(function () {
        $("#houseparent_dialog_del").dialog({
          autoOpen: false,
          show: "blind",
          hide: "explode",
          modal: true,
          buttons: [
            {
              text: "确定",
              click: function () {
                $.ajax({
                  url: "admin/delHouseparentSeparately.do",
                  data: {
                    hID: $("input[id=del_hID]").val()
                  },
                  type: "post",
                  dataType: "json",
                  success: function (res) {
                    alert(res[0]);
                  },
                  error: function () {
                    alert("删除失败");
                  }
                })

                loadHouseparentData();
                $(this).dialog("close");
              }
            },
            {
              text: "取消",
              click: function () {
                $(this).dialog("close");
              }
            }
          ],
          closeOnEscape: false,
          title: "删除一个宿舍管理员",
          position: "center",
          width: 400,
          height: 330,
          resizable: false,
        });

        $("#houseparent_dialog_delBtn").click(function () {
          $("#houseparent_dialog_del").dialog("open");
        });
      })
    </script>

    <!-- 导入一批宿舍管理员 -->
    <script type="text/javascript">
      let HouseparentSet = function() {
        this.init = function() {
          //模拟上传excel
          $("#houseparent_uploadEventBtn").unbind("click").bind("click", function() {
            $("#houseparent_uploadEventFile").click();
          });
          $("#houseparent_uploadEventFile").bind("change", function() {
            $("#houseparent_uploadEventPath").attr("value", $("#houseparent_uploadEventFile").val());
          });
        };
        //点击上传按钮
        this.uploadBtn = function() {
          let uploadEventFile = $("#houseparent_uploadEventFile").val();
          if(uploadEventFile == '') {
            alert("请选择Excel文件, 再上传");
          }
          else if(uploadEventFile.lastIndexOf(".xls") < 0) {
            alert("只能上传Excel文件");
          }
          else {
            let url = 'admin/uploadHouseparent.do';
            let formData = new FormData($('form')[1]);
            houseparentSet.sendAjaxRequest(url, 'POST', formData);
          }
        };
        this.sendAjaxRequest = function(url, type, data) {
          $.ajax({
            url: url,
            type: type,
            data: data,
            success: function(res) {
              loadHouseparentData();
              alert(res[0]);
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

      let houseparentSet;
      $(function() {
        houseparentSet = new HouseparentSet();
        houseparentSet.init();
      });
    </script>

    <!-- 系统管理员修改宿舍管理员信息 -->
    <script type="text/javascript">
      function ModifyHouseparentDetail() {
        $.ajax({
          url: "admin/modifyHouseparentDetail.do",
          type: "post",
          dataType: "json",
          data: {
            hName: document.getElementById("detail_hName").value,
            hID: document.getElementById("detail_hID").value,
            hSex: document.getElementById("detail_hSex").value,
            hIDcardNo: document.getElementById("detail_hIDcardNo").value,
            hPhoneNumber: document.getElementById("detail_hPhoneNumber").value,
            hEmail: document.getElementById("detail_hEmail").value,
            dormID: document.getElementById("detail_hDormID").value
          },
          success: function (res) {
            alert(res[0]);
          },
          error: function () {
            alert("修改失败");
          }
        })
      }
    </script>

    <!-- 查看宿舍楼栋信息 -->
    <script type="text/javascript">
      $(function () {
        // 当前页面dom对象加载后, 执行loadDormitoryData()
        loadDormitoryData();

        $("#dormitoryInfoLoader").click(function () {
          loadDormitoryData();
        })
      })

      function loadDormitoryData() {
        $.ajax({
          url: "admin/displayDormitory.do",
          type: "get",
          dataType: "json",
          success: function (dormitories) {
            // 清除旧的数据
            $("#dormitoryInfo").html("");
            // 添加新的数据
            $.each(dormitories, function (i, dormitory) {
              $("#dormitoryInfo").append("<tr>")
                  .append('<td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>')
                  .append('<td bgcolor="#FFFFFF">' + dormitory.dormID + "</td>")
                  .append('<td bgcolor="#FFFFFF">' + dormitory.numOfFloor + "</td>")
                  .append('<td bgcolor="#FFFFFF"><a href="#" onclick="DormTarget(\''+ dormitory.dormID +'\')">详细信息</a></td>')
                  .append("</tr>")
            })
          }
        })
      }
    </script>

    <!-- 添加一个宿舍楼栋 -->
    <script type="text/javascript">
      $(function () {
        $("#dormitory_dialog").dialog({
          autoOpen: false,
          show: "blind",
          hide: "explode",
          modal: true,
          buttons: [
            {
              text: "确定",
              click: function () {
                $.ajax({
                  url: "admin/addDormitorySeparately.do",
                  data: {
                    dormID: $("input[id=add_dDormID]").val(),
                    numOfFloor: $("input[id=add_dNumOfFloor]").val()
                  },
                  type: "post",
                  dataType: "json",
                  success: function (res) {
                    alert(res[0]);
                  },
                  error: function () {
                    alert("添加失败");
                  }
                })

                loadDormitoryData();
                $(this).dialog("close");
              }
            },
            {
              text: "取消",
              click: function () {
                $(this).dialog("close");
              }
            }
          ],
          closeOnEscape: false,
          title: "添加一个宿舍楼栋",
          position: "center",
          width: 400,
          height: 330,
          resizable: false
        });

        $("#dormitory_dialog_link").click(function () {
          $("#dormitory_dialog").dialog("open");
        });
      })
    </script>

    <!-- 删除一个宿舍楼栋 -->
    <script type="text/javascript">
      $(function () {
        $("#dormitory_dialog_del").dialog({
          autoOpen: false,
          show: "blind",
          hide: "explode",
          modal: true,
          buttons: [
            {
              text: "确定",
              click: function () {
                $.ajax({
                  url: "admin/delDormitorySeparately.do",
                  data: {
                    dormID: $("input[id=del_dDormID]").val()
                  },
                  type: "post",
                  dataType: "json",
                  success: function (res) {
                    alert(res[0]);
                  },
                  error: function () {
                    alert("删除失败");
                  }
                })

                loadDormitoryData();
                $(this).dialog("close");
              }
            },
            {
              text: "取消",
              click: function () {
                $(this).dialog("close");
              }
            }
          ],
          closeOnEscape: false,
          title: "删除一个宿舍楼栋",
          position: "center",
          width: 400,
          height: 330,
          resizable: false,
        });

        $("#dormitory_dialog_delBtn").click(function () {
          $("#dormitory_dialog_del").dialog("open");
        });
      })
    </script>

    <!-- 导入一批宿舍楼栋和房间 -->
    <script type="text/javascript">
      let DormitoryAndRoomSet = function() {
        this.init = function() {
          //模拟上传excel
          $("#dormitory_uploadEventBtn").unbind("click").bind("click", function() {
            $("#dormitory_uploadEventFile").click();
          });
          $("#dormitory_uploadEventFile").bind("change", function() {
            $("#dormitory_uploadEventPath").attr("value", $("#dormitory_uploadEventFile").val());
          });
        };
        //点击上传按钮
        this.uploadBtn = function() {
          let uploadEventFile = $("#dormitory_uploadEventFile").val();
          if(uploadEventFile == '') {
            alert("请选择Excel文件, 再上传");
          }
          else if(uploadEventFile.lastIndexOf(".xls") < 0) {
            alert("只能上传Excel文件");
          }
          else {
            let url = 'admin/uploadDormitoryAndRoom.do';
            let formData = new FormData($('form')[2]);
            dormitoryAndRoomSet.sendAjaxRequest(url, 'POST', formData);
          }
        };
        this.sendAjaxRequest = function(url, type, data) {
          $.ajax({
            url: url,
            type: type,
            data: data,
            dataType: "json",
            success: function(res) {
              loadDormitoryData();
              alert(res[0]);
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

      let dormitoryAndRoomSet;
      $(function() {
        dormitoryAndRoomSet = new DormitoryAndRoomSet();
        dormitoryAndRoomSet.init();
      });
    </script>

    <!-- 添加一个宿舍 -->
    <script type="text/javascript">
      $(function () {
        $("#room_dialog").dialog({
          autoOpen: false,
          show: "blind",
          hide: "explode",
          modal: true,
          buttons: [
            {
              text: "确定",
              click: function () {
                $.ajax({
                  url: "admin/addRoomSeparately.do",
                  data: {
                    roomID: $("input[id=add_rRoomID]").val(),
                    dormID: currentDormID,
                    numOfFloor: $("input[id=add_rNumOfFloor]").val(),
                    roomCapacity: $("input[id=add_roomCapacity]").val(),
                    roomState: $("input[id=add_roomState]").val()
                  },
                  type: "post",
                  dataType: "json",
                  success: function (res) {
                    alert(res[0]);
                  },
                  error: function () {
                    alert("添加失败");
                  }
                })

                DormTarget(currentDormID);
                $(this).dialog("close");
              }
            },
            {
              text: "取消",
              click: function () {
                $(this).dialog("close");
              }
            }
          ],
          closeOnEscape: false,
          title: "添加一个宿舍",
          position: "center",
          width: 400,
          height: 330,
          resizable: false
        });

        $("#room_dialog_link").click(function () {
          $("#room_dialog").dialog("open");
        });
      })
    </script>

    <!-- 删除一个宿舍 -->
    <script type="text/javascript">
      $(function () {
        $("#room_dialog_del").dialog({
          autoOpen: false,
          show: "blind",
          hide: "explode",
          modal: true,
          buttons: [
            {
              text: "确定",
              click: function () {
                $.ajax({
                  url: "admin/delRoomSeparately.do",
                  data: {
                    dormID: currentDormID,
                    roomID: $("input[id=del_rRoomID]").val()
                  },
                  type: "post",
                  dataType: "json",
                  success: function (res) {
                    alert(res[0]);
                  },
                  error: function () {
                    alert("删除失败");
                  }
                })

                DormTarget(currentDormID);
                $(this).dialog("close");
              }
            },
            {
              text: "取消",
              click: function () {
                $(this).dialog("close");
              }
            }
          ],
          closeOnEscape: false,
          title: "删除一个宿舍",
          position: "center",
          width: 400,
          height: 330,
          resizable: false,
        });

        $("#room_dialog_delBtn").click(function () {
          $("#room_dialog_del").dialog("open");
        });
      })
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
  <div id="header">
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
        <span class="infoText">姓名: </span><input id="admin_detail_aName" type="text" name="aName" value="超管姓名" readonly="readonly"><br>
        <span class="infoText">工号: </span><input id="admin_detail_aID" type="text" name="aID" value="超管ID" readonly="readonly"><br>
        <span class="infoText">性别: </span><input id="admin_detail_aSex" type="text" name="aSex" value="男"  readonly="readonly"><br>
        <span class="infoText">身份证号码: </span><input id="admin_detail_aIDcardNo" type="text" name="aIdCard" value="超管身份证号码" readonly="readonly"><br>
        <span class="infoText">手机号码: </span><input id="admin_detail_aPhoneNumber" type="tel" name="aPhone" value="超管手机号码" readonly="readonly"><br>
        <span class="infoText">邮箱地址: </span><input id="admin_detail_aEmail" type="email" name="aEmail" value="超管邮箱" readonly="readonly"><br>
        <input type="button" id="aAlter" value="修改">
        <input type="submit" id="aSave" value="保存" disabled="disabled" onclick="ModifyAdminDetail()">
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
            <td width="152" bgcolor="#EFEFEF" Name="sSex" EditType="DropDownList">性别</td>
            <td width="103" bgcolor="#EFEFEF" Name="dormID" EditType="DropDownList">宿舍楼</td>
            <td width="103" bgcolor="#EFEFEF" Name="roomID" EditType="DropDownList">房间号</td>
            <td width="120" bgcolor="#EFEFEF" Name="sDetail" >详细信息</td>
          </tr>
          </thead>

          <tbody id="studentInfo">

          </tbody>
        </table>

        <br>
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
        <form enctype="multipart/form-data" id="batchUpload" action="admin/uploadStudent.do" method="post" class="form-horizontal">
          <button class="btn btn-success btn-xs" id="uploadEventBtn" style="height:26px;" type="button">选择文件</button>
          <input type="file" name="file" style="width:0px;height:0px;" id="uploadEventFile">
          <input id="uploadEventPath" disabled="disabled" type="text">
        </form>
        <button type="button" class="btn btn-success btn-sm"  onclick="user.uploadBtn()">上传</button>

        <!-- 查看学生信息 -->
        <input type="button" id="btnLoader" value="查询所有学生">
      </div>
    </div>

    <!-- 学生详细信息模块 -->
    <div id="studentDetail" class="detailDivs">
      <div>
        <span class="infoText">姓名: </span> <input id="detail_sName" type="text" name="sName" value="学生的姓名" readonly> <br>
        <span class="infoText">学号: </span> <input id="detail_sID" type="text" name="sID" value="学生的学号" readonly> <br>
        <span class="infoText">性别: </span> <input id="detail_sSex" type="text" name="sSex" value="学生的性别" readonly> <br>
        <span class="infoText">身份证号: </span> <input id="detail_sIDcardNo" type="text" name="sIDcardNo" value="学生的身份证号码" readonly> <br>
        <span class="infoText">入学年份: </span> <input id="detail_sEnrollYear" type="text" name="sEnrollYear" value="学生的入学时间" readonly> <br>
        <span class="infoText">手机号码: </span> <input id="detail_sPhoneNumber" type="text" name="sPhone" value="学生的手机号码" readonly> <br>
        <span class="infoText">邮箱地址: </span> <input id="detail_sEmail" type="text" name="sEmail" value="学生的邮箱" readonly> <br>
        <span class="infoText">宿舍楼: </span> <input id="detail_dormID" type="text" name="dormID" value="学生所在宿舍楼" readonly> <br>
        <span class="infoText">房间号: </span> <input id="detail_roomID" type="text" name="roomID" value="学生所在的房间号" readonly> <br>
        <span class="infoText">在住状态: </span> <input id="detail_livingState" type="text" name="livingState" value="学生在住状态" readonly> <br>
        <span class="infoText">在校状态: </span> <input id="detail_schoolState" type="text" name="schoolState" value="学生在校状态" readonly> <br>
        <input type="button" id="sAlter" value="修改">
        <input type="submit" id="sSave" value="保存" disabled="disabled" onclick="ModifyStudentDetail()">
      </div>
    </div>

    <!-- 宿舍管理员模块 -->
    <div id = "hparent" class="functDivs">
      <div id="hform" name="hform">
        <table width="698" border="0" cellpadding="0" cellspacing="0" id="hparentTable">
          <thead>
          <tr>
            <td width="32" align="center" bgcolor="#EFEFEF" Name="Num"><input type="checkbox" name="checkbox" value="checkbox" /></td>
            <td width="186" bgcolor="#EFEFEF" Name="hID" EditType="TextBox">工号</td>
            <td width="186" bgcolor="#EFEFEF" Name="hName" EditType="TextBox">姓名</td>
            <td width="152" bgcolor="#EFEFEF" Name="hSex" EditType="TextBox">性别</td>
            <td width="123" bgcolor="#EFEFEF" Name="dormID" EditType="TextBox">管理的宿舍楼</td>
            <td width="120" bgcolor="#EFEFEF" Name="hDetail">详细信息</td>
          </tr>
          </thead>

          <tbody id="houseparentInfo">

          </tbody>
        </table>

        <br>
        <!-- 添加一个宿舍管理员 -->
        <button id="houseparent_dialog_link">添加一个宿舍管理员</button>
        <div id="houseparent_dialog" align="center">
          <br>
          工号: <input type="text" id="add_hID" name="addName_hID"> <br> <br>
          姓名: <input type="text" id="add_hName" name="addName_hName"> <br> <br>
          性别: <input type="text" id="add_hSex" name="addName_hSex"> <br> <br>
          身份证号码: <input type="text" id="add_hIDcardNo" name="addName_hIDcardNo"> <br> <br>
          密码: <input type="text" id="add_hPassword" name="addName_hPassword"> <br> <br>
          手机号码: <input type="text" id="add_hPhoneNumber" name="addName_hPhoneNumber"> <br> <br>
          邮箱地址: <input type="text" id="add_hEmail" name="addName_hEmail"> <br> <br>
          管理的楼栋号: <input type="text" id="add_hdormID" name="addName_hdormID"> <br> <br>
        </div>

        <!-- 删除一个宿舍管理员 -->
        <br> <br>
        <button id="houseparent_dialog_delBtn">删除一个宿舍管理员</button>
        <div id="houseparent_dialog_del" align="center">
          <br>
          工号: <input type="text" id="del_hID" name="delName_hID"> <br> <br>
        </div>

        <input type="button" name="hSubmit22" value="重置" onclick="window.location.reload()" />

        <!-- 导入一批宿舍管理员 -->
        <form enctype="multipart/form-data" id="houseparent_batchUpload" action="admin/uploadHouseparent.do" method="post" class="form-horizontal">
          <button class="btn btn-success btn-xs" id="houseparent_uploadEventBtn" style="height:26px;" type="button">选择文件</button>
          <input type="file" name="file" style="width:0px;height:0px;" id="houseparent_uploadEventFile">
          <input id="houseparent_uploadEventPath" disabled="disabled" type="text">
        </form>
        <button type="button" class="btn btn-success btn-sm"  onclick="houseparentSet.uploadBtn()">上传</button>

        <!-- 查看宿舍管理员信息 -->
        <input type="button" id="houseparentInfoLoader" value="查询所有宿舍管理员">
      </div>
    </div>

    <!-- 宿舍管理员详细信息模块 -->
    <div id="hparentDetail" class="detailDivs">
      <div>
        <span class="infoText">姓名: </span> <input id="detail_hName" type="text" name="hName" value="宿管的姓名" readonly> <br>
        <span class="infoText">工号: </span> <input id="detail_hID" type="text" name="hID" value="宿管的工号" readonly> <br>
        <span class="infoText">性别: </span> <input id="detail_hSex" type="text" name="hSex" value="宿管的性别" readonly> <br>
        <span class="infoText">身份证号码: </span> <input id="detail_hIDcardNo" type="text" name="hIDcardNo" value="宿管的身份证号码" readonly> <br>
        <span class="infoText">手机号码: </span> <input id="detail_hPhoneNumber" type="text" name="hPhone" value="宿管的手机号码" readonly> <br>
        <span class="infoText">邮箱地址: </span> <input id="detail_hEmail" type="text" name="hEmail" value="宿管的邮箱" readonly> <br>
        <span class="infoText">管理的宿舍楼: </span> <input id="detail_hDormID" type="text" name="dormID" value="管理的宿舍楼" readonly> <br>
        <input type="button" id="hAlter" value="修改">
        <input type="submit" id="hSave" value="保存" disabled="disabled" onclick="ModifyHouseparentDetail()">
      </div>
    </div>

    <!-- 宿舍楼模块 -->
    <div id = "dorm" class="functDivs">
      <div id="dform" name="dform">
        <table width="698" border="0" cellpadding="0" cellspacing="0" id="dormTable">
          <thead>
          <tr>
            <td width="32" align="center" bgcolor="#EFEFEF" Name="Num"><input type="checkbox" name="checkbox" value="checkbox" /></td>
            <td width="186" bgcolor="#EFEFEF" Name="dID" EditType="TextBox">宿舍楼栋号</td>
            <td width="186" bgcolor="#EFEFEF" Name="numOfFloor" EditType="TextBox">总楼层数</td>
            <td width="120" bgcolor="#EFEFEF" Name="dDetail">详细信息</td>
          </tr>
          </thead>

          <tbody id="dormitoryInfo">

          </tbody>
        </table>

        <br>
        <!-- 添加一个宿舍楼栋 -->
        <button id="dormitory_dialog_link">添加一个宿舍楼栋</button>
        <div id="dormitory_dialog" align="center">
          <br>
          楼栋号: <input type="text" id="add_dDormID" name="addName_dDormID"> <br> <br>
          总层数: <input type="text" id="add_dNumOfFloor" name="addName_dNumOfFloor"> <br> <br>
        </div>

        <!-- 删除一个宿舍楼栋 -->
        <br> <br>
        <button id="dormitory_dialog_delBtn">删除一个宿舍楼栋</button>
        <div id="dormitory_dialog_del" align="center">
          <br>
          宿舍楼栋号: <input type="text" id="del_dDormID" name="delName_dDormID"> <br> <br>
        </div>

        <input type="button" name="dSubmit22" value="重置" onclick="window.location.reload()" />

        <!-- 导入一批宿舍楼栋和房间 -->
        <form enctype="multipart/form-data" id="dormitory_batchUpload" action="admin/uploadDormitoryAndRoom.do" method="post" class="form-horizontal">
          <button class="btn btn-success btn-xs" id="dormitory_uploadEventBtn" style="height:26px;" type="button">选择文件</button>
          <input type="file" name="file" style="width:0px;height:0px;" id="dormitory_uploadEventFile">
          <input id="dormitory_uploadEventPath" disabled="disabled" type="text">
        </form>
        <button type="button" class="btn btn-success btn-sm"  onclick="dormitoryAndRoomSet.uploadBtn()">上传</button>

        <!-- 查看所有宿舍楼栋信息 -->
        <input type="button" id="dormitoryInfoLoader" value="查询所有宿舍楼栋">
      </div>
    </div>

    <!-- 宿舍楼详细信息模块 -->
    <div id="dormDetail" class="detailDivs">
      <div id="rform" name="rform">
        <table width="698" border="0" cellpadding="0" cellspacing="0" id="roomTable">
          <thead>
          <tr>
            <td width="32" align="center" bgcolor="#EFEFEF" Name="Num"><input type="checkbox" name="checkbox" value="checkbox" /></td>
            <td width="186" bgcolor="#EFEFEF" Name="dID" EditType="TextBox">宿舍楼栋号</td>
            <td width="186" bgcolor="#EFEFEF" Name="numOfFloor" EditType="TextBox">总楼层数</td>
            <td width="186" bgcolor="#EFEFEF" Name="rID" EditType="TextBox">宿舍房间号</td>
            <td width="186" bgcolor="#EFEFEF" Name="rNumOfFloor" EditType="TextBox">宿舍所在楼层</td>
            <td width="186" bgcolor="#EFEFEF" Name=" roomCapacity" EditType="TextBox">宿舍容纳人数</td>
            <td width="186" bgcolor="#EFEFEF" Name="roomState" EditType="TextBox">宿舍状态</td>
          </tr>
          </thead>

          <tbody id="dormitoryAndRoomDetail">

          </tbody>
        </table>

        <br>
        <!-- 添加一个宿舍 -->
        <button id="room_dialog_link">添加一个宿舍</button>
        <div id="room_dialog" align="center">
          <br>
          宿舍房间号: <input type="text" id="add_rRoomID" name="addName_rRoomID"> <br> <br>
          宿舍所在楼层: <input type="text" id="add_rNumOfFloor" name="addName_rNumOfFloor"> <br> <br>
          宿舍容纳人数: <input type="text" id="add_roomCapacity" name="addName_roomCapacity"> <br> <br>
          宿舍状态: <input type="text" id="add_roomState" name="addName_roomState"> <br> <br>
        </div>

        <!-- 删除一个宿舍楼栋 -->
        <br> <br>
        <button id="room_dialog_delBtn">删除一个宿舍楼栋</button>
        <div id="room_dialog_del" align="center">
          <br>
          宿舍房间号: <input type="text" id="del_rRoomID" name="delName_rRoomID"> <br> <br>
        </div>

        <input type="button" name="dSubmit22" value="重置" onclick="window.location.reload()" />

        <!-- 查看宿舍楼栋详细信息 -->
        <input type="button" id="roomInfoLoader" onclick="DormTarget(currentDormID)" value="刷新">
      </div>
    </div>
  </div>

  </body>

  <script>
    // 保存当前页面是哪个宿舍楼栋的详细信息
    let currentDormID;

    let menuLists = document.querySelector("#menu").querySelectorAll("li");
    let functDivs = document.querySelectorAll(".functDivs");
    let detailDivs = document.querySelectorAll(".detailDivs");
    for(let i = 0; i < menuLists.length; i++) {
      menuLists[i].addEventListener("click", function() {
        let j = 0;
        let k = 0;
        for(;j < functDivs.length; j++) {
          functDivs[j].style.display = "none";
          if(menuLists[j] == this) {
            k = j;
          }
        }
        for(let l = 0; l < detailDivs.length; l++) {
          detailDivs[l].style.display = "none";
        }
        let nav = document.querySelector("#nav")
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

    let aAlter = document.querySelector("#aAlter");
    let aSave = document.querySelector("#aSave");
    let infoInputs = document.querySelector("#info").querySelectorAll("input");
    aAlter.addEventListener("click", function() {
      this.disabled = true;
      aSave.disabled = false;
      for(let i = 0; i < infoInputs.length-2; i++) {
        infoInputs[i].readOnly = false;
      }
    })
    aSave.addEventListener("click", function() {
      this.disabled = true;
      aAlter.disabled = false;
      for(let i = 0; i < infoInputs.length-2; i++) {
        infoInputs[i].readOnly = true;
      }
    })

    let sAlter = document.querySelector("#sAlter");
    let sSave = document.querySelector("#sSave");
    let studInputs = document.querySelector("#studentDetail").querySelectorAll("input");
    sAlter.addEventListener("click", function() {
      this.disabled = true;
      sSave.disabled = false;
      for(let i = 0; i < studInputs.length-2; i++) {
        studInputs[i].readOnly = false;
      }
    })
    sSave.addEventListener("click", function() {
      this.disabled = true;
      sAlter.disabled = false;
      for(let i = 0; i < studInputs.length-2; i++) {
        studInputs[i].readOnly = true;
      }
    })

    let hAlter = document.querySelector("#hAlter");
    let hSave = document.querySelector("#hSave");
    let hparentInputs = document.querySelector("#hparentDetail").querySelectorAll("input");
    hAlter.addEventListener("click",function(){
      this.disabled = true;
      hSave.disabled = false;
      for(let i = 0; i < hparentInputs.length-2; i++) {
        hparentInputs[i].readOnly = false;
      }
    })
    hSave.addEventListener("click", function() {
      this.disabled = true;
      hAlter.disabled = false;
      for(let i = 0; i < hparentInputs.length-2; i++) {
        hparentInputs[i].readOnly = true;
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

    // 跳转到宿舍管理员详细信息界面, 并显示该名宿舍管理员的详细信息
    let houseparentDetail = function () {
      this.searchHouseparentDetail = function (hID) {
        <!-- 进入到宿舍管理员详细信息界面时, 发起异步请求: 根据工号查询其详细信息 -->
        $.ajax({
          url: "admin/searchHouseparentDetail.do",
          type: "post",
          dataType: "json",
          data: {
            hID: hID
          },
          success: function (houseparent) {
            document.getElementById("detail_hName").value = houseparent.hName;
            document.getElementById("detail_hID").value = houseparent.hID;
            document.getElementById("detail_hSex").value = houseparent.hSex;
            document.getElementById("detail_hIDcardNo").value = houseparent.hIDcardNo;
            document.getElementById("detail_hPhoneNumber").value = houseparent.hPhoneNumber;
            document.getElementById("detail_hEmail").value = houseparent.hEmail;
            document.getElementById("detail_hDormID").value = houseparent.dormID;
          }
        })
      }
    }

    let searchDetail_houseparent;
    $(function () {
      searchDetail_houseparent = new houseparentDetail();
    });

    function HparentTarget(hID) {
      for(let j = 0; j < functDivs.length; j++) {
        functDivs[j].style.display = "none";
      }
      let hparentDetail = document.querySelector("#hparentDetail");
      hparentDetail.style.display = "block";

      searchDetail_houseparent.searchHouseparentDetail(hID);
    }

    // 跳转到宿舍楼栋详细信息界面, 并显示该宿舍楼栋的详细信息
    let dormitoryDetail = function () {
      this.searchDormitoryDetail = function (dormID) {
        <!-- 进入到宿舍楼栋详细信息界面时, 发起异步请求: 根据宿舍楼栋号查询其详细信息 -->
        $.ajax({
          url: "admin/searchDormitoryDetail.do",
          type: "post",
          dataType: "json",
          data: {
            dormID: dormID
          },
          success: function (dormitoryAndRoomList) {
            // 清除旧的数据
            $("#dormitoryAndRoomDetail").html("");
            // 添加新的数据
            $.each(dormitoryAndRoomList, function (i, dormitoryAndRoom) {
              $("#dormitoryAndRoomDetail").append("<tr>")
                  .append('<td align="center" bgcolor="#FFFFFF"><input type="checkbox" name="checkbox2" value="checkbox" /></td>')
                  .append('<td bgcolor="#FFFFFF">' + dormitoryAndRoom.dormID + '</td>')
                  .append('<td bgcolor="#FFFFFF">' + dormitoryAndRoom.dormNumOfFloor + '</td>')
                  .append('<td bgcolor="#FFFFFF">' + dormitoryAndRoom.roomID + '</td>')
                  .append('<td bgcolor="#FFFFFF">' + dormitoryAndRoom.roomNumOfFloor + '</td>')
                  .append('<td bgcolor="#FFFFFF">' + dormitoryAndRoom.roomCapacity + '</td>')
                  .append('<td bgcolor="#FFFFFF">' + dormitoryAndRoom.roomState + '</td>')
                  .append("</tr>")
            })
          }
        })
      }
    }

    let searchDetail_dormitory;
    $(function () {
      searchDetail_dormitory = new dormitoryDetail();
    });

    function DormTarget(dormID) {
      for(let j = 0; j < functDivs.length; j++) {
        functDivs[j].style.display = "none";
      }
      let dormDetail = document.querySelector("#dormDetail");
      dormDetail.style.display = "block";

      currentDormID = dormID;
      searchDetail_dormitory.searchDormitoryDetail(dormID);
    }
  </script>

  <script language="javascript" src="${pageContext.request.contextPath}/js/Admin/adminModel.js"></script>
  <script language="javascript">
    let studTable = document.getElementById("studTable");
    SetTableCanEdit(studTable);

    let hparentTable = document.getElementById("hparentTable");
    SetTableCanEdit(hparentTable);

    let dormTable = document.getElementById("dormTable");
    SetTableCanEdit(dormTable);

    let roomTable = document.getElementById("roomTable");
    SetTableCanEdit(roomTable);
  </script>

</html>
