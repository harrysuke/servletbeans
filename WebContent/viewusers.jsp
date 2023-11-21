<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.crud.dao.UserDao"%>
<%@ page import="com.crud.bean.*"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<a href="adduserform.jsp" class="btn btn-primary">Add new user</a>
<table class="table table-bordered">
<thead>
<tr>
<th>ID</th>
<th>Name</th>
<th>Password</th>
<th>Email</th>
<th>Sex</th>
<th>Country</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
List<User> list = UserDao.getAllRecords();
request.setAttribute("list",list);
%>
<c:forEach var="user" items="${list}">
<tr>
<td><c:out value="${user.id}"/></td>
<td><c:out value="${user.name}"/></td>
<td><c:out value="${user.password}"/></td>
<td><c:out value="${user.email}"/></td>
<td><c:out value="${user.sex}"/></td>
<td><c:out value="${user.country}"/></td>
<td>
<a href="editform.jsp?id=${user.getId()}"><i class="bi bi-pencil"></i></a>
<a href="deleteuser.jsp?id=${user.getId()}"><i class="bi bi-trash text-danger"></i></a>
</td>
</tr>
</c:forEach>

</tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>