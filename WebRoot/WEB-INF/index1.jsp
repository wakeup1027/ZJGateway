<%@ page language="java" import="java.util.*,org.apache.struts2.ServletActionContext" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String fileSavePath = ServletActionContext.getServletContext().getRealPath("/upload");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>后台管理</title>
    <meta http-equiv="x-ua-compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/uploadify/uploadify.css">
    <link href="${pageContext.request.contextPath}/resource/css/header.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/jquery1.8.3.min.js"> </script>
    <script type="text/javascript" src="<%=basePath%>resource/uploadify/jquery.uploadify.js?id=<%=System.currentTimeMillis()%>"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor.all.min.js"> </script>
     
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/lang/zh-cn/zh-cn.js"></script>

  <style type="text/css">
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
		border: 1px solid #FFCDB4;
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
</head>
<body>
<div class="header">
	<div id="name_nav">
    	<div id="name">
        	后台管理
    	</div>
        <div id="nav">
        	<ul>
        		<li><a href="gateway.action">返回门户首页</a></li>
            	<li  style="background-color:#BE4211;border-radius:15px 15px 15px 15px;"><a href="gateway_seeInformation.action">门户信息</a></li>
            	<li><a href="file.action">文件上传</a></li>
            	<li><a href="picture.action">开发区风采图片上传</a></li>
            	<li><a href="gateway_homeInvestmentProjects.action">投资项目</a></li>
            	<li><a href="mailbox.action">局长信箱</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="main" >
	<div id="left">
		<ul>
			<div class="first">信息库管理</div>
			<li>
				<a href="gateway_seeInformation.action" style="color:#F63; font-weight:bold">门户信息</a>
			</li>
		</ul>
	</div>
    <div id="right" style="margin-top: 2px;">
    	<h1 style="text-align: center;color: #E75116;">新建标题与内容文档(附带图片)</h1>
    	<!-- <hr style="border: 1px solid #FFCDB4;"> -->
    	<div>
    	<table class="ui-edit-table" width="100%" border="0" cellpadding="0" cellspacing="0">
    		<thead>
    			<tr class="tr">
    				<th class="th">标题：</th>
    				<td class="td"><input type="text" name="title1" id="title1" style="width: 221px;margin-left: 0px;" /></td>
    			</tr>
    			<tr class="tr">
    				<th class="th">模块：</th>
    				<td class="td">
    					<select name="modular" id="modular" style="width: 225px;">
			    			<option value="">请选择...</option>
			    			<option value="首页-投资湛江开发区">首页-投资湛江开发区</option>
			    			<option value="首页-信息栏">首页-五张小图片轮询</option>
			    			<option value="投资环境-湛江开发区概况">投资环境-湛江开发区概况</option>
			    			<option value="投资环境-投资优势">投资环境-投资优势</option>
			    			<option value="投资环境-投资成本">投资环境-投资成本</option>
			    			<option value="投资环境-投资政策">投资环境-投资政策</option>
			    			<option value="投资环境-载体介绍">投资环境-载体介绍</option>
			    			<option value="投资环境-经济发展">投资环境-经济发展</option>
			    			<option value="信息公开-开发区规划">信息公开-开发区规划</option>
			    			<option value="产业布局-重点企业">产业布局-重点企业</option>
			    			<option value="产业布局-重大落户项目">产业布局-重大落户项目</option>
			    		</select>
    				</td>
    			</tr>
    			<tr class="tr">
    				<th class="th">图片上传：</th>
    				<td class="td">
						<input type="file" name="file" id="uploadify" onchange="previewImage(this)" />
						<span id="imageDisplay1"></span>
						<span id="imageDisplay"></span> 
    				<input type="hidden" name="fileName" id="fileName">
    				<input type="hidden" name="picture" id="picture" value="<%=fileSavePath %>">
    				</td>
    			</tr>
    			<tr class="tr">
    				<th class="th">文章摘要：</th>
    				<td class="td"><textarea id="fieldSummary" name="fieldSummary" style="width:600px;height:50px;" placeholder="作为图文下方的显示字段"></textarea>
    			</tr>
    			<tr class="tr">
    				<th class="th">内容：</th>
    				<td class="td">
    					<div style="display:none;">
    						<textarea id="characterString" name="characterString" disabled="disabled" readonly="readonly" placeholder="内容不在此方框编写，在编辑器编写后保存即可！" style="width:600px;height:200px;"></textarea>
    					</div>
    					<script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
    				</td>
    			</tr>
    			<tr class="tr">
    				<td class="td"  colspan="2">
    					<div style="margin-top: 10px;margin-bottom: 15px;text-align: center;"> 
						    <button class="button" type="submit" onclick="getContent();" style="width: 80px;height: 35px;font-size: 20px;">保存</button>
						</div>
    				</td>
    			</tr>
    		</thead>
    	</table>
    </div>
   <!--  <div id="btns">
    <div>
        <button onclick="getAllHtml()">获得整个html的内容</button>
        <button onclick="getContent()">获得内容</button>
        <button onclick="setContent()">写入内容</button>
        <button onclick="setContent(true)">追加内容</button>
        <button onclick="getContentTxt()">获得纯文本</button>
        <button onclick="getPlainTxt()">获得带格式的纯文本</button>
        <button onclick="hasContent()">判断是否有内容</button>
        <button onclick="setFocus()">使编辑器获得焦点</button>
        <button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
        <button onmousedown="setblur(event)" >编辑器失去焦点</button>

    </div>
    <div>
        <button onclick="getText()">获得当前选中的文本</button>
        <button onclick="insertHtml()">插入给定的内容</button>
        <button id="enable" onclick="setEnabled()">可以编辑</button>
        <button onclick="setDisabled()">不可编辑</button>
        <button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
        <button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
        <button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
    </div>

    <div>
        <button onclick="getLocalData()" >获取草稿箱内容</button>
        <button onclick="clearLocalData()" >清空草稿箱</button>
    </div>

