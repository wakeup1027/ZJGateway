<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + "l:" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="IE=edge" />
	<title>首页</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/public.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/index.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/index1.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/twoLevelMenu.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/route/js/lrtk.js"></script>
	<script src="${pageContext.request.contextPath}/route/js/jquery1.8.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/route/js/prototype.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/route/js/ImageSlide.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/route/js/html5media.min.js"></script>
	
	<!-- 右下角悬浮框 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/route/js/top.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/suspensionFrame.css">
	
<style type="text/css">
.text p{
	width: 259px;
    word-break: break-all;
    text-overflow: ellipsis;
    display: -webkit-box; /** 将对象作为伸缩盒子模型显示 **/
    -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
    -webkit-line-clamp: 2; /** 显示的行数 **/
    overflow: hidden;
}

/*弹出框*/

.commend-showep .commend-epwrap{ 

/* display:block; position:relative; z-index:3;  */
    display: block;
    position: absolute;
    z-index: 9999999999999999999;
    width: 100%;
    padding-top: 150px;

}
/* .commend-showep .listPage {position: fixed;z-index: 1;_position: absolute;padding-top: 0; width:100%; } */
/* .main-listwrap{ position:relative; background:#f2f2f2; } */
.commend-epwrap{ display:none;}
.commend-epbody{
	position:relative;
	padding:0;
	margin:0 auto;
	z-index:3;
	width:890px;
	top:0;
}
.commend-epbody-inner
{
	background:#fff;
	box-shadow:0 1px 6px rgba(0,0,0,0.8);
	-webkit-box-shadow:0 1px 6px rgba(0,0,0,0.8);
	-ms-box-shadow:0 1px 6px rgba(0,0,0,0.8);
	-o-box-shadow:0 1px 6px rgba(0,0,0,0.8);
	-moz-box-shadow:0 1px 6px rgba(0,0,0,0.8);
	padding:25px 28px 30px;
}
.mainarea .epmask{
	display:none;
	background:#000;
	opacity: 0.5;
	filter:alpha(opacity=50);
	z-index: 2;
	width:100%;
	position:absolute;
	top:0;
	left:0;
	height:100%;
}
.ep-h1{ font-size:26px; font-weight: bold; letter-spacing:-1px;}
.ep-info{ padding:10px 0 20px 0; border-bottom:1px solid #ddd; margin-bottom:20px;}
.ep-info,.ep-info a{ color:#888; text-decoration:none;}
.ep-close{
	display:none;
	visibility:hidden;
	position: absolute;
	width:40px;
	height:40px;
	z-index:99;
	cursor:pointer;
	background:url(./route/images/close-1.png) no-repeat;
	display:block;
	right:9px;
	top:0;
}
.ep-sidetools{
	position:absolute;
	z-index: 9;
	top:65px;
}
.ep-lefttools{
	left:-70px;
}
.ep-righttools{
	left:960px;
}
.ep-nav{
	position:absolute;
	top:262px;
	cursor:pointer;
	padding:12px 0;
	opacity:.88;
	text-align: left;
	border-radius:3px 0 0 3px;
	-webkit-border-radius:3px 0 0 3px;
	-moz-border-radius:3px 0 0 3px;
	-ms-border-radius:3px 0 0 3px;
	-o-border-radius:3px 0 0 3px;
}
.ep-nav-right{
	right:-8px;
	padding-right:2px;
	border-radius:0 3px 0 0;
	-webkit-border-radius:0 3px 0 0;
	-moz-border-radius:0 3px 0 0;
	-ms-border-radius:0 3px 0 0;
	-o-border-radius:0 3px 0 0;
}
.ep-nav i{
	width:60px;
	height:48px;
	display:block;
	background:url(./route/images/arrow-1.png) no-repeat 10px 0;
	margin:13px 0;
}
.ep-nav-left i{
	float:left;
}
.ep-nav-right i{
	float:right;
	background-position:20px -47px;
}
.ep-nav label{
	color:#9b9b9b;
	font-size:14px;
	margin-bottom: 2px;
}
.ep-nav span{
	color:#f6f6f6;
	font-size:16px;
	height:48px;
	line-height: 24px;
	overflow:hidden;
}
.ep-nav-pc:hover label,.ep-nav-pc:hover span{
	display:block;
}
.ep-nav-pc label,.ep-nav-pc span{
	display:none;
}
.ep-nav-pc:hover{
	opacity:1;
	background:#000;
	text-decoration: none;
	width:295px;
}
.ep-nav-pc.ep-nav-left:hover{
	padding-right:18px;
}
.ep-nav-pc.ep-nav-right:hover{
	padding-left:18px;
}
#endText{margin-top: -30px; font-size:16px; line-height:30px;	text-indent:2em; padding:0 10px; }
.listfooter{
	clear:both;
	width:100%;
	height:264px;
	background:#EDE8E2  url(../images/footbg.png) no-repeat center bottom;
	padding-top:40px;
}
.listfooter-con{
	width:1200px;
	margin:0 auto;
	font-size:13px;
	color:#8a5f10;
}
#picture img{
margin-top: 20px;
width: 600px;
margin-left: 65px;
}

/* 最新信息 */
	#main_new1{
		width: 994px;
	    height: 33px;
	    background-color: #fafafa;
	    border: 1px solid #eee;
	    margin-bottom: -19px;
	    margin-top: 10px; 
	}
	#xinwen { 
		overflow:hidden; 
		width: 849px; 
	}  
	#inxinwen { 
		float: left; 
		width: 800%; 
	} 
	#xinwen1 { 
		float: left; 
	}
	
	/*活动图片*/
	#foot_url {
		width: 1000px;
		height: 200px;
		margin: 0 auto;
	}
	#demo { 
		background-color: #fafafa; 
		overflow:hidden; 
		width: 1000px; 
	}  
	#indemo { 
		float: left; 
		width: 800%; 
	} 
	#demo1 { 
		float: left; 
	}
