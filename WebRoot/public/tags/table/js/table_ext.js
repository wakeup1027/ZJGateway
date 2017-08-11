var Constant = function(){};
 Constant.baseURL = "";
(function($){
$(function() {	
	
	 /**
	  * 全选、取消全选
	  * @author: linxiaoyu 20100324
	  */
	 $("#checkall").live("click", function(){
		$.fn.checkAll(this);
	 }); 

    /**
	  * 反选
	  * @author: linxiaoyu 20100324
	  */
   $("#fncheckall").live("click", function() { 
		$.fn.checkAllFn(this);
	});
   
   
   /**
	  * 自定义操作
	  * @author: linxiaoyu 20100324
	  */
	$(".operation").live("click", function(){
		var tableName = $(this).attr("tableName");
		var operationTitle = "";
		if($(this).attr("operationTitle")){
			operationTitle = $(this).attr("operationTitle");
		}
		
		if(tableName == null || tableName == ""){
		alert("tableName不能为空");
		return false;
		}
		
		var actionValue = $(this).attr("actionValue");
		if(actionValue == null || actionValue==""){
		alert("actionValue不能为空")	;
		return false;
		}
		
		if($.fn.isHaveCheck(tableName+"Form",this)){
		  if(!window.confirm("温馨提示：确定对"+$.fn.getCheckBoxNum(tableName+"Form",this)+"条数据进行" + operationTitle + "操作？")){
			return false;	
			}
		}else{
			alert("温馨提示：请选择要操作的记录！");
			return false;
		 }
		
		$("#order").val("");
		$("#orderBy").val("");
		$("#pageNo").val("1");
		
		var tableName = $(this).attr("tableName");
		if(tableName==null||tableName=="")
		{
		alert("tableName不能为空");
		return false;
		}
		var actionValue = $(this).attr("actionValue");
		if(actionValue==null||actionValue=="")
		{
		alert("actionValue不能为空")	;
		return false;
		}
		var _target = $(this).attr("target");
		if(_target !=null && _target != ""){
			$("#"+tableName+"Form").attr("target",_target);
		}
		else{
			$("#"+tableName+"Form").removeAttr("target");
			var loading = $('#pageloading');
           if(loading.length==0){
              var tpl ='<span id="pageloading" class="load_info2" ><span class="text"><img align="absmiddle" src="/visit_exam/zh/images/loading.gif" />正在处理....</span><span class="mask"></span></span>';
              $(tpl).appendTo($('body')).show();
            }else{
        	loading.show();
            }
		}
		$("#"+tableName+"Form").attr("action",actionValue);
		$("#"+tableName+"Form").submit();
		
		
	});
	
		
		//删除表格记录
		$(".deletedata").live("click", function(){
			
			var tableName = $(this).attr("tableName");
			var operationTitle = "";
			if($(this).attr("operationTitle")){
				operationTitle = $(this).attr("operationTitle");
			}
			
			if(tableName == null || tableName == ""){
			alert("tableName不能为空");
			return false;
			}
			
			var actionValue = $(this).attr("actionValue");
			if(actionValue == null || actionValue==""){
			alert("actionValue不能为空")	;
			return false;
			}
			
			if($.fn.isHaveCheck(tableName+"Form",this)){
			  if(!window.confirm("温馨提示：确定对"+$.fn.getCheckBoxNum(tableName+"Form",this)+"条数据进行" + operationTitle + "操作？")){
				return false;	
				}
			}else{
				alert("温馨提示：请选择要操作的记录！");
				return false;
			 }
			
			
			$("#order").val("");
			$("#orderBy").val("");
			$("#pageNo").val("1");
			
			var tableName = $("#deletedata").attr("tableName")+"Form";
			var action = $("#"+tableName).attr("action");
			var prop = "";
			var w = action.indexOf("!");
			var h = action.indexOf("?");
			if(h>0)
			{
			prop = action.substring(h,action.length);
			}
			action = action.substring(0,w);
			
			var _target = $(this).attr("target");
			if(_target !=null && _target != ""){
				$("#"+tableName+"Form").attr("target",_target);
			}
			else{
				$("#"+tableName+"Form").removeAttr("target");
				var loading = $('#pageloading');
	           if(loading.length==0){
	              var tpl ='<span id="pageloading" class="load_info2" ><span class="text"><img align="absmiddle" src="/visit_exam/zh/images/loading2.gif" />正在处理....</span><span class="mask"></span></span>';
	              $(tpl).appendTo($('body')).show();
	            }else{
	        	loading.show();
	            }
			}
		
			$("#"+tableName).attr("action",action+"!delete.do"+prop);
			$("#"+tableName).submit();
		});

		$(".editdata").live("click", function() {
			
			var tableName = $(this).attr("tableName");
			var operationTitle = "";
			
			if($(this).attr("operationTitle")){
				operationTitle = $(this).attr("operationTitle");
			}
			
			if(tableName == null || tableName == ""){
			alert("tableName不能为空");
			return false;
			}
			
			var actionValue = $(this).attr("actionValue");
			
			
			if($.fn.isHaveCheck(tableName+"Form",this)){
				if($.fn.getCheckBoxNum(tableName+"Form",this)>1){
					alert("温馨提示：请选择单条记录进行操作！");
					return false;
				}
				//else  
				//	if(!window.confirm("温馨提示：确定进行" + operationTitle + "操作？")){
				//    return false;	
				//}
			}else{
				alert("温馨提示：请选择要操作的记录！");
				return false;
			 }
			
			
			$("#order").val("");
			$("#orderBy").val("");
			$("#pageNo").val("1");
			
			var sid = $.fn.getCheckBoxValue(tableName+"Form",this);
			
			if(actionValue==null||actionValue=="")
			{
				actionValue = $("#"+tableName+"Form").attr("action").replace(/!.*do/, "!edit.do");;
			}
			
			var h = actionValue.indexOf("?");
			var prop  = "";
			var idStr = sid.split("_");
			if(idStr[0]){
				var idAttr = $(this).attr("idAttr")
					if(idAttr == null || idAttr == ""){
				        prop = "id=" + idStr[0];
				        }
				    else{
					  prop = idAttr+"=" + idStr[0];
				     }
			}
			
			if(idStr[1]){
				prop += "&data_locale=" + idStr[1];
			}
			
			if(h > 0) {
				prop = "&" + prop;
			} else {
				prop = "?" + prop;
			}
			
			var _target = $(this).attr("target");
			if(_target !=null && _target != ""){
				$("#"+tableName+"Form").attr("target",_target);
			}
			else{
				$("#"+tableName+"Form").removeAttr("target");
				var loading = $('#pageloading');
	           if(loading.length==0){
	              var tpl ='<span id="pageloading" class="load_info2" ><span class="text"><img align="absmiddle" src="/visit_exam/zh/images/loading2.gif" />正在处理....</span><span class="mask"></span></span>';
	              $(tpl).appendTo($('body')).show();
	            }else{
	        	loading.show();
	            }
			}
			
			$("#"+tableName+"Form").attr("action",actionValue + prop);
			$("#"+tableName+"Form").submit();
		});
		
		$(".backfn").live("click", function(){
			window.location.href = $(this).attr("backUrl");;
		});
		
});


})(jQuery);	


function page_loadCompleted(){
	if(typeof(jQuery.fn.table_addClass) == "function"){
		jQuery.fn.table_addClass();
	}
	
	if(typeof(jQuery.fn.table_userFn) == "function" ){
		jQuery.fn.table_userFn();
	}
}

