<%--
  Created by IntelliJ IDEA.
  User: zjt
  Date: 2021/6/12
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="author" content="Kodinger">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>My Login Page</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/my-login.css">
</head>

<body class="my-login-page">
<section class="h-100">
  <div class="container h-100">
    <div class="row justify-content-md-center h-100">
      <div class="card-wrapper">
        <div class="brand">
          <img src="${pageContext.request.contextPath}/img/logo.jpg" alt="logo">
        </div>
        <div class="card fat">
          <div class="card-body">
            <h4 class="card-title">Login</h4>
            <form action="login.do" method="POST" class="my-login-validation" novalidate="">
              <div class="form-group">
                <label for="userID">User ID</label>
                <input id="userID" type="text" class="form-control" name="id" value="" required autofocus>
              </div>

              <div class="form-group">
                <label for="password">Password</label>
                <input id="password" type="password" class="form-control" name="password" required data-eye>
                <div class="invalid-feedback">
                  Password is required
                </div>
              </div>

              <div class="form-group">
                <div class="custom-checkbox custom-control">
                  学生 <input type="radio" name="identity" value="student">
                  宿舍管理员 <input type="radio" name="identity" value="houseparent">
                  系统管理员 <input type="radio" name="identity" value="superAdmin">
                </div>
              </div>

              <div class="form-group m-0">
                <button type="submit" class="btn btn-primary btn-block">
                  Login
                </button>
              </div>
            </form>
          </div>
        </div>
        <div class="footer">
          Copyright &copy; 2021 &mdash; SCUT
        </div>
      </div>
    </div>
  </div>
</section>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/my-login.js"></script>
</body>
</html>

