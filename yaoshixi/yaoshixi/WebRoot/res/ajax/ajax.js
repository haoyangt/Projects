$.extend({
	ajaxForHtml: function(url, data, callBack){
		alert("come in");
		$.ajax({
			type: "post",
			url: url,
			data:data,
			dataType: "html",
			success: callBack
		});	
	},
	ajaxForJson: function(url, data, callBack){
		alert("come in ajax");
		$.ajax({
			type: "post",
			url: url,
			data:data,
			dataType: "json",
			success: callBack
		});	
	}
});
