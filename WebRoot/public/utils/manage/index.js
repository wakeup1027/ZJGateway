function ChangeTopMenu(topMenu, leftMenu) {
	$('.top_menu').removeClass('on');
	$("#" + topMenu).addClass('on');
    
	$('#current_pos').text($(this).text());
    
    $('#leftMain').load('index!menu.do', {
	 appCode : topMenu.replace('_M_', '')
	 }, function() {
	     $('.sub_menu').removeClass('on fb blue');
		 $("#" + leftMenu).addClass("on fb blue");
	 });
    
    
	
	$("#openClose").data('clicknum', 1);
	$("#openClose").click();
	$('#display_center_id').hide();
	var _pos = $('.top_menu.on').text();
	_pos = _pos + '>' + $("#" + leftMenu).parent().prev().text();
	_pos = _pos + '>' + $("#" + leftMenu).text();

	$('#current_pos').text(_pos);
	$("#current_pos").data('clicknum', 1);
	$('#display_center_id').hide();
	
}

function selectedColumn() {
	
	///return $("#center_frame")[0].contentWindow.selectNodeId();
}

function selectedFisrt() {
	///$("#center_frame")[0].contentWindow.selectNode();
}

function menuScroll(num) {

	var Scroll = document.getElementById('Scroll');

	if (num == 1) {

		Scroll.scrollTop = Scroll.scrollTop - 60;

	} else {

		Scroll.scrollTop = Scroll.scrollTop + 60;

	}

}

function _MP(menuid, targetUrl) {

	$("#menuid").val(menuid);

	$("#paneladd").html('<a class="panel-add" href="javascript:add_panel();"><em>添加</em></a>');

	$("#rightMain").attr('src',targetUrl + '&menuid=' + menuid + '&pc_hash=' + pc_hash);

	$('.sub_menu').removeClass("on fb blue");

	$('#_MP' + menuid).addClass("on fb blue");

	$.get("?m=admin&c=index&a=public_current_pos&menuid=" + menuid, function(data) {
		$("#current_pos").html(data + '<span id="current_pos_attr"></span>');
	});

	$("#current_pos").data('clicknum', 1);

	show_help(targetUrl);

}

function wSize() {

	//这是一字符串

	var str = getWindowSize();

	var strs = new Array(); //定义一数组

	strs = str.toString().split(","); //字符分割

	var heights = strs[0] - 120, Body = $('body');
	$('#rightMain').height(heights);

	//iframe.height = strs[0]-46;

	if (strs[1] < 980) {

		$('.header').css('width', 980 + 'px');

		$('#content').css('width', 980 + 'px');

		Body.attr('scroll', '');

		Body.removeClass('objbody');

	} else {

		$('.header').css('width', 'auto');

		$('#content').css('width', 'auto');

		Body.attr('scroll', 'no');

		Body.addClass('objbody');

	}

	var openClose = $("#rightMain").height() + 39;

	$('#center_frame').height(openClose + 9);

	$("#openClose").height(openClose + 30);

	$("#Scroll").height(openClose - 30);

	windowW();

}

function windowW() {

	if ($('#Scroll').height() < $("#leftMain").height()) {

		$(".scroll").show();

	} else {

		$(".scroll").hide();

	}

}

var _onload = function() {
	if (!+"\v1" && !document.querySelector) { // for IE6 IE7
		document.body.onresize = resize;
	} else {
		window.onresize = resize;
	}

	function resize() {

		wSize();

		return false;

	}

}

var getWindowSize = function() {
	var height = $(window).height();
	var width = $(window).width();
	return height + "," + width;
	//return [ "Height", "Width" ].map(function(name) {
		//return window["inner" + name] || document.compatMode === "CSS1Compat" && document.documentElement["client" + name] || document.body["client" + name]
	//});
}

