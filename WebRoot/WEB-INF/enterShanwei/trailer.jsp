<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<title>投资环境</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/public.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/public1.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/twoLevelMenu.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/environment.css">
	<script src="${pageContext.request.contextPath}/route/js/jquery1.8.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/route/js/jwplayer/jwplayer.js"></script>
	
	<!-- 右下角悬浮框 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/route/js/top.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/suspensionFrame.css">
<style type="text/css">
.introduce {
    border: 1px solid #eee;
    padding: 15px 10px;
    margin-top: 12%;
    float: left;
    margin-bottom: 25px;
    margin-left: 10%;
    width: 80%;
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
			<ul  class="menu"><div class="li_3_div"></div>
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
				<li id="navSelect" class="li_4"><a href="gateway_survey.action" >投资环境</a>
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
				<li class="weixin"><img alt="" src="${pageContext.request.contextPath}/route/images/weixin.png" style="margin-top: 8px;position: absolute;width: 25px;margin-left: -30px;">
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
	<div style="width: 81.2%;
			    height: 25px;
			    border: 1px solid #e9e9e9;
			    margin-top: 25%;
			    margin-left: 9.9%;
			    padding-top: 10px;
			    padding-left: 10px;
			    background-color: #13509E;
    			color: #fff;font-size: 20px;">汕尾市宣传片</div>
    
	<div  style="margin-left: 10%;margin-top: -1px;margin-bottom: 30px;">
		<div id="mediaplayer"></div> 
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

	jwplayer('mediaplayer').setup({
		'flashplayer': 'jwplayer/jwplayer.flash.swf',
		//'image': 'http://bcs.duapp.com/images-link/3.jpg',
		'id': 'playerID',
		'width': '91%',
		'margin-left': '10%',
		'aspectratio':'10:6',
		'file': '${pageContext.request.contextPath}/route/images/VTS.mp4'
	});
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
</script>

</html>