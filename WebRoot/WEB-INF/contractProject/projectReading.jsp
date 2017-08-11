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
	
	<!-- 分享 -->
	<script src="${pageContext.request.contextPath}/route/js/share.js"></script>
<style type="text/css">
a:hover, .onlinelist li a:hover, .link a:hover, .index-main .more:hover, .hotnews #list li a:hover, .cblue, .item_b .like_btn:hover, .mTitle .more:hover{color:#0981de;}
.bgBanner{ background:url(../images/bgbanner.jpg) no-repeat center top #FBFAF1;}
.lbox{ float:left; }
.rbox{ float:right; }
.mTwoColumn .lbox{ width:900px; }
.mTwoColumn .rbox{ width:284px; background:#fff;}
.mTwoColumn .lbox .box{ padding:0 40px; background:#fff; }
.curposition{ width:1100px; margin:0 auto; color:#888; padding-top: 165px;margin-left: 16%;}

.detailHeader{ border-bottom:1px solid #ddd; }
.detailHeader h1{ font-size:26px; padding:30px 0;}
.detailDesc{ height:40px; margin-bottom:20px; }
.detailDesc .text{ float:left; width:350px; line-height:22px; color:#999;}
/*share*/
.detailDesc .share{ float:right; width:300px; height:30px; line-height:30px; text-align:right; margin-top:20px;}
.detailDesc .share span{ display:inline-block; margin-right:10px; }
#share-bar-btn{ float:right;}
#share-bar-btn a{ float:left; display:inline-block; width:36px; height:30px; margin:0;  padding:0;	background-image:url(./route/images/sharebg.gif);  background-repeat: no-repeat;}
#share-bar-btn .bds_tsina{ background-position:0 0;}
#share-bar-btn .bds_qzone{ background-position:0 -39px;}
#share-bar-btn .bds_tqq { background-position: 0 -77px;}
.detailContent{ font-size:16px; line-height:30px; color:#444; padding:40px 0;}
.detailPager{ padding:20px 20px; color:#666;}
.detailPager a{ color:#1574c1;}
.detailPager a:hover{ text-decoration:underline;}
.detailPager .previous{ }
.detailPager .next{ float:right;}

</style>

</head>
<body  class="bgBanner">
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
	<!--E nav -->
    <div class="curposition">您现在的位置是：招商项目 &gt; ${informationInput.modular} </div>
    <div class="bgTop marT30" style="margin-left: 16%;margin-top: 15px;">
        <div class="w1200 bc mTwoColumn">
            <div class="lbox">
                <div class="box">
                    <div class="detailHeader">
                        <h1>${informationInput.title }</h1>
                        <div class="detailDesc">
                            <div class="text">时间：<fmt:formatDate  value="${informationInput.releaseTime}" type="both" pattern="yyyy-MM-dd" /><br>
                               				 来源：湛江经济技术开发区&nbsp;&nbsp;&nbsp;&nbsp;浏览：${informationInput.clickRate }
                            </div>
                            <div class="share">
                                <div class="bdsharebuttonbox bdshare-button-style0-32" id="share-bar-btn" data-bd-bind="1478160972641">
                                    <a href="javaScript:void(0);" data-cmd="tsina" title="分享到新浪微博"></a>
                                    <a href="javaScript:void(0);" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                                    <a href="javaScript:void(0);" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="detailContent">
                        <p>
            				${informationInput.content }
                        	<img alt="" src="${informationInput.picture }" style="width: 820px;" data-bd-imgshare-binded="1">
                        </p>

                    </div>
                </div>
                <div class="detailPager">
                    <span class="next">下一篇：<a href="${nextArticleId }">${nextArticleTitle }</a></span>
                    <span class="previous">上一篇：<a href="${lastOneId }">${lastOneTitle }</a></span>
                </div>
            </div>
        </div>
    </div>
   

    <script>
        window._bd_share_config = {
            common: {
                bdText: "${informationInput.title}",
                    bdDesc: "${informationInput.content }",
                    bdUrl: location.href
                },
                share: [{
                    "bdSize": 32
                }],
                image: [{
                    viewList: ['tsina', 'qzone', 'tqq']
                }]
            }
            with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion=' + ~(-new Date() / 36e5)];
    </script>



	<div id="bdimgshare_1478160972651" class="sr-bdimgshare sr-bdimgshare-list sr-bdimgshare-16 sr-bdimgshare-black" style="height: 36px; line-height: 26px; font-size: 12px; position: absolute; top: 601px; left: 114.5px; width: 820px; display: none;" data-bd-bind="1478160972651">
		<div class="bdimgshare-bg"></div>
		<div class="bdimgshare-content bdsharebuttonbox bdshare-button-style0-16">
			<label class="bdimgshare-lbl">图片分享</label>
			<a href="http://www.shenshan.gov.cn/home/detail/139#" onclick="return false;" class="bds_tsina" data-cmd="tsina" hidefocus=""></a>
			<a href="http://www.shenshan.gov.cn/home/detail/139#" onclick="return false;" class="bds_qzone" data-cmd="qzone" hidefocus=""></a>
			<a href="http://www.shenshan.gov.cn/home/detail/139#" onclick="return false;" class="bds_tqq" data-cmd="tqq" hidefocus=""></a>
			<a href="http://www.shenshan.gov.cn/home/detail/139#" onclick="return false;" class="bds_more" data-cmd="more" hidefocus=""></a>
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