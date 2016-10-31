<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<base href="<%=basePath%>">
<head>
<meta charset="UTF-8">
<!-- 优先使用 IE 最新版本和 Chrome -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>登录验证</title>
</head>
<body>
<div align="center">
	<form action="validate.jsp" method="post">
		<label for="username">用户名：</label>
		<input type="text" id="username" name="username"/>
		<br />
		<label for="password">密&nbsp;码：</label>
		<input type="password" id="password" name="password"/>
		<br/>
		<input type=submit value="登录">
	</form>
	</div>
</body>
</html>