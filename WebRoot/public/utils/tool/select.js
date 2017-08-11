//<ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true"></ul>
/*
setting{
	baseUrl,//指获取数据的baseUrl（必填项，例：“http://localhost:8080/project”或“/project”）
	isMulti,//指是否为多选，默认为true
	fields:{id,name,code,pid,pname,pcode,departId,departCode,departName,groupId,groupCode,groupName,organId,organCode,organName,phone},//选择确定后需要填充的窗体，按顺序为选择的ID，选择的名称，（选择的用户的部门ID，部门名称，电话）【可配置】（必填项）
	by,//仅指在选用户时，若为"organ"则按组织机构为维度选择用户，若为"role"则按角色为维度来选择用户，默认为空表示按组织构架选择用户。
	params:{
		organIds,//以此配置的机构id作为选择的范围。为空时则忽略此配置。
		departIds,//以此配置的部门id作为选择的范围。为空时则忽略此配置。
		groupIds,//以此配置的小组id作为选择的范围。为空时则忽略此配置。
		roleIds,//以此配置的角色id作为选择的范围。为空时则忽略此配置。
		userIds,//以此配置的用户id作为选择的范围。为空时则忽略此配置。
		filterOrganIds,//过滤此机构id
		filterDepartIds,//过滤此部门id
		filterGroupIds,//过滤此小组id
		filterRoleIds,//过滤此角色id
		filterUserIds,//过滤此用户id
		xxx,//自定义的参数
		isSearchCurrentOrgan,//是否根据当前登录用户的机构来筛选
	}
	callback//回调方法
}
*/

