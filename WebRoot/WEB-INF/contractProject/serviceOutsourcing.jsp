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
	<title>招商项目</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/public.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/public1.css">
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/environment.css"> --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/twoLevelMenu.css">
	<script src="${pageContext.request.contextPath}/route/js/jquery1.8.3.min.js"></script>

	<!-- 右下角悬浮框 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/route/js/top.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/suspensionFrame.css">
	
<style type="text/css">
/*左侧帮助*/
.help { margin-bottom:30px; background:url(./route/images/help_line_shu.gif) repeat-y 220px 0; min-height:392px;}
.help-side { width:220px;float:left;position:relative;}
.help-side dl {/*  background:url(./route/images/help_line_heng.gif) no-repeat 0 bottom;  */padding-bottom:14px; margin-bottom:12px; line-height:40px;}
.help-side dl.last { background:none;}
.help-side dl dt { font-weight:700; color:#FFF; font-size:16px;background-color: #1C74BE;text-align: center;}
.help-side dl dd a {  font-size:12px; color:#787878;    margin-left: 15px;}
.help-side dl dd.cur a,.help-side dl dd a:hover { color:#46a313; text-decoration:none;}
.help-side .side-slider { position:absolute; width:3px; background:#46A313; height:20px; left:0px; top:27px;}
.help-cont { margin-left:185px; padding-left:55px;  font-size:14px; color:#333;}
.help-cont h2 { font-weight:normal; margin-bottom:16px; font-size:16px; font-family:微软雅黑; }
.help-cont p { line-height:24px; padding:0 0 2px; font-size:14px;}
.help-cont p a,.help-cont dl dt a { color:#0078b6;}
.help-cont dl { margin-bottom:10px;}
.help-cont dl dt { background:url(img/icon05.png) no-repeat 0 2px; padding-left:26px; margin-bottom:5px;}
.help-cont dl dd { color:#808080; line-height:22px; padding-left:26px; display:none;}
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



.slideFour{ width:1220px; position:relative;}
.slideFourBox{ width:1200px; height:350px; padding:10px; position:relative; overflow:hidden; }
.slideFour_ul{ position:absolute;}
.slideFour_ul li{ float:left; width:276px; height:350px; background:#fff; margin-right:32px;  box-shadow:0 0 10px #dfdad2; overflow:hidden;}

/*签约项目*/
.radiusImgList li{ text-align:center; position:relative;}
.radiusImgList li span{ display:block; width:276px; overflow:hidden;}
.radiusImgList li .img{ height:250px; overflow:hidden;}
.radiusImgList li .img img{width: 220px;height:220px; margin-top:5px;  border-radius:50%; -webkit-border-radius:50%;}
.radiusImgList li.color1 .img{ background:#ffe5b6; }
.radiusImgList li.color1 .img img{ border:10px solid #f9b12b; }
.radiusImgList li.color2 .img{ background:#aafeff;}
.radiusImgList li.color2 .img img{ border:10px solid #15afb1; }
.radiusImgList li.color3 .img{ background:#ffcccc;}
.radiusImgList li.color3 .img img{ border:10px solid #f26261; }
.radiusImgList li.color4 .img{ background:#abffc7;}
.radiusImgList li.color4 .img img{ border:10px solid #41c66d; }
.radiusImgList li.color5 .img{ background:#fff6bc;}
.radiusImgList li.color5 .img img{ border:10px solid #ffde00; }
.radiusImgList li.color6 .img{ background:#c6c9ff;}
.radiusImgList li.color6 .img img{ border:10px solid #6a71ff; }
.radiusImgList li h2.title{ margin-top:20px;}
.radiusImgList li.color1 h2{ color:#936b21;}
.radiusImgList li.color2 h2{ color:#0d8182;}
.radiusImgList li.color3 h2{ color:#ad4342;}
.radiusImgList li .aHover{ display:none; width:236px; padding:40px 20px; height:270px; background:#c1e6ff; position:absolute; top:0; left:0; text-align:left;}
.radiusImgList li .aHover h2{ color:#256895;}
.radiusImgList li .aHover p{ line-height:24px; height:190px; margin-top:28px; overflow:hidden;}

</style>
<script type="text/javascript">
$(function () {
    $(".slideFour").each(function () {
        var viewW = $(this).width();
        var $slideList = $(this).find(".slideFour_ul");
        var sumli = $slideList.find("li").length;
        var slideW = ($slideList.find("li").width() + 32) * sumli;
        var sumslide = Math.ceil((slideW / viewW).toFixed(1));
        var lastPosition = -viewW * (sumslide - 1);
        $slideList.css("width", slideW);
        var $btnLeft = $(this).find(".aLeft")
        var $btnRight = $(this).find(".aRight")
        $btnLeft.click(function () {
            var onLeft = $slideList.position().left;
            if (!$slideList.is(":animated")) {//确定动画是否执行完毕
                if (onLeft < 0) {
                    onLeft = onLeft + viewW + 10;
                    $slideList.animate({ "left": onLeft });
                }
            }
        })

        $btnRight.click(function () {
            var onLeft = $slideList.position().left;
            if (!$slideList.is(":animated")) {
                if (sumslide > 1) {
                    if (onLeft > lastPosition) {
                        moveto = onLeft + (-viewW) - 10;
                        $slideList.animate({ "left": moveto });
                    }
                }
            }
        })
    });

$(".radiusImgList li").hover(function () {
        $(this).find('.aHover').fadeIn();
    },
    function () {
        $(this).find('.aHover').fadeOut();
    });
})




</script>
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
			<ul class="menu"><div class="li_3_div"></div>
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
				<li class="li_3"><a href="gateway_supportPolicy.action">投资政策</a>
					<dl class="li_3_content"  style="top: 122px; margin-left: 0%; ">
	                    <dt></dt>
	                    <dd><a href="gateway_supportPolicy.action"><span>扶持政策</span></a></dd>
	                    <dd><a href="gateway_policyInterpretation.action"><span>政策解读</span></a></dd>
	                    <dd><a href="gateway_fileDownload.action"><span>资料下载</span></a></dd>
	                </dl>
				</li>
				<li  id="navSelect" class="li_4"><a href="gateway_contractProject.action?classification=1">招商项目</a>
					<dl class="li_3_content"  style="top: 122px; margin-left: -40%; ">
	                    <dt></dt>
	                    <dd><a href="gateway_contractProject.action?classification=1"><span>工业园区及基础设施</span></a></dd>
	                    <dd><a href="gateway_contractProject.action?classification=2"><span>农业</span></a></dd>
			            <dd><a href="gateway_contractProject.action?classification=3"><span>电子信息</span></a></dd>
			            <dd><a href="gateway_contractProject.action?classification=4"><span>工业制造</span></a></dd>
			            <dd><a href="gateway_contractProject.action?classification=5"><span>旅游服务业</span></a></dd>
			            <dd><a href="gateway_contractProject.action?classification=6"><span>服务外包</span></a></dd>
			            <dd><a href="gateway_contractProject.action?classification=7"><span>其他</span></a></dd>
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
    <div class="main">
	  <div class="help clearfix">
	    <div class="help-side">
		 <dl>
	     <dt>招商项目</dt>
	        <dd><a href="gateway_contractProject.action?classification=1"><span>工业园区及基础设施</span></a></dd>
            <dd><a href="gateway_contractProject.action?classification=2"><span>农业</span></a></dd>
            <dd><a href="gateway_contractProject.action?classification=3"><span>电子信息</span></a></dd>
            <dd><a href="gateway_contractProject.action?classification=4"><span>工业制造</span></a></dd>
            <dd><a href="gateway_contractProject.action?classification=5"><span>旅游服务业</span></a></dd>
            <dd class="cur"><a href="gateway_contractProject.action?classification=6"><span>服务外包</span></a></dd>
            <dd><a href="gateway_contractProject.action?classification=7"><span>其他</span></a></dd>
	     </dl>
	     <div class="side-slider" style="top: 148px; "></div>
	    </div>
	    <div class="help-cont">
	      <h2><b>招商项目    &gt  服务外包</b></h2>
	      <a href="gateway_moreProjects.action?classification=6" style="color: gray; float: right;position: absolute;margin-left: 60%;margin-top: -2%;">更多>></a>
          <div class="lists" style="width: 88.5%">
          	<ul  class="slideFour_ul radiusImgList" style="margin-top: 8px;" id="colorData">
				
				<s:iterator value="#serviceOutsourcing" status="st">
					<s:if test="#st.index<3">
						<li>
							<span class="img"><img src="${picture }" alt="${title }"></span>
							<h2 class="title">${title }</h2>
							<a href="gateway_projectReading.action?id=${id }&classification=6" target="_blank" class="aHover" style="display: none;">
								<h2>${title }</h2>
								<p>${fieldSummary }</p>
							</a>
						</li>
					</s:if>
				</s:iterator>
			</ul>
			<%-- <ul class="slideFour_ul radiusImgList" style="margin-top: 8px;" id="colorData">
					<a href="gateway_generalSituationOfShanwei.action" style="color: gray; float: right;position: absolute;margin-left: 88%;margin-top: -4%;">更多>></a>
					<li>
						<span class="img"><img src="./route/images/20150121001846294.jpg" alt="鹅埠邻里中心"></span>
						<h2 class="title">鹅埠邻里中心6</h2>
						<a href="http://www.shenshan.gov.cn/home/detail/139" target="_blank" class="aHover" style="display: none;">
							<h2>鹅埠邻里中心</h2>
							<p>该项目由深圳市广兴源投资发展有限公司投资建设，总投资1.8亿元，借鉴新加玻模式建设，项目占地1.6万平方米，容积率2.5，建筑面积4万平方米，其中邻里中心3.4万平方米，三星级酒店6000平方米。项目建成后将为园区企业和从业人员提供综合服务配套。</p>
						</a>
					</li>
					<li>
						<span class="img"><img src="./route/images/20150121001731872.jpg" alt="创业家园项目"></span>
						<h2 class="title">创业家园项目</h2>
						<a href="http://www.shenshan.gov.cn/home/detail/138" target="_blank" class="aHover" style="display: none;">
							<h2>创业家园项目</h2>
							<p>该项目由汕尾市和信实业有限公司投资建设，总投资3亿元，占地面积12万平方米，容积率2.5，为产业园区配套建设保障性住房、拆迁安置房及人才公寓，项目用地分两期出让，首期6万平方。2014年12月开工，已核发项目用地蓝线图，正在开展场地平整、施工设计工作。首期计划2016年上半年建成。</p>
						</a>
					</li>
					<li>
						<span class="img"><img src="./route/images/20150121001626372.jpg" alt="鲘门汽车客运站"></span>
						<h2 class="title">鲘门汽车客运站</h2>
						<a href="http://www.shenshan.gov.cn/home/detail/137" target="_blank" class="aHover" style="display: none;">
							<h2>鲘门汽车客运站</h2>
							<p>该项目由海丰明威贸易有限公司投资建设，投资额1000万元，用地面积4500平方米，在鮜门火车站西侧建设鮜门汽车客运站，建成后年利税约100万元。2014年9月开工，已取得项目用地，土地已平整完成，已完成规划设计工作。计划2015年10月竣工投入使用。</p>
						</a>
					</li>
			</ul> --%>
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
	
	<div class="floating_ck" style="right:8px;">
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
	
	//给li默认加样式
	$(function (){
		$("#colorData").find("li").eq(0).addClass("color2");
		$("#colorData").find("li").eq(1).addClass("color4");
		$("#colorData").find("li").eq(2).addClass("color6");
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