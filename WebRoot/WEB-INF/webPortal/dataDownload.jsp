<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="IE=edge" />
	<title>资料下载</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/public.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/route/css/twoLevelMenu.css">
	<script src="${pageContext.request.contextPath}/route/js/jquery1.8.3.min.js"></script>
</head>
<body>
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
				<li  id="navSelect" class="li_4"><a href="gateway_investmentProcessData.action">投资服务</a>
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
				        <dd><a href="gateway_complaint.action" target="_blank"><span>投诉建议</span></a></dd>
				        <dd><a href="gateway_opinionCollection.action" target="_blank"><span>意见征集</span></a></dd>
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
                        	<img src="${pageContext.request.contextPath}/route/images/erweima.png">
                        	<h3>官方微信二维码</h3>
                        </div>
                    </div>
				</li>
			</ul>
		</div>
	</div>
	<div class="container" >
	<div style="width: 610px;
			    height: 25px;
			    border: 1px solid #e9e9e9;
			    margin-top: 20px;
			    margin-left: 182px;
			    padding-top: 10px;
			    padding-left: 10px;
			    background-color: #13509E;
    			color: #fff;">您当前位置：下载专区-资料下载</div>
		<div class="contentTxt" style="margin-top: 5px;width:62%;height: 400px;margin-left: 182px;margin-bottom: 34px;float: left;border: 1px solid #e9e9e9;">
			<ul>
				<s:iterator value="#files">
					<li style="text-indent: 20px;background: url(${pageContext.request.contextPath}/route/images/hsjt.png) no-repeat 10px 10px;line-height: 35px;
					       position: relative;
						   width: 508px;
						   text-overflow: ellipsis;
						   overflow: hidden;
						   white-space: nowrap;
						   padding-right: 109px;">
						<a style="color: #666;" href="javascript:void(0);" onclick="onLoad(${id});">${fileName }</a>
						<span style="float: right;margin-right: 5px;position: absolute;
								    right: 0;
								    font-size: 13px;">[<fmt:formatDate  value="${releaseTime}" type="both" pattern="yyyy-MM-dd" />]</span>
					</li>
				</s:iterator>
				<input type="hidden" id="modular" value="${modular }" />
			</ul>
			<br clear="both">
			<div style="margin-left: 256px;position: absolute; top: 575px;" id="page">第${page }页，共${totalPage }页，${totalNum }条记录&nbsp;&nbsp;跳转到<input id="currentPage" type="text" name="page" style="width:30px" value="${page }" /><label><a id="go" style="color:#00E; cursor: pointer;">&nbsp;GO</a></label>
              <label class="" id="pre">
              <a href="gateway_dataDownload.action?page=${page-1 }&rows=${rows}&modular=${modular}"><font>上一页</font></a></label>
              <label class="">
              <a href="gateway_dataDownload.action?page=${page+1 }&rows=${rows}&modular=${modular}"><font>下一页</font></a></label>
          </div>
		</div>
		
	</div>
	<div class="investor" style="margin-left:19%">
		<button style="margin-left:0px;cursor: pointer;"><a style="color: #333;" href="gateway_mailbox.action"  target="_blank">局长信箱</a></button>
		<button style="margin-left:0px;cursor: pointer;"><a style="color: #333;" href="gateway_fileDownload.action" target="_blank">下载专区</a></button>
		<button style="margin-left:0px;cursor: pointer;"><a style="color: #333;" href="gateway_complaint.action" target="_blank">投诉建议</a></button>
		<button style="margin-left:0px;cursor: pointer;"><a style="color: #333;" href="gateway_opinionCollection.action" target="_blank">意见征集</a></button>
	</div>
	<!-- footer -->
	<br clear="both">
	<!--底部页面-->
	<div class="flink">
		<div class="space20"></div>
		<ul id="select">
			<li>
			<select name="select2" onchange="window.open(this.options[this.selectedIndex].value);">
				<option value="http://www.swchengqu.gov.cn/">市城区</option>
				<option value="http://www.gdhf.gov.cn/index.html" >海丰县</option>
				<option value="http://www.lufengshi.gov.cn/index.asp">陆丰市</option>
				<option value="http://www.luhe.gov.cn/" >陆河县</option>
				<option value="http://www.hhw.gov.cn/" >红海湾开发区</option>
				<option value="http://www.swhqglq.gov.cn/" >华侨管理区</option>
			</select>
			</li>
			<li>
			<select name="select3" onchange="window.open(this.options[this.selectedIndex].value);">
				<option value="http://www.swaic.gov.cn/" >市工商局</option>
				<option value="http://www.swhbj.gov.cn/" >市环保局</option>
				<option value="http://www.swkjj.gov.cn/" >市科技局</option>
				<option value="http://www.swghj.gov.cn/">市规划局</option>
				<option value="http://202.104.252.59/swbjz.com/" >边检站</option>
				<option value="http://www.swsjj.gov.cn/" >市审计局</option>
				<option value="http://www.swgzw.gov.cn/" >市国资委</option>
				<option value="http://www.swcg.gov.cn/" >市城管执法局</option>
				<option value="http://www.swswj.gov.cn/" >市水务局</option>
				<option value="http://www.swczj.gov.cn/" >市财政局</option>
				<option value="http://www.sw119.gov.cn/" >市消防局</option>
				<option value="http://www.swny.gov.cn/" >市农业局</option>
				<option value="http://www.swgtj.gov.cn/" >市国土局</option>
				<option value="http://www.swjmj.gov.cn/" >市经信局</option>
				<option value="http://www.gdsw.lss.gov.cn/" >市人力资源和社会保障局</option>
				<option value="http://www.swwgxj.gov.cn/">市文广新局</option>
				<option value="http://www.swjsj.gov.cn/" >市住建局</option>
				<option value="http://www.swtjj.gov.cn/" >市统计局</option>
				<option value="http://sw.gdda.gov.cn/">市食品药监局</option>
				<option value="http://www.swwqj.gov.cn/" >市外侨局</option>
				<option value="http://www.swsgwglj.com/" >市港务局</option>
				<option value="http://www.swsafe.gov.cn/" >市安监局</option>
				<option value="http://www.swsme.cn/" >市中小企业局</option>
				<option value="http://www.swszwb.com/" >市人民政府驻广州办事处</option>
				<option value="http://www.swjt.gov.cn/">市交通局</option>
				<option value="http://www.swqts.gov.cn/" >市质监局</option>
				<option value="http://www.swsports.gov.cn/">市体育局</option>
				<option value="http://www.swlyj.gov.cn/" >市林业局</option>
				<option value="http://www.swly.org.cn/" >市旅游局</option>
				<option value="http://www.gd-n-tax.gov.cn/pub/001023/" >市国税局</option>
				<option value="http://sw.123662.gov.cn/" >市地税局</option>
				<option value="http://www.sw.gdciq.gov.cn/" >市出入境检验检疫局</option>
				<option value="http://www.swdpb.gov.cn/" >市发改委</option>
				<option value="http://www.swzw.gov.cn/web/index.action" >市行政服务中心</option>
				<option value="http://www.gdmsa.gov.cn/swmsa/Index.asp" >市海事局</option>						
			</select>
			</li>
			<li>
			<select  name="select4" onchange="window.open(this.options[this.selectedIndex].value);">
				<option value="http://tzswj.mofcom.gov.cn/" >商务部投资促进事务局</option>
				<option value="http://www.investguangdong.gov.cn/Article/" >广东省投资促进局</option>						
			</select>
			</li>

			<li>
			<select  name="select5"  onchange="window.open(this.options[this.selectedIndex].value);">
				<option>友情链接</option>
				
				<option value="http://www.zhao-shang.com.cn">中国第一招商网</option>
				
				<option value="http://www.chinamarket.com.cn/web/zh_CN/cecf/">中国商品交易市场</option>
				
				<option value="http://www.ec.com.cn/">商务部中国国际电子商务中心</option>
				
				<option value="http://www.ecnia.org">深圳外商投资企业协会</option>
				
				<option value="http://www.shanwei.gov.cn">汕尾市人民政府</option>
				
				<option value="">汕尾商务局</option>

				<option value="">办事大厅</option>
				
				<option value="http://www.investhk.gov.hk">香港投资推广署</option>
										
				<option value="http://www.investhk.gov.hk">香港贸易发展局</option>
										
				<option value="http://www.ipim.gov.mo">澳门贸易投资促进局</option>
			</select>
			</li>
		</ul>
	</div>

	
	
	<div class="footer">
		<div class="footerConn">
			<div class="QR">
				<img style="width: 68px;" src="${pageContext.request.contextPath}/route/images/erweima2.jpg" alt="">&nbsp;&nbsp;&nbsp;
				<img src="${pageContext.request.contextPath}/route/images/erweima.png" alt="">
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
				<p>主办：广东省湛江经济技术开发区 版权所有 　联系地址：广东省汕尾市城区香城路外经贸大厦</p>
				<p>未经书面授权任何单位、个人不得转载或建立镜像(建议使用1024×768分辨率 IE7.0以上版本浏览器) 粤ICP备05063439</p>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#go").click(function(){
		window.location.href="gateway_dataDownload.action?page="+$("#currentPage").val()+"&rows="+$("#rows").val()+"&modular="+$("#modular").val();
	});
	$("#rows1").val("${rows1}");
	
	$("#rows1").change(function(){
		window.location.href="gateway_dataDownload.action?page="+$("#currentPage").val()+"&rows="+$(this).val()+"&modular="+$("#modular").val();
	});
	
	//资料下载
	function onLoad(id){
		$.ajax({
			type:'POST',
			url:"fileDownLoad_checkFile.action",
			data:{
				"id":id
			},
			success:function(result){ 
				if(result=="true"){
					window.location.href="fileDownLoad.action?id="+id;
				}else{
					alert("对不起,该文件已经被删除!");
					window.location.href="gateway_dataDownload.action";
				}
			},
			errer:function(result){
				alert("对不起,系统内部异常,请联系管理人员!");
			}
		});
	};
			
			
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
</script>
</html>