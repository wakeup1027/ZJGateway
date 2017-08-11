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
    <meta http-equiv="x-ua-compatible" content="IE=edge" />
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
            	<li><a href="gateway_seeInformation.action">门户信息</a></li>
            	<li><a href="file.action">文件上传</a></li>
            	<li><a href="picture.action">开发区风采图片上传</a></li>
            	<li><a href="gateway_homeInvestmentProjects.action">投资项目</a></li>
            	<li style="background-color:#BE4211;border-radius:15px 15px 15px 15px;"><a href="mailbox.action">局长信箱</a></li>
            	<li><a href="GIS.action">GIS产业分布地图</a></li>
            </ul>
        </div>
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
    <div id="right">
    	<div id="operation" class="tourist">
        	<ul>
            	<li><label class="button" id="deleteLots">&nbsp;删&nbsp;除&nbsp;</label></li>
            </ul>
        </div>
        <div class="search">	
            <form action="mailbox.action" method="post" id="search">
        	<div id="choose">
            	姓名：<input type="text" name="name"  placeholder="请输入关键字" />&nbsp;
            	<button type="submit" class="button">搜索</button>
            </div>
            </form>
        </div>
        <div>
        	<table style="border-collapse: collapse;" class="table">
            	<tr class="tr">
                	<td><input type="checkbox"  id="allchoose"/></td>
                    <td>序号</td>
                    <td>姓名</td>
                    <td>联系电话</td>
                    <td>主题</td>
                    <td class="tourist">操作</td>
                </tr>
                <% int s=0;//变量初始化为0%>
                <s:iterator value="#mailbox">
                <tr class="xunhuan">
                	<td><input type="checkbox" id="qqq" name="check" class="checkStaff" value="${id }"/></td>
                   	<% s++;%>
                    <td><%=s%></td><!-显示序号->
                 	<td style="text-align: left;">&nbsp;<a style="color:#2a00ff;" href="mailbox_queryAll.action?id=${id}">${name }</a></td>
                    <td>${contactPhone }</td>
                    <td>${title }</td>
                    <td>
                    	<a style="color:#2a00ff;" href="mailbox_modifyJump.action?id=${id}">修改</a>
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
                <label class="button page" id="pre"><a href="mailbox.action?page=${page-1 }&rows=${rows}"><font color="white">上一页</font></a></label>
                <label class="button page"><a href="mailbox.action?page=${page+1 }&rows=${rows}"><font color="white">下一页</font></a></label>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function(e) {
	       $("#search").validationEngine();
	});
	
	$("#go").click(function(){
		window.location.href="mailbox.action?page="+$("#currentPage").val()+"&rows="+$("#rows").val();
	});
	$("#rows").val("${rows}");
	
	$("#rows").change(function(){
		window.location.href="mailbox.action?page="+$("#currentPage").val()+"&rows="+$(this).val();
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
				url:"mailbox_batchRemoval.action",
				data:{
					idLots:echo,
				},
				success:function(data){
					if(data=="success"){
						window.location.href="mailbox.action";
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
