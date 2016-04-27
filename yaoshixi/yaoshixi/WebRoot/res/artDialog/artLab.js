//var artLab = (function(){

//	
//	return dialog;
//})();
define(['res/artDialog/dialog'], function(dialog){
	/*
	 * 消息提示框
	 */
	var msg = function(content) {
		var d = dialog({
		    content: content
		});
		d.show();
		setTimeout(function () {
		    d.close().remove();
		}, 2000);
	};
	
	/**
	 * 
	 */
	
	
	return {msg:msg, dialog:dialog}; 
});