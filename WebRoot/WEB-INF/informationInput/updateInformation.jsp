<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>汕尾门户管理系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=8" />
	<meta name="renderer" content="webkit">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link type="text/css" href="${pageContext.request.contextPath}/resource/css/header.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/route/js/jquery1.8.3.min.js" language="javascript" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor.all.min.js"> </script>
<style>
#main {
	width: 100%;
}

#right {
	float: right;
	background-color: #F9F9F7;
	width: 88%;

	border: 1px #FFCDB4 solid;
}



#operation ul li {
	float: left;
	list-style-type: none;
	margin-left: 5px;
}

.button {
	font-size: 12px;
	cursor: pointer;
	border: 1px solid;
	color: #FFF;
	background-color: #E78D66;
	border-radius: 5px;
	padding: 5px;
}

.button:hover {
	background-color: #E75116;
}

#operation ul li span {
	color: #CCC;
}

#operation {
	height: 30px;
}

#left ul li a {
	text-decoration: none;
	color: #000;
}

.ui-edit { /*padding-bottom: 10px;*/
	
}

.ui-edit-table {
	border: 1px solid #E8DBD5; /*#D5DFE8;//#CCCCCC;*/
	background: #FFFFFF;
	border-collapse: collapse;
}

.ui-edit-table tr th {
	background-color: #FFF0CF; /*#FFF5D0;//#F7F1EE;//#EEF3F7;*/
	text-align: right;
	font-weight: normal;
	color: #BE4211; /*#E75116;*/
}

.ui-edit-table tr td {
	text-align: left;
}

.ui-edit-table .tr .th,.ui-edit-table .tr .td {
	height: 30px;
	padding-left: 5px;
	padding-right: 5px;
	border: 1px solid #FFCDB4; /*#E8DBD5;//#D5DFE8;//#CCCCCC;*/
}

.ui-edit-table th.column-title {
	text-align: left;
	font-weight: bold;
}

input[type=name],input[type=email],input[type=password],input[type=text],textarea
	{
	font-family: "Helvetica Neue", Helvetica, sans-serif;
	padding: 2px;
	border: 1px solid #E8DBD5; //# ddd;
	border-radius: 2px; //
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1); //
	background: #FFF url(../images/input.png) repeat-x;
}

textarea {
	margin: 3px 0 3px 0;
}

input[type=name]:focus,input[type=email]:focus,input[type=password]:focus,input[type=text]:focus,textarea:focus
	{
	outline: none;
	border: 1px solid #00bce9;
	box-shadow: 0 0 2px #2da1ec;
}

.ui-edit-table tr td.operate-area {
	height: 50px;
	text-align: center;
	background-color: #FFF0CF; /*#F7F1EE;//#EEF3F7;*/
}

.none {
	width: 0px;
	height: 0px;
	display: none;
}

