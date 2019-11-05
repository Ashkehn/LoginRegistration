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
<c:if test="${empty exist}">
    <div  class="container mySpace" style="width: 50%">
        <div class="alert alert-info">
            <p class="text text-center">
                <h2 align="center">REGISTRATION</h2>
            </p>
        </div>

    </c:if>
<c:if test="${not empty exist}">
<div  class="container mySpace">
    <div class="alert alert-info">
        <p class="text text-center">
            User with this Email already Exist
        </p>
    </div>
    </div></c:if>
<c:if test="${not empty name_pass}">
<div  class="container mySpace" >
    <div class="alert alert-info">
        <p class="text text-center">
            Password must be at least 6 symbols,email and username note empty
        </p>
    </div>
    </div></c:if>

<div class="container mySpace">
    <form action="${pageContext.request.contextPath}/register"   method="post">

        <div class="form-group">
            <label for="email" class="form-control-label">Email</label> <input
                type="text" class="form-control"  id="email" name="email" />
            <div class="text text-danger"
              ></div>
        </div>
        <div class="form-group">
            <label for="password" class="form-control-label">Password</label> <input
                type="password" class="form-control"
                id="password" name="password" />
            <div class="text text-danger"
               ></div>

        </div>
        <div class="form-group">
            <label for="name" class="form-control-label">Name</label> <input
                type="text" class="form-control"  id="name" name="name" />
            <div class="text text-danger"></div>
        </div>
        <div class="form-group">
            <label for="name" class="form-control-label">Address</label> <input
                type="text" class="form-control"  id="address" name="address" />
            <div class="text text-danger"></div>
        </div>
        <div class="form-group">
            <label for="age" class="form-control-label">Age</label> <input
                type="text" class="form-control"  id="age" name="Age" />
            <div class="text text-danger"></div>
        </div>
        <br>
        <div class="form-group">
            <label>
                <input type="radio" name="rol" value="ADMIN" checked="checked">
            </label> Admin
            <label>
                <input type="radio" name="rol" value="USER">
            </label>User
        </div>
        <input type="submit" value="Register" class="btn btn-primary" />
        <br>

        <a href="${pageContext.request.contextPath}/login">Back To Login Page</a>
    </form>
</div>
</div>
</body>
</html>
