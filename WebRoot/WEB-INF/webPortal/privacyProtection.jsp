<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="IE=edge" />
	<title>隐私保护</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/public.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/touchuUs.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/twoLevelMenu.css">
	<script src="${pageContext.request.contextPath}/route/js/jquery1.8.3.min.js"></script>

	<!-- 右下角悬浮框 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/route/js/top.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/suspensionFrame.css">
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
	<div class="Mechanism">
			<div class="container" style="margin-top: 16%;">
				<div style="width: 990px;
						    height: 25px;
						    border: 1px solid #e9e9e9;
						    margin-top: 20px;
						    margin-left: 0px;
						    margin-bottom: 5px;
						    padding-top: 10px;
						    padding-left: 10px;
						    background-color: #13509E;
			    color: #fff;">您当前位置：首页-隐私保护</div>
			<div class="MechanismContent">
				<div class="w1">
						<ul>
							<li>“湛江市经济技术开发区门户网”作为湛江市经济技术开发区对社会公众的服务平台，承诺保护您的在线隐私权。 
							请您仔细阅读下列声明以便了解您在本网站登录，注册，以及接受本网站服务时，您的个人信息将会得到的保护政策。<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							一、个人信息的收集 <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							当您在本网站进行用户注册登记或公共论坛等所有活动时，在您的同意及确认下，本网站将通过注册表格、订单等形式要求您提供一些个人资料。这些个人资料包括：<br>
							1、个人识别资料：如姓名、性别、年龄、出生日期、身份证号码（或护照号码）、电话、通信地址、住址、电子邮件地址等。 <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							本网站收集这类关于个人身份的信息主要是为了其注册成员能够更容易和更满意地使用本网站网页接受本网站服务。而这些个人信息有助于我们实现这一目标。 
							另外，根据网站的特性，本网站将通过您的IP地址来收集非个人化的信息，例如您的浏览器性质、操作系统种类、给您提供接入服务的ISP的域名等，以优化在您计算机屏幕上显示的页面。通过收集上述信息，我们只进行客流量统计。这些无关个人身份的信息能帮助本网站辩别最受欢迎的服务并确定我们服务工作的有效性。此外，我们也可能将这些信息披露给我们的相关主管部门，使他们知道服务项目的点击人数。<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							二、个人信息的安全 <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							1、本网站将对您所提供的资料进行严格的管理及保护，并将使用相应的技术，防止您的个人资料丢失、被盗用或被篡改。 <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							2、本网站在必要时将会由专业技术人员代为对该类信息资料进行电脑处理，以用来符合专业分工的要求。如本网站届时将电脑处理通知送达予您，而您未在通知规定的时间内表示反对，将会被本网站视为默认。<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							三、个人信息的共享及披露 <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							一般情况下，在未得到您的同意之前，您的任何个人信息将不会被提供给任何无关的第三方。但在下列情况，本网站会将您的个人信息提供给有关的第三方，同时不承担任何责任： <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							1、本网站的某些服务需由市政府办公室提供或共同提供。为了向您提供此类服务，本网站有必要与该合作伙伴分享您的个人信息。<br> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							2、本网站可能会与第三方共同进行公益活动。在推广活动中所收集的全部或部分个人信息可能会与该第三方分享。如果您不想让您的信息被分享，您可以通过不参加该公益活动而拒绝。 <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							3、根据法律法规或政府的强制性规定，我们必须向有关司法或政府部门提供您的个人信息。<br> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							4、为了防止您的、他人的合法权益或社会公共利益受到重大危害。 <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							5、本网站掌握了确定的证据，证明您的行为违反了本网站的隐私声明或关于特定服务或产品的任何规则，从而对本网站合法权益构成了重大危害。<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							四、用户权利 <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							1、您对于自己的个人资料享有以下权利： <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							（1）随时查询及请求阅览；<br> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							（2）随时请求补充或更正； <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							（3）随时请求删除；<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							2、唯一拥有和使用自己的口令及其他帐户信息的权力。当您在线时，请小心和负责保管。<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							特此声明！<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							注:如有疑问,请联系我们。</li>
						</ul>
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
</script>
</html>