</style>
<script type="text/javascript">
	
	function clickQuery(id){
		//第一步先清空
		$("#titleValue").html("");
       	$("#browseVolume").html("");
       	$("#releaseTime").html("");
       	$("#contents").html("");
       	$("#picture").html("");
       	$("#lastOneId").append("");
       	$("#nextArticleId").append("");
       	
		$(".commend-epwrap").show();
		$.ajax({
            type:"POST",
            url :"gateway_clickQuery.action",
            dataType:"json",
            data:{
            	"id":id,
            	"classification":"1"
            },
            success:function (data) {//date是返回的结果，这里对返回值进行处理
            	var datas = eval(data);
            	$("#titleValue").html(datas[0].title);
            	$("#browseVolume").html(datas[0].clickRate);
            	$("#releaseTime").html(datas[0].releaseTime);
            	$("#contents").html(datas[0].content);
            	//判断是否有图片
            	if(datas[0].picture==null){
            	}else{
            		$("#picture").html("<img src='"+datas[0].picture+"' >");
            	}
            	//上一篇
            	if(datas[0].lastOneId==null){
            		var lastOneId = "<a class='ep-nav ep-nav-pc ep-nav-left' href='javascript:void(0);'>"+
				                        "<i></i>"+
				                        "<label>上一篇：</label>"+
				                        "<span id='ep-prev'>"+datas[0].lastOneTitle+"</span>"+
				                     "</a>";
				    $("#lastOneId").append(lastOneId);
            	}else{
            		var lastOneId = "<a class='ep-nav ep-nav-pc ep-nav-left' href='javascript:void(0);' onclick='clickQuery("+datas[0].lastOneId+")'>"+
				                        "<i></i>"+
				                        "<label>上一篇：</label>"+
				                        "<span id='ep-prev'>"+datas[0].lastOneTitle+"</span>"+
				                     "</a>";
				    $("#lastOneId").append(lastOneId);
            	}
            	
            	//下一篇
            	if(datas[0].nextArticleId==null){
            		var nextArticleId = "<a class='ep-nav ep-nav-pc ep-nav-right' href='javascript:void(0);'>"+
					                       "<i></i>"+
					                       "<label>下一篇：</label>"+
					                       "<span id='ep-next'>"+datas[0].nextArticleTitle+"</span>"+
					                    "</a>";
					$("#nextArticleId").append(nextArticleId);
            	}else{
            		var nextArticleId = "<a class='ep-nav ep-nav-pc ep-nav-right' href='javascript:void(0);' onclick='clickQuery("+datas[0].nextArticleId+")'>"+
					                       "<i></i>"+
					                       "<label>下一篇：</label>"+
					                       "<span id='ep-next'>"+datas[0].nextArticleTitle+"</span>"+
					                    "</a>";
					$("#nextArticleId").append(nextArticleId);
            	}
            },
            error:function(){
              alert("系统异常，请稍后重试！");
            }
	    });
	}
	
	function bb(){
		$(".commend-epwrap").hide()
	}
	$(function(){
		var Wheingt = $(document.body).height()-150;
		$(".commend-epwrap").height(Wheingt);
	});
	
</script>
</head>
<body class="commend-showep">

