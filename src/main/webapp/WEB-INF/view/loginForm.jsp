<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Register Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

</head>
<body>

<c:if test="${param.error=='?error'}">
    <div  class="container mySpace">
        <div class="alert alert-info">
            <p class="text text-center">
                Wrong password or email
            </p>
        </div>
    </div></c:if>

<c:if test="${not empty success}">
    <div  class="container mySpace">
        <div class="alert alert-info">
            <p class="text text-center">
                Registration success!! Please sign in  to Continue
            </p>
        </div>
    </div></c:if>
<div  class="container mySpace" style="width: 50%">
    <div class="alert alert-info">
        <p class="text text-center">
<h1 align="center">Login Form</h1>

    </div>
    <form action="/login"  method="post">
        <div class="form-group">
            <label for="email" class="form-control-label">Email</label>
            <input type="text" class="form-control"  id="email" name="username" />

        </div>
        <div class="form-group ">
            <label for="password" class="form-control-label">Password</label>
            <input type="password" class="form-control" id="password"  name="password"/>
        </div>
        <input type="submit" value="Login" class="btn btn-primary" />

    </form>
    <div id="reg" style="margin-top: -37px;margin-left: 100px;">
    <a href="/register">
        <input type="submit" value="Register" class="btn btn-primary" />
    </a></div>
</div>
</body>
</html>
