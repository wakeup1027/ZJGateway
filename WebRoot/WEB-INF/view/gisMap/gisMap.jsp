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
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=9f203065d6bfef95503b9519831eda1b"></script>
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
            	<li><a href="mailbox.action">局长信箱</a></li>
            	<li style="background-color:#BE4211;border-radius:15px 15px 15px 15px;"><a href="GIS.action">GIS产业分布地图</a></li>
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
    <div id="right" style="margin-top:3px;">
    	<div id="operation" class="tourist">
        	<ul>
            	<li><label class="button" onclick="addGIS()">&nbsp;新&nbsp;增&nbsp;</label></li>
            	<li><label class="button" id="deleteLots">&nbsp;删&nbsp;除&nbsp;</label></li>
            </ul>
            <div style="clear:both;"></div>
        </div>
        <div>
        	<table style="border-collapse: collapse;" class="table">
            	<tr class="tr">
                	<td><input type="checkbox"  id="allchoose"/></td>
                    <td>序号</td>
                    <td>标题</td>
                    <td>经度</td>
                    <td>纬度</td>
                    <td>区域</td>
                    <td>操作</td>
                </tr>
                <% int s=0;//变量初始化为0%>
                <s:iterator value="#gismap">
                <tr class="xunhuan">
                	<td><input type="checkbox" id="qqq" name="check" class="checkStaff" value="${id }"/></td>
                   	<% s++;%>
                    <td><%=s%></td>
                 	<td style="text-align: left;">${commitTitle }</td>
                    <td>${xpoint }</td>
                    <td>${ypoint }</td>
                    <td>${areaName }</td>
                    <td><button onclick="upGISmap(this)" style="cursor:pointer;outline:none;">修改</button><span class="commitText" style="display:none;">${commit}</span></td>
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
                <label class="button page" id="pre"><a href="GIS.action?page=${page-1 }&rows=${rows}"><font color="white">上一页</font></a></label>
                <label class="button page"><a href="GIS.action?page=${page+1 }&rows=${rows}"><font color="white">下一页</font></a></label>
            </div>
        </div>
    </div>
</div>

<div id="addgisBox" style="position:absolute; background:#fff; top:18%; left:35%; width:500px; padding-bottom:15px; border:1px solid #E75116; display:none;">
	<div style="width:100%; background:#E75116;">
		<span style="display:block; line-height:45px; padding-left:15px; color:#fff;">新增GIS产业分布地图</span>
	</div>
	<form id="addFormBox" name="form" action="GIS_addGIS.action" method="post">
	<table border="0" cellspacing="0" cellpadding="10" width="100%">
		<tr style="width:70px;">
			<td style="padding-left:15px;">标题：</td>
			<td><input type="text" id="titleStrBox" name="commitTitle" style="width:250px; height:30px;"/></td>
			<td></td>
		</tr>
		<tr>
			<td style="padding-left:15px;">经度：</td>
			<td style="width:260px;"><input type="text" id="xpointStrBox" name="xpoint" style="width:250px; height:30px;"/></td>
			<td><a href="javascript:void(0)" onclick="getPointer()" style="color:blue; font-size:13px; text-decoration:underline;">获取坐标</a></td>
			<!--a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" style="color:blue; font-size:13px; text-decoration:underline;" target="_blank">去获取坐标</a-->
		</tr>
		<tr>
			<td style="padding-left:15px;">纬度：</td>
			<td><input type="text" name="ypoint" id="ypointStrBox" style="width:250px; height:30px;"/></td>
			<td></td>
		</tr>
		<tr>
			<td style="padding-left:15px;">区域：</td>
			<td><input type="text" name="areaName" id="areaNameStrBox" style="width:250px; height:30px;"/></td>
			<td></td>
		</tr>
		<tr>
			<td style="padding-left:15px;">备注：</td>
			<td colspan="2"><textarea name="commit" id="commitStrBox" style="width:376px; height:150px;"></textarea></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="保存"/>&nbsp;&nbsp;<input type="button" onclick="closeGIS()" value="取消"/></td>
			<td></td>
		</tr>
	</table>
	</form>
</div>

<div id="upgisBox" style="position:absolute; background:#fff; top:18%; left:35%; width:500px; padding-bottom:15px; border:1px solid #E75116; display:none;">
	<div style="width:100%; background:#E75116;">
		<span style="display:block; line-height:45px; padding-left:15px; color:#fff;">修改GIS产业分布地图</span>
	</div>
	<form name="form2" action="GIS_upGISinfo.action" method="post">
	<table border="0" cellspacing="0" cellpadding="10" width="100%">
		<tr style="display:none;">
			<td colspan="3"><input type="text" id="idStr" name="id" style="width:250px; height:30px;"/></td>
		</tr>
		<tr style="width:70px;">
			<td style="padding-left:15px;">标题：</td>
			<td><input type="text" id="commitTitleStr" name="commitTitle" style="width:250px; height:30px;"/></td>
			<td></td>
		</tr>
		<tr>
			<td style="padding-left:15px;">经度：</td>
			<td style="width:260px;"><input type="text" id="xpointerStr" name="xpoint" style="width:250px; height:30px;"/></td>
			<td><a href="javascript:void(0)" onclick="getPointer()" style="color:blue; font-size:13px; text-decoration:underline;">获取坐标</a></td>
		</tr>
		<tr>
			<td style="padding-left:15px;">纬度：</td>
			<td><input type="text" name="ypoint" id="ypointerStr" style="width:250px; height:30px;"/></td>
			<td></td>
		</tr>
		<tr>
			<td style="padding-left:15px;">区域：</td>
			<td><input type="text" name="areaName" id="areaNameStr" style="width:250px; height:30px;"/></td>
			<td></td>
		</tr>
		<tr>
			<td style="padding-left:15px;">备注：</td>
			<td colspan="2"><textarea name="commit" id="commitTextStr" style="width:376px; height:150px;"></textarea></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="保存"/>&nbsp;&nbsp;<input type="button" onclick="closeGIS()" value="取消"/></td>
			<td></td>
		</tr>
	</table>
	</form>
