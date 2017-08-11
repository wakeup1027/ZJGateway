
(function(window, undefined){
	var document = window.document,
		navigator = window.navigator,
		location = window.location;
	
	var tool = {
		
		// 鼠标悬浮事件
		mouse_over: function(obj) {
			$(obj).children().siblings().css("background-color", "#F6F6F6");
		},
		
		// 鼠标悬浮离开事件
		mouse_out: function(obj) {
			$(obj).children().siblings().css("background-color", "#FFFFFF");
		},
		
		//全选、取消
		toggleSelectAll: function(o, checkboxName){
			if(o.checked == true){
				$("input[name='" + checkboxName + "']").attr('checked',true);
			}else{
				$("input[name='" + checkboxName + "']").attr('checked',false);
			}
		},
		
		//是否有选中的复选框
		hasSelected: function(checkboxName){
			var len = tool.countSelected(checkboxName);
			if(len > 0){
				return true;
			}else{
				return false;
			}
		},
		
		//选中的复选框的个数
		countSelected: function(checkboxName){
			var len = 0;
			var checkedObj = $("input[name='" + checkboxName + "']:checked");
			if(checkedObj != null){
				len = checkedObj.length;
			}
			return len;
		},
		
		//选中的复选框的隐藏值
		selectedValues: function(checkboxName){
			var values = "";
			var checkedObj = $("input[name='" + checkboxName + "']:checked");
			if(checkedObj != null){
				len = checkedObj.length;
				if(len > 0){
					checkedObj.each(function(index){
						values += (values == "" ? "" : ",") + $(this).val();
					});
				}
			}
			return values;
		},
		
		//单个链接
		singleLink: function(checkboxName, callbackFun){
			var len = tool.countSelected("checkbox");
			if(len == 0){
				art.dialog({
					icon: 'warning',
					lock: true,
				    content: "请选择一项！",
			    	ok: function () {}
				});
			}else if(len == 1){
				var id = tool.selectedValues("checkbox");
				if(callbackFun){
					callbackFun(id);
				}
			}else if(len > 1){
				art.dialog({
					icon: 'warning',
					lock: true,
				    content: "只能选择一项！",
			    	ok: function () {}
				});
			}
		},
		
		
		/**
		 * 自动生成随机码
		 * @param {Object} n
		 * @return {TypeName} 
		 */
		generateMixed: function(n) {
			var chars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
			var res = "";
			for(var i = 0; i < n ; i ++) {
				var id = Math.ceil(Math.random()*35);
				res += chars[id];
			}
			return res;
		},
		
		/**
		 * 判断是否为表单元素（true），否则为普通元素（false）
		 */
		isFormTag: function(id){
			var isFormTag = null;
			if($("#" + id).length > 0){
				var tagName = $("#" + id).get(0).tagName.toLowerCase();
				if(tagName == "input" || tagName == "textarea" || tagName == "select"){
					isFormTag = true;
				}else{
					isFormTag = false;
				}
			}
			return isFormTag;
		},
		
		/**
		 * 设置值
		 */
		setValue: function(id, value){
			var isFormTag = tool.isFormTag(id);
			if(isFormTag === true){
				$("#" + id).val(value);
			}else if(isFormTag === false){
				$("#" + id).html(value);
			}
		},
		
		/**
		 * 短暂提示
		 * @param   {String}    提示内容
		 * @param   {Number}    显示时间 (默认1.5秒)
		 */
		tips: function(content, time) {
		    return art.dialog({
		        id: 'Tips',
		        title: false,
		        cancel: false,
		        fixed: true,
		        lock: true,
		        opacity: 0.3
		    })
		    .content('<div style="padding: 0 1em;">' + content + '</div>')
		    .time(time || 1.5);
		},
		
		/**
		 * 通过样式名称获取对象的值（若多个对象，则以逗号隔开它们的值）
		 */
		getValues: function(className){
			var values = "";
			var objs = $("." + className);
			if(objs != null && objs.length > 0){
				objs.each(function(index) {
					var value = $(this).val();
					if(value != null && value.length > 0){
						values += (values.length > 0 ? "," : "") + value;
					}
				});
			}
			return values;
		},
		
		/**
		 * 是否存在
		 * （即：字符string是否存在stringArray字符数组中，若存在返回true，否则返回false）
		 */
		isExists: function(string, stringArray){
			var isExists = false;
			if(string && $.trim(string).length > 0 && stringArray && stringArray.length > 0){
				for(var i = 0; i < stringArray.length; i ++){
					var value = stringArray[i];
					if(value && $.trim(value).length > 0 && string == value){
						isExists = true;
					}
				}
			}
			return isExists;
		},
		
		/**
		 * 单选筛选框（筛选框中只选择一个，若选择第二个，自动取消之前选中的那个）
		 */
		checkOnlyOne: function(id, checkboxName){
			var checkboxObjs = $("input[name='" + checkboxName + "']:checked").filter("#" + id);
			if(checkboxObjs && checkboxObjs.length > 0){
				checkboxObjs.each(function(){
					$(this).attr("checked", false);
				});
			}
		},
		
		/**
		 * 列表页面中单个删除的公共方法
		 * 若是持久化的数据，则确认删除，若是刚新增的数据，则可以直接删除
		 * @param {Object} tableId 表格id
		 * @param {Object} deletedBoxId 删除持久化的对象后将id存储起来，以便保存时在后端处理数据。
		 * @param {Object} id
		 * @param {Object} isPersistent 是否为持久化的对象（是否已经保存过，即有id了）
		 * @param {Object} orderNumLabelClass 显示排序号的标签的class
		 * wxw 2013.04.24
		 */
		singleDelFun: function(tableId, deletedBoxId, id, isPersistent, orderNumLabelClass){
			if(isPersistent === true){
				art.dialog({
				    icon: 'warning',
				    lock: true,
				    opacity: 0.3,// 透明度
				    content: '确定要删除吗？',
				    ok: function () {
						if($("#" + deletedBoxId).val() == ""){
							$("#" + deletedBoxId).val(id);
						}else{
							$("#" + deletedBoxId).val($("#" + deletedBoxId).val() + "," + id);
						}
						$("#tr_" + id).remove();
						tool.updateOrderNum(tableId, orderNumLabelClass);
				    },
				    cancel: true//true表示关闭
				});
			}else{
				$("#tr_" + id).remove();
				tool.updateOrderNum(tableId, orderNumLabelClass);
			}
		},
		
		/**
		 * 更新排序号
		 * wxw 2014.01.22
		 */
		updateOrderNum: function(tableId, orderNumLabelClass) {
			var orderNums = $("#" + tableId).find("." + orderNumLabelClass);//orderNum-span");
			var len = orderNums.length;
			if(len > 0){
				orderNums.each(function(index) {
					$(this).html(index + 1);
				});
				$("#" + tableId).find("." + orderNumLabelClass).each(function(index) {
					$(this).val(index + 1);
				});
			}
		},
		
		/**
		 * 互斥的复选框
		 * checkboxName 复选框的name
		 * value 当前复选框的值
		 * hiddenInputIdPrefix 隐藏域的id的前缀
		 * 必要条件：
		 * 1、隐藏域的id必须以相应复选框的值为结尾
		 * 2、复选框的值必须唯一
		 * wxw 2014.12.03
		 */
		incompatibleCheckbox: function(checkboxName, value, hiddenInputIdPrefix){
			$("input:checkbox[name=" + checkboxName + "]").each(function(){
				if($(this).val() == value && $(this).is(":checked")){
					$(this).attr("checked", "checked");
					$("#" + hiddenInputIdPrefix + value).val("001");
				}else{
					$(this).removeAttr("checked");
					$("#" + hiddenInputIdPrefix + $(this).val()).val("002");
				}
			});
		}
	};
	
	window.tool = tool;
	
})(window);
