<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>编辑用户信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("username");
	String pwd = request.getParameter("password");
%>
<body>
	<div align="center">
		<form action="doedit.jsp" method="post">
			<input type="hidden" name="id" value="<%=id%>"><br> <input
				type="text" name="username" value="<%=name%>"><br> <input
				type="text" name="password" value="<%=pwd%>"><br> <input
				type="submit" value="提交">
		</form>
		<a href="show_all.jsp">返回上一页</a>
	</div>
</body>
</html>
