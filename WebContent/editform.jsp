<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.UserDao"%>
<%@page import="com.crud.bean.*"%>
<%@page import="java.util.*" %>
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
String id = request.getParameter("id");
User u = UserDao.getRecordById(Integer.parseInt(id));
%>
<form method="post" action="edituser.jsp">
<input type="hidden" name="id" value="<%=u.getId()%>"/>
<div class="mb-3">
<input type="text" name="name" value="<%=u.getName()%>"/>
</div>
<div class="mb-3">
<input type="password" name="password" value="<%=u.getPassword()%>"/>
</div>
<div class="mb-3">
<input type="email" name="email" value="<%=u.getEmail()%>"/>
</div>
<div class="mb-3">
<input type="text" name="sex" value="<%=u.getSex()%>"/>
</div>
<div class="mb-3">
<input type="text" name="country" value="<%=u.getCountry()%>"/>
</div>
<div class="mb-3">
<button type="submit" name="submit" class="btn btn-primary">Edit user</button>
</div>

</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>