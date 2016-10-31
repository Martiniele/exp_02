<%@page import="java.sql.ResultSet"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.dao.IUserDao"%>
<%@ page import="com.dao.impl.UserDao"%>
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

<title>显示所有用户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%
		UserDao ud = new UserDao();
		List<User> users = ud.getAllUsers();
	%>

	<table border="1" align="center">
		<tr>
     		<td><h3>ID</h3></td>
     		<td><h3>用户名</h3></td>
     		<td><h3>密码</h3></td>
     		<td><h3>操作1</h3></td>
     		<td><h3>操作2</h3></td>
     	</tr>
		<%
			for (int i = 0; i < users.size(); i++) {
				User user = users.get(i);
				int id = user.getId();
				String name = user.getUsername();
				String pwd = user.getPassword();
		%>
		<tr>
			<td><h5><%=id%></h5></td>
			<td><h5><%=name%></h5></td>
			<td><h5><%=pwd%></h5></td>
			<td><h5>
					<form action="edituser.jsp" method="post">
						<input type="hidden" name="id" value=<%=id%>> <input
							type="hidden" name="username" value=<%=name%>> <input
							type="hidden" name="password" value=<%=pwd%>> <input
							type="submit" value="编辑">
					</form>
				</h5></td>
			<td><h5>
					<form action="delete.jsp" method="post">
						<input type="hidden" name="id" value=<%=id%>> <input
							type="submit" value="删除">
					</form>
				</h5></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<br>
	<br>
	<div align="center">
		<form action="add.jsp" method="post">
			账号<input type="text" name="username"><br> 密码<input
				type="text" name=password><br> <input type="submit"
				value="添加">
		</form>
		<a href="index.jsp">退出系统</a>
	</div>
</body>
</html>
