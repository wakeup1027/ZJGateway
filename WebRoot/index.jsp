<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<script type="text/javascript">
setTimeout("window.opener=null;window.location.href='gateway.action'",1);
</script>
</body>
</html>