.address select {
		width:80px;
} 
</style>
<body>
<div id="fullbg"></div> 
	<div class="header">
		<div id="name_nav">
			<div id="name">后台管理</div>
			<div id="nav">
				<ul>
					<li><a href="gateway.action">返回门户首页</a></li>
	            	<li style="background-color:#BE4211;border-radius:15px 15px 15px 15px;"><a href="gateway_seeInformation.action">门户信息</a></li>
	            	<li><a href="file.action">文件上传</a></li>
	            	<li><a href="picture.action">开发区风采图片上传</a></li>
	            	<li><a href="gateway_homeInvestmentProjects.action">投资项目</a></li>
	            	<li><a href="mailbox.action">局长信箱</a></li>
	            </ul>
			</div>
		</div>
	</div>
	<div id="main">
		<div id="left">
			<ul>
				<div class="first">信息库管理</div>
				<li>
					<a href="gateway_seeInformation.action" style="color:#F63; font-weight:bold">门户信息</a>
				</li>
			</ul>
		</div>
	</div>
		<!-- <form name="form" id="form" action="gateway_updateInformation.action"  method="post" > -->
			<div id="right" style="margin-top: 2px;">
				<div style="text-align:center;height:30px; line-height:30px; font-size:18px; font-weight:bold; color:#BF4260">修改信息</div>
				<div class="ui-edit">
					<table class="ui-edit-table" width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr class="tr">
								<th class="th">标题：</th>
								<td class="td" colspan="3">
									<input type="text" id="title1" name="informationInput.title" value="${informationInput.title }" class="validate[maxSize[50]],validate[required]" style="width: 300px;" >
									<input type="hidden" id="informationInputID" name="id" value="${informationInput.id }"  >
								</td>
							</tr>
							<tr class="tr">
								<th class="th">具体模块：</th>
								<td class="td" colspan="3">${informationInput.modular }
									<input type="hidden" id="modular" name="informationInput.modular" value="${informationInput.modular }" class="validate[maxSize[50]],validate[required]" style="width: 300px;">
								</td>
							</tr>
							<tr class="tr">
								<th class="th">内容：</th>
								<td class="td" colspan="3">
									<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
									<div style="display:none">
										<textarea name="informationInput.content" id="content" class="validate[maxSize[5000]]" style="width: 800px;height: 200px;"></textarea>
									</div>
								</td>
								
							</tr>					
							<tr class="tr">
								<td class="td" colspan="4" class="operate-area" style="text-align: center;">
									<button class="button" onclick="getContent();" style="width: 80px;height: 35px;font-size: 20px;margin-top: 10px;margin-bottom: 15px;">&nbsp;保存&nbsp;</button>
									<button class="button" style="width: 100px;height: 35px;font-size: 20px;margin-top: 10px;margin-bottom: 15px;">
										<a href="gateway_seeInformation.action" style="color:#fff;">取消返回</a>
									</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</div>
		<!-- </form> -->


</body>
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
    
    //往编辑器里面回显文章内容
	ue.ready(function() {
	    //异步回调
	    UE.getEditor('editor').execCommand('insertHtml', '${informationInput.content }');
	});
	
	function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        $("#content").val(UE.getEditor('editor').getContent());
        $.ajax({
               type:"POST",
               url :"gateway_updateInformation.action",
               dataType:"json",
               data:{
               	"id":$("#informationInputID").val(),
               	"title":$("#title1").val(),
               	"content":$("#content").val(),
               	"modular":$("#modular").val()
               },
               success:function (data) {//date是返回的结果，这里对返回值进行处理
               	window.location.href = "gateway_seeInformation.action";
               },
               error:function(){
                 alert("系统异常，请稍后重试！");
               }
       });
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯`本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
    
    function add(){
		$.ajax({
                type:"POST",
                url :"gateway_demo.action",
                dataType:"json",
                data:{
                	"characterString":$("#characterString").val(),
                	"modular":$("#modular").val(),
                },
                success:function (data) {//date是返回的结果，这里对返回值进行处理
                	alert("存储成功");
                	window.location.href = "gateway_seeInformation.action";
                },
                error:function(){
                  alert("系统异常，请稍后重试！");
                }
	       });
	}
	
	/* function setImagePreview() { 
		var docObj=document.getElementById("doc"); 
		var imgObjPreview=document.getElementById("preview"); 
		
		if(docObj.files && docObj.files[0]){ 
		//火狐下，直接设img属性 
		imgObjPreview.style.display = 'block'; 
		imgObjPreview.style.width = '300px'; 
		imgObjPreview.style.height = '120px'; 
		//imgObjPreview.src = docObj.files[0].getAsDataURL(); 
		//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
		imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		alert(imgObjPreview.src); 
		}else{ 
		//IE下，使用滤镜 
		docObj.select(); 
		var imgSrc = document.selection.createRange().text; 
		var localImagId = document.getElementById("localImag"); 
		//必须设置初始大小 
		localImagId.style.width = "250px"; 
		localImagId.style.height = "200px"; 
		//图片异常的捕捉，防止用户修改后缀来伪造图片 
		try{ 
		localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)"; 
		localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc; 
		}catch(e){ 
		alert("您上传的图片格式不正确，请重新选择!"); 
		return false; 
		} 
		imgObjPreview.style.display = 'none'; 
		document.selection.empty(); 
		} 
		
		return true; 
	}  */ 
</script>
</html>

