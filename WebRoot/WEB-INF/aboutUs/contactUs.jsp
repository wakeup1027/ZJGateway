﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="IE=edge" />
	<title>联系我们</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/public.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/public1.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/touchuUs.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/twoLevelMenu.css">
	<script src="${pageContext.request.contextPath}/route/js/jquery1.8.3.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=9f203065d6bfef95503b9519831eda1b"></script>
	
	<!-- 右下角悬浮框 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/route/js/top.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/suspensionFrame.css">
<style type="text/css">
/*左侧帮助*/
.help { margin-bottom:30px; background:url(./route/images/help_line_shu.gif) repeat-y 220px 0; min-height:453px;}
.help-side { width:220px;float:left;position:relative;}
.help-side dl {/*  background:url(./route/images/help_line_heng.gif) no-repeat 0 bottom;  */padding-bottom:14px; margin-bottom:12px; line-height:40px;}
.help-side dl.last { background:none;}
.help-side dl dt { font-weight:700; color:#FFF; font-size:16px;background-color: #1C74BE;text-align: center;}
.help-side dl dd a {  font-size:12px; color:#787878;    margin-left: 15px;}
.help-side dl dd.cur a,.help-side dl dd a:hover { color:#46a313; text-decoration:none;}
.help-side .side-slider { position:absolute; width:3px; background:#46A313; height:20px; left:0px; top:27px;}
.help-cont { margin-left:185px; padding-left:55px;  font-size:14px; color:#333;}
.help-cont h2 { margin-left: 14px;font-weight:normal; margin-bottom:16px; font-size:16px; font-family:微软雅黑; }
.help-cont p { line-height:24px; padding:0 0 2px; font-size:14px;}
.help-cont p a,.help-cont dl dt a { color:#0078b6;}
.help-cont dl { margin-bottom:10px;}
.help-cont dl dt { background:url(img/icon05.png) no-repeat 0 2px; padding-left:26px; margin-bottom:5px;}
/* .help-cont dl dd { color:#808080; line-height:22px; padding-left:26px;display:none;} */
.code_box{border:1px solid #ccc;padding:10px;background:rgb(240, 240, 240);margin:-20px 0 10px;}
.info_table{width:100%;margin:10px 0 20px;}
.info_table,.info_table th,.info_table td{border:1px solid #ccc;text-align:left;}
.info_table th,.info_table td{padding:0 4px;line-height:22px;}

.main{
	margin-left: 10%;
    margin-top: 12%;
}
.introduce {
    border: 1px solid #eee;
    padding: 15px 10px;
    margin-top: 12%;
    float: left;
    margin-bottom: 25px;
    margin-left: 10%;
    width: 82.7%;
}
.introduce img {
    float: left;
}
.introduce ul {
    float: left;
    width: 830px;
    margin-left: 15px;
    padding-top: 4px;
}
.introduce ul li {
    line-height: 24px;
    font-size: 12px;
    text-indent: 20px;
}
#bsjgTable{}
#l-map{height:300px;width:88%;}
</style>
</head>
<body>
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
				<li class="li_3"><a href="gateway.action">首 页</a></li>
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
				<li id="navSelect" class="li_4"><a href="gateway_mechanismFunction.action">联系我们</a>
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
<br clear="both">

    <div class="main">
	  <div class="help clearfix">
	    <div class="help-side">
		 <dl>
	     <dt>联系我们</dt>
			<dd><a href="gateway_mechanismFunction.action"><span>机构职能</span></a></dd>
			<dd class="cur"><a href="gateway_contactUs.action"><span>联系我们</span></a></dd>	
	     </dl>
	     <div class="side-slider" style="top: 148px; "></div>
	    </div>
	    <div class="help-cont">
          <div class="container" style="margin-left: 14px;">
				<div class="call" style="margin-top: -19px;">联系我们</div>
				<div class="contain" style="margin-bottom: 30px;width: 88%;">
				<div class="span">
				<span>您好!</span>
				</div>
				<div class="leftcontain">
				<P>尊敬的网友：欢迎您使用湛江市湛江经济技术开发区《公众留言》系统。为使您更方便有效地使用本网站资源，请您留下对本网站建设的意见和建议，以便我们为您提供更多的服务与更好的用户体验。</P>
				<form>
					<table>
						<tr><td>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td><td class="news">广东省湛江市湛江经济技术开发区东海岛中线公路中一号东海大厦</td></tr>
						<tr><td>联系电话：</td><td class="news"></td></tr>
						<tr><td>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：</td><td class="news">524076</td></tr>
						<tr><td>局长邮箱：</td><td class="news">zjkfqfgjbgs@126.com</td></tr>
						<tr><td>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td><td class="news"></td></tr>
						
					</table>
				</form>
				</div>
				<%-- <div class="rightcontain" style="width: 330px;margin-top: -49px;">
					<ul><span style="font-size: 18px;color: #999;">我要投资</span>
						<li><input type="text" placeholder="产业类型" id="industryType" name="industryType" style="width: 310px;"></li>
						<li><input type="text" placeholder="项目名称"  id="entryName" name="entryName" style="width: 310px;"></li>
						<li><input type="text" placeholder="联系人"  id="contacts" name="contacts" style="width: 310px;"></li>
						<li><input type="text" placeholder="邮箱" id="mailbox" name="mailbox" style="width: 310px;"></li>
						<li><input type="text" placeholder="联系电话" id="contactPhone" name="contactPhone" style="width: 310px;"></li>
						<li><input type="text" placeholder="手机号码" id="mobilePhone" name="mobilePhone" style="width: 310px;"></li>
						<li><input type="submit"  onclick="add();" value="提交" style="cursor: pointer;"></li>
					</ul></div><br> --%>
					<div class="rightcontain" style="width: 330px;">
						<ul><span>注：本留言暂不受理其他事项。</span>
							<li><input type="text" placeholder="姓名  Name" style="width: 300px;"></li>
							<li><input type="text" placeholder="邮件  Email" style="width: 300px;"></li>
							<li><input type="text" placeholder="电话  Tel" style="width: 300px;"></li>
							<li><textarea placeholder="留言  Message" cols="65" rows="4" noresize="noresize" style="width: 285px;"></textarea></li>
							<li><input type="submit" value="提交"></li>
						</ul>
					</div>
				
			</div>
			<div style="width:88%; margin-bottom:40px;">
				<table id="bsjgTable" style="width:100%;" border="1" cellspacing="0" cellpadding="10">
					<tr>
						<td colspan="3" style="text-align:center; font-weight:bold;">主要办事机构一览表</td>
					</tr>
					<tr style="text-align:center;">
						<td>部门</td>
						<td>办公电话</td>
						<td>办公室房号</td>
					</tr>
					<tr>
						<td>办公室</td>
						<td>2968980、2968981</td>
						<td>801</td>
					</tr>
					<tr>
						<td>招商一科</td>
						<td>2968997、2968998</td>
						<td>805</td>
					</tr>
					<tr>
						<td>招商二科</td>
						<td>2968985、2968986</td>
						<td>802</td>
					</tr>
					<tr>
						<td>物价科</td>
						<td>2968977、2968987</td>
						<td>807</td>
					</tr>
					<tr>
						<td>投资项目服务中心</td>
						<td>2968971、2968972</td>
						<td>811</td>
					</tr>
					<tr>
						<td>发改科</td>
						<td>2968918、2968913</td>
						<td>812</td>
					</tr>
				</table>
			</div>
			<div id="l-map"></div>
		</div>
	    </div>
	  </div>
	</div>
	
	<!-- footer -->
	<br clear="both">
	<!--底部页面-->
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
	    var st = 180;
	    $(".li_4").mouseenter(function () {
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
	
	$(function(){
		$(".MechanismContent>ul>li").click(function(){
			$(this).addClass("NewsDetailBg").siblings().removeClass("NewsDetailBg");
			$(".w1 ul").eq($(this).index()).show().siblings().hide();
		});
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
    
    (function ($) {
	$(function () {
		sideSlider(); //左侧竖导航
	});
	
	function sideSlider() {
		if (!$(".help-side dl").length) {
			return false;
		}
		var $aCur = $(".help-side dl").find(".cur a"),
			$targetA = $(".help-side dl dd a"),
			$sideSilder = $(".side-slider"),
			curT = $aCur.position().top+1;
		$sideSilder.stop(true, true).animate({
			"top" : curT
		});
		$targetA.mouseenter(function () {
			var posT = $(this).position().top+1;
			$sideSilder.stop(true, true).animate({
				"top" : posT
			}, 240);
		}).parents(".help-side").mouseleave(function (_curT) {
			_curT = curT
				$sideSilder.stop(true, true).animate({
					"top" : _curT
				});
		});
	};
})(jQuery);



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
                	window.location.href = window.location.href;
                },
                error:function(){
                  alert("系统异常，请稍后重试！");
                }
	       });	
		}
		
	}	
</script>
<script type="text/javascript">
	// 百度地图API功能
	var sContent ="<table>"
		+"<tr><td>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td><td class='news'>广东省湛江市湛江经济技术开发区东海岛中线公路中一号东海大厦</td></tr>"
		+"<tr><td>联系电话：</td><td class='news'></td></tr>"
		+"<tr><td>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：</td><td class='news'>524076</td></tr>"
		+"<tr><td>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</td><td class='news'></td></tr>"
		+"<tr><td>网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td><td class='news'></td></tr>"
	+"</table>";
	var map = new BMap.Map("l-map");
	var point = new BMap.Point(110.407156,21.028088);
	var marker = new BMap.Marker(point);  // 创建标注
	map.addOverlay(marker);
	map.centerAndZoom(point, 15);
	var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
	
	//初始化窗口信息
	map.openInfoWindow(infoWindow,point); //开启信息窗口
	
	//点击显示信息窗口
	marker.addEventListener("click", function(){          
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	});
	
	//缩放事件
	map.enableScrollWheelZoom(true);
</script>
</html>