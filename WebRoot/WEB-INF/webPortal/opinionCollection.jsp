<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html >
<meta http-equiv="x-ua-compatible" content="IE=edge" />
<title>调查问卷</title>
<style type="text/css">
body{
	background-color:#CCCCCC}
.exlist{
	background-color:#fff;
	margin:6px auto;
	padding:5px;
	width:640px;
	min-height:200px;
	height:auto;
	font-family:Arial, Helvetica, sans-serif;
	-webkit-box-shadow:4px 4px 5px #333;
	-moz-box-shadow:4px 4px 5px #333;
	box-shadow:4px 4px 5px #333;
}

#mytitle{
	width:100%;
	margin:6px auto;
	text-align:center
}

#mytitle span{
	font-size:16px;
	font-weight:bolder;
}

div.exlist_title{
	background-color:#fff;
	width:600px;
	height:3px;
}

div.exlist_title img{
	float:right;
	margin:-15px 10px;
}


fieldset{
	width:90%;
	border:1px dashed #666;
	margin:15px auto;
	padding:0px;
}
 
legend{
	background-color:#fff;
	height:27px;
	color:#630;
	font-weight:bolder;
	font-size:14px;
	line-height:18px;
	margin:-20px 10px 10px;
	margin: 0px 10px 10px !important;
	padding:0px;
	*margin:0 -7px;
}
div.row{
	margin:10px;
	padding:5px;
}
 
div.row label{
	height:20px;
	font-size:14px;
	line-height:20px;
	margin:0 10px;
}
 
input.txt{
	background-color:#fff;
	color:#333;
	width:150px;
	height:20px;
	margin:0 10px;
	font-size:14px;
	line-height:20px;
	border:none;
	border-bottom:1px solid #565656;
}

 
input.txt:focus{
	color:#333;
	background-color: #fff;
	border-bottom:1px solid #F00;
}


textarea.txt{
	background-color:#fff;
	color:#333;
	width:500px;
	height:90px;
	margin:0 20px;
	font-size:14px;
	line-height:20px;
	border:none;
	border:1px solid #565656;
	overflow:auto;
}

textarea.txt:focus{
	color:#333;
	background-color: #fff;
	border:1px solid #F00;
}
 
select{
	width:100px;
}

option{
	text-align:center;
}

input.btn{
	width:90px;
	height:30px;
	color: #000;
	border: solid 1px #b7b7b7;
	background: #fff;
}
input.btn:hover{
	width:90px;
	height:30px;
	color: #000;
	border: solid 1px #b7b7b7;
	background: #fff;
}



