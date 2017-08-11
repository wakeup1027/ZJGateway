 var checkboxName = "str";
 
(function($){
		  
    $.fn.extend({
		  
		  /**
		  * 判断表单的多选框是否有选择的
		  * @author: linxiaoyu 20100324
		  */
		  isHaveCheck : function(form,obj){
			   var flag = false;
			   
	           var checkObj = this.checkBoxObj(form,obj); 
			   if(checkObj != null )
			   checkObj.each(function(){
				if(this.checked) {
					flag = true;
				}
			 }); 
			return flag;
		  },
		  
		  /**
		   * 获取表单选择的条数
		   * @author: linxiaoyu 20100324
		   */
		  getCheckBoxNum : function (form,obj){
			  var num = 0;
			  var checkObj = this.checkBoxObj(form,obj); 
			  if(checkObj != null )
			   checkObj.each(function(){
				if(this.checked) {
					num = num+1;
				}
			 }); 
			return num;
		  },
		  
		  
		  /**
		   * 获取表单选择1条记录时的值
		   * @author: linxiaoyu 20100324
		   */
		  getCheckBoxValue : function (form,obj){
			  var checkValue = "";
			  var checkObj = this.checkBoxObj(form,obj); 
			  if(checkObj != null )
			   checkObj.each(function(){
				if(this.checked) {
					checkValue = this.value;
				}
			 }); 
			return checkValue;
		  },
		  
		  /**
		  * 获取表单的多选框对象
		  * @author: linxiaoyu 20100324
		  */
		  checkBoxObj : function(form,obj){
			  var formObj = "";
			  
			  if(form&&form!=""){
				  formObj = $("#"+form);
			  }
			  else{
				  formObj =  $(obj).parents("form");			   
			  }
			  
			  var checkObjName = $(obj).attr(checkboxName) ;
			  
			  if(checkObjName && checkObjName != ""){
				  checkObj =  formObj.find("input[name='"+checkObjName+"']");
			  } else if(formObj.find("input[class='checkbox']").length >0) {
				checkObj = formObj.find("input[class='checkbox']");
			  }else{
				checkObj = formObj.find("input[type='checkbox']");
				 if(checkObj.length==1){
					 checkObj = null;
				 }
			  }
			 			 
			  return checkObj;
			  
		  },
		  
		  
		  /**
		  * 表单多选框全选
		  * @author: linxiaoyu 20100324
		  */
		  checkAll : function (obj){
			var checkObj = this.checkBoxObj("",obj);
			if(checkObj != null )
			if(obj.checked){
				checkObj.each(function() {
					if(!this.checked && !this.disabled){
					$(this).trigger('click');
					$(this).attr('checked', true);
					}
				 }); 
				//checkObj.attr('checked', true);
			}
			else{   
				checkObj.each(function() {
					if(this.checked){
						$(this).trigger('click');
						}
				 });
				checkObj.attr('checked', false);
			}
		  },
		  
		  /**
		  * 表单多选框反选
		  * @author: linxiaoyu 20100324
		  */
		  checkAllFn : function (obj){
			var checkObj = this.checkBoxObj("",obj);
			if(checkObj != null )
			checkObj.each(function() {
				if(!this.disabled) {
					this.checked = !this.checked;
					$(this).trigger('click');
				}
			 }); 
		  }
		  

	});
})(jQuery);

