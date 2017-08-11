(function(K, undefined) {
	var _System = {}, t = document.getElementsByTagName("SCRIPT");;
	
	t=(_System.scriptElement=t[t.length-1]).src.replace(/\\/g, "/").split('?');
	_System.path=(t[0].lastIndexOf("/")<0)?".":t[0].substring(0, t[0].lastIndexOf("/"));
	
	_System.params = (function(p) {
		if(!p) return {};
	
		var paramsArr=p.split('&');
		var args={},argsStr=[],param,t,name,value;
		for(var ii=0,len=paramsArr.length;ii<len;ii++){
	        param=paramsArr[ii].split('=');
	        name=param[0],value=param[1];
	        if(typeof args[name]=="undefined"){ //�����в�����
	            args[name]=value;
	        }else if(typeof args[name]=="string"){ //�����Ѿ������򱣴�Ϊ����
	            args[name]=[args[name]]
	            args[name].push(value);
	        }else{  //�Ѿ��������
	            args[name].push(value);
	        }
	    }
		return args;
	})(t[1]);
	
	K.lang({
		'autoformat'	: '自动排版',
		'tool'			: '工具'
	});
	
	K.system = _System;
	
	K.build = function(target, opts) {
		if(typeof target === "string") {
			target = K('#' + target);
		}
		
		var IRegExp = function(regx, args) {
			if(!regx || regx.length == 0) {
				return null;			
			}
			
			var meta = /([\$|\{|\}|\.|\\|\/])/g;
			regx = regx.replace(meta, function($0) {
				return "\\" + $0;
			});
			return new RegExp(regx, args);
		};
		
		var settings = {
        	items			: [
			'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
        'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
         'table', 'hr', 'emoticons', 'map', 'code', 'pagebreak',
        'link', 'unlink', '|', 'about'
 ],
			filterMode		: true,
			uploadJson		: '',
			afterCreate		: function() {
				var reDM = new IRegExp(_System.params.rs_domain_holder, "ig");
				this.html(this.html().replace(reDM, _System.params.rs_domain));
				
			},
			afterSetHtml	: function() {
				//将图片资源的域名作标记以保存到数据库
				this.edit.textarea.val(this.edit.textarea.val().replace(new IRegExp(_System.params.rs_domain, "ig"), _System.params.rs_domain_holder));
			}
		};
		
		K.each(opts, function(k, v) {
			settings[k] = v;
		});
		
		K.g = K.g || {};
		
		K.g[target.id] = K.create(target,settings);
	};
	
	K.addParam = function(url, param) {
		if("object" === typeof param) {
			var args = [];
			K.each(param, function(k, v) {
				args[args.length] = encodeURIComponent( k ) + "=" + encodeURIComponent( v );
			});
			
			param = args.join("&");
			
		}
		
		return url.indexOf('?') >= 0 ? url + '&' + param : url + '?' + param;
	}
})(KindEditor);