<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理</title>
     <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <meta name="renderer" content="webkit">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="${pageContext.request.contextPath}/resource/css/header.css" rel="stylesheet" type="text/css">
	<script src="${pageContext.request.contextPath}/route/js/jquery1.8.3.min.js" language="javascript" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resource/js/common.js" language="javascript" type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/route/ueditor/ueditor.config.js"></script>  
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/route/ueditor/ueditor.all.js"></script> 
<style>
a{
	text-decoration:none;
	color:#000;
}
</style>
</head>
<body>
<script type="text/plain" id="upload_ue"></script>
<script type="text/javascript">
    //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
    var _editor = UE.getEditor('upload_ue');
    _editor.ready(function () {
        //设置编辑器不可用
        _editor.setDisabled();
        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
        _editor.hide();
        
        //侦听图片上传
        _editor.addListener('beforeInsertImage', function (t, arg) {
            //将图片路径拼接起来
            var sum  = "";
            for(var i=0;i<arg.length;i++){
            	sum = (sum+arg[i].src+",").replace("/route/ueditor/jsp/upload", "/ueditor");
            }
            $.ajax({
                type:"POST",//请求方式
                url :"picture_uploadFile.action", //请求路径
		        data: {picturePath: sum},        //请求参数
		        success: function (data) {
		           	alert("上传成功");
                	window.location.href="picture.action";
		        },
		        fail: function (status) {
		            // 此处放失败后执行的代码
		        }
		    });
        });
        //侦听文件上传，取上传文件列表中第一个上传的文件的路径
        _editor.addListener('afterUpfile', function (t, arg) {
            $("#file").attr("value", _editor.options.filePath + arg[0].url);
        });
    });
    //弹出图片上传的对话框
    function upImage() {
        var myImage = _editor.getDialog("insertimage");
        myImage.open();
    }
    //弹出文件上传的对话框
    function upFiles() {
        var myFiles = _editor.getDialog("attachment");
        myFiles.open();
    }
  
  
</script>
<div class="header">
	<div id="name_nav">
    	<div id="name">
        	后台管理
    	</div>
        <div id="nav">
        	<ul>
                <li><a href="gateway.action">返回门户首页</a></li>
           		<li><a href="gateway_seeInformation.action">门户信息</a></li>
            	<li><a href="file.action">文件上传</a></li>
            	<li style="background-color:#BE4211;border-radius:15px 15px 15px 15px;"><a href="picture.action">开发区风采图片上传</a></li>
            	<li><a href="gateway_homeInvestmentProjects.action">投资项目</a></li>
            	<li><a href="mailbox.action">局长信箱</a></li>
            	<li><a href="GIS.action">GIS产业分布地图</a></li>
            </ul>
        </div>
    </div>
     <div id="exit">您好,管理员！</div>
</div>
<div id="main" >
	<div id="left">
		<ul><div class="first">本地工具</div>
        	<li><a href="picture.action" style="color:#F63; font-weight:bold">图片上传</a></li>
        </ul>
	</div>
	<div id="right" style="margin-top: 3px;">
		<div id="operation">
        	<ul>
            	<li><label class="button"><a id="upload"  onclick="upImage();"><font color="white">上传图片</font></a></label></li>
            	<%-- <li><span>|</span></li>
				<li><label class="button"><a id="share"><font color="white">一键发布</font></a></label></li>
				<li><span>|</span></li>
				<li><label class="button"><a id="cancelShare"><font color="white">一键撤销</font></a></label></li> --%>
            </ul>
        </div>
        <div class="col-tab">
		<table style="border-collapse: collapse;" class="table">
			<tr>
				<td><input type="checkbox" id="allchoose"/></td>
				<td>序号</td>
				<td>图片</td>
				<td>上传时间</td>
				<td>上传者</td>
				<td>操作</td>
			</tr>
			
            <% int s=0;//变量初始化为0%>
			<s:iterator value="#picture">
			<tr>
			<td><input type="checkbox" name="check" class="checkCarrier" value="${id }"/></td>
				<% s++;%>
                <td><%=s%></td><!-显示序号->
				<td><img style="width:200px;height:200px;" src="${picturePath}"></td>
				<td><fmt:formatDate  value="${createTime }" type="both" pattern="yyyy-MM-dd" /></td>
				<td>管理员</td>
				<td>
			       <a href="picture_delete.action?id=${id }" onclick="return window.confirm('确认删除？')">删除</a>
				</td>
			</tr>
			
			</s:iterator>
		</table>
		<div id="page">第${page }页，共${totalPage }页，${totalNum }条记录&nbsp;&nbsp;跳转到<input id="currentPage" type="text" name="page" style="width:30px" value="${page }" /><label><a id="go" style="color:#F63; cursor: pointer;">&nbsp;GO</a></label>&nbsp;&nbsp;每页
        	<select id="rows">		
            	<option value ="5">5</option>
            	<option value="10">10</option>
            	<option value="20">20</option>
            	<option value="50">50</option>
            	<option value="100">100</option>
            </select>
            <label class="button page" id="pre"><a href="picture.action?page=${page-1 }&rows=${rows}"><font color="white">上一页</font></a></label>
            <label class="button page"><a href="picture.action?page=${page+1 }&rows=${rows}"><font color="white">下一页</font></a></label>
        </div>
	</div>
</div>
</div>
<script type="text/javascript">
	$("#go").click(function(){
		window.location.href="picture.action?page="+$("#currentPage").val()+"&rows="+$("#rows").val();
	});
	$("#rows").val("${rows}");
	
	$("#rows").change(function(){
		window.location.href="picture.action?page="+$("#currentPage").val()+"&rows="+$(this).val();
	});
	
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
					window.location.href="file_delete.action?id="+id;
				}
			},
			errer:function(result){
				alert("对不起,系统内部异常,请联系管理人员!");
			}
		});
	}
	$("#share").click(function(){
		console.log("#share");
		var echo = new Array();
		var trueAfalse = false ;
		var i=0;
		$("input[name='check']:checked").each(function() {
		echo[i++] = $(this).val() ;
		trueAfalse = true ;
		});
		if(!trueAfalse)
		{
			alert("请选择发布文件!");	
		}
		else 
		{
			$.ajaxSettings.traditional=true;
			if(confirm("是否发布文件？"))
				//alert(echo);
			$.ajax({
				type:'POST',
				url:"file_batchUpdate.action",
				data:{
					idLots:echo,
				},
				success:function(data){
					if(data=="success"){
						window.location.href="file.action";
					}else{
						alert("刷新失败");
					}
				}
				});
		}
		

	});
	
	$("#cancelShare").click(function(){
		console.log("#cancelShare");
		var echo = new Array();
		var trueAfalse = false ;
		var i=0;
		$("input[name='check']:checked").each(function() {
		echo[i++] = $(this).val() ;
		trueAfalse = true ;
		});
		if(!trueAfalse)
		{
			alert("请选择取消共享文件!");	
		}
		else 
		{
			$.ajaxSettings.traditional=true;
			if(confirm("取消共享文件？"))
				$.ajax({
					type:'POST',
					url:"file_batchUpdateTwo.action",
					data:{
						idLots:echo,
					},
					success:function(data){
						//alert(data=="success")
						if(data=="success"){
							window.location.href="file.action";
						}else{
							
							alert("刷新失败");
						}
						
					}
					});	
			
		}
		
	});
</script>

</body>
</html>
