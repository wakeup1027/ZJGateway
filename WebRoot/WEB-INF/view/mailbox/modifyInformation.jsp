<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>后台管理</title>
    <meta http-equiv="x-ua-compatible" content="IE=edge" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
	<meta name="renderer" content="webkit">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<link href="${pageContext.request.contextPath}/resource/css/header.css" rel="stylesheet" type="text/css">
	<link type="text/css" href="resource/css/validationEngine.jquery.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resource/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resource/js/jquery-1.7.2.min.js" language="javascript" type="text/javascript"></script>
	<script type="text/javascript" src="<%=basePath%>resource/uploadify/jquery.uploadify.js?id=<%=System.currentTimeMillis()%>"></script>
	<script src="${pageContext.request.contextPath}/resource/js/common.js" language="javascript" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resource/js/jquery.validationEngine.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/jquery.validationEngine-cn.js"></script>
	

<script>
</script>
<style>
th{
	background-color:#FFF1CF;
	font-weight:normal;
	text-align:right;
	padding:5px;
	border:1px #FFCDB4 solid;
	width:45%;
}
td{
	text-align:left;
	border:1px #FFCDB4 solid;
}
</style>
<body>
<div class="header">
	<div id="name_nav">
    	<div id="name">
        	后台管理
    	</div>
        <div id="nav">
        	<ul>
        		<li><a href="gateway.action">返回门户首页</a></li>
            	<li><a href="gateway_seeInformation.action">门户信息</a></li>
            	<li><a href="file.action">文件上传</a></li>
            	<li><a href="picture.action">开发区风采图片上传</a></li>
            	<li><a href="gateway_homeInvestmentProjects.action">投资项目</a></li>
            	<li style="background-color:#BE4211;border-radius:15px 15px 15px 15px;"><a href="mailbox.action">局长信箱</a></li>
            </ul>
        </div>
    </div>
    <div id="exit">
    	您好,${onUser.realName }| <a href="login_exitSystem.action"  style="text-decoration:none"><font color="#FFFFFF">退出</font></a>
    </div>
</div>
<div id="main" >
	<div id="left">
        <ul>
			<div class="first">局长信息库</div>
			<li>
				<a href="mailbox.action" style="color:#F63; font-weight:bold">局长信箱</a>
			</li>
		</ul>
	</div>
    <div id="right" style="margin-top: 2px;height: 348px;">
        <div style="text-align:center;height:30px; line-height:30px; font-size:18px; font-weight:bold; color:#BF4260">查看信息</div>
		<div style="color:#BE4211">
		<form id="form" action="mailbox_modifyInformation.action" method="POST">
        	<table style="border-collapse: collapse;width: 1187px;margin-left: 0px;" class="table">
        	
        		<tr>
                	<th style="width:150px; height: 30px"><span style="color: #BE4211;">姓名:</span></th>
                    <td>
                    	<input type="hidden" name="id" value="${mailbox.id }">
                    	<input type="text" name="name" value="${mailbox.name }" />
                    </td>
            	
                	<th style="width:150px; height: 30px"><span style="color: #BE4211;">电子邮箱:</span></th>
                    <td><input type="text" name="electronicMail" value="${mailbox.electronicMail }" /></td>
                
                </tr>
                <tr>
                	<th style="width:150px; height: 30px"><span style="color: #BE4211;">联系电话:</span></th>
                    <td><input type="text" name="contactPhone" value="${mailbox.contactPhone }" /></td>
                
                	<th style="width:150px; height: 30px"><span style="color: #BE4211;">联系地址:</span></th>
                    <td><input type="text" name="contactAddress" value="${mailbox.contactAddress }" /></td>
                
                </tr>
                <tr>
					<th style="width:150px; height: 30px"><span style="color: #BE4211;">主　　题:</span></th>
					<td colspan="3"><input type="text" name="title" value="${mailbox.title }" /></td>
				</tr>
                <tr>
					<th style="width:150px; height: 30px"><span style="color: #BE4211;">内　　容:</span></th>
					<td colspan="3"><textarea name="contents" style="width: 585px;height: 150px;" rows="" cols="">${mailbox.contents }</textarea></td>
				</tr>
            </table>
           
            <div style="text-align:center; padding:10px; border:1px #FFCDB4 solid; margin:-10px 15px 0px 15px; background-color:#FFF1CF;width: 1165px; margin-left: 0px;">
            	 <button class="button" type="submit">保存</button>
            	 <button type="button" class="button" onclick="javascript:history.go(-1)">取消返回</button>
            </div>
          </form>
        </div>
	</div>
</div>
</body>
<script type="text/javascript">
</script>
</html>
