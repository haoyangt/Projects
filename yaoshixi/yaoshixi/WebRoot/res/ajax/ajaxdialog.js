function commentDialog(obj)
{
	var msgDialog = art.dialog({
		title:'消息',
		show:false
	});
	var contentDialog = art.dialog({
		title:$(obj).attr("title"),
		show:false,
		lock:true,
		opacity:0.3,
		ok:function(){
			msgDialog.time(1).content("submint success").show();
		},
		okVal:'提交',
		cancel:true,
		cancelVal:'取消'
	});
	$.ajax({
		url:$(obj).attr("contentUrl"),
		type:'post',
		success:function(html){
			contentDialog.show().content(html);
		}
	});
	
}

function comfirmDialog(obj)
{
	var msgDialog = art.dialog({
		title:'消息',
		show:false
	});
	
	var content = $(obj).attr("showContent");
	var comfirmDialog = art.dialog({
		title:'提示',
		content:content,
		lock:true,
		opacity:0.3,
		ok:function(){
			msgDialog.time(1).content($(obj).attr("success")).show();
		},
		okVal:'确定',
		cancel:true,
		cancelVal:'取消'
	});
}

/**
 * ajax 提交form表单，返回json
 * 成功后执行 actionFun , nextActionFun
 */
function ajaxForm(form, actionFun, nextActionFun)
{
	//alert(form + "***" + actionFun + "***" + mFun);
	$.ajax({
		type:'post',
		url:$(form).attr("action"),
		dataType:'json',
		data:$(form).serialize(),
		success:function(json){

			if(json.message!=undefined){
				alert(json.message);
			}
			
			if(json.statusCode == 200)
			{
				//重置表单
				
				$(form).find("input[type=reset]").click();
				if(actionFun != undefined && $.isFunction(actionFun)){
					if(nextActionFun != undefined && $.isFunction(nextActionFun))
					{
						actionFun(form, nextActionFun);
					}else
					{
						actionFun(json);
					}
				}
			}
		},
		error:function(){
			alert("请检查网络后重试");
		}
	});
	return false;
}

function ajaxFormAndChangeStatus(form, actionFun, mFun)
{
	$.ajax({
		type:'post',
		url:$(form).attr("action"),
		dataType:'json',
		data:$(form).serialize(),
		success:function(json){
			if(json.statusCode == 200)
			{
				alert("处理成功");
				if(actionFun != undefined && $.isFunction(actionFun)){
					actionFun(form, mFun);
				}
			}
		},
		error:function(){
			alert("请检查网络后重试");
		}
	});
	return false;
}
/**
 * ajax 提交form表单，返回html
 */
function ajaxFormForHtml(form, targetId)
{
	$.ajax({
		type:'post',
		url:$(form).attr("action"),
		data:$(form).serialize(),
		success:function(html){
			$("#" + targetId).html(html);
		},
		error:function(){
			alert("请检查网络后重试");
		}
	});
	return false;
}



/**
 * ajax载入一个页面到target中
 * 有下拉的动画
 * @param url
 * @param target
 */
function ajaxLoadPage(url, target)
{
	$.ajax({
		type:'post',
		url:url,
		success:function(html){
			$(target).html(html);
			slideDownDiv($(target));
		},
		error:function(){
			alert("网络故障，请稍后重试");
		}
	});
}


/**
 * ajax载入一个页面到target中
 * @param url
 * @param target
 */
function loadPage(url, targetId)
{
	//alert(target);
	var target = $("#"+targetId);
	//alert(target.attr("id"));
	$.ajax({
		type:'post',
		url:url,
		success:function(html){
			$(target).html(html);
			$(target).show();
		},
		error:function(){
			alert("网络故障，请稍后重试");
		}
	});
}


/**
 * ajax载入一个页面到targetObj中   targetObj为 jquery对象
 * @param url
 * @param target
 */
function loadPageToObj(url, targetObj)
{
	//alert(target);
	var target = $(targetObj);
	//alert(target.attr("id"));
	$.ajax({
		type:'post',
		url:url,
		success:function(html){
			$(target).html(html);
			$(target).show();
		},
		error:function(){
			alert("网络故障，请稍后重试");
		}
	});
}


/**
 * ajax请求下拉列表内容
 * @param obj
 */
function ajaxToSelect(obj)
{
	var options = $(obj).find("option");
	
	if(options.length > 1)
	{
		//第二次点击，不重新请求数据
		return;
	}
	
	//ajax请求下拉选项
	$.ajax({
		type:'post',
		url:$(obj).attr('href'),
		dataType:'json',
		success:function(jsons){
			for(var i = 0; i < jsons.length; i++)
			{
				$(obj).append("<option value=\""+jsons[i].dictId+"\">"+jsons[i].dictName+"</option>");
			}
		},
		error:function(){
			alert("请检查网络后重试");
		}
	});
}


/**
 * 将div下拉出现
 * @param obj
 */
function slideDownDiv(slideCon)
{
	$(slideCon).css("display", "block");
	$(slideCon).css("height", "auto");
	var totalH = $(slideCon).css("height");
	totalH = parseInt(totalH.substring(0, totalH.length - 2));
	$(slideCon).css("height", "0px");
	var slider = {
			height:0,
			t:null,
			myTimer:function(){
				var height = this.height;
				var t = setInterval(function(){
					height += 2;
					if (totalH > height) {
						$(slideCon).css("height", height + 10 + "px");
					} else {
						clearInterval(t);
					}
				}, 10);
			}
	};
	slider.myTimer();
}

/**
 * 将包含obj的可下拉div收起
 * @param obj
 */
function slideUpDivHavingObj(obj, actionFun)
{
	var slideCon = $(obj).parent(".box_content").filter(":first");
	
	slideUpDiv(slideCon, actionFun);
}

/**
 * 将DIV滑动收起
 * @param slideCon
 */
function slideUpDiv(slideCon, actionFun){
	slideCon = $(slideCon);
	var height = $(slideCon).css('height');
	height = parseInt(height.substring(0, height.length - 2));
	var test = {
		height:height,
		t:null,
		mYtimer:function(){
			height = this.height;
			var t = setInterval(function(){
				if(height <= 0)
				{
					$(slideCon).css("display", "none");
					clearInterval(t);
					if($.isFunction(actionFun))
					{
						actionFun(slideCon);
					}
				}else{
					height = height - 10;
					$(slideCon).css('height', height + "px");
				}
			}, 10);
		}
	};
	test.mYtimer();
}


function updateTarget(obj)
{
	
}

/**
 * 删除一个节点
 * @param obj
 * @param targetClass
 * @param isSlideUp
 */
function deleteTarget(obj, targetClass, isSlideUp)
{
	if(isSlideUp == true)
	{
		//先收起下拉 div
		slideUpDivHavingObj(obj);
	}
	//删除目标Div
	var expandableBox = $(obj).parent(".expandable_box:first");
	var targetBox = expandableBox;
	if(targetClass != undefined)
	{
		targetBox = getParentNodeByClass(expandableBox, targetClass);
	}
	targetBox.remove();
}

/**
 * 获取node所有父节点中 类名为className的第一个 node
 * @param node
 * @param className
 * @returns
 */
function getParentNodeByClass(node, className)
{
	var classNames = $(node).attr("class");
	if(classNames == undefined || classNames == "")
	{
		node = $(node).parent();
		return getParentNodeByClass(node, className);
	}
	var classArr = classNames.split(" ");
	for(var i = 0; i < classArr.length; i++)
	{
		if($.trim(classArr[i]) == className)
		{
			return node;
		}
	}
	node = $(node).parent();
	return getParentNodeByClass(node, className);
}

