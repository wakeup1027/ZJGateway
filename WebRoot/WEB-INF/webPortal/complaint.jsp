<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html >
<meta http-equiv="x-ua-compatible" content="IE=edge" />
<title>湛江市经济技术开发区咨询投诉</title>
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
       <div id="mytitle"><span style="text-align:center;margin:10px auto;">咨询窗口: <span id="zxwindow">湛江市经济技术开发区咨询投诉</span></span></div>
       <form id="form1" method="post" action="" accept-charset="UTF-8">
		   <input type="hidden" name="ChannelId" id="ChannelId" value="38499">
		   <input type="hidden" name="咨询窗口" id="zxck" value="71">
		   <input type="hidden" name="咨询事项" id="zxsxvalue" value="">
		   <input type="hidden" name="f" value="01">
		   <div>
           <fieldset>
           <legend>温馨提示</legend>
                   <div class="row" style="text-indent:1em;">
                   <label>在您通过本网站投诉时，请务必做到实事求是，并留下您的真实姓名、联系电话，我们将为您保密并及时回复。否则，作匿名处理，不予回复。 <span class="red">*</span> 号是必填项。
                   </label></div>
           </fieldset>
		   </div>
		   <hr>
		   <div style="*margin-top:10px;">
           <fieldset>
           <legend>请填写您的个人信息</legend>
                   <div class="row">
                   <label>姓　　名:</label><input class="txt" type="text" name="姓名" id="fullname"> <span class="red">*</span>
				   <label>电子邮箱:</label><input class="txt" type="text" name="邮箱" id="email"> <span class="red">*</span>
                   </div>
                   <div class="row">
                   <label>手机号码:</label><input class="txt" type="text" name="手机号码" id="mobile"> <span class="red">*</span>
				   <label>固定电话:</label><input class="txt" type="text" name="电话" id="phone"><span class="red">*</span>
                   </div>
                   <div class="row">
                   <label>联系地址:</label><input class="txt" style="width:400px" type="text" name="联系方式" id="address"><span class="red">*</span>
                   </div>
                   <div class="row">
                   <label style="font-size:12px;">(友情提示：手机号码、固定电话至少选填一项)</label>
                   </div>
           </fieldset>
		   </div>
		   <hr>
		   <div style="*margin-top:10px;">
           <fieldset>
           <legend>请填写您的信件信息</legend>
                   <div class="row">
                   <label>咨询类型:</label>
                     <label><input type="radio" name="咨询类型" value="咨询">咨询</label>
                     <label><input type="radio" name="咨询类型" value="投诉">投诉</label>
                     <label><input type="radio" name="咨询类型" value="建议或意见">建议或意见</label>
                     <label><input type="radio" name="咨询类型" value="其他">其他</label>
                   </div>
                   <div class="row">
                   <label>是否公开:</label>
                     <label><input type="radio" name="public" value="1">公开</label>
                     <label><input type="radio" name="public" value="0">不公开</label>
                   </div>
                   <div class="row" id="zxsxbg" style="display:none">
                   <label>咨询事项:</label>
				   <span id="zxsx">数据加载中</span>
                   </div>
                   <div class="row">
                   <label>主　　题:</label>
				   <input name="主题" id="subject" class="txt" style="width:400px" type="text"> <span class="red">*</span>
                   </div>
             <div class="row">
               <label>内　　容:</label> <span class="red">*</span>
			   <p>
                     <label><textarea name="内容" id="Content" rows="6" class="txt"></textarea></label>
					 </p>
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