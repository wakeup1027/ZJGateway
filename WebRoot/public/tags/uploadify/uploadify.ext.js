var t = document.getElementsByTagName("SCRIPT");
t = t[t.length-1].src.replace(/\\/g, "/");
var _basePath = (t.lastIndexOf("/")<0)?".":t.substring(0, t.lastIndexOf("/"));

if(jQuery)(
	function($) {
		$.extend($.fn, {
			initUpload : function(options) {
			
				var settings = {
					fileDataName: 'data',
					displayData	: 'all',
					multi       : true,
					auto        : true,
					height		: 25,
					width		: 100,
					sizeLimit   : 1024*1024*100,//单个文件最大一百M
					showpic     : false,
					solution	: 'list',
					successTimeout:300,
					data		: {},
					scriptData	: {},
					uploader    : _basePath + '/uploadify.swf',
					buttonImg   : _basePath + '/upload.gif',
					cancelImg	: _basePath + '/cancel.png',
					fileDesc    : '请选择文件',
					fileExt     : '*.jpg;*.jpeg;*.gif;*.png;*.doc;*.docx;*.ppt;*.txt;*.pdf;*.flv;*.rar;*.zip;*.xls;*.xlsx;*.csv;*.swf',
					onError     : function(event, queueId, fileObj, errorObj){
						alert("发生错误，信息如下<br/>type:" + errorObj.type + ";info:" + errorObj.info );
					},
					onAllComplete:function() {window.onbeforeunload = null;},
					onCheck		: function() {},
					value : function(target, obj) {
						$(target).attr("name").replace(/(.*?)rsurl/i, function($0, $1) {
							$("input[name="+$1+"rsurl]").val(obj.path + obj.fileName);
							$("input[name="+$1+"Rsurl]").val(obj.path + obj.fileName);
							$("input[name="+$1+"rsid]").val(obj.id);
							$("input[name="+$1+"Rsid]").val(obj.id);
							$("input[name="+$1+"fileSize]").val(obj.fileSize);
							$("input[name="+$1+"fileTypeId]").val(obj.rsFileType.id);
						});
					},
					list : function(target, obj) {
						var html = "<div id='attach_@id'><span>@name</span>&nbsp;<a href='#none' onclick=\"jQuery('#@uid').removeAttach(@id, '@language')\">删除</a></div>";
						html = html.replace(/@id/g, obj.id).replace(/@name/g, obj.name).replace(/@uid/g, target.id).replace(/@language/g, obj.language);
						jQuery(target).before(html);
					},
					onProgress	: function(event, queueID, fileObj, data) {
						if(data.percentage == 100) {
							$("#" + event.currentTarget.id + queueID + " .percentage").text(' - 服务器正在保存,请稍候...');
							$("#" + event.currentTarget.id + queueID + "ProgressBar").css("width", '100%');
							return false;
						}
					},
					onComplete  : function(event, queueID, fileObj, response, data) {
						var result = {};
						try {
							result = eval("(" + response + ")")[0];
						} catch(e) {
							result.msg = "服务器发生错误！";
						}
						
						if(result.message_code === 1) {
							var o = event.currentTarget;
							var settings = $(o).data('settings');
							
							var front = o.id.replace(/\./g, "_").replace('upload', '');
							
							var exeSolution = true;
							
							if(typeof window[front + "Complete"] == "function") {
								exeSolution = window[front + "Complete"](result.o, result.url);
							} else if(typeof window.uploadComplete == "function") {
								exeSolution = window.uploadComplete(o, result.o, result.url);
							} 
							
							if(exeSolution !== false && (typeof settings[settings.solution] == "function")) {
								settings[settings.solution](o, result.data);
							}
						} else {
							alert(fileObj.name + "上传失败,请重试。如果多次重试仍然失败，请与管理员联系！");
						}
					},
					onOpen		: function(event, queueId, fileObj) {
						window.onbeforeunload = function() {
							return "正在上传附件，您确定要离开当前页面吗？";
						}
					},
					onSelect    : function(event, queueID, fileObj) {
						var o = $(event.currentTarget);
						
						if(typeof window[o[0].id.replace(/\./g, "_") + "Before"] == 'function') {
							if(window[o[0].id.replace(/\./g, "_") + "Before"](o) === false) {
								$.uploadifyCancel(queueID);
							}
						}
					}
				};
			
				$.extend(settings, options);
				if(this[0].className) {
					try {
						var custom = this[0].className.match(/\{\w+\s*:\s*.+(,\w+\s*:\s*.+)*\}/);
						if(custom != null) {
							custom = eval("(" + custom[0] + ")");
							$.extend(true, settings, custom);
						}
					} catch(o) {}
				}
				
				$.extend(settings.scriptData, settings.data);
				this.uploadify(settings);
			}
		});
		
		
		$.extend($.fn, {
			removeAttach : function(id, language) {
				var settings = $(this).data('settings');
				$.getJSON(settings.deleteURL, {id : id, data_locale : language}, function(rs) {
					rs = rs[0];
					if(rs.message_code > 0) {
						$('#attach_' + id).remove();
					} else {
						alert("删除失败，原因可能是：" + rs.message);
					}
				});
			},
			loadStore : function() {
				var opts = this._defaults;
				var audobj = this;
				jQuery.ajax({
					url		: opts.loadURL,
					data	: encode(opts.data),
					success	: function(response) {
						var result = eval(response)[0];
						if(result.state > 0) {
							for(var i=0; i< result.obj.length; i++) {
								result.obj[i].url = opts.rsBaseURL + result.obj[i].rsurl;//资源绝对路径
								if(eval("typeof(" + opts.obj.id.replace(/\./g, "_") + "Complete) == 'function'")) {
									eval(opts.obj.id.replace(/\./g, "_") + "Complete(opts.obj, result.obj[i], opts)");
								} else if(typeof(audobj[opts.solution]) == "function") {
									audobj[opts.solution](opts.obj, result.obj[i]);
								}
							}
						}
					}
				});
			},
			value : function(target, obj) {
				var rs_front = $(target).attr("name").replace("_rsurl", "");
				jQuery("input[name="+rs_front+"_rsurl]").val(obj.path + obj.fileName);
				jQuery("input[name="+rs_front+"_rsid]").val(obj.id);
				jQuery("input[name="+rs_front+"_rssize]").val(obj.fileSize);
				jQuery("input[name="+rs_front+"_rstype]").val(obj.type);
			},
			list : function(target, obj) {
				var html = "<div id='div_"+obj.id+"'><span ondblclick=\"AdjunctUpload.rename(this, "+obj.id+", '"+obj.language+"', '"+this._defaults.uploadURL+"', '"+this._defaults.createTempToken+"');\">" + obj.name +"</span>&nbsp;<a href='#none' onclick=\"AdjunctUpload.remove(jQuery('#div_"+obj.id+"')[0],"+obj.id+",'"+obj.language+"','"+this._defaults.delURL+"');\">删除</a></div>";
				if(this._defaults.containerID)
					jQuery("#" + this._defaults.containerID).append(html);
				else {
					jQuery(target).before(html);
				}
			}
		});
	}		
)(jQuery);