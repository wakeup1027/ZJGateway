
/**
 * 封装的一个JQuery小插件:合并单元格
 * 用法：$("#table1").rowspan(0);0表示表格id为table1的列的下标
 * 注：经测试速度太慢，强烈建议不要使用！！！
 */
jQuery.fn.rowspan = function (colIdx) {
	return this.each(function () {
		var that;
		$("tr", this).each(function (row) {
			$("td:eq(" + colIdx + ")", this).filter(":visible").each(function (col) {
				if (that != null && $(this).html() == $(that).html()) {
					rowspan = $(that).attr("rowSpan");
					if (rowspan == undefined) {
						$(that).attr("rowSpan", 1);
						rowspan = $(that).attr("rowSpan");
					}
					rowspan = Number(rowspan) + 1;
					$(that).attr("rowSpan", rowspan);
					$(this).hide();
				} else {
					that = this;
				}
			});
		});
	});
};


