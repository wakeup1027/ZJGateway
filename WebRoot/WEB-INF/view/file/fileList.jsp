<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理</title>
     <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <meta name="renderer" content="webkit">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link href="${pageContext.request.contextPath}/resource/css/header.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/route/js/jquery1.8.3.min.js" language="javascript" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js" language="javascript" type="text/javascript"></script>

<style>
a{
	text-decoration:none;
	color:#000;
}
</style>
</head>
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
            	<li  style="background-color:#BE4211;border-radius:15px 15px 15px 15px;"><a href="file.action">文件上传</a></li>
            	<li><a href="picture.action">开发区风采图片上传</a></li>
            	<li><a href="gateway_homeInvestmentProjects.action">投资项目</a></li>
            	<li><a href="mailbox.action">局长信箱</a></li>
            	<li><a href="GIS.action">GIS产业分布地图</a></li>
            </ul>
        </div>
    </div>
     <div id="exit">您好,管理员！</div>
</div>
<div id="main" >
	<div id="left">    	
		<ul><div class="first">本地工具</div>
        	<li><a href="file.action" style="color:#F63; font-weight:bold">本地文件柜</a></li>
        	<li style="display: none;"><a href="problem.action">投促常用问题</a></li>
        </ul>
	</div>
	<div id="right">
		<div id="operation">
        	<ul>
            	<li style="display: none;"><label class="button"><a href="folder.action"><font color="white">新建文件夹</font></a></label></li>
            	<li style="display: none;"><span>|</span></li>
            	<li><label class="button"><a id="upload"><font color="white">上传文件</font></a></label></li>
            	<li><span>|</span></li>
				<li><label class="button"><a id="share"><font color="white">一键发布</font></a></label></li>
				<li><span>|</span></li>
				<li><label class="button"><a id="cancelShare"><font color="white">一键撤销</font></a></label></li>
            </ul>
        </div>
       	<div class="search" style="height: 45px;">	
        	<form action="file.action" method="post">
        	<div id="choose">
            	文件名称：
				<input type="text" name = "fileName"><button type="submit" class="button">&nbsp;&nbsp;搜&nbsp;索&nbsp;&nbsp;</button>
            	<!-- <th>当前登录用户：</th> -->
				<input type="hidden" name="files.currentUser" id="currentUser" value="${onUser.userName }" readonly>
            </div>
            </form>
        </div>
        <div class="col-tab">
		<div style="display: none;position: absolute;top:50%;left: 40%;width:370px;height:26px;   border:#FFCDB4 1px solid;border-radius:5px;background-color:#FDF3E3;padding: 5px;" id="showUpload">
			<form enctype="multipart/form-data" action="file_uploadFile.action" method="post" id="fileForm">
				<input type="file" name="file" id="file">
				<input type="submit" value="上传" class="button">
				<input type="button" value="取消" id="cancle" class="button">
			</form>
		</div>
		<table style="border-collapse: collapse;" class="table">
			<tr>
				<td><input type="checkbox" id="allchoose"/></td>
				<td>序号</td>
				<td>文件名</td>
				<td>大小</td>
				<td>创建时间</td>
				<td>上传者</td>
				<td>是否发布</td>
				<td>发布者</td>
				<td>发布时间</td>
				<td>操作</td>
			</tr>
			
            <% int s=0;//变量初始化为0%>
			<s:iterator value="#files">
			<tr>
			<td><input type="checkbox" name="check" class="checkCarrier" value="${id }"/></td>
				<% s++;%>
                <td><%=s%></td><!-显示序号->
				<td style="text-align:left;">&nbsp;${fileName }</td>
				<td>${fileSize }</td>
				<td><fmt:formatDate  value="${createTime }" type="both" pattern="yyyy-MM-dd" /></td>
				<td>${user}</td>
				<td>
				<input type="hidden" name="files.sharedState" id="sharedState" value="${sharedState }" readonly>${sharedState }</td>
				<td>${releasePerson }</td>
				<td><fmt:formatDate  value="${releaseTime }" type="both" pattern="yyyy-MM-dd" /></td>
				<td>
			        <a href="javascript:void(0);" onclick="onLoad(${id});">下载</a>&nbsp;<a href="file_delete.action?id=${id }" onclick="return window.confirm('确认删除？')">删除</a>
				</td>
			</tr>
			
			</s:iterator>
		</table>
	</div>
</div>
</div>
<script type="text/javascript">
	document.getElementById("fileForm").onsubmit = function (){
		var file = document.getElementById("file");
		if(file.files[0].size>1024*1024*20)
		{
			alert("您选择的文件太大，请重新选择，文件不能大于20M");
			return  false;
		}
	};
	function onLoad(id){
		$.ajax({
			type:'POST',
			url:"fileDownLoad_checkFile.action",
			data:{
				"id":id
			},
			success:function(result){ 
				if(result=="true"){
					window.location.href="fileDownLoad.action?id="+id;
				}else{
					alert("对不起,该文件已经被删除!");
					window.location.href="file_delete.action?id="+id;
				}
			},
			errer:function(result){
				alert("对不起,系统内部异常,请联系管理人员!");
			}
		});
	}
	$("#upload").click(function(){
		$("#showUpload").show();
	});
	
	$("#cancle").click(function(){
		$("#showUpload").hide();
	});
	
	$("#share").click(function(){
		console.log("#share");
		var echo = new Array();
		var trueAfalse = false ;
		var i=0;
		$("input[name='check']:checked").each(function() {
		echo[i++] = $(this).val() ;
		trueAfalse = true ;
		});
		if(!trueAfalse)
		{
			alert("请选择发布文件!");	
		}
		else 
		{
			$.ajaxSettings.traditional=true;
			if(confirm("是否发布文件？"))
				//alert(echo);
			$.ajax({
				type:'POST',
				url:"file_batchUpdate.action",
				data:{
					idLots:echo,
				},
				success:function(data){
					if(data=="success"){
						window.location.href="file.action";
					}else{
						alert("刷新失败");
					}
				}
				});
		}
		

	});
	
	$("#cancelShare").click(function(){
		console.log("#cancelShare");
		var echo = new Array();
		var trueAfalse = false ;
		var i=0;
		$("input[name='check']:checked").each(function() {
		echo[i++] = $(this).val() ;
		trueAfalse = true ;
		});
		if(!trueAfalse)
		{
			alert("请选择取消共享文件!");	
		}
		else 
		{
			$.ajaxSettings.traditional=true;
			if(confirm("取消共享文件？"))
				$.ajax({
					type:'POST',
					url:"file_batchUpdateTwo.action",
					data:{
						idLots:echo,
					},
					success:function(data){
						//alert(data=="success")
						if(data=="success"){
							window.location.href="file.action";
						}else{
							
							alert("刷新失败");
						}
						
					}
					});	
			
		}
		
	});
</script>

</body>
</html>
