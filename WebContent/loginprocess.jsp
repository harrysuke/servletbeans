<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.crud.bean.User" %>
<%@page import="com.crud.dao.UserDao" %>
<%@page import="javax.servlet.http.HttpSession" %>
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
<jsp:useBean id="login" class="com.crud.dao.UserDao"></jsp:useBean>
<jsp:setProperty property="*" name="login"></jsp:setProperty>
<%
UserDao ud = new UserDao();
String email = request.getParameter("email");
String password = request.getParameter("password");
String userId, name, sex, country;
HttpSession s = request.getSession();

User user = UserDao.login(email, password, session);
if(user != null){
	userId = (String)s.getAttribute("userIDKey");
	name = (String)s.getAttribute("name");
	email = (String)s.getAttribute("email");
	sex = (String)s.getAttribute("sex");
	country = (String)s.getAttribute("country");
	
	out.println("You are logged in.<a href='logout.jsp'>Log Out</a>");
	out.println(userId);
	out.println(name);
	out.println(email);
	out.println(sex);
	out.println(country);
}else{
	out.println("Please login.");
}
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>