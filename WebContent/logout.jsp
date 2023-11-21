<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.crud.bean.User, com.crud.dao.UserDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession s = request.getSession();
UserDao.logout(s);
response.sendRedirect("login.jsp");
%>
</body>
</html>