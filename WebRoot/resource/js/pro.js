/* 取消並返回 --begin */
	function cancel() {
		window.location.href = "projectLibrary_projects.action";
	}

	/* 信息庫 --begin*/
	function infoLibList() {
		window.location.href = "findProjectByState_execute.action";
	}

	/* 項目管理 --begin*/
	function itemsManage() {
		window.location.href = "findProjectByState_execute.action";
	}
	function seachproject() { //项目库
		window.location.href = "findProjectByState_haveGoneToLib.action";
	}

	function itemsMagnage() {
		window.location.href = "findProjectByState_execute.action";
	}
	
	$(function(){
		tabClick(0);
	});

	//选项卡切换
	function tabClick(index){
		$("#tabs a").css({
			"background":"#ddd",
			"background":"-ms-linear-gradient(#FDE2C7 0%,#FFC0A0 100%)",
			"backgroundImage":"linear-gradient(to bottom, #FDE2C7, #FFC0A0)",
			"filter":"progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#FDE2C7,endColorStr=#FFC0A0)",
			"zIndex":"2"
		});
		$("#tabs a:eq("+index+")").css({"background":"#fff","zIndex":"3"});
		$("#tabscontent .tabcar").css("display","none");
		$("#tabscontent .tabcar:eq("+index+")").css("display","");
	}
	
	//异步请求常用意见数据
	function getSugg(index) { 
		
		$.getJSON("suggestion_findAll.action",function(date){
			
			 $("#content").html("");
			 $.each($.parseJSON(date), function(i,val){ 
				
			 	$("#content").append("<div class='suggeContent'><a href='javascript:void(0)' onclick='updateSugg("+index+",this)'>"+val.content+"</a></div>"); 
			
			  
			 });  
			
			 showBg();
		}); 
	} 
	
	//把意见值写到文本域中
	function updateSugg(index,obj){
		$("textarea:eq("+index+")").val($(obj).html());
		//alert($("textarea:eq(1)")).attr("name");
		if(index==0){
			$("#suggest").val($(obj).html());
		}
		else{
			$("#suggest1").val($(obj).html());
		}
		
		closeBg();
		
	}
	
	//将文本域中的意见异步插入到数据库
	function addSugg(index){
		var content = $("textarea:eq("+index+")").val();
		if(content==""){
			alert("内容不能为空！");
		}else{
	//	alert("bbbb");
			$.post("suggestion_addSuggestion.action",{"ws.content":content},function(data){
				alert(data);
			});
		}
	}
	
	//将文本域中的意见异步插入到数据库
	function addSugg11(index){
		var content = $("textarea:eq("+index+")").val();
		
		if(index==0){
			
			content=$("#suggest").val();
			//alert(content);
		}
		else{
			content=$("#suggest1").val();
		}		
		
		if(content==""){
			alert("内容不能为空！");
		}else{
	//	alert("bbbb");
			$.post("suggestion_addSuggestion.action",{"ws.content":content},function(data){
				alert(data);
			});
		}
	}
	
	function getUserGroup(){
		$.getJSON("userAndRole_findUser1.action",function(data){
			//alert("22222222222");
			$("#content").html("");
	
			$("#content").append("<ul><li><label>领导</label></li><ul class='userGroup'></ul></ul>");
			$.each($.parseJSON(data), function(i,val){ 
				
				$(".userGroup").append("<li><input onclick='inUser()' " +
											"type = 'radio' value='"+val.realName+"' " +
											"name = 'userGroup'/>"+val.realName+"" +
											"<input type='hidden' value='"+val.id+"'/> </li>"); 
				//$(".userGroup").append("<li><input type = 'radio' value='"+val.realName+"' name = 'userGroup'/>"+val.realName+"</li>");
			}); 
			
			showBg();
		});
	}
	//修改	
	function getUser(){	
		$.getJSON("userAndRole_findUser1.action",function(data){
			
			$("#content").html("");
	
			$("#content").append("<ul><li><label>领导</label></li><ul class='userGroup'></ul></ul>");
			$.each($.parseJSON(data), function(i,val){ 
				
				$(".userGroup").append("<li><input onclick='inUser2()' " +
											"type = 'radio' value='"+val.realName+"' " +
											"name = 'userGroup'/>"+val.realName+"" +
											"<input type='hidden' value='"+val.id+"'/> </li>"); 
				//$(".userGroup").append("<li><input type = 'radio' value='"+val.realName+"' name = 'userGroup'/>"+val.realName+"</li>");
			}); 
			
			showBg();
		});
	}
	
	function inUser2(){
		var user = $("input[name='userGroup']:checked");
		$("#nextExecutorName1s").val(user.val());
		
		$("#nextExecutorId1s").val(user.parent().children("input[type='hidden']").val());
		closeBg();
	}
	
	
	//项目移交弹框责任机构
	function getUserGroup2(){
		$.post("organ1_findOrgan.action",function(data){
			//alert("22222222222");
			$("#content").html("");
	
			$("#content").append("<ul><li><label>机构</label></li><ul class='userGroup'></ul></ul>");
			$.each($.parseJSON(data), function(i,val){ 
				
				$(".userGroup").append("<li><input onclick='inUser3()' " +
											"type = 'radio' value='"+val.organName+"' " +
											"name = 'userGroup'/>"+val.organName+"" +
											"<input type='hidden' value='"+val.id+"'/> </li>"); 
				//$(".userGroup").append("<li><input type = 'radio' value='"+val.realName+"' name = 'userGroup'/>"+val.realName+"</li>");
			}); 
			
			showBg();
		});
	}
	
	//项目移交
	function inUser3(){

		var user = $("input[name='userGroup']:checked");
		$("#nextExecutorName2s").val(user.val());
		$("#nextExecutorIds").val(user.parent().children("input[type='hidden']").val());
		closeBg();
	}
	

	//项目移交弹框责任人
	function getUserGroup3(){
        $.getJSON("userAndRole_findUser1.action",function(data){
			
			$("#content").html("");
	
			$("#content").append("<ul><li><label>领导</label></li><ul class='userGroup'></ul></ul>");
			$.each($.parseJSON(data), function(i,val){ 
				
				$(".userGroup").append("<li><input onclick='inUser4()' " +
											"type = 'radio' value='"+val.realName+"' " +
											"name = 'userGroup'/>"+val.realName+"" +
											"<input type='hidden' value='"+val.id+"'/> </li>"); 
				//$(".userGroup").append("<li><input type = 'radio' value='"+val.realName+"' name = 'userGroup'/>"+val.realName+"</li>");
			}); 
			
			showBg();
		});
	}
	
	//项目移交责任人
	function inUser4(){

		var user = $("input[name='userGroup']:checked");
		$("#nextExecutorName3s").val(user.val());
		$("#nextExecutorId3s").val(user.parent().children("input[type='hidden']").val());
		closeBg();
	}
	

	
	function inUser(){

		var user = $("input[name='userGroup']:checked");
		$("#nextExecutorNames").val(user.val());
		$("#nextExecutorIds").val(user.parent().children("input[type='hidden']").val());
		closeBg();
	}
	

	//显示灰色 jQuery 遮罩层
	function showBg(){
		var bh = $("html").height(); 
		var bw = $("html").width(); 
		$("#fullbg").css({ 
			   "z-index":"1",
				height:bh, 
				width:bw, 
				
				display:"block",
				
		}); 
		$("#dialog").show();
	}
	//关闭灰色 jQuery 遮罩 
	function closeBg() { 
		$("#fullbg,#dialog").hide(); 
	} 