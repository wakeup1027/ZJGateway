/*!
 * fdi file tool JavaScript Library v1.0.0
 * http://fdiworldexpo.com/
 *
 * Copyright 2013, wxw
 * Date: 2013.11.29
 */

(function(window, undefined){
	var document = window.document,
		navigator = window.navigator,
		location = window.location;
	
	var check_file_value_upload = "";
	var fileTypeId = "";
	
	var currentUploadBtnId = "";
	
	var maxSize = 100;//单个文件的最大限制，单位为MB
	
	var fileTool = {
	
		/**
		 * 单个文件上传
		 * @param {Object} baseURL 当前服务器URL
		 * @param {Object} staticURL 静态资源服务器URL
		 * @param {Object} uploadId 上传（按钮）ID
		 * @param {Object} config 配置
		 * @param {Object} callFun 回调函数
		 * @return {TypeName}
		 */
		initSingleUploader: function(baseURL, staticURL, uploadId, config, callFun){
		   	try{
		   		var defaultConfig = fileTool._getConfig(baseURL, staticURL, uploadId, callFun);
		   		var newConfig = $.extend(true, {}, defaultConfig, config, {
			   		auto: true,//设置自动上传为true
			   		multi: false//设置多文件上传为false
		   		});
	   			$("#" + uploadId).uploadify(newConfig);
			}catch(ex){}
		},
		
		/**
		 * 多个文件上传
		 * @param {Object} baseURL 当前服务器URL
		 * @param {Object} staticURL 静态资源服务器URL
		 * @param {Object} uploadId 上传（按钮）ID
		 * @param {Object} config 配置
		 * @param {Object} callFun 回调函数
		 * @return {TypeName}
		 */
		initBatchUploader: function(baseURL, staticURL, uploadId, config, callFun, allCompleteFun){
			var dialog;
			try{
		   		var defaultConfig = fileTool._getConfig(baseURL, staticURL, uploadId, callFun);
		   		var newConfig = $.extend(true, {}, defaultConfig, config, {
			   		auto: false,//设置自动上传为false
			   		multi: true,//设置多文件上传为true
			   		queueID: "fileQueue",//设置批量选择文件时存放位置的ID
			   		onAllComplete: function(event, data) {
			   			if(allCompleteFun == null){
				   			art.dialog({
							    icon: 'succeed',
							    lock: true,
								opacity: 0.1,// 透明度
							    content: "上传成功！",
							    ok: function () {
									dialog.close();
							    }
							});
						}else{
							allCompleteFun(event, data);
						}
			   		}
		   		});
			
				//绑定按扭点击
				$("#" + uploadId).click(function (e) {
					var panel_html = "<div class=\"upload-content\" style=\"width: 480px;\">" +
							"<div>" +
								"<div style=\"margin-right:10px;margin-bottom:10px;\">" +
									"<input type=\"file\" name=\"uploadify\" id=\"uploadify\" />" +
									"<span style=\"color: gray;\">（上传单个文件不大于" + maxSize + "M）</span>" +
								"</div>" +
								"<div class=\"clear\"></div>" +
							"</div>" +
							"<div id=\"fileQueue\" style=\"width: 467px;height: 280px; overflow-y: auto; overflow-x: hidden; border: 1px solid #ccc;padding-left: 5px;padding-right: 5px;\"></div>" +
							"<div class=\"content-menu ib-a blue line-x\" style=\"margin-top:10px;text-align: center;\">" +
								"<input type=\"button\" class=\"pure-button\" onclick=\"javascript:$('#uploadify').uploadifyUpload();\" name=\"uploadBtn\" value=\"上传\" id=\"saveBtn\" style=\"width: 70px;\" />" +
								"&nbsp;&nbsp;&nbsp;&nbsp;" +
								"<a class=\"\" href=\"javascript:$('#uploadify').uploadifyClearQueue();\">清空列表</a>" +
								"&nbsp;&nbsp;&nbsp;&nbsp;" +
								"<a class=\"\" href=\"javascript:art.dialog.get('fileListPanel').close();void(0);\">关闭</a>" +
							"</div>" +
						"</div>";
					dialog = art.dialog({
						id: 'fileListPanel',
						title: '上传文件',
						content: panel_html,//$(".upload-content").get(0),
						lock: true,
						opacity: 0.3,// 透明度
						width: 500,
						height: 374,
						padding: '5px 5px 5px 5px'
					});
		   			$("#uploadify").uploadify(newConfig);
				});
			}catch(ex){}
		},
		
		//获取配置
		_getConfig: function(baseURL, staticURL, uploadId, callFun){
			try{
		   		var defaultConfig = {
					uploader: staticURL + '/public/tags/uploadify2.1.4/uploadify.swf',
					cancelImg: staticURL + '/public/tags/uploadify2.1.4/cancel.png',
					buttonImg: staticURL + '/public/tags/uploadify2.1.4/upload.gif',
					script: baseURL + '/code/upload.do',
					fileDataName: 'data',
					height: 27,
					width: 102,
					sizeLimit : 1024*1024*maxSize,
					scriptAccess: 'always',
					fileDesc: $("#" + uploadId).attr("fileDesc"),
					fileExt: $("#" + uploadId).attr("fileExt"),
					onComplete: function(event, ID, fileObj, response, data) {
						try {
							var rs = eval("("+response+")");
							callFun(rs.data);
						} catch(e) {
							var rs = {message_code : -1};
						}
					},
					onSelect: function(e, queueId, fileObj) {
						if( fileObj.size > 1024*1024*maxSize ) {
							art.dialog({
								icon: 'error',
								content: "对不起,您上传的文件超过限制的容量大小(" + maxSize + "M)",//$(".upload-content").get(0),
								lock: true,
								opacity: 0.3// 透明度
							});
							//alert("对不起,您上传的文件超过限制的容量大小(" + maxSize + "M)");
							return false;
						}
						return true;
					}
				};
		   		return defaultConfig;//$.extend(true, {}, defaultConfig, config);
			}catch(ex){}
		}
	};
	
	window.fileTool = fileTool;
	
})(window);



