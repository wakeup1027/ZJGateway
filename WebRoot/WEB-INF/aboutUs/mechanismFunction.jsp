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
	<title>联系我们</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/public.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/public1.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/touchuUs.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/twoLevelMenu.css">
	<script src="${pageContext.request.contextPath}/route/js/jquery1.8.3.min.js"></script>
	
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
			<ul  class="menu"><div class="li_3_div"" style="top:95%;"></div>
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
				<li id="navSelect"  class="li_4"><a href="gateway_mechanismFunction.action">联系我们</a>
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
			<dd class="cur"><a href="gateway_mechanismFunction.action"><span>机构职能</span></a></dd>
			<dd><a href="gateway_contactUs.action"><span>联系我们</span></a></dd>	
	     </dl>
	     <div class="side-slider" style="top: 148px; "></div>
	    </div>
	    <div class="help-cont">
	      
          <div class="Mechanism" style="margin-left: 14px;min-width: 91%;width: 870px;">
			<div class="title"  style="margin-top: -19px;">机构职能</div>
			<div class="MechanismContent" style="width: 800px;">
				<!--<ul class="natit">
					<li class="NewsDetailBg">机构概况</li>
					<!-- <li>领导班子</li>
					<li>内设机构</li>
					<li>主要职责</li>
				</ul> -->
				<div class="w1">
						<!-- <ul>
							<h1>湛江市湛江经济技术开发区简介</h1>
							<li></li>
						</ul> -->
						<ul>
							<li>（一）贯彻执行国家的国民经济和社会发展的方针、政策；拟订并组织实施全区国民经济和社会发展战略、中长期发展规划和年度发展计划、搞好资源开发、生产力布局和生态环境建设规划，以及基础产业(能源、交通、通信、原材料、水利等)、支柱产业、高新技术产业专项发展规划；研究提出总量平衡、发展速度和结构调整的调控目标及调控政策措施；引导、促进全区经济结构合理化和经济与社会可持续发展、协调、衔接和平衡各主要行业规划及相关的政策措施；</li>
							<li>（二）研究分析国内外经济形势和发展情况，进行宏观经济的预测、预警；综合研究经济运行中的重大经济社会问题，提出宏观调控政策建议，综合协调经济社会发展；</li>
							<li>（三）汇总和分析财政、金融以及其他经济和社会发展的情况，参与制定财政政策，拟订并组织实施地方性产业政策，监督检查产业政策的执行；</li>
							<li>（四）研究经济体制改革和对外开放的重大问题，组织拟订综合性经济体制改革方案，协调有关专项经济体制改革方案；研究制订投融资体制改革方案经批准后组织实施；提出完善社会主义市经济体制、以改革开放促进发展的建议，指导和推进总体经济体制改革；</li>
							<li>（五）推进产业结构战略性调整和升级，提出重要产业的发展战略和规划；研究并协调农业和农村经济社会发展的有关问题，衔接农村专项规划和政策，研究工业化发展规划；推动高新技术产业发展，实施技术进步和产业现代化的宏观指导。 </li>
							<li>（六）研究分析国内外市场状况，负责重要商品总量平衡和宏观调控；会同有关部门提出现代物流业发展的战略和规划；</li>
							<li>（七）推进可持续发展战略，提出能源发展战略、规划，参与编制生态建设规划，综合协调生态建设和资源节约综合利用的重大问题，促进经济与资源、环境的协调发展； </li>
							<li>（八）负责全区投资规模进行预测，进行总量平衡，结构调整；组织审查项目的可行性研究报告、概算；按规定权限审批、核准或备案投资建设项目；指导监督政策性贷款的使用方向，依法指导和协调招标投标活动，对重大建设项目招标投标进行监督检查； </li>
							<li>（九）负责制定全区的招商引资有关规定，研究提出利用外资的发展战略、结构优化的目标和政策，审核或审批重大投资项目境外投资项目；策划组织招商引资活动，负责项目的洽谈、项目的全程跟踪服务代理制和招商引资有关奖励制度的落实；加强经济技术协作，拓宽投融资渠道；</li>
							<li>（十）宣传、贯彻落实《价格法》，执行国家价格方针、政策和法规；拟订价格、收费管理的有关规定。负责管理国家定价的商品价格；组织价格听证；监督各项收费政策的落实，查处违反《中华人民共和国价格法》和价格管理法规的违法行为；做好区域价格监测、预警及有关生产成本调查；</li>
							<li>（十一）承办区党委、管委会和上级业务主管部门交办的其他事项。</li>
						</ul>
						<%--<ul style="width: 850px;">
							<h1>商务局领导班子</h1>
							<style>
								.table{
									margin:auto;
								}
								.table tr td {
				   					border: 1px solid #3E84C0;
								}
							</style>
							<table class="table" width="-201" align="center">
								<tbody>
									<tr class="firstRow">
										<td width="180" valign="top" style="word-break: break-all;" align="center">
											<img alt="" src="${pageContext.request.contextPath}/route/leadershipRanksImages/20084135592794.jpg"><br>
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">林献良</span><br>
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">党组书记、局 长</span>
										</td>
										<td width="770" valign="top" style="word-break: break-all;" align="center">
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">负责局全面工作</span>
										</td>
									</tr>
									<tr class="firstRow">
										<td width="180" valign="top" style="word-break: break-all;" align="center">
											<img alt="" src="${pageContext.request.contextPath}/route/leadershipRanksImages/20140317125133.jpg"><br>
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">段宝杰</span><br>
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">纪检组长、党组成员</span>
										</td>
										<td width="770" valign="top" style="word-break: break-all;" align="center">
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">分管纪检组、监察室</span>
										</td>
									</tr>
									<tr class="firstRow">
										<td width="180" valign="top" style="word-break: break-all;" align="center">
											<img alt="" src="${pageContext.request.contextPath}/route/leadershipRanksImages/20120412165524.jpg"><br>
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">连俊辉</span><br>
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">副局长、党组成员</span>
										</td>
										<td width="770" valign="top" style="word-break: break-all;" align="center">
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">分管：口岸管理协调科、口岸规划建设科、汕尾进出境货运车辆检查场、加工装配公司、以及党群、人事、计生、工会、老干、妇女、青年等工作。</span>
										</td>
									</tr>
									<tr class="firstRow">
										<td width="180" valign="top" style="word-break: break-all;" align="center">
											<img alt="" src="${pageContext.request.contextPath}/route/leadershipRanksImages/20140317124749.jpg"><br>
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">陈永旭</span><br>
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">副局长、党组成员</span>
										</td>
										<td width="770" valign="top" style="word-break: break-all;" align="center">
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">分管：财务科、市场秩序与调节科、市场规划与建设科、贸促事务科、投资促进与对外经济合作科、外资管理科、外商投资企业协会服务中心。</span>
										</td>
									</tr>
									<tr class="firstRow">
										<td width="180" valign="top" style="word-break: break-all;" align="center">
											<img alt="" src="${pageContext.request.contextPath}/route/leadershipRanksImages/20140317125003.jpg"><br>
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">林 娟</span><br>
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">副局长、党组成员</span>
										</td>
										<td width="770" valign="top" style="word-break: break-all;" align="center">
											<span style="font-size:16px;font-family:宋体;font-weight: bold;">分管：办公室、综合科、贸易促进科、贸易管理科、机电与科技产业科。</span>
										</td>
									</tr>
								</tbody>
							</table>
						</ul>
						<ul>
							<h1>湛江经济技术开发区设13个内设机构</h1>
							<li>（一）办公室。
							负责文电、会务、机要、档案等机关日常工作；承担信息、保密、应急、安全保卫、信访、政务公开、宣传、督办、后勤保障、物业管理等工作，会同有关部门处理涉外知识产权和贸易纠纷；承办有关行政复议和行政应诉工作；负责落实本部门行政执法责任制工作；组织推进本部门行政审批制度改革及职能转变相关工作；负责机关和指导直属单位的人事管理、机构编制、工资福利、计划生育、党群、离退休人员服务等工作。
							</li><li>（二）综合科（挂开发区管理科牌子）。
							负责编报和组织实施对外开放、商务和口岸发展战略、中长期发展规划和年度指导性计划，监测分析商务和口岸宏观运行情况；组织研究对外开放、商务和口岸发展趋势和重大问题，拟订相关政策建议；承担有关统计和综合性材料起草等工作；综合协调有关自由贸易区事务工作；负责有关开发区建设发展规划计划的政策引导和协调、指导、管理工作，负责有关开发区情况汇总、评价工作；研究分析有关开发区建设中的重大问题。
							</li><li>（三）财务科。
							研究提出与商务工作有关的财税、金融、价格等政策建议；会同有关部门贯彻落实涉及商务领域的外汇、财税、金融、价格、保险等政策，会同有关部门管理专项资金；负责机关财务、资产管理以及机关和直属单位财务检查、内部审计工作。
							</li><li>（四）市场规划与建设科。
							拟订国内市场布局、开拓规划和计划并组织实施；牵头拟订有关健全和规范商品市场体系的政策措施；指导大宗产品批发市场规划和城市商业网点规划、商业体系建设；指导社区商业发展，推进农村市场和农产品等重要商品流通体系建设；拟订并组织实施规范市场运行、流通秩序的政策措施；推进流通标准化。
							</li><li>（五）市场秩序与调节科。
							承担整顿和规范市场经济秩序的相关协调工作；推动商务领域信用建设，指导商业信用销售，建立市场诚信公共服务平台；监测分析市场运行态势、商品供求和进出口情况，调查分析商品价格信息，进行预测预警和信息引导；承担建立健全生活必需品市场供应和应急管理机制相关工作；承担重要生产资料流通相关工作；承担需要消费品储备的管理和市场调控有关工作；承担茧丝绸协调工作。
							</li><li>（六）贸易促进科（挂公平贸易科牌子）。
							组织拟订会展、商务服务等发展计划、政策措施并组织实施；推行连锁经营、商业特许经营等现代流通方式，深化商贸流通体制改革，协调解决商贸流通中的重大问题；推动流通业品牌建设；推动贸易促进体系建设；指导和监督各类交易会、展览会以及赴外举行展销会、洽谈会等活动；负责反倾销、反补贴、保障措施和产业损害调查等涉及进出口公平贸易的相关工作；综合协调有关世界贸易组织工作；指导和协调对我市出口商品的反倾销、反补贴、保障措施及其他贸易救济调查的应诉及相关工作，指导应对国外技术性贸易壁垒；参与实施贸易救济措施；建立公平贸易、产业损害的预警机制，维护产业安全；依法承担对经营者集中行为的调查及其他反垄断相关工作；指导我市企业在国外反垄断应诉工作。
							</li><li>（七）贸易管理科。
							负责流通行业发展工作；依法对拍卖、典当、租赁、汽车流通和旧货流通业等进行监督管理；推进再生资源回收利用体系建设，指导和管理再生资源回收工作；组织实施机电产品以外的进出口商品目录；承担企业申请限制类商品进出口经营资质相关工作；组织实施重要工业品、原材料和重要农产品（除粮食、棉花外）进出口计划以及进出口商品配额、关税配额计划；协调供应港澳的配额商品工作；牵头拟订商贸服务、服务贸易发展规划、计划和政策措施，会同有关部门拟订促进服务贸易进出口、规划并组织实施；承担服务贸易进出口管理、统计工作；拟订服务外包发展规划，推动服务外包平台建设；承担商贸服务业（含批发、零售、家政、餐饮、住宿业等）管理、发展相关工作；提出促进商贸中小企业发展的政策建议。
							</li><li>（八）机电与科技产业科（挂市机电产品进出口办公室牌子）。
							组织实施科技兴贸战略和品牌建设工作；指导本市科技兴贸创新基地建设和商务系统科技创新工作；承担机电和高新技术产品贸易促进工作；管理机电产品进出口目录；监督协调机电产品国际招投标工作；拟订有关电子商务发展规划、计划和政策措施并组织实施；推动电子商务服务体系和平台建设；促进电子商务推广与应用；促进网络零售、电子商务服务业等多业态发展；承担跨境电子商务、电商统计分析相关工作；指导并推进现代商贸服务信息公共平台和全市商务系统电子政务网络建设。
							</li><li>（九）投资促进与对外经济合作科。
							拟订本市招商引资、对外投资计划并组织实施；承担重大项目对外招商和跟踪服务工作；做好对外投资的管理、服务相关工作；拟订并组织实施有关对外经济合作的规划和管理办法；依法管理、监督和服务境外投资、对外承包工程、对外劳务合作等对外经济合作业务；承办外派劳务和境外就业人员权益保护相关工作；承担对外直接投资、对外承包工程、对外劳务合作和境外就业统计工作；指导对外援助业务的开展，监督检查本市承担的对外援助项目实施工作；拟订全市商务交流计划并组织实施；参与全市性商务和口岸的重要外事活动；指导本系统外事和对外交流工作；收集和发布有关经济合作交流信息；推进海外经贸网络的建设与管理，负责驻外经贸代表机构有关管理工作；负责区域经贸合作、协作相关工作；承担涉港澳台经贸相关工作；承担境外非经济组织在本市设立常驻业务机构管理工作。
							</li><li>（十）外资管理科。
							参与拟订外商投资政策措施；拟订年度外商投资指导计划并组织实施；依法对外商投资项目相关活动进行监督管理；依法监督检查外商投资企业执行法律法规和合同、章程的情况并协调解决有关问题；承担外商投资统计工作；指导加工贸易转型升级工作，依法监督管理本市加工贸易进出口和统计工作。
							</li><li>（十一）口岸规划建设科。
							负责拟订本地区口岸建设发展规划并组织实施；负责全市各口岸的规划、开设、关闭、调整和检查验收工作；统一安排使用上级划拨或其它渠道筹集的口岸建设专用资金；负责口岸电脑网络的规划、建设、管理和监督工作；负责口岸业务数据、信息资料的统计、收集和上报工作。
							</li><li>（十二）口岸管理协调科。
							负责全市口岸的综合管理工作；对口岸工作方针、政策的贯彻实施和基层口岸情况进行调查研究，掌握口岸动态，为决策提供依据；组织公路、水运口岸查验方法和监管模式的改革；负责口岸业务的对外联络、协调和服务工作；指导县（市、区）口岸管理机构的工作；指导口岸工作部门安全生产，组织处理口岸重大涉外事件和其它突发事件。
							</li><li>（十三）贸促事务科。
							负责开展同世界各国经济贸易界的联络，组织本市经济技术贸易和企业家团体等出访和考察；负责同外国商会、经济贸易协会、国际经贸组织和驻我市的外国工商团体的联系，必要时向外国派遣常驻代表或设立代表机构；参加、组织或同外国相应机构合办有关国际经济贸易方面的国际会议；申办并组织参加赴国（境）外举办的展销会、洽谈会和国内各种外经贸交易会、展览会等；主办或参与多国展览、展销会和国际博览会；联系、组织中外技术交流；指导、协调和服务于招商引资、贸易促进和汕尾商会工作。负责贸促会法律事务工作，出具中国出口商品产地证明书和人力不可抗拒证明，签发和认证对外贸易和货物运输业务的文件和单证。
							</li>
						</ul>
						<ul>
							<h1>湛江经济技术开发区主要职责</h1>
							<li>（一）贯彻执行国家和省商务管理及口岸工作有关方针政策和法律法规，起草有关规范性文件并组织实施；研究国内外贸易、现代流通方式的发展趋势并提出政策建议。
							</li><li>（二）拟订全市商务和口岸发展战略、规划、计划并组织实施；拟订市场体系建设、内外贸易发展、投资的政策措施并组织实施，加快推进现代市场体系建设，推动商贸服务平台建设；推进内外贸融合发展；优化商贸流通产业布局和结构。
							</li><li>（三）牵头拟订有关健全和规范城乡市场发展的政策措施；建立市场诚信公共服务平台，推动商务领域信用建设；推进农村市场体系建设，指导大宗产品批发市场规划和城市商业网点规划、商业体系建设；促进商贸流通体制改革，协调解决商贸流通中的重大问题；推进流通标准化。
							</li><li>（四）负责整顿和规范市场经济秩序的相关协调工作；拟订并组织实施规范市场运行、流通秩序的政策措施；监测分析商务运行态势、商品供求，进行预测预警和信息引导；负责建立健全生活必需品市场供应应急管理机制；负责重要消费品储备的管理和市场调控工作。
							</li><li>（五）拟订并组织实施会展、电子商务、商务服务等发展规划和政策措施；推进连锁经营、商业特许经营、物流配送等现代流通方式发展；促进贸易增长方式转变，指导和协调贸易促进体系建设，推动电子商务服务体系和平台建设；促进商贸中小企业发展，指导商品贸易结构调整；推动流通业品牌建设。
							</li><li>（六）制定并组织流通业产业政策措施，提出优化产业布局、结构的政策建议并组织实施；负责流通行业发展工作，指导和管理再生资源回收相关工作；依法对拍卖、典当、租赁、汽车流通和旧货流通业等进行监督管理；组织实施进出口商品目录；组织实施重要工业品、原材料和重要农产品（除粮食、棉花外）进出口计划以及进出口商品配额、关税配额计划。
							</li><li>（七）牵头拟订全市服务贸易发展计划，负责商贸服务业（含批发、零售、家政、餐饮、住宿业等）管理、发展相关工作；指导服务贸易领域的对外开放；会同有关部门制定促进服务出口和服务外包发展的规划、政策措施并组织实施；推动服务外包平台建设。
							</li><li>（八）拟订并组织实施优化机电产品、高新技术产品进出口结构和对外技术贸易的政策措施；组织实施科技兴贸战略和国际品牌建设；负责监督协调机电产品国际招投标；推进进出口贸易标准化。
							</li><li>（九）拟订本市招商引资、对外投资规划、计划并组织实施；承担重大项目对外招商和跟踪服务工作；负责协调和指导本市招商引资、投资促进工作；负责对外投资管理和服务工作；参与制定本市促进投资规划和改善投资环境的政策措施。
							</li><li>（十）负责国内外经济合作和对外援助工作；拟订并组织实施有关经济合作的政策措施和管理办法；依法管理、监督和服务对外承包工程、对外劳务合作等对外经济合作业务；指导和监督检查本市承担的对外援助相关工作。
							</li><li>（十一）指导全市外商投资工作，拟订外商投资政策措施和改革方案并组织实施，依法管理外商投资企业和项目有关事项，依法监督检查外商投资企业执行有关法律法规情况并协调解决有关重大问题；指导加工贸易工作，依法监督管理本市加工贸易进出口工作。
							</li><li>（十二）负责有关开发区（经济技术开发区、保税监管区等，下同）建设发展的规划计划的政策引导、协调、指导和管理工作；组织实施本市自由贸易区战略；负责有关开发区情况汇总、评价工作；研究分析有关开发区建设中的重大问题。
							</li><li>（十三）拟订全市商务交流计划并组织实施；负责全市性商务和口岸的重要外事活动；指导本系统外事和对外交流工作；推进海外经贸网络规划布局；负责涉港澳台经贸工作；负责区域经贸合作、协作相关工作。
							</li><li>（十四）负责口岸建设和对外开放规则并组织实施；综合协调和指导本市口岸管理机构的工作，负责电子口岸建设及口岸信息发布；参与协调口岸安全管理。
							</li><li>（十五）承担组织协调反倾销、反补贴、保障措施及其他进出口公平贸易相关工作；综合协调本市有关世界贸易组织事务的具体工作；依法组织产业损害调查及其他贸易救济措施，指导协调国外对我市出口商品的反倾销、反补贴、保障措施的应诉工作；依法对经营者集中行为的调查及其他反垄断相关工作。
							</li><li>（十六）承办市人民政府和省商务厅、省口岸主管部门交办的其他事项。
							</li>
						</ul> --%>
				</div>
			</div>
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
</script>
</html>