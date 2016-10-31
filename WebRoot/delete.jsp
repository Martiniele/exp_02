<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.dao.IUserDao"%>
<%@ page import="com.dao.impl.UserDao"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<base href="<%=basePath%>">
<head>
<meta charset="UTF-8">
<!-- 优先使用 IE 最新版本和 Chrome -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- 页面关键词 -->
<meta name="keywords" content="">
<!-- 页面描述 -->
<meta name="description" content="不超过150个字符">
<title>删除用户操作</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		IUserDao userDAO = new UserDao();
		boolean flag = userDAO.deleteUser(Integer.valueOf(id));
		if (flag) {
			response.sendRedirect("show_all.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}
	%>
</body>
</html>