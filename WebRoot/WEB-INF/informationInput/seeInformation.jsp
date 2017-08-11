<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            	<li style="background-color:#BE4211;border-radius:15px 15px 15px 15px;"><a href="gateway_seeInformation.action">门户信息</a></li>
            	<li><a href="file.action">文件上传</a></li>
            	<li><a href="picture.action">开发区风采图片上传</a></li>
            	<li><a href="gateway_homeInvestmentProjects.action">投资项目</a></li>
            	<li><a href="mailbox.action">局长信箱</a></li>
            	<li><a href="GIS.action">GIS产业分布地图</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="main" >
	<div id="left">
		<ul>
			<div class="first">信息库管理</div>
			<li>
				<a href="gateway_seeInformation.action" style="color:#F63; font-weight:bold">门户信息</a>
			</li>
		</ul>
	</div>
    <div id="right">
    	<div id="operation" class="tourist">
        	<ul>
            	<li><label class="button"><a href="index.html" style="color: white">新建模板（内容模式(不包含图片））</a></label></li>
            	<li><span>|</span></li>
            	<li><label class="button"><a href="gateway_index1.action" style="color: white">新建模板（图文模式）</a></label></li>
            	<li><span>|</span></li>
            	<li><label class="button" id="deleteLots">&nbsp;删&nbsp;除&nbsp;</label></li>
            	<li><span>|</span></li>
            	<li><label class="button" id="release">一键发布</label></li>
            	<li><span>|</span></li>
            	<li><label class="button" id="revoke">一键撤销</label></li>
            	<li><span>|</span></li>
            	<li><label class="button"><a href="gateway_dustbin.action" style="color: white">&nbsp;垃圾箱&nbsp;</a></label></li>
            </ul>
        </div>
        <div class="search">	
            <form action="gateway_seeInformation.action" method="post" id="search">
        	<div id="choose">
            	标题：<input type="text" name="title"  placeholder="请输入关键字" />&nbsp;
            	模块：<select name="modular" id="modular" style="width: 225px;">
			    			<option value="">请选择...</option>
			    			<option value="首页-企业动态">首页-企业动态</option>
			    			<option value="首页-通知公告">首页-通知公告</option>
			    			<option value="首页-最新资讯">首页-最新资讯</option>
			    			<option value="首页-重点产业介绍">首页-重点产业介绍</option>
			    			<option value="信息公开-统计数据">信息公开-统计数据</option>
			    			<option value="信息公开-重点招商项目">信息公开-重点招商项目</option>
			    			<option value="投资服务-投资流程">投资服务-投资流程</option>
			    			<option value="投资服务-投资目录">投资服务-投资目录</option>
			    			<option value="投资服务-职能部门联系">投资服务-职能部门联系</option>
			    			
			    			<option value="首页-投资湛江开发区">首页-投资湛江开发区</option>
			    			<option value="首页-信息栏">首页-五张小图片轮询</option>
			    			<option value="投资环境-湛江开发区概况">投资环境-湛江开发区概况</option>
			    			<option value="投资环境-投资优势">投资环境-投资优势</option>
			    			<option value="投资环境-投资成本">投资环境-投资成本</option>
			    			<option value="投资环境-投资政策">投资环境-投资政策</option>
			    			<option value="投资环境-载体介绍">投资环境-载体介绍</option>
			    			<option value="投资环境-经济发展">投资环境-经济发展</option>
			    			<option value="信息公开-开发区规划">信息公开-开发区规划</option>
			    			<option value="产业布局-重点企业">产业布局-重点企业</option>
			    			<option value="产业布局-重大落户项目">产业布局-重大落户项目</option>
			    		</select>
            	<button type="submit" class="button">搜索</button>
            </div>
            </form>
        </div>
        <div>
        	<table style="border-collapse: collapse;" class="table">
            	<tr class="tr">
                	<td><input type="checkbox"  id="allchoose"/></td>
                    <td>序号</td>
                    <td>标题</td>
                    <td>具体模块</td>
                    <td>发布人</td>
                    <td>发布状态</td>
                    <td>发布时间</td>
                    <td class="tourist">操作</td>
                </tr>
                <% int s=0;//变量初始化为0%>
                <s:iterator value="#informationInput">
                <tr class="xunhuan">
                	<td><input type="checkbox" id="qqq" name="check" class="checkStaff" value="${id }"/></td>
                   	<% s++;%>
                    <td><%=s%></td><!-显示序号->
                 	<td style="text-align: left;">&nbsp;<a style="color:#2a00ff;" href="gateway_query.action?id=${id}">${title }</a></td>
                    <td>${modular }</td>
                    <td>${publisher }</td>
                    <td>${releaseStatus }</td>
                    <td><fmt:formatDate  value="${releaseTime }" type="both" pattern="yyyy-MM-dd" /></td>
                    <td class="tourist">
                    <c:choose>
                    	<c:when test="${releaseStatus=='未发布' }">
                    		<a href="gateway_updateJump.action?id=${id}"><font color="#2a00ff">修改</font></a>
                    		<a href="gateway_delete.action?id=${id}"  onclick="return window.confirm('确认删除？')"><font color="#2a00ff">删除</font></a>
                    		<a href="gateway_release.action?id=${id}" onclick="return window.confirm('确认发布？')"><font color="#2a00ff">发布</font></a>
                    	</c:when>
                    </c:choose>
                    <c:choose>
                    	<c:when test="${releaseStatus=='已发布' }">
                    		<a href="gateway_updateJump.action?id=${id}"><font color="#2a00ff">修改</font></a>
                    		<a href="gateway_delete.action?id=${id}"  onclick="return window.confirm('确认删除？')"><font color="#2a00ff">删除</font></a>
                    		<a href="gateway_revoke.action?id=${id}" onclick="return window.confirm('确认撤销？')"><font color="#2a00ff">撤销</font></a>
                    	</c:when>
                    </c:choose>
                    	
                    </td>
                </tr>
                </s:iterator>
            </table>
            <div id="page">第${page }页，共${totalPage }页，${totalNum }条记录&nbsp;&nbsp;跳转到<input id="currentPage" type="text" name="page" style="width:30px" value="${page }" /><label><a id="go" style="color:#F63; cursor: pointer;">&nbsp;GO</a></label>&nbsp;&nbsp;每页
            	<select id="rows">		
                	<option value ="5">5</option>
                	<option value="10">10</option>
                	<option value="20">20</option>
                	<option value="50">50</option>
                	<option value="100">100</option>
                </select>
                <label class="button page" id="pre"><a href="gateway_seeInformation.action?page=${page-1 }&rows=${rows}"><font color="white">上一页</font></a></label>
                <label class="button page"><a href="gateway_seeInformation.action?page=${page+1 }&rows=${rows}"><font color="white">下一页</font></a></label>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function(e) {
	       $("#search").validationEngine();
	});
	
	$("#go").click(function(){
		window.location.href="gateway_seeInformation.action?page="+$("#currentPage").val()+"&rows="+$("#rows").val();
	});
	$("#rows").val("${rows}");
	
	$("#rows").change(function(){
		window.location.href="gateway_seeInformation.action?page="+$("#currentPage").val()+"&rows="+$(this).val();
	});
		
	//批量删除
	$("#deleteLots").click(function(){
	console.log("#deleteLots");
	var echo = new Array();
	var trueAfalse = false ;
	var i=0;
		$("input[name='check']:checked").each(function() {
		echo[i++] = $(this).val() ;
		trueAfalse = true ;
		});
		if(!trueAfalse)
		{
			alert("请选择删除项!");	
		}
		else {
			$.ajaxSettings.traditional=true;
			if(confirm("确认删除？"))
				$.ajax({
				type:'POST',
				url:"gateway_deleteLots.action",
				data:{
					idLots:echo,
				},
				success:function(data){
					if(data=="success"){
						window.location.href="gateway_seeInformation.action";
					}else{
						alert("刷新失败");
					}
				},
				});
			}
		});
		
		
	//批量发布
	$("#release").click(function(){
	console.log("#release");
	var echo = new Array();
	var trueAfalse = false ;
	var i=0;
		$("input[name='check']:checked").each(function() {
		echo[i++] = $(this).val() ;
		trueAfalse = true ;
		});
		if(!trueAfalse)
		{
			alert("请选择发布项!");	
		}
		else {
			$.ajaxSettings.traditional=true;
			if(confirm("确认发布？"))
				$.ajax({
				type:'POST',
				url:"gateway_oneButtonPublishing.action",
				data:{
					idLots:echo,
				},
				success:function(data){
					if(data=="success"){
						window.location.href="gateway_seeInformation.action";
					}else{
						alert("刷新失败");
					}
				},
				});
			}
		});
		
		
		
	//批量撤销
	$("#revoke").click(function(){
	console.log("#revoke");
	var echo = new Array();
	var trueAfalse = false ;
	var i=0;
		$("input[name='check']:checked").each(function() {
		echo[i++] = $(this).val() ;
		trueAfalse = true ;
		});
		if(!trueAfalse)
		{
			alert("请选择撤销项!");	
		}
		else {
			$.ajaxSettings.traditional=true;
			if(confirm("确认撤销？"))
				$.ajax({
				type:'POST',
				url:"gateway_oneKeyRevocation.action",
				data:{
					idLots:echo,
				},
				success:function(data){
					if(data=="success"){
						window.location.href="gateway_seeInformation.action";
					}else{
						alert("刷新失败");
					}
				},
				});
			}
		});
</script>
</body>
</html>
