<%--
  Created by IntelliJ IDEA.
  User: zjt
  Date: 2021/6/12
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
  <div align="center">
    <form action="login.do" method="post">
      账号: <input type="text" name="id"> <br>
      密码: <input type="text" name="password"> <br>
      学生 <input type="radio" name="identity" value="student">
      宿管 <input type="radio" name="identity" value="houseparent">
      系统管理员 <input type="radio" name="identity" value="superAdmin"> <br>
      <input type="submit" value="登录">
    </form>
  </div>
</body>
</html>
