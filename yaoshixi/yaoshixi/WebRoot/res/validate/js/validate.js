/**
 *插件依赖
 * js依赖       jquery1.7.1.js
 * css依赖    validate.css
 * 用法
 * //初始化
 * validateUtil.init(form);
 * //表单验证 成功返回false 失败返回true
 * var flag = validateUtil.validateForm(form); 
 */
var validateUtil = {
	init:function($form,divId){
		//input
		$("input[validate], input[funValidate]",$form).blur(function(e){
			validateUtil._validate($(this));
	      }
	    ).each(function(){
    		$(this).addClass("required");
	    });
		/*$("input[validate], input[funValidate]",$form).each(function(){
    		$(this).addClass("required");
	    });*/
	    //textarea
		$("textarea[validate], textarea[funValidate]",$form).blur(function(e){
			validateUtil._validate($(this));
	      }
	    ).each(function(){
    		$(this).addClass("required");
	    });
		/*$("textarea[validate], textarea[funValidate]",$form).each(function(){
    		$(this).addClass("required");
	    });*/
	    $(divId).scroll(function(){
	    	validateUtil._hideTips();
	    });
	},
	validateForm:function($form){
		var flag = true;
		//移除所有
		validateUtil._removeTips();
		$("input[validate], input[funValidate], textarea[validate], textarea[funValidate], select[funValidate], select[validate]",$form).each(function(){
			var that = $(this);
			var validate = validateUtil._validateFun(that);
			
			if(validate != false){
				validateUtil._error(that);
				if(flag){
					flag = false;
					validateUtil._tip(validate,that);
				}
			}else{
				validateUtil._success(that);
			}
		});
		return flag;
	},
	removeTips:function(){
		validateUtil._removeTips();
	},
	_validate:function(obj){
		//移除所有
		validateUtil._removeTips();
		var that = $(obj);
		//进行验证
		var flag = validateUtil._validateFun(obj);
		
		if(flag == false){//验证通过
			validateUtil._success(obj);
		}else{//验证不通过
			validateUtil._error(obj);
			validateUtil._tip(flag,obj);
		}
	},
	_validateFun:function(obj){
		
		var flag = false;
		var validate = $(obj).attr("validate");
		var regValidate = $(obj).attr("regValidate");
		var urlValidate = $(obj).attr("urlValidate");
		var funValidate = $(obj).attr("funValidate");
		var val = $(obj).val();
		if(validate){
			flag = validateUtil._validateNormal(obj,validate);
		}
		if(flag == false && regValidate){
			flag = validateUtil._validateNotNull(obj);
			if(flag == false){
				flag = validateUtil._validateReg(obj,regValidate);
			}
		}
		if(flag == false && urlValidate){
			flag = validateUtil._validateNotNull(obj);
			if(flag == false){
				flag = validateUtil._validateUrl(obj,urlValidate);
			}
		}
		if(flag == false && funValidate){
			flag = validateUtil._validateNotNull(obj);
			if(flag == false){
				flag = validateUtil._validateFunction(obj,funValidate);
			}
		}
		return flag;
	},
	_validateNotNull:function(obj){
		return validateUtil._validateNormal(obj,"true::请填写该字段");
	},
	_validateNormal:function(obj,validate){
		var val = $.trim($(obj).val());
	    var objs = validate.split(',');
	    for ( var iii = 0; iii < objs.length; iii++) {
	        var  keys = objs[iii].split(':');
	        var key = null; // minlength
	        var value = null; // 6
	        var tip = null;// 最小为6
	        var length = keys.length;
	        
	        if(length == 1){
	            key = keys[0];
	        }
	        if(length == 2){
	            key = keys[0];
	            value = keys[1];
	        }
	        if(length == 3){
	            key = keys[0];
	            value = keys[1];
	            tip = keys[2];
	        }
	        /*验证必填*/
	        if(key == true || 'true' == key || 'required' == key || 'require' == key){
	            if('' == val || val == null || undefined == val){
	                return tip||'请输入值';
	            } 
	        }
	        //最小长度
	        if('minlength' == key){
	            var min = value;
                if(val.length < min){
                    return tip||'长度至少为' + min;
                } 
	        }
	        //最大长度
	        if('maxlength' == key){
	            var max = value;
                if(val.length > max){
                    return tip||'长度最大为' + max;
                } 
	        }
	       //email
	        if('email' == key){
	            //var regTmp = new RegExp("^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$");
	        	var regTmp = new RegExp("^([0-9A-Za-z\\-_\\.]+)@([0-9a-z\-]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$");
                if(!regTmp.test(val)){
                    return tip||'邮件格式不正确';
                }
	        }
	        if('tel' == key){
	            var regTmp = new RegExp("^\\d+$");
                if(!regTmp.test(val)){
                    return tip||'电话格式不正确';
                }else if((val.length) != 11){
                	return '电话号码位数不正确';
                }
	        }
	        //最小值
	        if('min' == key){
                if(!validateUtil._isNumber(val)){
                    return tip||'请输入数字';
                }
                // 不管是证书还浮点数都以浮点数比较
                if(parseFloat(val) < parseFloat(value)){
                    return '最小为' + value;
                }
            }
            if('max' == key){
                if(!validateUtil._isNumber(val)){
                    return tip||'请输入数字';
                }
                // 不管是证书还浮点数都以浮点数比较
                if(parseFloat(val) > parseFloat(value)){
                    return tip||'最大为' + value;
                }
	        }
	        // 限定字符串长度
	        if('limitlength' == key){
	            var reg = '^.{' + value + '}$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入长度为' + value + '的字符串，当前长度为' + valLength;
		        }
	        }
	        // 验证整数[是数，但不一定全是数字如-1就不全是数字]
	        if('int' == key){
	        	var reg = '^-?\\d+$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入整数';
		        }
	        }
	        // 验证数字，全是数字，不能出现负号等
	        if('num' == key){
	        	var reg = '^[0-9]+$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入数字';
		        }
	        }
	        // 浮点数
	        if('float' == key){
	        	var reg = '^(-?\\d+)(\\.\\d+)?$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入小数';
		        }
	        }
	        // gtzeroint[大于0的整数,即非0正整数]、
	        if('gtzeroint' == key){
	        	var reg = '^\\+?[1-9][0-9]*$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入非0正整数';
		        }
	        }
	        // ltzeroint[小于0的负整数，即非零的负整数]
	        if('ltzeroint' == key){
	        	var reg = '^\\-[1-9][0-9]*$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入非0负整数';
		        }
	        }
	        // gezeroint[大于等于0的整数，即非负整数]、
	        if('gezeroint' == key){
	        	var reg = '^\\+?\\d+$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入非负整数';
		        }
	        }
	        // lezeroint[非正整数]、
	        if('lezeroint' == key){
	        	var reg = '^((-\\d+)|(0+))$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入非正整数';
		        }
	        }
	        // gezerofloat[非负浮点数即正浮点数 + 0]、
	        if('gezerofloat' == key){
	        	var reg = '^\\d+(\\.\\d+)?$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入非负浮点数';
		        }
	        }
	        // gtzerofloat[正浮点数,即大于0的浮点数]
	        if('gtzerofloat' == key){
	        	var reg = '^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*))$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入正浮点数';
		        }
	        }
	        // lezerofloat[非正浮点数，小于等于0的浮点数]、
	        if('lezerofloat' == key){
	        	var reg = '^((-\\d+(\\.\\d+)?)|(0+(\\.0+)?))$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入非正浮点数';
		        }
	        }
	        // ltzerofloat[负浮点数，即小于0的浮点数]
	        if('ltzerofloat' == key){
	        	var reg = '^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入负浮点数';
		        }
	        }
	        // 验证汉字
	        // {n,} n 是一个非负整数，至少匹配n 次。 
	        // {n,m} m 和 n 均为非负整数，其中n <= m。最少匹配 n 次且最多匹配 m 次。在逗号和两个数之间不能有空格。 */
	        // '^[\\u4e00-\\u9fa5]{1,3}$'    '^[\\u4e00-\\u9fa5]+{1,3}$'(后面的1,3无效)
	        if('chinese' == key){
	        	var reg = '^[\\u4e00-\\u9fa5]+$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入汉字';
		        }
	        }
	        // 验证字符A-Z a-z
	        if('character' == key){
	        	var reg = '^[A-Za-z]+$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入英文字符';
		        }
	        }
	        // char[数字和26个英文字母组成的字符串]
	        if('char' == key){
	        	var reg = '^[A-Za-z0-9]+$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入数字和26个英文字母组成的字符串';
		        }
	        }
	        // chardown[数字、26个英文字母或者下划线组成的字符串]
	        if('chardown' == key){
	        	var reg = '^\\w+$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能输入由数字、26个英文字母或者下划线组成的字符串';
		        }
	        }
	        // mounth[12个月份，如“01”-“09”和“1”“12”]
	        if('mounth' == key){
	        	var reg = '^(0?[1-9]|1[0-2])$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'您输入的月份不正确';
		        }
	        }
	        // 验证一个月的31天正确格式为：01、09和1、31。 
	        if('day' == key){
	        	var reg = '^((0?[1-9])|((1|2)[0-9])|30|31)$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'您输入的号数不正确';
		        }
	        }
	        // 验证安全的密码
	        if('password' == key){
	        	var reg = '^[a-zA-Z]\\w{5,17}$';
	            var valLength = val.length;
	            var tmpReg = new RegExp(reg);
		        var testRes = tmpReg.test(val) ;
		        if(!testRes){
		            return tip||'只能以字母开头，长度在6-18之间，只能包含字符、数字和下划线';
		        }else if(value){
		        	if(val != $(value).val()){
		        		 return tip||'两次验证密码不相同';
		        	}
		        }
	        }
	    }
	    return false;
	},
	_validateReg:function(obj,validate){
		var flag = false;
		var reg = new RegExp(validate);
	    var objValue = $(obj).val();
	    var tips = $(obj).attr("tips");
	    if(!reg.test(objValue)){
	       flag = tips || "验证失败";
	    }
	    return flag;
	},
	_validateUrl:function(obj,validate){
		var flag = false;
		var val = $(obj).val();
		var name = $(obj).attr("name");
		$.ajax({
			type: 'POST',
			url:validate,
			data:[{name:name,value:val}],
			dataType:"json",
			cache: false,
			success: function(json){
				if(json.statusCode != 200){
					flag = json.message;
					validateUtil._error(obj);
					validateUtil._tip(flag,obj);
				}else{
					validateUtil._success(obj);
				}
			},
			error: function(){
				alert("网络出现故障，请稍后重试。");
			}
		});
		return flag;
	},
	_validateFunction:function(obj,validate){
		var flag = eval(validate);
		return flag || false;
	},
	_isNumber:function(val){
		// 小数
	    var tFlag = false;
	    var regTmp = new RegExp("^(-?\\d+)(\\.\\d+)?$");
	    var mt = regTmp.test(val);
	    if(!(mt == false || undefined == mt)){
	    	 var f = 0;
		    try{
		        f = parseFloat(val);
		    }catch(e){
		        f = 'NaN';
		    }
		    if((f + '-') != 'NaN-'){
		    	tFlag = true;
		    } 
	    }
	    return tFlag;
	},
	_success:function(obj){
		$(obj).removeAttr("tips");
		$(obj).removeClass("vError");
	},
	_error:function(obj){
		$(obj).addClass("vError");
	},
	_tip:function(tips,obj){
		$(obj).val($.trim($(obj).val()));
		$(obj).attr("tips",tips);
		var that = $(obj);
		var tip = $("<p class='vtip'/>");
		var img = $("<div class='vtipArrow'/>");
		var offset = that.offset();
	    var left = offset.left + that.width() - 25;
	    var top = offset.top + that.height() + 15;
	    tip.css({top:top,left:left});
	    tip.hide();
	    tip.append(img).append(tips);
	    $('body').append(tip);
	    tip.fadeIn("fast").delay(3000).fadeOut("fast");
	},
	_hideTips:function(){
		$(".vtip").hide();
	},
	_showTips:function(){
		$(".vtip").show();
	},
	_removeTips:function(){
		$(".vtip").remove();
	},
	
	//结束时间大于开始时间
	endTimeGTstartTime: function(startDateId, endDateId){
		var startTime = $("#"+startDateId, $.pdialog.getCurrent()).val();
		var endTime = $("#"+endDateId, $.pdialog.getCurrent()).val();
		
		if(startTime == "" || endTime == "" || endTime > startTime)
		{
			$("#startDate").removeClass("vError");
			$("#endDate").removeClass("vError");
			return false;
		}
		
		return "结束日期要大于开始日期";
	}
};
