<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.UserDao" %>
<jsp:useBean id="u" class="com.crud.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int i = UserDao.update(u);
response.sendRedirect("viewusers.jsp");
%>
</body>
</html>