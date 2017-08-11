
/**
 * js树插件（ztree[http://www.ztree.me]）的封装文件，以便于更方便的引用。
 * wxw 2013.07.24
 * @copyright wxw 2013.07.24
 */


(function($){
//	var setting = {
//		check: {
//			enable: true,
//			chkStyle: "radio",//表示单选
//			radioType: "all"//默认为整棵树只能选择一个 ，level表示同一级只能选择一个
//		},
//		data: {
//			simpleData: {
//				enable: true
//			}
//		},
//		instances: [],
//		treeId: ''
//	},
	
	//设置已经选择的值
	_setDefault = function(tree_data, input_code_id){
		var code_value = $("#"+input_code_id).val();
		if(tree_data && input_code_id){
			for(var i = 0; i < tree_data.length; i ++){
				if(tree_data[i].id == code_value){
					tree_data[i].checked = true;
					break;
				}
			}
		}
	},
	
	_init = function(input_code_id, input_name_id, pcode_span, ajax, setting){
		
		var tree = {
			tree_id: "tree_" + input_name_id,
			panel_id: "panel_" + input_name_id,
			confirm_id: "confirm_" + input_name_id,
			close_id: "close_" + input_name_id
		}
		
		var _setting = {
			check: {
				enable: true,
				chkStyle: "radio",//表示单选
				radioType: "all"//默认为整棵树只能选择一个 ，level表示同一级只能选择一个
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		}
		
		var panelObj = $("#" + tree.panel_id);
		if(panelObj.length == 0){
			var panel_html = "<div class=\"tree-panel\" id=\"" + tree.panel_id + "\">"
								+ "<div class=\"select-ctrl\">"
									+ "<a href=\"javascript:void(0);\" class=\"select-confirm\" id=\"" + tree.confirm_id + "\" treeId=\"" + tree.tree_id + "\">确定</a><a href=\"javascript:void(0);\" id=\"" +tree.close_id + "\" class=\"select-close\">关闭</a>"
								+ "</div>"
								+ "<div class=\"data-panel\">"
								 	+ "<ul id=\"" + tree.tree_id + "\" class=\"ztree\"></ul>"
								+ "</div>"
							+ "</div>";
			$(document.body).append(panel_html);
			panelObj = $("#" + tree.panel_id);
		}
		
		//异步加载数据
		$.ajax({
			type: "POST",
			url: ajax.url,
			data: ajax.data,
			dataType: ajax.dataType,
			success: function(result){
				//加载数据
				var tree_data = result.tree;
				_setDefault(tree_data, input_code_id);
				
				//zTreeNodes = [{"name":"网站导航", open:true, children: tree_data}];
				_setting = $.extend(true, {}, _setting, setting);//true表示深度合并（默认为false）
				//初始化数据
				treeTools = $.fn.zTree.init($("#"+tree.tree_id), _setting, tree_data);
				//展开全部
				//treeTools.expandAll(true);
				//setting.instances.push(treeTools);
				//treeId = tree.tree_id;
				//setting.instance = treeTools;
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){}
		});
		
		//显示面板（必须通过文本框的ID来绑定）
		
		var textObj = $("#" + input_name_id);
		
		textObj.click(function(){
			var A_top = $(this).offset().top + $(this).outerHeight(true);  //  1
			var A_left =  $(this).offset().left;
			panelObj.show().css({"position":"absolute","top":A_top+"px" ,"left":A_left+"px"});
		});
		
		panelObj.find("#"+tree.close_id).click(function(){
			panelObj.hide();
		});
		
		$(document).click(function(event){
			if(event.target.id != textObj.selector.substring(1)){
				panelObj.hide();
			}
		});
		
		panelObj.click(function(e){
			e.stopPropagation(); //  2
		});
		
		//为确定按钮绑定一个方法
		$("#"+tree.confirm_id).click(function(){
			var checkedNode = $.fn.zTree.getZTreeObj($(this).attr("treeId")).getCheckedNodes(true);
			var is_temp = true;
			if(checkedNode && checkedNode.length == 1){
				if(checkedNode[0].checked !== false){
					is_temp = false;
					$("#"+input_code_id).val(checkedNode[0].id);
					$("#"+input_name_id).val(checkedNode[0].name);
					$("#"+pcode_span).text(checkedNode[0].id);
				}
			}
			if(is_temp === true){
				$("#"+input_code_id).val("");
				$("#"+input_name_id).val("");
			}
			panelObj.hide();
		});
	}
	
	$.fn.tree = {
		init: function(input_code_id, input_name_id, pcode_span, ajax, setting){
			_init(input_code_id, input_name_id, pcode_span, ajax, setting);
		}
	};
	
})(jQuery);