(function(window, undefined){
	var document = window.document,
		navigator = window.navigator,
		location = window.location;
	
	var select = {
		
		// 以部门为维度选择用户
		selectUser: function(setting) {
			select._createPanel(setting, "选择用户");
			var method = "selectUserByDepart";
			if(setting.by != null && setting.by != ""){
				if(setting.by == "role"){
					method = "selectUserByRole";
				}else if(setting.by == "user"){
					method = "selectUser";
				}
			}
			var data = $.ajax({url:setting.baseUrl+"/select/user!" + method + ".do",type:'POST',data:setting.params,async:false,cache:false}).responseText;
			select._showData(data, setting.isMulti);
			select._setSelectedData(setting.fields);//提取已有数据到选择面板
		},
		
		// 选择机构
		selectOrgan: function(setting) {
			select._createPanel(setting, "选择机构");
			var data = $.ajax({url:setting.baseUrl+"/select/organ!selectOrgan.do",type:'POST',data:setting.params,async:false,cache:false}).responseText;
			select._showData(data, setting.isMulti);
			select._setSelectedData(setting.fields);//提取已有数据到选择面板
		},
		
		// 选择部门
		selectDepart: function(setting) {
			select._createPanel(setting, "选择部门");
			var data = $.ajax({url:setting.baseUrl+"/select/depart!selectDepart.do",type:'POST',data:setting.params,async:false,cache:false}).responseText;
			select._showData(data, setting.isMulti);
			select._setSelectedData(setting.fields);//提取已有数据到选择面板
		},
		
		// 选择小组
		selectGroup: function(setting) {
			select._createPanel(setting, "选择小组");
			var data = $.ajax({url:setting.baseUrl+"/select/group!selectGroup.do",type:'POST',data:setting.params,async:false,cache:false}).responseText;
			select._showData(data, setting.isMulti);
			select._setSelectedData(setting.fields);//提取已有数据到选择面板
		},
		
		// 以角色为维度选择用户
		selectRole: function(setting) {
			select._createPanel(setting, "选择角色");
			var data = $.ajax({url:setting.baseUrl+"/select/role!selectRole.do",type:'POST',data:setting.params,async:false,cache:false}).responseText;
			select._showData(data, setting.isMulti);
			select._setSelectedData(setting.fields);//提取已有数据到选择面板
		},
		
		// 选择地区
		selectRegion: function(setting) {
			select._createPanel(setting, "选择地区");
			//var params = select._fullParam(setting);
			var data = $.ajax({url:setting.baseUrl+"/select/region!selectRegion.do",type:'POST',data:setting.params,async:false,cache:false}).responseText;
			select._showData(data, setting.isMulti);
			select._setSelectedData(setting.fields);//提取已有数据到选择面板
		},
		
		// 选择字段
		selectColumn: function(setting) {
			select._createPanel(setting, "选择字段");
			var data = $.ajax({url:setting.baseUrl+"/workflow/property!select.do",type:'POST',data:setting.params,async:false,cache:false}).responseText;
			select._showData(data, setting.isMulti);
			select._setSelectedData(setting.fields);//提取已有数据到选择面板
		},
		
		// 创建面板
		_createPanel: function(setting, title){
			var html = "<div class=\"tree_div\">";
			html += "<ul id=\"tree\" class=\"ztree\"></ul>";
			html += "</div>";
			var panel = art.dialog({
				id: 'select',
				title: title,
				content: html,
				lock: true,
				fixed: true,
				opacity: 0.3,// 透明度
				width: 450,
				height: 347,
				padding: '10px 10px 0px 10px',
				button: [
					{
						name: "确定",
						callback: function(){
							var result = select._ok(setting.fields);
							if(result === false){
								return false;
							}
							if(setting.callback){
								setting.callback();
							}
						},
						focus: true
					},
					{
						name: "清空",
						callback: function(){
							select._clear(setting.fields);
							if(setting.callback){
								setting.callback();
							}
						}
					},
					{
						name: "取消"
					}
				]
			});
		},
		
		// 显示数据
		_showData: function(data, isMulti){
			if(data){
				var tree = $("#tree");
				data = eval(data);
				var setting2 = {
					check: {
						enable: true,
						chkboxType: {"Y" : "", "N" : ""}//选中时不影响子节点，不影响父节点，取消选中时不影响子节点不影响父节点。
					},
					callback: {
						onClick: function(e, treeId, treeNode) {
							var tree = $.fn.zTree.getZTreeObj("tree");
							tree.checkNode(treeNode, !treeNode.checked, null, true);
							return false;
						}
					}
				};
				if(isMulti == null || isMulti == "" || isMulti === false){
					setting2.check.chkStyle = "radio";
					setting2.check.radioType = "all";
				}
				$.fn.zTree.init(tree, setting2, data);//生成树
			}
		},
		
		//默认提取目标框中已有数据到选择面板中
		_setSelectedData: function(fields){
			var tree = $.fn.zTree.getZTreeObj("tree");
			var nodes = tree.getCheckedNodes(true);
			if(fields.id){
				var ids = $("#" + fields.id).val();//id
				if($.trim(ids) != ""){
					var ids_ = ids.split(",");
					for(var i = 0; i < ids_.length; i ++){
						if($.trim(ids_[i]) != ""){
							var node = tree.getNodesByParam("id", $.trim(ids_[i]));
							if(node && node.length > 0){
								tree.checkNode(node[0], true);
							}
						}
					}
				}
			}else if(fields.code){
				var codes = $("#" + fields.code).val();//code
				if($.trim(codes) != ""){
					var codes_ = codes.split(",");
					for(var i = 0; i < codes_.length; i ++){
						if($.trim(codes_[i]) != ""){
							var node = tree.getNodesByParam("code", $.trim(codes_[i]));
							if(node){
								tree.checkNode(node[0], true);
							}
						}
					}
				}
			}
		},
		
		// 确定
		_ok: function(fields){
			var tree = $.fn.zTree.getZTreeObj("tree");
			var nodes = tree.getCheckedNodes(true);
			var ids = "";//id
			var codes = "";//code
			var names = "";//名称
			var pids = "";//父级id
			var pcodes = "";//父级code
			var pnames = "";//父级名称
			var groupIds = "";//小组id
			var groupCodes = "";//小组code
			var groupNames = "";//小组名称
			var departIds = "";//部门id
			var departCodes = "";//部门code
			var departNames = "";//部门名称
			var organIds = "";//机构id
			var organCodes = "";//机构code
			var organNames = "";//机构名称
			var phones = "";//电话
			if(nodes && nodes.length > 0){
				for(var i = 0; i < nodes.length; i ++){
					if(nodes[i].id != "0"){//过滤掉顶级节点ID
						var level = nodes[i].level;
						if(fields.id){
							ids += (ids != "" ? "," : "") + nodes[i].id;
						}
						if(fields.code){
							codes += (codes != "" ? "," : "") + nodes[i].code;
						}
						if(fields.name){
							names += (names != "" ? "," : "") + nodes[i].name;
						}
						if(fields.pid){
							pids += (pids != "" ? "," : "") + nodes[i].pid;
						}
						if(fields.pcode){
							pcodes += (pcodes != "" ? "," : "") + nodes[i].pcode;
						}
						if(fields.pname){
							pnames += (pnames != "" ? "," : "") + nodes[i].pname;
						}
						if(fields.groupId){
							groupIds += (groupIds != "" ? "," : "") + nodes[i].groupId;
						}
						if(fields.groupCode){
							groupCodes += (groupCodes != "" ? "," : "") + nodes[i].groupCode;
						}
						if(fields.groupName){
							groupNames += (groupNames != "" ? "," : "") + nodes[i].groupName;
						}
						if(fields.departId){
							departIds += (departIds != "" ? "," : "") + nodes[i].departId;
						}
						if(fields.departCode){
							departCodes += (departCodes != "" ? "," : "") + nodes[i].departCode;
						}
						if(fields.departName){
							departNames += (departNames != "" ? "," : "") + nodes[i].departName;
						}
						if(fields.organId){
							organIds += (organIds != "" ? "," : "") + nodes[i].organId;
						}
						if(fields.organCode){
							organCodes += (organCodes != "" ? "," : "") + nodes[i].organCode;
						}
						if(fields.organName){
							organNames += (organNames != "" ? "," : "") + nodes[i].organName;
						}
						if(fields.phone){
							phones += (phones != "" ? "," : "") + (nodes[i].phone == null ? "" : nodes[i].phone);
						}
					}
				}
				if(fields.id){
					tool.setValue(fields.id, ids);
				}
				if(fields.code){
					tool.setValue(fields.code, codes);
				}
				if(fields.name){
					tool.setValue(fields.name, names);
				}
				if(fields.pid){
					tool.setValue(fields.pid, pids);
				}
				if(fields.pcode){
					tool.setValue(fields.pcode, pcodes);
				}
				if(fields.pname){
					tool.setValue(fields.pname, pnames);
				}
				if(fields.groupId){
					tool.setValue(fields.groupId, groupIds);
				}
				if(fields.groupCode){
					tool.setValue(fields.groupCode, groupCodes);
				}
				if(fields.groupName){
					tool.setValue(fields.groupName, groupNames);
				}
				if(fields.departId){
					tool.setValue(fields.departId, departIds);
				}
				if(fields.departCode){
					tool.setValue(fields.departCode, departCodes);
				}
				if(fields.departName){
					tool.setValue(fields.departName, departNames);
				}
				if(fields.organId){
					tool.setValue(fields.organId, organIds);
				}
				if(fields.organCode){
					tool.setValue(fields.organCode, organCodes);
				}
				if(fields.organName){
					tool.setValue(fields.organName, organNames);
				}
				if(fields.phone){
					tool.setValue(fields.phone, phones);
				}
			}else{
				art.dialog({
					icon: 'warning',
					lock: true,
				    content: "请至少选择一项",
					opacity: 0.3,// 透明度
			    	ok: function () {}
				});
				return false;
			}
			return true;
		},
		
		// 清空
		_clear: function(fields){
			if(fields.id){
				tool.setValue(fields.id, "");
			}
			if(fields.code){
				tool.setValue(fields.code, "");
			}
			if(fields.name){
				tool.setValue(fields.name, "");
			}
			if(fields.pid){
				tool.setValue(fields.pid, "");
			}
			if(fields.pcode){
				tool.setValue(fields.pcode, "");
			}
			if(fields.pname){
				tool.setValue(fields.pname, "");
			}
			if(fields.groupId){
				tool.setValue(fields.groupId, "");
			}
			if(fields.groupCode){
				tool.setValue(fields.groupCode, "");
			}
			if(fields.groupName){
				tool.setValue(fields.groupName, "");
			}
			if(fields.departId){
				tool.setValue(fields.departId, "");
			}
			if(fields.departCode){
				tool.setValue(fields.departCode, "");
			}
			if(fields.departName){
				tool.setValue(fields.departName, "");
			}
			if(fields.organId){
				tool.setValue(fields.organId, "");
			}
			if(fields.organCode){
				tool.setValue(fields.organCode, "");
			}
			if(fields.organName){
				tool.setValue(fields.organName, "");
			}
			if(fields.phone){
				tool.setValue(fields.phone, "");
			}
		}
		
	};
	
	window.select = select;
	
})(window);