</div>
<div>
    <button onclick="createEditor()">
    创建编辑器</button>
    <button onclick="deleteEditor()">
    删除编辑器</button>
</div> -->
</div>
</div>

<script type="text/javascript">



    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


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
        //alert(arr.join("\n"));
        $("#characterString").val(UE.getEditor('editor').getContent());
        if($("#characterString").val()==""){
        	alert("内容不能为空！");
        	return false;
        }else if($("#modular").val()==""){
        	alert("请选择模块！");
        	return false;
        }else if($("#title1").val()==""){
        	alert("标题不能为空！");
        	return false;
        }else if($("#fileName").val()==""){
        	alert("图片不能为空！");
        	return false;
        }else if($("#fieldSummary").val()==""){
        	alert("文章摘要不能为空！");
        	return false;
        }else{
	        $.ajax({
	                type:"POST",
	                url :"gateway_demo2.action",
	                dataType:"json",
	                data:{
	                	"characterString":$("#characterString").val(),
	                	"modular":$("#modular").val(),
	                	"picture":$("#picture").val(),
	                	"title":$("#title1").val(),
	                	"fieldSummary":$("#fieldSummary").val(),
	                	"fileName":$("#fileName").val(),
	                },
	                success:function (data) {//date是返回的结果，这里对返回值进行处理
	                if(data==true){
	                	alert("存储成功！");
	                	window.location.href = "gateway_seeInformation.action";
	                }
	                },
	                error:function(){
	                  alert("系统异常，请稍后重试！");
	                }
		       });
		     }
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        //alert(arr.join('\n'))
        var picture = $("#picture").val(UE.getEditor('editor').getPlainTxt());
        
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
                url :"gateway_demo2.action",
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







	
        
        $(function(){
        $('#uploadify').uploadify({
 
            'uploader': 'upload_uploadFile.action',//url
           //指定swf文件
           
            'swf':'<%=basePath%>resource/uploadify/uploadify.swf?id=<%=System.currentTimeMillis()%>',
            'cancelImg': '<%=basePath%>resource/uploadify/uploadify-cancel.png',
            'queueID': 'uploadify',//与下面的id对应
            'auto': true,
            'buttonText': '图片上传',
            'fileObjName': 'file',
            'method': 'POST',
            'onUploadSuccess' : function(file,data,response) {//上传完成时触发（每个文件触发一次）
              
              var obj=eval('('+data+')');
              var flag=obj.success;
              if(flag){
              $("#fileName").val(obj.fileName);
              	document.getElementById("imageDisplay").innerHTML="<input type=\"hidden\" value=\""+obj.msg+"\" name=\"filePath\">"+"<input type=\"hidden\" value=\""+obj.fileName+"\" name=\"fileName\">";
              	
              	document.getElementById("imageDisplay1").innerHTML=obj.fileName;
              }else{
              alert(obj.msg);
              }
            }
        });
 });
        
      /* //图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
        alert("11111");
          var MAXWIDTH  = 260; 
          var MAXHEIGHT = 180;
          var div = document.getElementById('preview');
          if (file.files && file.files[0])
          {
              div.innerHTML ='<img id=imghead>';
              var img = document.getElementById('imghead');
              img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
              }
              var reader = new FileReader();
              reader.onload = function(evt){img.src = evt.target.result;}
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
          }
        }
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight )
            {
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                
                if( rateWidth > rateHeight )
                {
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else
                {
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        } */
        
          
       
</script>
</body>
</html>