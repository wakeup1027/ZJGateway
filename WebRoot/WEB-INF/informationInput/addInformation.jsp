<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>汕尾门户管理系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=8" />
	<meta name="renderer" content="webkit">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link type="text/css" href="resource/css/header.css" rel="stylesheet">
<link type="text/css" href="resource/css/box.css" rel="stylesheet">
<link type="text/css" href="resource/css/validationEngine.jquery.css" rel="stylesheet">

<link href="resource/css/proLibStyle.css" rel="stylesheet" type="text/css">


<link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/uploadify/uploadify.css">
<script src="${pageContext.request.contextPath}/resource/js/jquery-1.7.2.min.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>resource/uploadify/jquery.uploadify.js?id=<%=System.currentTimeMillis()%>"></script>

<script src="${pageContext.request.contextPath}/resource/js/common.js" language="javascript" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resource/js/jquery.validationEngine.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/jquery.validationEngine-cn.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" src="resource/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="resource/js/box.js"></script>
<script src="resource/bootstrap-3.3.4-dist/js/bootstrap.js"	type="text/javascript"></script>
<script type="text/javascript" src="resource/js/pro.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/industryType.js"></script> 
<script src="${pageContext.request.contextPath}/resource/js/jquery.cityselect.js"></script>
<style>
#main {
	width: 100%;
}

#right {
	float: right;
	background-color: #F9F9F7;
	width: 88%;

	border: 1px #FFCDB4 solid;
}



#operation ul li {
	float: left;
	list-style-type: none;
	margin-left: 5px;
}

.button {
	font-size: 12px;
	cursor: pointer;
	border: 1px solid;
	color: #FFF;
	background-color: #E78D66;
	border-radius: 5px;
	padding: 5px;
}

.button:hover {
	background-color: #E75116;
}

#operation ul li span {
	color: #CCC;
}

#operation {
	height: 30px;
}

#left ul li a {
	text-decoration: none;
	color: #000;
}

.ui-edit { /*padding-bottom: 10px;*/
	
}

.ui-edit-table {
	border: 1px solid #E8DBD5; /*#D5DFE8;//#CCCCCC;*/
	background: #FFFFFF;
	border-collapse: collapse;
}

.ui-edit-table tr th {
	background-color: #FFF0CF; /*#FFF5D0;//#F7F1EE;//#EEF3F7;*/
	text-align: right;
	font-weight: normal;
	color: #BE4211; /*#E75116;*/
}

.ui-edit-table tr td {
	text-align: left;
}

.ui-edit-table tr th,.ui-edit-table tr td {
	height: 30px;
	padding-left: 5px;
	padding-right: 5px;
	border: 1px solid #FFCDB4; /*#E8DBD5;//#D5DFE8;//#CCCCCC;*/
}

.ui-edit-table th.column-title {
	text-align: left;
	font-weight: bold;
}

input[type=name],input[type=email],input[type=password],input[type=text],textarea
	{
	font-family: "Helvetica Neue", Helvetica, sans-serif;
	padding: 2px;
	border: 1px solid #E8DBD5; //# ddd;
	border-radius: 2px; //
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1); //
	background: #FFF url(../images/input.png) repeat-x;
}

textarea {
	margin: 3px 0 3px 0;
}

input[type=name]:focus,input[type=email]:focus,input[type=password]:focus,input[type=text]:focus,textarea:focus
	{
	outline: none;
	border: 1px solid #00bce9;
	box-shadow: 0 0 2px #2da1ec;
}

.ui-edit-table tr td.operate-area {
	height: 50px;
	text-align: center;
	background-color: #FFF0CF; /*#F7F1EE;//#EEF3F7;*/
}

.none {
	width: 0px;
	height: 0px;
	display: none;
}



.address select {
		width:80px;
	} 
</style>
<body>
<div id="fullbg"></div> 
	<div class="header">
		<div id="name_nav">
			<div id="name">后台管理</div>
			<div id="nav">
				<ul>
					<li><a href="gateway.action">返回门户首页</a></li>
	            	<li style="background-color:#BE4211;border-radius:15px 15px 15px 15px;"><a href="gateway_seeInformation.action">门户信息</a></li>
	            	<li><a href="file.action">文件上传</a></li>
	            	<li><a href="picture.action">开发区风采图片上传</a></li>
	            	<li><a href="gateway_homeInvestmentProjects.action">投资项目</a></li>
            		<li><a href="mailbox.action">局长信箱</a></li>
	            </ul>
			</div>
		</div>
	</div>
	<div id="main">
		<div id="left">
			<ul>
				<div class="first">信息库管理</div>
				<li>
					<a href="gateway_seeInformation.action" style="color:#F63; font-weight:bold">门户信息</a>
				</li>
			</ul>
		</div>
	</div>
		<form name="form" id="form" action="gateway_addInformation.action"  method="post" >
			<div id="right">
				<div style="text-align:center;height:30px; line-height:30px; font-size:18px; font-weight:bold; color:#BF4260">新增信息</div>
				<div class="ui-edit">
					<table class="ui-edit-table" width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<th colspan="4" class="column-title">基本信息</th>
							</tr>
							<tr>
								<th>标题：</th>
								<td colspan="3">
									<input type="text" name="informationInput.title" class="validate[maxSize[50]],validate[required]" style="width: 300px;" >
								</td>
							</tr>
							<tr>
								<th>具体模块：</th>
								<td colspan="3">
									<input type="text" name="informationInput.modular" class="validate[maxSize[50]],validate[required]" style="width: 300px;" >
								</td>
							</tr>
							<tr>
								<th>内容：</th>
								<td colspan="3">
									<textarea name="informationInput.content" class="validate[maxSize[5000]]" style="width: 800px;height: 200px;"></textarea></td>
							</tr>					
							<tr>
								<td colspan="4" class="operate-area">
									<button class="button" type="submit">&nbsp;保存&nbsp;</button>
									<label class="button" type="submit"><a href="gateway_seeInformation.action"><font color="white">取消返回</font></label> </a> &nbsp;&nbsp; <input type="button"
									class="pure-button close-button" name="closeBtn" value="关闭"
									id="closeBtn" style="display: none;">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</div>
		</form>


</body>
<script type="text/javascript">

</script>

</html>

