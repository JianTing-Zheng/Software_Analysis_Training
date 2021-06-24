<%--
  Created by IntelliJ IDEA.
  User: zjt
  Date: 2021/6/12
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String basePath = request.getScheme() + "://" +
          request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
  <title>Title</title>
  <base href="<%=basePath%>" />
</head>
<body>
  <div align="center">
    <h3>系统管理员首页</h3>
    <a href="page_admin_StudentModel.do">学生模块</a>
    <a href="page_admin_HouseparentModel.do">宿舍管理员模块</a>
    <a href="page_admin_lkx.do">学生模块2</a>
  </div>
</body>
</html>
