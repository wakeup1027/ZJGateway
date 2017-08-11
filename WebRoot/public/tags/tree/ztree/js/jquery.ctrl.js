/*
 * Copyright (c) 2012 wxw (http://brandonaaron.net)
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php) 
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 *
 * $LastChangedDate: 2007-07-21 18:44:59 -0500 (Sat, 21 Jul 2007) $
 * $Rev: 2446 $
 *
 * Version 2.1.1
 */

/**
 * @name ctrl
 * @type jQuery
 * @cat Plugins/ctrl
 * @author wxw
 */
(function($){
	
	jQuery.fn.ctrl = function(targetId) {
		var _seft = this;
		var targetId = $(targetId);
		
		this.click(function(){
			var A_top = $(this).offset().top + $(this).outerHeight(true);  //  1
			var A_left =  $(this).offset().left;
			//targetId.bgiframe();
			targetId.show().css({"position":"absolute","top":A_top+"px" ,"left":A_left+"px"});
		});
		
		targetId.find("#select_close").click(function(){
			targetId.hide();
		});
		
//		targetId.find(".1select-confirm").click(function(){		
//			targetId.find(":radio").attr("selected",false);
//			_seft.val( $(this).val() );
//			targetId.hide();
//		});
		
		$(document).click(function(event){
			if(event.target.id!=_seft.selector.substring(1)){
				targetId.hide();
			}
		});
		
		targetId.click(function(e){
			e.stopPropagation(); //  2
		});
		
	    return this;
	};
	
})(jQuery);