<div style="position: fixed;z-index: 999999999;width: 100%;">
	<div class="header">
		<div class="headerCon">
			<div class="logo">
				<img src="${pageContext.request.contextPath}/route/images/logo1.png" alt="">
			</div>
			<div class="language">
				<span>市政府网搜索</span>|<span>RSS订阅</span>|<span><a style="color: #333;font-size: 12px;" onclick="SetHome(window.location)" href="javascript:void(0)">设为首页</a></span>|<span>中文版</span>|<span>English</span><%-- |<span><a style="color: #333;font-size: 12px;" href="userlogin_login.action">后台入口</a></span> --%>
				<br clear="both">
				<span>
					<div class="search_box radius6">                   
					  <form  action="gateway_siteSearch.action"method="post">
					        <input class="inp_srh" id="s1" name="keyName"  placeholder="请输入您要查找的文件及信息">                     
					        <button style="border:none;cursor:pointer;" id="submit" class="seachButton" ></button>
					   </form>
					</div>
				</span>
			</div>
		</div>
	</div>
	<div class="nav">
		<div class="navCon">
			<ul  class="menu"><div class="li_3_div" style="top:95%;"></div>
				<li id="navSelect"><a href="gateway.action">首 页</a></li>
				<li class="li_3"><a href="gateway_information.action">信息公开</a>
					<dl class="li_3_content"  style="top: 122px; margin-left: 0%; ">
	                    <dt></dt>
	                    <dd><a href="gateway_information.action"><span>通知公告</span></a></dd>
	                    <dd><a href="gateway_dataStatistical.action"><span>统计数据</span></a></dd>
	                    <dd><a href="gateway_plan.action"><span>开发区规划</span></a></dd>
	                    <dd><a href="gateway_keyInvestment.action"><span>重点招商项目</span></a></dd>
	                    
	                </dl>
				</li>
				<li class="li_3"><a href="gateway_survey.action">投资环境</a>
					<dl class="li_3_content">
	                    <dt></dt>
	                    <dd><a href="gateway_survey.action"><span>湛江开发区概况</span></a></dd>
	                    <dd><a href="gateway_advantage.action"><span>投资优势</span></a></dd>
	                    <dd><a href="gateway_cost.action"><span>投资成本</span></a></dd>
	                    <dd><a href="gateway_shanweiPolicy.action"><span>投资政策</span></a></dd>
	                    <dd><a href="gateway_economicDevelopment.action"><span>经济发展</span></a></dd>
	                    <dd><a href="gateway_carrier.action"><span>载体介绍</span></a></dd>
	                    
	                </dl>
				</li>
				<li class="li_3"><a href="gateway_settledProject.action">产业布局</a>
					<dl class="li_3_content"  style="top: 122px; margin-left: 0%; ">
	                    <dt></dt>
	                    <dd><a href="gateway_settledProject.action"><span>重大落户项目</span></a></dd>
	                    <dd><a href="gateway_keyindustry.action"><span>重点企业</span></a></dd>
	                    <dd><a href="gateway_theCountyIndustrialZone.action"><span>GIS产业地图</span></a></dd>
	                </dl>
				</li>
				<li class="li_3"><a href="gateway_investmentProcessData.action">投资服务</a>
					<dl class="li_3_content"  style="top: 122px; margin-left: 0%; ">
	                    <dt></dt>
	                    <dd><a href="gateway_investmentProcessData.action"><span>投资流程</span></a></dd>
            			<dd><a href="gateway_investmentCatalogData.action"><span>投资目录</span></a></dd>
            			<dd><a href="gateway_functionalDepartmentsData.action"><span>职能部门联系</span></a></dd>
	                    <dd><a href="gateway_fileDownload.action"><span>资料下载</span></a></dd>
	                </dl>
				</li>
				<li class="li_3"><a href="#">互动交流</a>
					<dl class="li_3_content"  style="top: 122px; margin-left: 0%; ">
	                    <dt></dt>
	                    <dd><a href="gateway_mailbox.action"  target="_blank"><span>局长信箱</span></a></dd>
				        <dd><a href="gateway_complaint.action" target="_blank"><span>投诉建议</span></a></dd><dd><a href="gateway_opinionCollection.action" target="_blank"><span>意见征集</span></a></dd>
	                </dl>
				</li>
				<li class="li_3"><a href="gateway_mechanismFunction.action">联系我们</a>
					<dl class="li_3_content"  style="top: 122px; margin-left: 0%; ">
	                    <dt></dt>
	                    <dd><a href="gateway_mechanismFunction.action"><span>机构职能</span></a></dd>
	                    <dd><a href="gateway_contactUs.action"><span>联系我们</span></a></dd>
	                </dl>
				</li>
				<li class="weixin"><img alt="" src="${pageContext.request.contextPath}/route/images/weixin.png" style="margin-top: 8px;width: 25px;margin-left: -30px;">
	                <div class="zs-ewm" style="display: none;">
                        <span></span>
                        <div style="float: left;">
                        	<img src="${pageContext.request.contextPath}/route/images/1485230278.png">
                        	<h3>官方微信二维码</h3>
                        </div>
                    </div>
				</li>
			</ul>
		</div>
	</div>
