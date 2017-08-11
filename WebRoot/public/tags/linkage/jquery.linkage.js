/*
 * JQuery Linkage Plugin (联动组件) 1.0.4
 * 说明：
 * 1、支持自定义数据和ajax异步获取（支持带回调的方式）两种方式，若为ajax方式，则返回的集合需要包装一个名为data的数据。
 * 2、返回的数据中必须包含code,pcode,name三个属性。
 * 3、支持一个页面中多处调用（多个实例）。
 * Copyright © 2012 wxw. All rights reserved.
 */

/**
 * 更新日志：
 * 2013.06.21
 * 1、支持指定json对象中属性名（增加属性firstLabel）
 * 2、修复在首次加载时若隐藏值为空时第一个下拉框加载再次的错误。
 * 3、支持自定义第一个文本框的提示文字（增加属性keys）
 * 4、修改以前定义多个下拉框的方式为定义一个下拉框，自动生成后面需要的下拉框（以第一个为原型，自动修改ID为【原ID+从1开始的序号】）。
 * 5、修改4中的问题，初始化时不先生成不需要的下拉框，而是在用到时再去通过第一个来copy一个改id来实现显示下一级下拉框。在切换时若未用到的下拉框将会销毁，再次使用时再重新copy生成。
 * 6、版本号更改为1.0.2
 * 
 * 2014.12.23
 * 1、修改在已选择其中的一个级别后，在修改时加载数据不完整的问题。（修改了加载策略，由加载3，2，1，4改为1，2，3，4）
 * 2、版本号更改为1.0.3
 * 
 * 2015.01.08
 * 1、修改在首次加载下拉框时出现的错误。
 * 2、版本号更改为1.0.4
 * 
 * 注意：若使用ajax来获取数据，请使用Struts2Utils.renderJson(list);来返回数据。（使用到的包为org.springside.modules.web.struts2.Struts2Utils）
 */




