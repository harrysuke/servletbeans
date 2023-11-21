<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.UserDao" %>
<%@page import="com.crud.bean.User" %>
<%@page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%
String searchTerm = request.getParameter("search");
List<User> userList = UserDao.searchUsers(searchTerm);
request.setAttribute("userList", userList);
%>
<table class="table">
<tr>
<thead>
<th>ID</th>
<th>Name</th>
<th>Password</th>
<th>Email</th>
<th>Sex</th>
<th>Country</th>
</thead>
</tr>
<%for (User u : userList){ %>
<tr>
<td><%= u.getId() %></td>
<td><%= u.getName() %></td>
<td><%= u.getPassword() %></td>
<td><%= u.getEmail() %></td>
<td><%= u.getSex() %></td>
<td><%= u.getCountry() %></td>
</tr>
<%} %>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>