
var Common = function () {
};
(function ($) {
	$.extend(Common, {
		jumpPage:function (formId, pageNo, ajaxInst) {
			var form = $(formId);
			if(pageNo)
				form.find("#pageNo").val(pageNo);
			if(!this.isInt(form.find("#pageNo").val())){
				alert("请输入正确的页码！");
				return ;
			}
			this.submitForm(form, ajaxInst);
		}, 
		
		isInt : function(value){
			return /^\d+$/.test(value);
		},
		
		submitForm : function(form, ajaxInst){
			if(ajaxInst){
				ajaxInst.submitAJAX();
			}else
				$(form).submit();
		},
		
		refreshForm : function(formId){
			var ajaxInst = window[formId+'AjaxInst'];
			this.submitForm($(formId+"Form"), ajaxInst);
		},
		
		exportExcel : function(tableName){
		   	var startStr = prompt("请输入要导出的开始页：","1");
		   	var startPage = parseInt(startStr);
		   	if(!startPage)
		   		return ;
		   	
		   	var endStr = prompt("请输入要导出的最后一页：","1");
		   	var endPage = parseInt(endStr);
		   	if(!endPage)
		   		return ;
		   		
		   	if(!startPage || !endPage){
		   		alert("请输入正确的页码！");
		   		return ;
		   	}
		   	
		   	var formId = '#'+tableName+'Form';
		   	var form = $(formId);
		   	form.find('#pageNo').val(startPage);
		   	form.find('#endPage').val(endPage);
		   	form.find('#export').val('true');
		   	form.submit();
		   	form.find('#export').val('false')
	   },
	   
	   //导入excel
	   importExcel : function(ev,obj,action,varName,baseUrl){
			fPopBox(ev.originalEvent,obj,1,baseUrl + '/code/excel!importing.do?action='+action+'&varName='+varName,310,50,'buttom',0);
	   },
		
		sort:function (orderBy, defaultOrder, formId, ajaxInst) {
			var form = $(formId);
			if (form.find("#orderBy").val() == orderBy) {
				if (form.find("#order").val() == "") {
					form.find("#order").val(defaultOrder);
				} else {
					if (form.find("#order").val() == ":desc") {
						form.find("#order").val(":asc");
					} else {
						if (form.find("#order").val() == ":asc") {
							form.find("#order").val(":desc");
						}
					}
				}
			} else {
				form.find("#orderBy").val(orderBy);
				form.find("#order").val(defaultOrder);
			}
			this.submitForm(form, ajaxInst);
		}, 
		
		search:function (formId, ajaxInst) {
			var form = $(formId || "#mainForm");
			form.find("#order").val("");
			form.find("#orderBy").val("");
			form.find("#pageNo").val("1");
			this.submitForm(formId, ajaxInst);
		}, 
		
		doAction : function(url, msg){
			if(msg){
				if($.trim(msg)=='')
					msg = '你确定要进行此操作？';
				if(!window.confirm(msg))
					return ;
			}
			location.href = url;
		},
		
		doDelete : function(url){
			this.doAction(url, "确定要删除记录？")
		},
		
		loadJs : function(jsfile){
			var head = $("head:first");
			$("<script></script>").attr({
				id:"loadScript",
				type : "text/javascript",
				src : jsfile
			}).appendTo(head);
		},
		
		jumpPageAfter : function(time, url){
			var o = this;
			window.setTimeout(function(){
				if(time>0){
					jQuery('#time').html(time);
					time--;
					o.jumpPageAfter(time, url);
				}else{
					window.location.href=url;
				}
			}, 1000);
		}
	});
})(jQuery);

