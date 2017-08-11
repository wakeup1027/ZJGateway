// JavaScript Document

$(document).ready(function(e) {
    	//点击展开搜索按钮
//	$("#button").click(function(){
//		$(".search").css("height","160px");
//	});
	//全选/全不选
	$("#allchoose").click(function (){
		$("input[name='check']").each(function() {
            $(this).prop("checked",$("#allchoose").prop("checked"));
        });
	});
	//当没有全选的时候全选框默认为false
	$(":checkbox").click(function (){
		var flag = $(this).prop("checked");
		if(!flag)
		{
			$("#allchoose").prop("checked",flag);
		}
	});
});

function typeControl(type)
{
	if(type=="1"){
		//alert("你好，业务人员!");
		//$(".tourist").hide();
		//$("#hideLeft").hide();
		
	}else if(type=="2"){
		//alert("你好，领导!");
	}else if(type=="3"){
		//alert("你好，管理员!")
	}
	
	/*
	if(type==3)
	{
		$(".tourist").hide();
		
	}else if(type==1){
		$(".staff").hide();
		$("#hideLeft").hide();
	}
	*/
	
}
