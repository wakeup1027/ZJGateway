<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="IE=edge" />
	<title>汕尾招商(登陆)</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/htrk.css">
</head>
<body>
	<div class="htdl">
		<div class="zb">
			<p>INVEST SHANWEI <span>system</span></p>
			<h4>招商引资管理工作平台</h4>
		</div>
	
		<div class="htdl1">
			<form action="userlogin_loginJump.action" method="post">
				<input type="text" name="userName" placeholder="请输入用户名"/>
				<input type="password" name="passWord" placeholder="请输入密码"/>
				<div class="anniu">	
					<input type="submit" value="登录" />
					<input type="reset" value="重置" />
				</div>
				<div style="color: red;text-align:center;">${msg }</div>
			</form>
		</div>
	</div>
</body>	
</html>