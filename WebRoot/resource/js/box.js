// JavaScript Document
 (function () {
	var index = 1;  		//弹出层索引 主要用于标志Id
	var showindex = 0;		//主要用于 弹出层z-index

	//默认
	var defaultOptions = {
		title: "",
		html: "",
		url: "",
		buttons: []
	}

	function prompt(options) {
		if (typeof arguments[0] == "object") {
			options = $.extend(defaultOptions, options);
		} else {
			options = {
				title: arguments[0],
				html: arguments[1],
				buttons: arguments[2] || []
			}
		}
		//----以上将参数均转换成统一对象形式---
		var p = new popup(options);
		return p;
	}
	
	 function promptPage(title, url) {
		var options = {
			title: title,
			url: url,
			buttons: arguments[2] || [],
			width: arguments[3] || 600,
			height: arguments[4] || 400
		}
		//----以上将参数均转换成统一对象形式---

		var p = new popup(options);
		return p;
	}
	
	//
	function popup(options){
		var popupDom = null;
		
		var exeConfirm, exeSave, exeDelete, exeCancel, exeClose;
		this.onClose = function(callback){exeClose = callback;};
		this.onConfirm = function(callback){exeConfirm = callback;};
		this.onCancel = function(callback){exeCancel = callback;};
		this.onSave = function(callback){exeSave = callback;};
		this.onDelete = function(callback){exeDelete = callback;};
		
		var self = this;
		//显示
		this.show = function(){
			popupDom.parents(".popup-box").show();
			popupDom.siblings(".layer").css("z-index", 1000+showindex);
			popupDom.css("z-index", 1001 + showindex);
			showindex+=2;
		}
		//隐藏
		this.hide = function(){
			popupDom.parents(".popup-box").hide();
		}
		//关闭
		this.close = function(){
			if(typeof(exeClose) == "function") exeClose();
			popupDom.parents(".popup-box").remove();
			index--;
		}
		//创建一个新窗体
		var create = function(){
			 var html = '<div class="popup-box"><div class="layer"></div><div class="popup" id="popup_' + index + '"><div class="title"><div class="name fl">';
			html += options.title;
			html += '</div><div class="close fr">X</div></div><div class="main">';
			if (options.html != null && options.html != "") {
				html += '<div class="content">' + options.html + '</div>';
			} else if (options.url != null && options.url != "") {
				var width = options.width || 600;
				var height = options.height || 400;
				html += '<iframe src="' + options.url + '" width="' + width + '" height="' + height + '" style="border:0;" ></iframe>';
			} else {

			}
			html += '</div>';
			if (options.buttons && options.buttons instanceof Array && options.buttons.length > 0) {
				html += '<div class="buttons box">';
				for (var i = 0; i < options.buttons.length; i++) {
					if (options.buttons[i] == "confirm") {
						html += '<div class="button confirm inline">确认 </div>';
					} else if (options.buttons[i] == "save") {
						html += '<div class="button save inline">保存</div>';
					} else if (options.buttons[i] == "cancel") {
						html += '<div class="button cancel inline">取消</div>';
					} else if (options.buttons[i] == "delete") {
						html += '<div class="button delete inline">删除</div>';
					}
				}
				html += '</div>';
			}
			html += '</div></div>';

			$("body").append(html);
			//居中
			$("#popup_" + index).css('margin-top', -($("#popup_" + index).height() / 2) + "px");
			$("#popup_" + index).css('margin-left', -($("#popup_" + index).width() / 2) + "px");
			//顶层
			$("#popup_" + index).siblings(".layer").css("z-index", 1000+showindex);
			$("#popup_" + index).css("z-index", 1001 + showindex);
			
			index++;showindex+=2;
			popupDom = $("#popup_" + (index - 1));
			
			//绑定
			bindEventListener(popupDom);
				
		}
		
		//返回窗体里面内容对象
		this.content = function(){
			if(popupDom.find(".content").length!=0){
				return popupDom.find(".content");
			}
			return null;
		}
		
		
		//绑定各种事件
		var bindEventListener = function(popdom){
			popdom.undelegate(".close", "click");
			popdom.delegate(".close", "click", function () {
				self.close();
			});
			$(document).undelegate("body","keydown");
			$(document).delegate("body","keydown", function (e) {
				if (e.keyCode == 27) {      //按下 ESC 键
					if(index-1>=1){
						var topPopup = $('#popup_'+(index-1))||null, maxindex = $('#popup_'+(index-1)).css("z-index")||-1;
						$(".popup").each(function() {
							topPopup = $(this).css("z-index")>maxindex ? $(this) : topPopup;
						});
						topPopup.find(".close").trigger("click");
					}
					
				}
			});
			popdom.undelegate(".confirm,.save,.delete,.cancel", "click");
			popdom.delegate(".confirm", "click", function () { if (typeof exeConfirm == "function") { exeConfirm(); } });
			popdom.delegate(".save", "click", function () { if (typeof exeSave == "function") { exeSave(); } });
			popdom.delegate(".delete", "click", function () { if (typeof exeDelete == "function") { exeDelete(); } });
			popdom.delegate(".cancel", "click", function () { if (typeof exeCancel == "function") { exeCancel(); } });
		};
		
		
		create();//new 对象后创建窗体
	}
	window.UI = $.extend(window.UI, { prompt: prompt, promptPage: promptPage });
})();	
		
