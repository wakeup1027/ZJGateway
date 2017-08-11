(function($){
		  
    $.fn.extend({
		  
		  /**
		   * 给表格增加样式
		   */
		  table_addClass : function(){
    	    $('.mytable tbody tr:even').removeClass('md-bj');
    	   // $('.mytable tbody tr').hover(function() {$(this).addClass('md-bj');},function() { $(this).removeClass('md-bj'); });
    	    // 如果复选框默认情况下是选择的，变色.
    	   //	$('.mytable input[type="checkbox"]:checked').parents('tr').addClass('t4');
		  }
		  

	});
    
    $(function() {
    	
    	$.fn.table_addClass();
    	
    	// 复选框
		$('.mytable tbody tr').live('click',function() {
			   if ($(this).hasClass('t4')&& !$(this).find('input[type="checkbox"]').attr('disabled')) {
					$(this).removeClass('t4');
					$(this).find('input[type="checkbox"]').removeAttr('checked');
				} else if(!$(this).find('input[type="checkbox"]').attr('disabled')) {
					$(this).addClass('t4');
					$(this).find('input[type="checkbox"]').attr('checked','checked');
				}
			});
    });
})(jQuery);