</div>
<!--E listPage-->
   <!--弹出框-->
   <div class="commend-epwrap" style="display: none;">
       <div class="mainarea">
           <div class="commend-epbody">
               <div class="commend-epbody-inner" id="epContent" style="visibility: visible; min-height: 600px;overflow: auto;height: 600px;">
                   <a class="ep-close" href="javascript:void(0);" onclick="bb()" title="关闭" style="visibility: visible"></a>
                   <h1 class="ep-h1" id="titleValue"></h1>
                   <div class="ep-info">
					日期：<span class="ep-datatime" id="releaseTime"></span>&nbsp;&nbsp;&nbsp;&nbsp;
					来源：<span class="ep-source">湛江经济技术开发区</span>&nbsp;&nbsp;&nbsp;&nbsp;
					浏览：<span class="ep-click" id="browseVolume"></span>
				</div>
                   <div id="endText">
                    <p id="picture"></p>
					<p style="text-align: center;">&nbsp;</p>
					<p id="contents"></p>
                   </div>
                   <!--上一篇 -->
                   <div class="ep-sidetools ep-lefttools" id="lastOneId">
                       
                   </div>
                   
                   <!-- 下一篇 -->
                   <div class="ep-sidetools ep-righttools" id="nextArticleId">
                       
                   </div>
               </div>
           </div>
           <div class="epmask" id="epMask" style="display: block;"></div>
       </div>
   </div>
	 <div id="playBox">
		<div class="pre"></div>
		<div class="next"></div>
		<div class="smalltitle">
		  <ul>
			<li class="thistitle"></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		  </ul>
		</div>
		<ul class="oUlplay">
		   <li><a href="#" target="_blank"><img class="imgStyle" src="${pageContext.request.contextPath}/route/images/zhanjiang01.jpg"></a></li>
		   <li><a href="#" target="_blank"><img class="imgStyle" src="${pageContext.request.contextPath}/route/images/zhanjiang05.jpg"></a></li>
		   <li><a href="#" target="_blank"><img class="imgStyle" src="${pageContext.request.contextPath}/route/images/zhanjiang02.jpg"></a></li>
		   <li><a href="#" target="_blank"><img class="imgStyle" src="${pageContext.request.contextPath}/route/images/zhanjiang03.jpg"></a></li>
		   <li><a href="#" target="_blank"><img class="imgStyle" style="height: 320px;" src="${pageContext.request.contextPath}/route/images/zhanjiang04.jpg"></a></li>
		</ul>
    </div>
				
	<div class="container">
		<div style="margin-top: 25px;">
			<div class="StandardHead" style="width: 675px;display: inline-block;">通知公告<br clear="both">
				<span style="margin-left: 0px;">NEWS CENTER</span>
			</div>
			<div class="StandardHead" style="width: 318px;display: inline-block;">投资引导<br clear="both">
				<span style="margin-left: 0px;">Investment Guide</span>
			</div>
		</div>
		<div id="main_new1">
			<table cellpadding="0" cellspacing="0" border="0" width="1000" height="33" align="center" background="./广州招商网_files/nav_bg.gif">
			  <tbody><tr>
				<td width="145" align="center" style="float:left;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody><tr>
							<td><img  src="${pageContext.request.contextPath}/route/images/icon_01.gif" border="0" style="float: left"></td>
							<td style="font-size:12px;position: relative;"><span style="position: absolute;margin-left: -76px;top: 11px;">最新信息：</span></td>
						</tr>
					</tbody></table>
				</td>
				<td width="500px" style="float:left;">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
						  <td width="100%"  style="position: relative;">
							<div id="xinwen" style="position: absolute;top: 11px;margin-left:0px;"> 
							<div id="inxinwen"> 
							<div id="xinwen1">
								<div id="xinwen3" style="float:left;">
									<span style="margin-left: 100px;">&nbsp;</span>
									<s:iterator value="#investmentInformation" status='st'>
										<s:if test="#st.index<100">
												<img src="${pageContext.request.contextPath}/route/images/dot03.gif">
												<a  style="font-size:14px;color:#D26900"  href="gateway_detailPage.action?id=${id}">${title }</a><span style="color:#00659d;">&nbsp;[最新资讯]</span>&nbsp;&nbsp;
										</s:if>
									</s:iterator>
									<s:iterator value="#workDynamics" status='st'>
										<s:if test="#st.index<100"> 
											<img src="${pageContext.request.contextPath}/route/images/dot03.gif">
											<a  style="font-size:14px;color:#D26900"  href="gateway_detailPage.action?id=${id}">${title }</a><span style="color:#00659d;">&nbsp;[企业动态]</span>&nbsp;&nbsp;
										</s:if>
									</s:iterator>
									<s:iterator value="#notificationAnnouncement" status='st'>
										<s:if test="#st.index<100"> 
											<img src="${pageContext.request.contextPath}/route/images/dot03.gif">
											<a  style="font-size:14px;color:#D26900"  href="gateway_detailPage.action?id=${id}">${title }</a><span style="color:#00659d;">&nbsp;[通知公告]</span>&nbsp;&nbsp;
										</s:if>
									</s:iterator>
								</div>
							</div> 
							</div> 
							</div> 
							<script> 
									var speed1=35; //数字越大速度越慢 
									var pad=document.getElementById("xinwen"); 
									var pad1=document.getElementById("xinwen1"); 
									//var pad2=document.getElementById("xinwen2"); 
									var pad3=document.getElementById("xinwen3"); 
									pad1.innerHTML=pad3.innerHTML; 
									function Marquee1(){ 
										if(pad1.offsetWidth-pad.scrollLeft<=0) 
											pad.scrollLeft-=pad1.offsetWidth; 
										else{ 
											pad.scrollLeft++; 
										} 
									} 
									var MyMar1=setInterval(Marquee1,speed1); 
									pad.onmouseover=function() {clearInterval(MyMar1)}; 
									pad.onmouseout=function() {MyMar1=setInterval(Marquee1,speed1)}; 
								 
								</script>
						  </td>
						 </tr>
				  </tbody></table>
				</td>
			  </tr>
			</tbody></table>
		</div>
		<div class="newData">
			<div class="newLists">
				<div id="focusImage" class="slide">
					<ul class="contents">
						<s:iterator value="#smallPicturePolling" status="st">
							<s:if test="#st.index<5">
								<li>
									<div class="image"><a href="javascript:void(0)"  onclick="clickQuery(${id});"><img src="${picture }"></a></div>
									<div class="text">
										<span class="title"><a onclick="clickQuery(${id});" target="_blank">${title }</a></span>
										<p>${fieldSummary }</p>
									</div>
									
								</li>
							</s:if>
						</s:iterator>
					</ul>
					
					<div class="triggers" style="display:none;">
						<a href="javascript:;" class="cur current"><img src="${pageContext.request.contextPath}/route/images/1.jpg" width="58" height="38"></a>
						<a href="javascript:;"><img src="${pageContext.request.contextPath}/route/images/2.jpg" width="58" height="38"></a>
						<a href="javascript:;"><img src="${pageContext.request.contextPath}/route/images/3.jpg" width="58" height="38"></a>
						<a href="javascript:;"><img src="${pageContext.request.contextPath}/route/images/4.jpg" width="58" height="38"></a>
						<a href="javascript:;"><img src="${pageContext.request.contextPath}/route/images/5.jpg" width="58" height="38"></a>
					</div>

					<div class="icon-dot">
						<a href="javascript:;" class="cur current"></a>
						<a href="javascript:;"></a>
						<a href="javascript:;"></a>
						<a href="javascript:;"></a>
						<a href="javascript:;"></a>
					</div>
				</div>
			</div>

			<div class="newTab">
				<ul class="natit">
					<li class="NewsDetailBg">最新资讯</li>
					<li>企业动态</li>
					<li>通知公告</li>
				</ul>
				<div class="NewsDetail">
					<ul>
						<s:iterator value="#investmentInformation" status='st'>
							<s:if test="#st.index<6"> 
								<li style="position: relative;width: 366px;text-overflow: ellipsis;overflow: hidden;text-indent: 24px;white-space: nowrap;padding-right: 0px;">
									<a  href="javascript:void(0)"  onclick="clickQuery(${id});"><span><fmt:formatDate  value="${releaseTime}" type="both" pattern="yyyy-MM-dd" /></span>${title }</a></li>
							</s:if>
						</s:iterator>
						<a href="gateway_investmentInformation.action" style="color: gray; float: right;position: absolute;top: 259px;right: 0px;">更多>></a>
					</ul>
					<ul>
						<s:iterator value="#workDynamics" status='st'>
							<s:if test="#st.index<6"> 
								<li style="position: relative;width: 366px;text-overflow: ellipsis;overflow: hidden;text-indent: 24px;white-space: nowrap;padding-right: 0px;">
									<a  href="javascript:void(0)"  onclick="clickQuery(${id});"><span><fmt:formatDate  value="${releaseTime}" type="both" pattern="yyyy-MM-dd" /></span>${title }</a></li>
							</s:if>
						</s:iterator>
						<a href="gateway_workDynamics.action" style="color: gray; float: right;position: absolute;top: 259px;right: 0px;">更多>></a>
					</ul>
					<ul>
						<s:iterator value="#notificationAnnouncement" status='st'>
							<s:if test="#st.index<6"> 
								<li style="position: relative;width: 366px;text-overflow: ellipsis;overflow: hidden;text-indent: 24px;white-space: nowrap;padding-right: 0px;">
									<a href="javascript:void(0)"  onclick="clickQuery(${id});"><span><fmt:formatDate  value="${releaseTime}" type="both" pattern="yyyy-MM-dd" /></span>${title }</a></li>
							</s:if>
						</s:iterator>
						<a href="gateway_notificationAnnouncement.action" style="color: gray; float: right;position: absolute;top: 259px;right: 0px;">更多>></a>
					</ul>
				</div>
			</div>
		</div>
		<div class="ReportGuidance">
			<ul style="height: 276px;">
				<li><span><a href="gateway_carrier.action" style="color: #3b63ab;font-size: 15px;">重点园区</a></span>
					<s:iterator value="#parkCarrier" status='st'>
						<s:if test="#st.index<2"> 
							<a href="gateway_detailPage.action?id=${id}" target="_blank">${title }、</a>
						</s:if>
					</s:iterator>
				</li>
				<li><span><a href="gateway_keyindustry.action" style="color: #3b63ab;font-size: 15px;">重点企业</a></span>
					<s:iterator value="#keyIndustry" status='st'>
						<s:if test="#st.index<3"> 
							<a href="gateway_detailPage.action?id=${id}" target="_blank">${title }、</a>
						</s:if>
					</s:iterator>
				</li>
				<li><span><a href="gateway_shanweiPolicy.action" style="color: #3b63ab;font-size: 15px;">投资政策</a></span>
					<s:iterator value="#foreignInvestment" status='st'>
						<s:if test="#st.index<1"> 
							<a href="gateway_detailPage.action?id=${id}" target="_blank">${title }</a>
						</s:if>
					</s:iterator>
				</li>
				<li>
					<%-- <s:iterator value="#investmentProcess" status='st'>
						<span><a href="gateway_investmentGuide.action" style="color: #3b63ab;font-size: 15px;">投资服务</a></span>
						<s:if test="#st.index<1"> 
							<a href="gateway_detailPage.action?id=${id}" target="_blank">${title }</a>
						</s:if>
					</s:iterator> --%>
					<span><a href="gateway_investmentProcessData.action" style="color: #3b63ab;font-size: 15px;">投资服务</a></span>
					<a href="gateway_investmentProcessData.action" target="_blank">投资流程</a>&nbsp;&nbsp;&nbsp;
            		<a href="gateway_investmentCatalogData.action" target="_blank">投资目录</a>
				</li>
				<li><span><a href="gateway_keyInvestment.action" style="color: #3b63ab;font-size: 15px;">招商项目</a></span>
					<s:iterator value="#industrialPark" status='st'>
						<s:if test="#st.index<3"> 
							<a href="gateway_projectReading.action?id=${id }&classification=1" target="_blank">${title }</a>
						</s:if>
					</s:iterator>
				</li>
			</ul>
		</div>
		<br clear="both">
		<div class="shangwei">
			<!-- 招商title -->
			<div class="StandardHead" style="margin-top: 25px;">投资湛江开发区
			<br clear="both"><span>Invest in Zhanjiang</span>
				<!-- <a href="gateway_investInShanwei.action" style="color: gray; float: right;position: absolute;margin-left: 830px;margin-top: 10px;">更多&gt;&gt;</a> -->
			</div>
			<!-- item -->
			<div class="item" style="height: 575px;width: 1040px;">
				<ul>
					<%-- <s:iterator value="#investInShanwei" status='st'>
						<s:if test="#st.index<3"> 
							<div class="itemDemo" style="margin-left: 0px;">
								<img src="${picture }">
								<p><a style="color: #333;font-size: 15px; margin-left: 10px;" href="gateway_detailPage.action?id=${id}" target="_blank">${title }</a></p>
								<span style="height: 62px;width: 302px;
								word-break: break-all;
								text-overflow: ellipsis;
								display: -webkit-box;
								-webkit-box-orient: vertical;
								-webkit-line-clamp: 3;
								overflow: hidden;text-indent: 0.7cm;">${fieldSummary }</span>
							</div>
						</s:if>
					</s:iterator> --%>
					<div class="itemDemo" style="margin-top: 30px;margin-left: 0px;">
						<img src="${pageContext.request.contextPath}/route/images/PeopleRoad.jpg" alt="">
						<p><a href="gateway_survey.action" style="color: #333;font-size: 15px;margin-left: 10px;">湛江开发区概况</a></p>
						<span style="height: 62px;width: 302px;
								word-break: break-all;
								text-overflow: ellipsis;
								display: -webkit-box;
								-webkit-box-orient: vertical;
								-webkit-line-clamp: 3;
								overflow: hidden;text-indent: 0.7cm;">湛江市为国家一类城市，是中国大陆唯一的热带海滨城市，全市面积1.32万平方公里，人口约754万。地处广东、广西、海南三省区交汇处，东接珠三角，西临北部湾，背靠中国大西南，面向东南亚国家。具有独特的区位优势和深水良港，交通发达，是世界贸易的“大通道”，是开发大西南的“金钥匙”，是进军东盟的“桥头堡”，是中国沿海通往非洲、中东、欧洲、东南亚、大洋洲航程最短的口岸。</span>

					</div>
					<div class="itemDemo" style="margin-top: 30px;margin-left: 0px;">
						<img src="${pageContext.request.contextPath}/route/images/DianJi.jpg" alt="">
						<p><a href="gateway_advantage.action" style="color: #333;font-size: 15px; margin-left: 10px;">投资优势</a></p>
						<span style="height: 62px;width: 302px;
								word-break: break-all;
								text-overflow: ellipsis;
								display: -webkit-box;
								-webkit-box-orient: vertical;
								-webkit-line-clamp: 3;
								overflow: hidden;text-indent: 0.7cm;">湛江市具有独特的地缘区位优势：一是中国沿海通往非洲、中东、欧洲、东南亚、大洋洲航程最短的口岸；二是中国大西南经济腹地进出口的重要咽喉；三是中国进军东盟各国市场最佳的“桥头堡”，也是东盟各国进入中国大陆市场最佳的“登陆点”。独特的区位优势使湛江经济技术开发区在泛珠三角经济合作圈、环北部湾经济圈、中国—东盟自由贸易区、亚太经济圈中处于重要的战略地位，成为中国大陆最适宜外来投资者投资经营的地区之一。</span>

					</div>
					<div class="itemDemo" style="margin-top: 30px;margin-left: 0px;">
						<img src="${pageContext.request.contextPath}/route/images/ZhanHua.jpg" alt="">
						<p><a href="gateway_cost.action" style="color: #333;font-size: 15px; margin-left: 10px;">投资成本</a></p>
						<span style="height: 62px;width: 302px;
								word-break: break-all;
								text-overflow: ellipsis;
								display: -webkit-box;
								-webkit-box-orient: vertical;
								-webkit-line-clamp: 3;
								overflow: hidden;text-indent: 0.7cm;">湛江经济技术开发区有丰富的水资源、电力资源以及土地资源，水价、电价、地价成本较低。</span>
					</div>
					<div class="itemDemo" style="margin-top: 30px;margin-left: 0px;">
						<img src="${pageContext.request.contextPath}/route/images/1460688389233064357.jpg" alt="">
						<p><a href="gateway_settledProject.action" style="color: #333;font-size: 15px;margin-left: 10px;">重点项目介绍</a></p>
						<span style="height: 62px;width: 302px;
								word-break: break-all;
								text-overflow: ellipsis;
								display: -webkit-box;
								-webkit-box-orient: vertical;
								-webkit-line-clamp: 3;
								overflow: hidden;text-indent: 0.7cm;">湛江经济技术开发区有重点企业宝钢集团、中科炼化、冠豪高新、恒立电子、盛宝科技等，涵盖了钢铁、石化和造纸等三大产业链。</span>

					</div>
					<div class="itemDemo" style="margin-top: 30px;margin-left: 0px;">
						<img src="${pageContext.request.contextPath}/route/images/1460652736043074039.jpg" alt="">
						<p><a href="gateway_carrier.action" style="color: #333;font-size: 15px; margin-left: 10px;">重点载体介绍</a></p>
						<span style="height: 62px;width: 302px;
								word-break: break-all;
								text-overflow: ellipsis;
								display: -webkit-box;
								-webkit-box-orient: vertical;
								-webkit-line-clamp: 3;
								overflow: hidden;text-indent: 0.7cm;">湛江经济技术开发区有重点投资载体湛江开发区水产加工示范基地、湛江高新技术产业开发区、广州(湛江)产业转移工业园、广东湛江东海岛经济开发区，包含了水产品加工、高新技术、制造业等行业。</span>

					</div>
					<div class="itemDemo" style="margin-top: 30px;margin-left: 0px;">
						<img src="${pageContext.request.contextPath}/route/images/1460654573540059776.jpg" alt="">
						<p><a href="gateway_detailPage.action?id=529" style="color: #333;font-size: 15px; margin-left: 10px;">重点产业介绍</a></p>
						<span style="height: 62px;width: 302px;
								word-break: break-all;
								text-overflow: ellipsis;
								display: -webkit-box;
								-webkit-box-orient: vertical;
								-webkit-line-clamp: 3;
								overflow: hidden;text-indent: 0.7cm;">2016年，湛江开发区总体经济继续领跑全市。1—9月，全区完成国内生产总值210.22亿元，同比增长15.2%。分产业看，其中工业生产保持高速增长，第二产业增加值109.02亿元，同比增长26.5%。三次产业结构优化为11.9：51.9：36.3。全区规模以上工业总产值完成298.93亿元，同比增长58.5%，增幅比全市平均水平高42.5个百分点。湛江开发区经济龙头作用得到体现，为打造湛江经济发展第一增长极奠定了良好基础。</span>
					</div>
				</ul>
			</div>
			<br clear="both">
			<div id="foot_url">
				<div class="StandardHead" style="margin-top: 25px;margin-bottom: 10px;">开发区风采
					<br clear="both"><span>Development zone style</span>
				</div>
				<table cellpadding="0" cellspacing="0" border="0" width="800" height="64" align="center">
				  <tbody>
				  <tr>
					<td valign="middle" width="835" height="50" background="./广州招商网_files/link_bg.gif" style="background-repeat:repeat-x">
					  <table cellpadding="0" cellspacing="0" border="0" width="100%" height="50" valign="middle" align="center">
						<tbody><tr valign="middle">
						  <td valign="middle" height="50">
							<table cellpadding="0" cellspacing="0" width="100%" border="0" align="left" valign="middle">
							  <tr>
								<td>
									<div id="demo"> 
										<div id="indemo"> 
											<div id="demo1">
												<s:iterator value="#picture" status='st'>
													<s:if test="#st.index<500"> 
														<img style="width: 250px;height: 115px;"  src="${picturePath }" border="0">&nbsp;
													</s:if>
												</s:iterator>
											</div> 
										</div> 
									</div> 
									<script>
										var speed=40; //数字越大速度越慢 
										var tab=document.getElementById("demo"); 
										var tab1=document.getElementById("demo1"); 
										function Marquee(){ 
											if(tab1.offsetWidth-tab.scrollLeft<=0) 
												tab.scrollLeft-=tab1.offsetWidth 
											else{ 
												tab.scrollLeft++; 
											} 
										} 
										var MyMar=setInterval(Marquee,speed); 
										tab.onmouseover=function() {clearInterval(MyMar)}; 
										tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};
									</script>
								</td>
							  </tr>
							</tbody></table>
						  </td>
						</tr>
					  </tbody></table>
					</td>
				  </tr>
				</tbody></table>  
			</div>
			<br clear="both">
			<div class="investor">
				<div class="vedio"><!--VOB<img src="./images/video.jpg" alt="">-->
					<%-- <video  autoplay="autoplay" id="video1"  width="370" height="207" controls preload >
						<source src="${pageContext.request.contextPath}/route/images/VTS.mp4" media="only screen and (max-device-width: 568px)"></source>
					</video> --%>
					<embed id="embed" src="${pageContext.request.contextPath}/route/images/20161015.mp4" volume=-10000  width="370" height="280" volume="0" loop="true" width="200" height="150" >
				</div>
				<div class="I_want_to_invest">
					<p>我要投资</p>
					<%-- <span>更多>></span> --%>
				</div>
				<table>
					<tr>
						<td>产业类型：</td>
						<td colspan="3"><input type="text" id="industryType" name="industryType" size="68"></td>
					</tr>
					<tr>
						<td>项目名称：</td>
						<td colspan="3"><input type="text" id="entryName" name="entryName" size="68"></td>
					</tr>
					<tr>
						<td>联系人：</td>
						<td ><input type="text" id="contacts" name="contacts" size="24" style="width: 203px;"></td>
						<td>邮箱：</td>
						<td ><input type="text" id="mailbox" name="mailbox" size="24" style="width: 203px;"></td>
					</tr>
					<tr>
						<td>联系电话：</td>
						<td ><input type="text" id="contactPhone" name="contactPhone" size="24" style="width: 203px;"></td>
						<td>手机：</td>
						<td ><input type="text" id="mobilePhone" name="mobilePhone" size="24" style="width: 203px;"></td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="submit" style="margin-left: 444px;margin-top: 5px;width: 115px;height: 30px;background-color: #3c62ad;border: none;color: #fff;cursor: pointer;position: absolute;" onclick="add();">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<br clear="both">
	<div>
		<div class="StandardHead" style="margin-top: 25px;margin-left: 175px;">友情链接
			<br clear="both"><span>Links</span>
		</div>
		<ul class="friendship">
			<li><a href="http://www.zhao-shang.com.cn">中国第一招商网</a></li>
			<li><a href="http://www.investguangdong.gov.cn/Article/" >广东省投资促进局</a></li>
			<li><a href="http://www.chinamarket.com.cn/web/zh_CN/cecf/">中国商品交易市场</a></li>
			<li><a href="http://www.ec.com.cn/">商务部中国国际电子商务中心</a></li>
			<li><a href="http://www.ecnia.org">深圳外商投资企业协会</a></li>
			<li><a href="http://www.investhk.gov.hk">香港投资推广署</a></li>
			<li><a href="http://www.investhk.gov.hk">香港贸易发展局</a></li>
			<li><a href="http://www.ipim.gov.mo">澳门贸易投资促进局</a></li>
			<li><a href="http://tzswj.mofcom.gov.cn/">商务部投资促进事务局</a></li>
		</ul>
	</div>
	<div class="footer">
		<div class="footerConn">
			<div class="QR">
				<img style="width: 68px;" src="${pageContext.request.contextPath}/route/images/1485230278.png" alt="">
			</div>
			<div class="copyright">
				<ul>
					<li><a style="color: #FFF;" href="gateway.action">网站首页</a></li>
					<li><a style="color: #FFF;" onclick="SetHome(window.location)" href="javascript:void(0)">设为首页</a></li>
					<li><a style="color: #FFF;" onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">加入收藏</a></li>
					<li><a style="color: #FFF;" href="gateway_siteMap.action">网站地图</a></li>
					<li><a style="color: #FFF;" href="gateway_privacyProtection.action">隐私保护</a></li>
					<li><a style="color: #FFF;" href="gateway_disclaimerOfLiability.action">免责声明</a></li>
					<li><a style="color: #FFF;" href="gateway_contactUs.action">联系我们</a></li>
					<li><a style="color: #FFF;" href="gateway_opinionCollection.action">意见提交</a></li>
				</ul>
				<p>版权所有：湛江经济技术开发区管委会　地址：广东省湛江市湛江经济技术开发区东海岛中线公路中一号东海大厦。&nbsp;&nbsp;&nbsp;&nbsp;邮编：524076</p>
				<p>未经书面授权任何单位、个人不得转载或建立镜像(建议使用1024×768分辨率 IE7.0以上版本浏览器) 粤ICP备040144</p>
			</div>
		</div>
	</div>
	
	
	<div class="floating_ck">
		<dl>
	    	<dt></dt>
	        <dd class="consult">
	        	<a href="gateway_mailbox.action"  target="_blank">局长信箱</a>
	        </dd>
	        <dd class="words">
	        	<a href="gateway_fileDownload.action" target="_blank">下载专区</a>
	        </dd>
	        <dd class="quote">
	        	<a href="gateway_complaint.action" target="_blank">投诉建议</a>
	        </dd>
	        <dd class="qrcord">
	            <a href="gateway_opinionCollection.action" target="_blank">意见征集</a>
	        </dd>
	        <dd class="return" style="height: 70px;">
	        	<span onClick="gotoTop();return false;">返回顶部</span>
	        </dd>
	    </dl>
	</div>
	
