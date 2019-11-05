<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

    <div class="bt" style="margin-left: 92%;margin-top: 30px;">
        <a href="<c:url value="/logout" />">
    <input type="submit" value="logout" class="btn btn-primary" />
</a>

</div>
<div  class="container mySpace">
    <div class="alert alert-info">
        <p class="text text-center">
          <h2 align="center">  All  users Data. Sorted by random column</h2>
        <h4 align="center">Note. The action available only ADMIN users</h4>

        </p>
    </div>
</div>
<div class="container mySpace">
    <div class="card" style="overflow-y: scroll;
    height: auto;
    width: 1150px;">
        <div class="card card-body">
            <table class="table table-hover">
                <thead>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Age</th>
        <th>Random Number</th>
        <th>Address</th>
        <th>Password</th>
        <th>Action</th>
    </tr>
    <c:forEach var="users" items="${users}">
        <tr>
            <td><c:out value="${users.name}" /></td>
            <td><c:out value="${users.email}" /></td>
            <td><c:out value="${users.age}" /></td>
            <td><c:out value="${users.random}" /></td>
            <td><c:out value="${users.address}" /></td>
            <td><c:out value="${users.password}" /></td>
            <c:if test="${role=='[ROLE_ADMIN]'}">
            <td><a href="${pageContext.request.contextPath}/delete?get=${users.email}">delete</a></td>
            </c:if>
            <c:if test="${role=='[ROLE_USER]'}">
                <td><a href="${pageContext.request.contextPath}/delete?get=${users.email}" class="disabled">delete</a></td>
            </c:if>
        </tr>
    </c:forEach>
                </thead>
                <tbody>
                <tr>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
