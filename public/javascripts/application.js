(function($) {
	$(document).ready(function(){

		$("#new_message").submit(function() {
			var form = $(this);
			var url = form.attr("action");
			var data = form.serialize();
			var callback = function(data, textStatus){ 
				if (data.errors == undefined) { 
					$("#message_body").val("");
					$("#message_body").focus();
				} else {
					$("#conversation ul").append("<li class='error'>** an error occurred **</li>");
				};
			};
			$.post(url, data, callback, "json");
			return false;
		});

	});
})(jQuery);