</body>
<script type="text/javascript">
	new ImageSlide({
		project:"#focusImage",
		content:".contents li",
		tigger:".triggers a",
		dot:".icon-dot a",
		watch:".link-watch",
		auto:!0,
		hide:!0
	})
	
	$(function(){
		$(".newTab>ul>li").click(function(){
			$(this).addClass("NewsDetailBg").siblings().removeClass("NewsDetailBg");
			$(".NewsDetail ul").eq($(this).index()).show().siblings().hide();
		})
	})
	
	$(function(){
		$(".slideWrap>ul>li").click(function(){
			$(this).addClass("current").siblings().removeClass("current");
			$(".item ul").eq($(this).index()).show().siblings().hide();
		})
	})
	
	$(function () {
		$(".li_3_div").hide();
	    var st = 180;
	    $(".li_3").mouseenter(function () {
	        $(this).find("dl").stop(false, true).slideDown(st);
	        $(".li_3_div").show();
	    }).mouseleave(function () {
	        $(this).find("dl").stop(false, true).slideUp(st);
	        $(".li_3_div").hide();
	    });
	});
	
	
	$(function () {
	    $(".weixin").mouseenter(function () {
	    	var y = $(this).offset().left;
	    	$(".zs-ewm").css("left",y-50);
	    	$(".zs-ewm").show();
	    }).mouseleave(function () {
	    	$(".zs-ewm").hide();
	    });
	});
	
	function add(){
		var name = $("#entryName").val();
		var contacts = $("#contacts").val();
		var contactPhone = $("#contactPhone").val();
		var mailbox = $("#mailbox").val();
		if(name==""){
			alert("项目名称不能为空！");
			return false;
		}
		else if(contacts==""){
			alert("联系人不能为空！");
			return false;
		}
		else if(contactPhone==""){
			alert("联系人电话不能为空！");
			return false;
		}
		else if(mailbox==""){
			alert("邮箱不能为空！");
			return false;
		}
		else{
			$.ajax({
                type:"POST",
                url :"gateway_add.action",
                dataType:"json",
                data:{
                	"industryType":$("#industryType").val(),
                	"entryName":$("#entryName").val(),
                	"contacts":$("#contacts").val(),
                	"mailbox":$("#mailbox").val(),
                	"contactPhone":$("#contactPhone").val(),
                	"mobilePhone":$("#mobilePhone").val(),
                },
                success:function (data) {//date是返回的结果，这里对返回值进行处理
                	alert("您的投资意向已经提交，我们会尽快跟您联系!");
                	window.location.href = "gateway.action";
                },
                error:function(){
                  alert("系统异常，请稍后重试！");
                }
	       });	
		}
		
	}
	
	$(function(){
		$(".contents li").eq(0).addClass("current");
	});
	
  		
   //加入收藏
    function AddFavorite(sURL, sTitle) {
        sURL = encodeURI(sURL); 
	    try{   
	        window.external.addFavorite(sURL, sTitle); 
	    }catch(e) {   
	        try{  
	            window.sidebar.addPanel(sTitle, sURL, "");
	        }catch (e) {   
	            alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
	        }  
	    }
    }
    //设为首页
    function SetHome(url){
        if (document.all) {
            document.body.style.behavior='url(#default#homepage)';
            document.body.setHomePage(url);
        }else{
            alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
        }
    }
    
    
    $(document).scroll(function(){
    	console.log($(document).scrollTop());
    })
    	
   $(function(){
		$(".imgStyle").width($(window).width());
	});
</script>
</html>