.button {
	display: inline-block;
	zoom: 1;
	*display: inline;
	vertical-align: baseline;
	margin: 0 2px;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 14px/100% Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	-webkit-border-radius: .5em; 
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.button:hover {
	text-decoration: none;
}
.button:active {
	position: relative;
	top: 1px;
}

.bigrounded {
	-webkit-border-radius: 2em;
	-moz-border-radius: 2em;
	border-radius: 2em;
}
.medium {
	font-size: 12px;
	padding: .4em 1.5em .42em;
}
.small {
	font-size: 11px;
	padding: .2em 1em .275em;
}

.red{color:red;font-size:12px}
</style>
</head>
<body oncontextmenu="return false;">
<div class="exlist">
    <div class="exlist_title"></div>
       <div id="mytitle"><span style="text-align:center;margin:10px auto;"><span id="zxwindow">湛江市经济技术开发区投资环境评价调查问卷</span></span></div>
       <form id="form1" method="post" action="" accept-charset="UTF-8">
		   <input type="hidden" name="ChannelId" id="ChannelId" value="38499">
		   <input type="hidden" name="咨询窗口" id="zxck" value="71">
		   <input type="hidden" name="咨询事项" id="zxsxvalue" value="">
		   <input type="hidden" name="f" value="01">
		   <div>
           <fieldset>
           <legend>温馨提示</legend>
                   <div class="row" style="text-indent:1em;">
                   <label>本次问卷调查目的是为了更好地实现与您的沟通和交流，您的意见将是我们选择更多宣传推广途径的重要依据，衷心感谢您对此次调查工作给予的帮助和支持！
                   </label></div>
           </fieldset>
		   </div>
		   <hr>
		   <div style="*margin-top:10px;">
           <fieldset>
           <legend>请您填写企业基本信息</legend>
                   <div class="row">
                   <label>企业名称:</label><input class="txt" type="text" name="" id="">
				   <label>联系部门:</label><input class="txt" type="text" name="" id="">
                   </div>
                   <div class="row">
                   <label>联系地址:</label><input class="txt" type="text" name="" id="">
				   <label>邮        编:</label><input class="txt" type="text" name="" id="">
                   </div>
                   <div class="row">
                   <label>国别/地区:</label><input class="txt" type="text" name="" id="">
				   <label>企业性质:</label><input class="txt" type="text" name="" id="">
                   </div>
                   <div class="row">
                   <label>联系人:</label><input class="txt" type="text" name="" id="">
				   <label>联系电话:</label><input class="txt" type="text" name="" id="">
                   </div>
                   <div class="row">
                   <label>联系传真:</label><input class="txt" type="text" name="" id="">
				   <label>E-mail:</label><input class="txt" type="text" name="" id="">
                   </div>
                   <div class="row">
                   <label>经营范围:</label><input class="txt" style="width:400px" type="text" name="" id="">
                   </div>
                   <div class="row">
                   <label>经营规模:</label><input class="txt" style="width:400px" type="text" name="" id="">
                   </div>
                   <div class="row">
                   <label>企业网址:</label><input class="txt" style="width:400px" type="text" name="" id="">
                   </div>
                   <div class="row">
                   <label>备注:</label><input class="txt" style="width:400px" type="text" name="" id="">
                   </div>
                   <!-- <div class="row">
                   <label style="font-size:12px;">(友情提示：手机号码、固定电话至少选填一项)</label>
                   </div> -->
           </fieldset>
		   </div>
		   <hr>
		   <div style="*margin-top:10px;">
           <fieldset>
           <legend>调查问卷</legend>
           			<h3>A.企业基本情况</h3>
                   <div class="row">
                   <label>1.贵公司所在地区:</label><br>
                     <label><input type="radio" name="1" value="城区">城区</label>
                     <label><input type="radio" name="1" value="海丰县">海丰县</label>
                     <label><input type="radio" name="1" value="陆丰县">陆丰县</label>
                     <label><input type="radio" name="1" value="陆河县">陆河县</label>
                   </div>
                   <div class="row">
                   <label>2.贵公司所从事的行业:</label><br>
                     <label><input type="radio" name="2" value="电子信息">电子信息</label>
                     <label><input type="radio" name="2" value="金融业">金融业</label>
                     <label><input type="radio" name="2" value="物流业">物流业</label>
                     <label><input type="radio" name="2" value="服务业">服务业</label>
                     <label><input type="radio" name="2" value="制造业">制造业</label>
                     <label><input type="radio" name="2" value="其他">其他</label>
                   </div>
                   <div class="row">
                   <label>3.贵公司注册资本:</label><br>
                     <label><input type="radio" name="3" value="1000万人民币以下">1000万人民币以下</label>
                     <label><input type="radio" name="3" value="1000万-5000万人民币">1000万-5000万人民币</label><br>
                     <label><input type="radio" name="3" value="5000万人民币-1亿人民币">5000万人民币-1亿人民币</label>
                     <label><input type="radio" name="3" value="1亿人民币以上">1亿人民币以上</label>
                   </div><br>
                   <h3>B.请您就贵公司所在区的政府投资项目服务工作作一总体评价:</h3>
                   <div class="row">
                   	 <label>①.政策制定落实:</label><br>
                     <label><input type="radio" name="4" value="非常满意">非常满意</label>
                     <label><input type="radio" name="4" value="基本满意">基本满意</label>
                     <label><input type="radio" name="4" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>②.信息宣传发布:</label><br>
                     <label><input type="radio" name="5" value="非常满意">非常满意</label>
                     <label><input type="radio" name="5" value="基本满意">基本满意</label>
                     <label><input type="radio" name="5" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>③.办事审批效率:</label><br>
                     <label><input type="radio" name="6" value="非常满意">非常满意</label>
                     <label><input type="radio" name="6" value="基本满意">基本满意</label>
                     <label><input type="radio" name="6" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>④.主动服务意识:</label><br>
                     <label><input type="radio" name="7" value="非常满意">非常满意</label>
                     <label><input type="radio" name="7" value="基本满意">基本满意</label>
                     <label><input type="radio" name="7" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>⑤.申诉沟通渠道:</label><br>
                     <label><input type="radio" name="8" value="非常满意">非常满意</label>
                     <label><input type="radio" name="8" value="基本满意">基本满意</label>
                     <label><input type="radio" name="8" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>⑥.廉洁奉公:</label><br>
                     <label><input type="radio" name="9" value="非常满意">非常满意</label>
                     <label><input type="radio" name="9" value="基本满意">基本满意</label>
                     <label><input type="radio" name="9" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   <label>不满意的主要原因是:</label>
				   <input name="" id="subject" class="txt" style="width:400px" type="text">
                   </div>
                   <h3>C.请您就贵公司所在区的营商环境作一总体评价:</h3>
                   <div class="row">
                   	 <label>①.物流配送:</label><br>
                     <label><input type="radio" name="10" value="非常满意">非常满意</label>
                     <label><input type="radio" name="10" value="基本满意">基本满意</label>
                     <label><input type="radio" name="10" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>②.办公环境周边配套:</label><br>
                     <label><input type="radio" name="11" value="非常满意">非常满意</label>
                     <label><input type="radio" name="11" value="基本满意">基本满意</label>
                     <label><input type="radio" name="11" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   <label>不满意的主要原因是:</label>
				   <input name="" id="subject" class="txt" style="width:400px" type="text">
                   </div>
                   <h3>D.请您就贵公司所在区的能源供给环境作一总体评价:</h3>
                   <div class="row">
                   	 <label>①.电力提供:</label><br>
                     <label><input type="radio" name="12" value="非常满意">非常满意</label>
                     <label><input type="radio" name="12" value="基本满意">基本满意</label>
                     <label><input type="radio" name="12" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>②.水力提供:</label><br>
                     <label><input type="radio" name="13" value="非常满意">非常满意</label>
                     <label><input type="radio" name="13" value="基本满意">基本满意</label>
                     <label><input type="radio" name="13" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>③.燃气提供:</label><br>
                     <label><input type="radio" name="14" value="非常满意">非常满意</label>
                     <label><input type="radio" name="14" value="基本满意">基本满意</label>
                     <label><input type="radio" name="14" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   <label>不满意的主要原因是:</label>
				   <input name="" id="subject" class="txt" style="width:400px" type="text">
                   </div>
                   <h3>E.请您就贵公司所在区的金融及社会中介环境作一总体评价:</h3>
                   <div class="row">
                   	 <label>①.银行业务（含贷款、结算等）服务的便利性:</label><br>
                     <label><input type="radio" name="15" value="非常满意">非常满意</label>
                     <label><input type="radio" name="15" value="基本满意">基本满意</label>
                     <label><input type="radio" name="15" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>②.中介金融服务:</label><br>
                     <label><input type="radio" name="16" value="非常满意">非常满意</label>
                     <label><input type="radio" name="16" value="基本满意">基本满意</label>
                     <label><input type="radio" name="16" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>③.其他社会中介服务:</label><br>
                     <label><input type="radio" name="17" value="非常满意">非常满意</label>
                     <label><input type="radio" name="17" value="基本满意">基本满意</label>
                     <label><input type="radio" name="17" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   <label>不满意的主要原因是:</label>
				   <input name="" id="subject" class="txt" style="width:400px" type="text">
                   </div>
                   <h3>F.请您就贵公司所在区的产业配套环境作一总体评价:</h3>
                   <div class="row">
                   	 <label>①.产业链状况:</label><br>
                     <label><input type="radio" name="15" value="非常满意">非常满意</label>
                     <label><input type="radio" name="15" value="基本满意">基本满意</label>
                     <label><input type="radio" name="15" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>②.技术配套:</label><br>
                     <label><input type="radio" name="16" value="非常满意">非常满意</label>
                     <label><input type="radio" name="16" value="基本满意">基本满意</label>
                     <label><input type="radio" name="16" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>③.原材料获得、质量与价格:</label><br>
                     <label><input type="radio" name="17" value="非常满意">非常满意</label>
                     <label><input type="radio" name="17" value="基本满意">基本满意</label>
                     <label><input type="radio" name="17" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   <label>不满意的主要原因是:</label>
				   <input name="" id="subject" class="txt" style="width:400px" type="text">
                   </div>
                   <h3>G.请您就贵公司所在区的产业配套环境作一总体评价:</h3>
                   <div class="row">
                   	 <label>①.技术研发能力:</label><br>
                     <label><input type="radio" name="18" value="非常满意">非常满意</label>
                     <label><input type="radio" name="18" value="基本满意">基本满意</label>
                     <label><input type="radio" name="18" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>②.技术转化能力:</label><br>
                     <label><input type="radio" name="19" value="非常满意">非常满意</label>
                     <label><input type="radio" name="19" value="基本满意">基本满意</label>
                     <label><input type="radio" name="19" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>③.知识产权保护:</label><br>
                     <label><input type="radio" name="20" value="非常满意">非常满意</label>
                     <label><input type="radio" name="20" value="基本满意">基本满意</label>
                     <label><input type="radio" name="20" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   <label>不满意的主要原因是:</label>
				   <input name="" id="subject" class="txt" style="width:400px" type="text">
                   </div>
                   <h3>H.请您就贵公司所在区的产业配套环境作一总体评价:</h3>
                   <div class="row">
                   	 <label>①.劳动力的可获得性、素质与价格:</label><br>
                     <label><input type="radio" name="21" value="非常满意">非常满意</label>
                     <label><input type="radio" name="21" value="基本满意">基本满意</label>
                     <label><input type="radio" name="21" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>②.技术工人的可获得性、素质与价格:</label><br>
                     <label><input type="radio" name="22" value="非常满意">非常满意</label>
                     <label><input type="radio" name="22" value="基本满意">基本满意</label>
                     <label><input type="radio" name="22" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>③.中高层管理人员的可获得性、素质与价格:</label><br>
                     <label><input type="radio" name="23" value="非常满意">非常满意</label>
                     <label><input type="radio" name="23" value="基本满意">基本满意</label>
                     <label><input type="radio" name="23" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   	 <label>④.外语人才的可获得性、素质与价格:</label><br>
                     <label><input type="radio" name="24" value="非常满意">非常满意</label>
                     <label><input type="radio" name="24" value="基本满意">基本满意</label>
                     <label><input type="radio" name="24" value="不满意">不满意</label>
                   </div>
                   <div class="row">
                   <label>不满意的主要原因是:</label>
				   <input name="" id="subject" class="txt" style="width:400px" type="text">
                   </div>
             <div class="row">
               <label>最后，您希望湛江经济开发区应如何进一步优化投资环境（可另附页）:</label> <span class="red">*</span>
			   <p>
                  <label><textarea name="内容" id="Content" rows="6" class="txt"></textarea></label>
			   </p>
               </div>
               <h5 style="text-indent: 2em;">谢谢您的大力支持和热情帮助！欢迎以邮件、传真方式把问卷结果寄往我局。祝贵公司在湛江经济开发区有更好的发展！</h5>
           		<div class="row">
                	<label>联系地址:</label><input class="txt" style="width:400px" type="text" name="" id="">
                </div>
                <div class="row">
                	<label>办公电话:</label><input class="txt" style="width:400px" type="text" name="" id="">
                </div>
                <div class="row">
                	<label>传真电话:</label><input class="txt" style="width:400px" type="text" name="" id="">
                </div>
           </fieldset>
		   </div>
		   <hr>
			<div class="row" style="text-align:center">
			<label><input type="submit" value="提交" id="subbtn" class="button btn medium"></label>
			<label><input type="reset" value="重置" class="button btn medium"></label>
			</div>
        </form>
</div>
<script type="text/javascript">
function alertWin(txt,o){
var btnFn = function(){o.focus();return true;};
easyDialog.open({
	container : {
		content : txt,
		yesFn : btnFn,
		noFn : false
	},
	fixed : false
});
}
function checkform(){
		var oname=$("#fullname");
		var oemail=$("#email");
		var omobile=$("#mobile");
		var ophone=$("#phone");
		var oaddress=$("#address");
		var osubject=$("#subject");
		var ocontent=$("#Content");
		var namevalue=$.trim(oname.val());
		var emailvalue=$.trim(oemail.val());
		var mobilevalue=$.trim(omobile.val());
		var phonevalue=$.trim(ophone.val());
		var addressvalue=$.trim(oaddress.val());
		var subjectvalue=$.trim(osubject.val());
		var contentvalue=$.trim(ocontent.val());
		var emailreg=/\w@\w*\.\w/gi;
		var mobilereg=/^(13|15|18)[0-9]{9}$/;
		var phonereg=/(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/;
		if(namevalue==""){
			alertWin("姓名是必填项!",oname);
			return false;
		}
		if(emailvalue==""){
			alertWin("电子邮箱是必填项!",oemail);
			return false;
		}
		if(emailvalue!="" && !emailreg.test(emailvalue)){
			alertWin("电子邮箱格式不正确!",oemail);
			return false;
		}
		if(mobilevalue!="" && !mobilereg.test(mobilevalue) ){
			alertWin("手机号码格式不正确!",omobile);
			return false;
		}
		if(phonevalue!="" && !phonereg.test(phonevalue) ){
			alertWin("固定电话格式不正确!",ophone);
			return false;
		}
		if(phonevalue=="" && mobilevalue==""){
			alertWin("手机号码、固定电话至少选填一项!",omobile);
			return false;
		}
		if(subjectvalue==""){
			alertWin("主题是必填项!",osubject);
			return false;
		}
		if(contentvalue==""){
			alertWin("内容是必填项!",ocontent);
			return false;
		}
		return true;
}
$(document).ready(function() {
	$("#zxck").val(did);
	try{
		var deptname = deptmapchnl[did][1];
		if(did==13){//监察局直接入市政府信箱
			did=1;
			deptname = "深圳市监察局";
		}
		var chnlid = deptmapchnl[did][0];
		$("#ChannelId").val(chnlid);
		$("#zxwindow").text(deptname);
		$("#dname").val(deptname);
	}catch(e){
		$("#zxck").val(1);
		$("#zxwindow").text("无效的窗口");
		$("#subbtn").hide();
	}

	try{
		var map = new Map();
		if(typeof(DymEnum) == "undefined"){
			//skip
		}else{
			var obj = DymEnum["咨询事项"];
			for(var i=0;i<obj.length;i++){
			  map.put(obj[i]["value"], obj[i]["display"]);
			}
			var zxtitle = map.get(docid);
			if(zxtitle){
				$("#zxsxvalue").val(docid);
				$("#zxsx").text(zxtitle);
			}
		}
	}catch(e){
		//skip
	}
	$('#form1').bind('submit', function(){
		if(checkform()){document.charset='UTF-8';return true;}
		return false;
	});
});
</script>

</body></html>