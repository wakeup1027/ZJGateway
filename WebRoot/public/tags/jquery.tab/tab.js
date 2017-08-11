
/*
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script>
*/
$(document).ready(function () {
	$("#tabscontent").find("[id^='tab']").hide(); // Hide all content
	$("#tabs li:first").attr("id", "current"); // Activate the first tab
	$("#tabscontent #tab1").fadeIn(); // Show first tab's content
	$("#tabs a").click(function (e) {
		e.preventDefault();
		if ($(this).closest("li").attr("id") == "current") { //detection for current tab
			return;
		} else {
			$("#tabscontent").find("[id^='tab']").hide(); // Hide all content
			$("#tabs li").attr("id", ""); //Reset id's
			$(this).parent().attr("id", "current"); // Activate this
			$("#" + $(this).attr("name")).fadeIn(); // Show content for the current tab
		}
	});
});
/*
</script>
*/