(function($){
	
	var linkage = {
		
		//设置参数
		settings: {
			id: '',//装载下拉框最后一个已选的值的隐藏域的ID（*必填配置）
			linkageId: '',//联动组件的ID（*必填配置）
			root: '0',//最顶级的root，默认为"0"
			useAjax: false,//是否使用ajax取数据（默认为false，表示不使用ajax方式获取数据，而是用户自己提供data的值）
			keys: ['id', 'name' ,'pid'],//指定json对象中的键名称（默认为['id', 'name' ,'pid']）
			firstLabel: '全部',//第一个文本框的提示文字（默认为全部）
			ajax: {
				type: "POST",
				url: '',//ajax取数据的路径（ajax为true时必填配置）
				data: {},//ajax需要的data参数
				dataType: "json"
			},
			data: []//json数据
		},
		
		
		//初始化
		init: function(defaults){
			
			//加载配置
			this.settings = $.extend({}, linkage.settings, defaults);
			
			//加载数据
			if(this.settings.useAjax === true){
				this._loadData();
			}
			
			//当前隐藏域的值
			var value = $("#" + this.settings.id).val();
			
			//先获取当前值的级别
			var level = this._getLevel(value, 0);
			
			//定义一个属性来装载指定的默认下拉菜单的html，作为模板
			var template = $("#" + this.settings.linkageId);
			this.settings.selector = template.outerHTML();
			
			//定义一个属性来装载数据的层级
			this.settings.dataLevel = this._sumLevel(this.settings.data);
			
			//根据配置设置值（首次加载数据）
			this._initLoad(value, level);
			
			//通过id查找name再去以name动态（live）注册change事件。
			var instance = this;
			$("select[name=" + $("#" + this.settings.linkageId).attr("name") + "]").live("change", function(){
				instance._loadNext($(this).val(), instance._getLevelById($(this).attr("id")));
				$("#" + instance.settings.id).val(instance._getValue());//change后将新值存入在隐藏域中
			});
			
		},
		
		
		/**
		 * 区取最后一个已选的值
		 */
		_getValue: function(){
			var value = "";
    		if(this.settings.dataLevel > 0){
    			for(var i = 0; i < this.settings.dataLevel; i ++){
					var obj = $("select[name=" + $("#" + this.settings.linkageId).attr("name") + "]")[i];
					if($(obj).val() == null || $(obj).val() == ""){
						break;
					}
					value = $(obj).val();
	        	}
    		}
    		if(value == ""){
    			value == this.settings.root;
    		}
        	return value;
		},
		
		
		/**
		 * 加载当前选项后面的下拉框
		 * @param {Object} value
		 * @param {Object} level
		 * @memberOf {TypeName} 
		 */
		_loadNext: function(value, level){
			//console.log("value1:", value);
			//console.log("level1:", level);
			//console.log("this.settings.dataLevel1:", this.settings.dataLevel);
			//如果还有下级，先加载待选择的下级
			if(level < this.settings.dataLevel){
				var haveChild = false;//是否有下级
				if(value != "" && value != this.settings.root){
					haveChild = this._loadOption('', value, level+1);
				}
			}
			
			//清空待选下拉框的所有下级下拉框
			if((level+3) <= this.settings.dataLevel){
				for(var i = level + 3; i <= this.settings.dataLevel; i ++){
					var id = this.settings.linkageId + "_" + i;
					$("#" + id).remove();//console.log("id:",id);
				}
			}
			
			//如果当前值为空，且下一个下拉框存在，则删除掉
			if((value == null || value == "" || value == this.settings.root) && (level+2) <= this.settings.dataLevel){
				$("#" + this.settings.linkageId + "_" + (level+2)).remove();//console.log("id0:",id);
				//console.log("value:", value);
				//console.log("level:", level);
			}
		},
		
		
		/**
		 * 首次加载数据
		 * 说明：若总共有5级，当前为第3级，则先找出1和2的编码，再加上3的编码一起按顺序加载1，2，3的下拉框，最后再加载4的下拉框（若4有数据）。
		 * @param {Object} code
		 * @param {Object} level
		 * @memberOf {TypeName} 
		 * @return {TypeName} 
		 */
		_initLoad: function(value, level){
		
			var current_level = level;//先记住当前下拉框的级别
			
			var code = value;
			var pcode = this.settings.root;
			if(code != null && code.length > 0){//表示有初始值
				var codes = code;
				if(level > 0){
					var cur_obj = this._getOne(code);
					var cur_pcode = cur_obj[this.settings.keys[2]];
					var parentCodes = this._loadParentCodes(cur_pcode, level);//获取所有的上级编码
					var codes = parentCodes + "," + codes;//所有的编码（所有的上级编码+当前编码）
				}
				var codes_ = codes.split(",");
				for(var i = 0; i <= level; i ++){
					this._loadOption(codes_[i], pcode, i);
					pcode = codes_[i];
				}
			}else{//没有初始值时，只需要加载第一个下拉框的选项，用于待选。
				this._loadOption(code, pcode, 0);
			}
			
			//2、再加载当前下拉框的下一个下拉框（如果没有，则忽略），为选择作准备
			this._loadNext(value, current_level);
		},
		
		
		/**
		 * 加载所有上级的code，并以逗号隔开的字符串形式返回。如当前的值为4，则返回（“1,2,3”）
		 * 如果有值被加入，将返回true，否则返回false
		 * @param {Object} value
		 * @param {Object} level
		 * @return {TypeName} 
		 */
		_loadParentCodes: function(pcode, level){
			var temp_values = "";
			if(level > 0){
				//console.log("level=",level);
				for(var i = level; i > 0; i --){
					var temp_obj = this._getOne(pcode);//获取上一级对象
					//console.log("pcode=",pcode);
					//console.log("temp_obj=",temp_obj);
					if(temp_obj != null){
						code = temp_obj[this.settings.keys[0]];
						pcode = temp_obj[this.settings.keys[2]];
						temp_values = code + (temp_values.length > 0 ? "," : "") + temp_values;
					}
				}
			}
			return temp_values;
		},
		
		
		/**
		 * 加载一个下拉框的所有选项，并赋值
		 * 如果有值被加入，将返回true，否则返回false
		 * @param {Object} pcode
		 * @param {Object} level
		 * @memberOf {TypeName} 
		 */
		_loadOption: function(value, pcode, level){
			var haveChild = false;//是否有下级
			var combox = null;
			//console.log("value2:", value);
			//console.log("pcode2:", pcode);
			//console.log("level2:", level);
			
			if(level === 0){//第一级时
				combox = $("#" + this.settings.linkageId);
			}else if(level < (this.settings.dataLevel)){//当前级别小于总的级别时
				//如果当前级的下拉框存在，则先删除。
				combox = $("#" + this.settings.linkageId + "_" + (level+1));
				if(combox.length > 0){
					combox.remove();
				}
				//克隆一个下拉框，并显示在上一级下拉框的后面。（以第一个下拉框为原型）
				combox = $("#" + this.settings.linkageId).clone().attr("id", this.settings.linkageId + "_" + (level+1));//.attr("name", this.settings.linkageId + "_" + (level+1));
				if(level == 1){
					$("#" + this.settings.linkageId).after(combox);
				}else{
					$("#" + this.settings.linkageId + "_" + level).after(combox);
				}
			}else{
				return haveChild;
			}
			combox.empty();//清空下拉框的选项
			//加载下拉框内的数据（开始）
			if(level === 0){
				combox.append($("<option>").attr("value", "").html(this.settings.firstLabel));//默认一个请选择
			}else{
				combox.append($("<option>").attr("value", "").html("全部"));//默认一个请选择
			}
			var list = this.settings.data;
			if(list != null && list.length > 0){
				for(var i = 0; i < list.length; i ++){
					var obj = list[i];
					var obj_id = obj[this.settings.keys[0]];
					var obj_name = obj[this.settings.keys[1]];
					var obj_pid = obj[this.settings.keys[2]];
					if(obj_pid == pcode){
						haveChild = true;
						combox.append($("<option>").attr("value", obj_id).html(obj_name));
						if(value == obj_id){
							combox.val(value);
						}
					}
				}
			}
			//加载下拉框内的数据（结束）
			if(haveChild === false && level > 0){
				combox.remove();
			}
			//console.log("haveChild2:", haveChild);
			return haveChild;
		},
		
		
		/**
		 * 获取当前code的级别（从0开始算）
		 * @param {Object} code
		 * @param {Object} level
		 * @memberOf {TypeName} 
		 * @return {TypeName} 
		 */
		_getLevel: function(code, level){
			var list = this.settings.data;
    		if(list){
				for(var j = 0; j < list.length; j ++){
					var obj = list[j];
					var obj_id = obj[this.settings.keys[0]];
					var obj_pid = obj[this.settings.keys[2]];
					if(code == obj_id){
						if(obj_pid != this.settings.root){
							level = this._getLevel(obj_pid, level) + 1;
						}
					}
	        	}
    		}
        	return level;
		},
		
		
		/**
		 * 获取当前code的级别（从0开始算）
		 * @param {Object} code
		 * @param {Object} level
		 * @memberOf {TypeName} 
		 * @return {TypeName} 
		 */
		_getLevelById: function(id){
			var level = 0;
    		if(this.settings.dataLevel){
    			for(var i = 0; i < this.settings.dataLevel; i ++){
					var id_ = this.settings.linkageId + "_" + (i+1);
					if(id_ == id){
						level = i;
						break;
					}
	        	}
    		}
        	return level;
		},
		
		
		/**
		 * 获取数据的等级（0表示没有数据，1表示有一级，以此类推）
		 * 递归计算法
		 */
		_sumLevel: function(list){
			var level = 0;
			if(list && list.length > 0){
				var max = 0;
				for(var i = 0; i < list.length; i ++){
					var obj = list[i];
					var obj_id = obj[this.settings.keys[0]];
					var objList = this._getList(obj_id);
					var result = this._sumLevel(objList);
					if(result > max){
						max = result;
					}
				}
				level = (max + 1);
			}
			return level;
		},
		
		
		/**
		 * 获取某一个对象
		 */
		_getOne: function(code){
    		var list = this.settings.data;
    		if(list){
				for(var j = 0; j < list.length; j ++){
					var obj = list[j];
					var obj_id = obj[this.settings.keys[0]];
					if(code == obj_id){
						return obj;
					}
	        	}
    		}
        	return null;
		},
		
		
		/**
		 * 获取某父ID下的所有对象
		 * @param {Object} pcode
		 */
		_getList: function(pcode){
			var list = this.settings.data;
			var result = [];
    		if(list){
				for(var j = 0; j < list.length; j ++){
					var obj = list[j];
					var obj_pid = obj[this.settings.keys[2]];
					if(pcode == obj_pid){
						result.push(obj);
					}
	        	}
    		}
        	return result;
		},
		
		
        //获取列表数据方法
        _loadData: function(){
        	var datas;
        	$.ajax({
        		type: this.settings.ajax.type,
				url: this.settings.ajax.url,
				data: this.settings.ajax.data,
				dataType : this.settings.ajax.dataType,
				async: false,
				success: function(result){
					datas = result;
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					//alert( "XMLHttpRequest.readyState: " + XMLHttpRequest.readyState + "\ntextStatus: " + textStatus + "\nerrorThrown: " + errorThrown );
				}
        	});
        	this.settings.data = datas;
        }
	};

	
	$.fn.linkage = function(defaults) {
		linkage.init.prototype = linkage;
		var instance = new linkage.init(defaults);
		return instance;
	};
	
	
	jQuery.fn.outerHTML = function(s) {
    	return (s) ? this.before(s).remove() : jQuery("<p>").append(this.eq(0).clone()).html();
    }

})(jQuery);