$(document).ready(function($) {

	//左侧开关
	$("#openClose").click(function() {
          var _clicknum = $(this).data('clicknum');
            if( _clicknum == '-1' ){
            	
            	$(".left_menu").addClass("left_menu_on");

            	$(this).removeClass();
            	
				$(this).addClass("HOME");

				$("html").addClass("on");

				$(this).data('clicknum', 100);

				$(".scroll").hide();
            }
			else if ( _clicknum == 1) {

				$("html").removeClass("on");

				$(".left_menu").removeClass("left_menu_on");

				$(this).removeClass();
				
				$(this).addClass("open");

				$(this).data('clicknum', 0);

				$(".scroll").show();

			} else if(_clicknum == 0){

				$(".left_menu").addClass("left_menu_on");

				$(this).removeClass();
				
				$(this).addClass("open close");

				$("html").addClass("on");

				$(this).data('clicknum', 1);

				$(".scroll").hide();

			}

			return false;

		});

	
	$('.top_menu').click(function() {
		
		$('#display_center_id').hide();
		
		$('.top_menu').removeClass('on');
		$(this).addClass('on');

		$('#current_pos').text($(this).text());
         
		$('#leftMain').load('index!menu.do', {
			   appCode : this.id.replace('_M_', '')
			}, function() {
				$('.sub_menu').first().addClass("on fb blue");
		  });
		
		if($("#openClose").data('clicknum')){
			$("#rightMain").attr("src",'');
		}
		
		if(this.id.replace('_M_', '') == 'HOME'){
		   $("#openClose").data('clicknum', '-1');
		}else{
			$("#openClose").data('clicknum', 1);
		}
		
		$("#openClose").click();
		
	}).first().click();

	$('#leftMain').delegate('.switchs', 'click', function() {
		var _self = $(this);
		_self.toggleClass('on');

		if (_self.hasClass('on')) {
			_self.parent().next().show();
		} else {
			_self.parent().next().hide();
		}
		$('#display_center_id').hide();
	});

	$('#leftMain').delegate('.sub_menu', 'click', function() {
		var _self = $(this);
		$('.sub_menu').removeClass('on fb blue');
		_self.addClass('on fb blue');

		var _pos = $('.top_menu.on').text();
		_pos = _pos + '>' + _self.parent().prev().text();
		_pos = _pos + '>' + _self.text();

		$('#current_pos').text(_pos);
		$("#current_pos").data('clicknum', 1);
		$('#display_center_id').hide();

	});

	$('#leftMain').delegate('.colum', 'click', function() {
		$('#display_center_id').show();
	});

	
		var addEvent = (function() {

			if (window.addEventListener) {

				return function(el, sType, fn, capture) {

					el.addEventListener(sType, fn, (capture));

				};

			} else if (window.attachEvent) {

				return function(el, sType, fn, capture) {

					el.attachEvent("on" + sType, fn);

				};

			} else {

				return function() {
				};

			}

		})(),

		Scroll = document.getElementById('Scroll');

		// IE6/IE7/IE8/Opera 10+/Safari5+

		addEvent(Scroll, 'mousewheel', function(event) {

			event = window.event || event;

			if (event.wheelDelta <= 0 || event.detail > 0) {

				Scroll.scrollTop = Scroll.scrollTop + 29;

			} else {

				Scroll.scrollTop = Scroll.scrollTop - 29;

			}

		}, false);

		// Firefox 3.5+

		addEvent(Scroll, 'DOMMouseScroll', function(event) {

			event = window.event || event;

			if (event.wheelDelta <= 0 || event.detail > 0) {

				Scroll.scrollTop = Scroll.scrollTop + 29;

			} else {

				Scroll.scrollTop = Scroll.scrollTop - 29;

			}

		}, false);

		
		if (!Array.prototype.map) {

			Array.prototype.map = function(fn, scope) {

				var result = [], ri = 0;

				for ( var i = 0, n = this.length; i < n; i++) {

					if (i in this) {

						result[ri++] = fn.call(scope, this[i], i, this);

					}

				}

				return result;

			};
		}
		
    
		_onload();
		
		wSize();

		windowW();
		
		

	});