</div>

<div id="mapBox" style="position:absolute; background:#fff; top:18%; left:35%; width:700px; border:1px solid #E75116; display:none;">
	<div style="background:#E75116;line-height:45px;color:#fff; padding-left:15px;">获取坐标窗口</div>
	<table width="100%">
		<tr>
			<td>
				<div>
					<input type="text" id="areaTest" style="width:250px; height:30px;" placeholder="地名关键字搜索"/>
					<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
				</div>	
			</td>
			<td>
				<div style="text-align:right;"><span style="color:#ff0000;">温馨提示：</span>点击地图上的点获取坐标</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="getMapPoint" style="width:100%; height:480px;"></div>
			</td>
		</tr>
	</table>	
</div>
<script type="text/javascript">
	
	$("#go").click(function(){
		window.location.href="GIS.action?page="+$("#currentPage").val()+"&rows="+$("#rows").val();
	});
	$("#rows").val("${rows}");
	
	$("#rows").change(function(){
		window.location.href="GIS.action?page="+$("#currentPage").val()+"&rows="+$(this).val();
	});
	function getPointer(){
		$("#mapBox").css("display","block");
	}
	
	//批量删除
	$("#deleteLots").click(function(){
	var echo = new Array();
	var trueAfalse = false ;
	var i=0;
		$("input[name='check']:checked").each(function() {
		echo[i++] = $(this).val() ;
		trueAfalse = true ;
		});
		console.log(echo);
		if(!trueAfalse)
		{
			alert("请选择删除项!");	
		}
		else {
			$.ajaxSettings.traditional=true;
			if(confirm("确认删除？"))
				$.ajax({
				type:'POST',
				url:"GIS_batchRemoval.action",
				data:{
					idLots:echo,
				},
				success:function(data){
					console.log(data);
					if(data=="success"){
						window.location.href="GIS.action";
					}else{
						alert("刷新失败");
					}
				},
				});
			}
		});
	
	function addGIS(){
		$("#titleStrBox").val(""); 
		$("#xpointStrBox").val(""); 
		$("#ypointStrBox").val(""); 
		$("#areaNameStrBox").val("");  
		$("#commitStrBox").val(""); 
		$("#addgisBox").css("display","block");
		$("#upgisBox").css("display","none");
	}
	
	function upGISmap(inc){
		var par = $(inc).parents(".xunhuan");
		var idStr = par.children("td:eq(0)").children(".checkStaff").val();
		var commitTitleStr = par.children("td:eq(2)").text().trim();
		var xpointerStr = par.children("td:eq(3)").text().trim();
		var ypointerStr = par.children("td:eq(4)").text().trim();
		var areaNameStr = par.children("td:eq(5)").text().trim();
		var commitTextStr = par.children("td:eq(6)").children(".commitText").text().trim();
		
		$("#idStr").val(idStr);
		$("#commitTitleStr").val(commitTitleStr);
		$("#xpointerStr").val(xpointerStr);
		$("#ypointerStr").val(ypointerStr);
		$("#areaNameStr").val(areaNameStr);
		$("#commitTextStr").val(commitTextStr);
		
		$("#upgisBox").css("display","block");
		$("#addgisBox").css("display","none");
	}
	
	function closeGIS(){
		$("#addgisBox").css("display","none");
		$("#upgisBox").css("display","none");
	}
	
	// 百度地图API功能
	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}
	$(function(){
		var map = new BMap.Map("getMapPoint",{enableMapClick:false});            
		map.centerAndZoom("湛江",12);
		map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
		map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用   
		map.setDefaultCursor("pointer");        
		//单击获取点击的经纬度
		map.addEventListener("click",function(e){
			$("#xpointStrBox").val(e.point.lng);
			$("#ypointStrBox").val(e.point.lat)
			$("#xpointerStr").val(e.point.lng);
			$("#ypointerStr").val(e.point.lat);
			//$("#areaNameStr").val($("#areaTest").val());
			//$("#areaNameStrBox").val($("#areaTest").val());
			$("#mapBox").css("display","none");
			
		});
		
		var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
			{"input" : "areaTest","location" : map}
		);

		ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
			var str = "";
			var _value = e.fromitem.value;
			var value = "";
			if (e.fromitem.index > -1) {
				value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			}    
			str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
			value = "";
			if (e.toitem.index > -1) {
				_value = e.toitem.value;
				value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			}    
			str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
			G("searchResultPanel").innerHTML = str;
		});
		
		var myValue;
		ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
		var _value = e.item.value;
			myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
			setPlace(map,myValue);
		});
		
	});
	
	function setPlace(map,myValue){
		map.clearOverlays();    //清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp));    //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: myFun
		});
		local.search(myValue);
	}
</script>
</body>
</html>
