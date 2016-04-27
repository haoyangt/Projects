function ddd(n,d){
		sxbq(n,d);
		var ccs = $("#litc").attr('Class');
		var ccsyd = $("#liyd").attr('Class');
		var jobCity = $("#jobCity").val();
		if(d=="litc"){
			if(ccs != "on"){
				$("#ads").attr('style','display:none;');
				$("#lizx").removeClass('on');
				$("#lidw").removeClass('on');
				$("#jobCity").val(jobCity.replace('在校',"").replace('单位',""));
			}else{
				$("#ads").attr('style','display:block;');
			}
		}else if(d=="liyd"){
			if(ccsyd == "on"){
				$("#zhus").attr('style','display:block;');
			}else{
				$("#zhus").attr('style','display:none;');
				$("#lizxjj").removeClass('on');
				$("#ligstg").removeClass('on');
				$("#jobCity").val(jobCity.replace('自行解决住宿',"").replace('公司提供住宿',""));
			}
		}
	}
	
	function sxbq(n,d){
		var jobCity = $("#jobCity").val();
		if(jobCity == ''){
			$("#jobCity").val(n);
		}else{
			if(jobCity.indexOf(""+n+"") == -1){
				$("#jobCity").val(jobCity+n);
			}else{
				$("#jobCity").val(jobCity.replace(n,""));
			}
		}
		if(jobCity.indexOf(""+n+"") != -1){
			$("#"+d).removeClass('on');
		}else{
			$("#"+d).addClass('on');
		}
	}
	
	function sxz(n,d){
		var workday = $("#workday").val();
		if(workday == ''){
			$("#workday").val(n);
		}else{
			if(workday.indexOf(""+n+"") == -1){
				$("#workday").val(workday+n);
			}else{
				$("#workday").val(workday.replace(n,""));
			}
		}
		$("#"+d).addClass('on');
		if(workday.indexOf(""+n+"") != -1){
			$("#"+d).removeClass('on');
		}
	}
	function sxy(n,d){
		var monthReady = $("#monthReady").val();
		if(monthReady == ''){
			$("#monthReady").val(n);
		}else{
			if(monthReady.indexOf(""+n+"") == -1){
				$("#monthReady").val(monthReady+n);
			}else{
				$("#monthReady").val(monthReady.replace(n,""));
			}
		}
		$("#"+d).addClass('on');
		if(monthReady.indexOf(""+n+"") != -1){
			$("#"+d).removeClass('on');
		}
	}
	
	function xueli(n){
		$("#education").val(n);
	}
	
	function nianji(n){
		$("#grade").val(n);
	}
	
	function sfgk(){
		if(!document.getElementById("exposec").checked){
			$("#expose").val("1");
			var spn = document.getElementById("mrdh");
			if(spn!=null){
				spn.outerHTML = "";
			}
		}else{
			$("#expose").val("2");
		}
	}
	
	function ysxXy(){
		if(!document.getElementById("cb6").checked){
			var spn = document.getElementById("sxxy");
			if(spn!=null){
				spn.outerHTML = "";
			}
		}
	}

	
	function nansex(){
		 $(".nan").removeClass('onnan');
		 $(".nv").addClass('onnv');	
		 $("#gender").val(1);
	};
	function nvsex(){
		 $(".nv").removeClass('onnv');	
		 $(".nan").addClass('onnan');	
		 $("#gender").val(0);
	};
	$('#nj li').click(function (){
		$(this).addClass('on').siblings().removeClass('on');
	});  
	function yixbiaoqz(s,obj){
		var spn = document.getElementById(""+s+"");
		if(obj=="tieshang"){
			spn.outerHTML = "";
			$.ajax({
				type:'POST',
				url:'/user/deltagUser',
				data:{"tagName":s,"userId":userId},
				dataType:'json',
				success:function(json) {
					if(json.start != 0){
						$("#tishi").text("删除失败！");
						return;
					}
				}
			});	
		}else{
			var div1 = document.getElementById("weixuanbq");
			var falg = true;
			for(var i=0 ;i<div1.children.length;i++){
				var tag = div1.children[i].innerHTML;
		    	if(s == tag){
			    	falg=false;
				};
			} 
			if(falg || div1.children.length == 0){
				  $("#weixuanbq").append("<span id=\""+s+"\" onclick=\"weixbiaoqz('"+s+"')\">"+s+"</span>");
				  $("#tishi").text("");
			}
			spn.outerHTML = "";
			$.ajax({
				type:'POST',
				url:'/user/deltagUser',
				data:{"tagName":s,"userId":userId},
				dataType:'json',
				success:function(json) {
					if(json.start != 0){
						$("#tishi").text("删除失败！");
						return;
					}
				}
			});	
		}
	}
	function weixbiaoqz(s){
		var div1 = document.getElementById("yixuanbq");
		var spn = document.getElementById(""+s+"");
		var falg = true;
		var num = 0;
		if(div1.children.length<8){
			for(var i=0 ;i<div1.children.length;i++){
				var tag = div1.children[i].innerHTML;
			    if(s == tag){
			    	num = i+1;
			    	falg=false;
				};
			}
			if(falg || div1.children.length == 0){
				$.ajax({
					type:'POST',
					url:'/user/addtagUser',
					data:{"tagName":s,"userId":userId},
					dataType:'json',
					success:function(json) {
						if(json.start != 0){
							$("#tishi").text("添加失败！");
							return;
						}
					}
				});	
				 $("#yixuanbq").append("<span name=\"tagName"+num+"\" id=\""+s+"\" onclick=\"yixbiaoqz('"+s+"',this)\">"+s+"</span>");
				  spn.outerHTML = "";
				  $("#tishi").text("");
				  return;
			}
		}else{
			$("#tishi").text("您最多只能选八个标签！");
		}
	}
	function tiebiaoq(){
		var zdybiaoq = $("#zdybiaoq").val();
		var div1 = document.getElementById("weixuanbq");
		var div2 = document.getElementById("yixuanbq");
		var a=/^.{1,6}$/;
		var falg = true;
		var fals = true;
		if(a.test(zdybiaoq)){
			if(div2.children.length<8){
				for(var i=0 ;i<div1.children.length;i++){
					var tag = div1.children[i].innerHTML;
					if(zdybiaoq == tag){
						falg=false;
					};
				};
				if(falg){	
					for(var i=0 ;i<div2.children.length;i++){
						var tag2 = div2.children[i].innerHTML;
					    if(zdybiaoq == tag2){
					    	fals=false;
						};
					}
			    	if(fals || div2.children.length == 0){
			    		$.ajax({
							type:'POST',
							url:'/user/addtagUser',
							data:{"tagName":zdybiaoq,"userId":userId},
							dataType:'json',
							success:function(json) {
								if(json.start != 0){
									$("#tishi").text("添加失败！");
									return;
								}
							}
						});	
					    $("#yixuanbq").append("<span id=\""+zdybiaoq+"\" onclick=\"yixbiaoqz('"+zdybiaoq+"','tieshang')\">"+zdybiaoq+"</span>");
					    //$("#zdybiaoq").val("");
					    $("#tishi").text("");
					    return;
			    	}else{
			    		$("#tishi").text("该标签已添加！");
			    	}
				}else{
					$("#tishi").text("该标签已添加！");
				}		
			}else{
				$("#tishi").text("您最多只能选八个标签！");
			}
	    }else{
	    	$("#tishi").text("输入字符必须是1-6位！");
	    }
	}
	
	
	
	function weixzsbqz(s){
		var div1 = document.getElementById("yixuanzsbq");
		var spn = document.getElementById(""+s+"");
		var falg = true;
		var num = 0;
		if(div1.children.length<8){
			for(var i=0 ;i<div1.children.length;i++){
				var tag = div1.children[i].innerHTML;
			    if(s == tag){
			    	num = i+1;
			    	falg=false;
				};
			}
			if(falg || div1.children.length == 0){
				var jobRequest = $("#certificate").val();
				if(jobRequest != ""){
					$("#certificate").val(jobRequest+","+s);
				}else{
					$("#certificate").val(s);
				}
				 $("#yixuanzsbq").append("<span name=\"tagName"+num+"\" id=\""+s+"\" onclick=\"yixuanzsbq('"+s+"',this)\">"+s+"</span>");
				  spn.outerHTML = "";
				  $("#zstishi").text("");
				  return;
			}
		}else{
			$("#zstishi").text("您最多只能选八个标签！");
		}
	}    
	   
	function yixuanzsbq(s,obj){
		var spn = document.getElementById(""+s+"");
		if(obj=="tieshang"){
			spn.outerHTML = "";
			var jobRequest = $("#certificate").val();
			if(jobRequest != "" && jobRequest.substring(0,jobRequest.indexOf(",")) != s){
				if(jobRequest.indexOf(",") == -1){
					$("#certificate").val(jobRequest.replace(s,""));
				}else{
					$("#certificate").val(jobRequest.replace(","+s,""));
				}
			}else {
				$("#certificate").val(jobRequest.replace(s+",",""));
			}
		}else{
			var div1 = document.getElementById("weixuanzsbq");
			var falg = true;
			for(var i=0 ;i<div1.children.length;i++){
				var tag = div1.children[i].innerHTML;
		    	if(s == tag){
			    	falg=false;
				};
			} 
			if(falg || div1.children.length == 0){
				  $("#weixuanzsbq").append("<span id=\""+s+"\" onclick=\"weixzsbqz('"+s+"')\">"+s+"</span>");
				  $("#zstishi").text("");
			}
			spn.outerHTML = "";
			var jobRequest = $("#certificate").val();
			if(jobRequest != "" && jobRequest.substring(0,jobRequest.indexOf(",")) != s){
				if(jobRequest.indexOf(",") == -1){
					$("#certificate").val(jobRequest.replace(s,""));
				}else{
					$("#certificate").val(jobRequest.replace(","+s,""));
				}
			}else {
				$("#certificate").val(jobRequest.replace(s+",",""));
			}
		}
	}
	function tiezsbiaoq(){
		var zdybiaoq = $("#zdyzsbiaoq").val();
		var div1 = document.getElementById("weixuanzsbq");
		var div2 = document.getElementById("yixuanzsbq");
		var a=/^.{1,6}$/;
		var falg = true;
		var fals = true;
		if(a.test(zdybiaoq)){
			if(div2.children.length<8){
				for(var i=0 ;i<div1.children.length;i++){
					var tag = div1.children[i].innerHTML;
					if(zdybiaoq == tag){
						falg=false;
					};
				};
				if(falg){	
					for(var i=0 ;i<div2.children.length;i++){
						var tag2 = div2.children[i].innerHTML;
					    if(zdybiaoq == tag2){
					    	fals=false;
						};
					}
			    	if(fals || div2.children.length == 0){
			    		var jobRequest = $("#certificate").val();
						if(jobRequest != ""){
							$("#certificate").val(jobRequest+","+zdybiaoq);
						}else{
							$("#certificate").val(zdybiaoq);
						}
					    $("#yixuanzsbq").append("<span id=\""+zdybiaoq+"\" onclick=\"yixuanzsbq('"+zdybiaoq+"','tieshang')\">"+zdybiaoq+"</span>");
					    //$("#zdybiaoq").val("");
					    $("#zstishi").text("");
					    return;
			    	}else{
			    		$("#zstishi").text("该标签已添加！");
			    	}
				}else{
					$("#zstishi").text("该标签已添加！");
				}		
			}else{
				$("#zstishi").text("您最多只能选八个标签！");
			}
	    }else{
	    	$("#zstishi").text("输入字符必须是1-6位！");
	    }
	}
	   
	
	
	
	
	function weixjnbiaoqz(s){
		var div1 = document.getElementById("yixuanjnbq");
		var spn = document.getElementById(""+s+"");
		var falg = true;
		var num = 0;
		if(div1.children.length<8){
			for(var i=0 ;i<div1.children.length;i++){
				var tag = div1.children[i].innerHTML;
			    if(s == tag){
			    	num = i+1;
			    	falg=false;
				};
			}
			if(falg || div1.children.length == 0){
				var jobRequest = $("#skill").val();
				if(jobRequest != ""){
					$("#skill").val(jobRequest+","+s);
				}else{
					$("#skill").val(s);
				}
				 $("#yixuanjnbq").append("<span name=\"tagName"+num+"\" id=\""+s+"\" onclick=\"yixuanjnbq('"+s+"',this)\">"+s+"</span>");
				  spn.outerHTML = "";
				  $("#jntishi").text("");
				  return;
			}
		}else{
			$("#jntishi").text("您最多只能选八个标签！");
		}
	}    
	   
	function yixuanjnbq(s,obj){
		var spn = document.getElementById(""+s+"");
		if(obj=="tieshang"){
			spn.outerHTML = "";
			var jobRequest = $("#skill").val();
			if(jobRequest != "" && jobRequest.substring(0,jobRequest.indexOf(",")) != s){
				if(jobRequest.indexOf(",") == -1){
					$("#skill").val(jobRequest.replace(s,""));
				}else{
					$("#skill").val(jobRequest.replace(","+s,""));
				}
			}else {
				$("#skill").val(jobRequest.replace(s+",",""));
			}
		}else{
			var div1 = document.getElementById("weixuanjnbq");
			var falg = true;
			for(var i=0 ;i<div1.children.length;i++){
				var tag = div1.children[i].innerHTML;
		    	if(s == tag){
			    	falg=false;
				};
			} 
			if(falg || div1.children.length == 0){
				  $("#weixuanjnbq").append("<span id=\""+s+"\" onclick=\"weixjnbiaoqz('"+s+"')\">"+s+"</span>");
				  $("#jntishi").text("");
			}
			spn.outerHTML = "";
			var jobRequest = $("#skill").val();
			if(jobRequest != "" && jobRequest.substring(0,jobRequest.indexOf(",")) != s){
				if(jobRequest.indexOf(",") == -1){
					$("#skill").val(jobRequest.replace(s,""));
				}else{
					$("#skill").val(jobRequest.replace(","+s,""));
				}
			}else {
				$("#skill").val(jobRequest.replace(s+",",""));
			}
		}
	}
	function tiejnbiaoq(){
		var zdybiaoq = $("#zdyjnbiaoq").val();
		var div1 = document.getElementById("weixuanjnbq");
		var div2 = document.getElementById("yixuanjnbq");
		var a=/^.{1,6}$/;
		var falg = true;
		var fals = true;
		if(a.test(zdybiaoq)){
			if(div2.children.length<8){
				for(var i=0 ;i<div1.children.length;i++){
					var tag = div1.children[i].innerHTML;
					if(zdybiaoq == tag){
						falg=false;
					};
				};
				if(falg){	
					for(var i=0 ;i<div2.children.length;i++){
						var tag2 = div2.children[i].innerHTML;
					    if(zdybiaoq == tag2){
					    	fals=false;
						};
					}
			    	if(fals || div2.children.length == 0){
			    		var jobRequest = $("#skill").val();
						if(jobRequest != ""){
							$("#skill").val(jobRequest+","+zdybiaoq);
						}else{
							$("#skill").val(zdybiaoq);
						}
					    $("#yixuanjnbq").append("<span id=\""+zdybiaoq+"\" onclick=\"yixuanzsbq('"+zdybiaoq+"','tieshang')\">"+zdybiaoq+"</span>");
					    //$("#zdybiaoq").val("");
					    $("#jntishi").text("");
					    return;
			    	}else{
			    		$("#jntishi").text("该标签已添加！");
			    	}
				}else{
					$("#jntishi").text("该标签已添加！");
				}		
			}else{
				$("#jntishi").text("您最多只能选八个标签！");
			}
	    }else{
	    	$("#jntishi").text("输入字符必须是1-6位！");
	    }
	}
	
	
	
	
	
	
	function weixjlbiaoqz(s){
		var div1 = document.getElementById("yixuanjlbq");
		var spn = document.getElementById(""+s+"");
		var falg = true;
		var num = 0;
		if(div1.children.length<8){
			for(var i=0 ;i<div1.children.length;i++){
				var tag = div1.children[i].innerHTML;
			    if(s == tag){
			    	num = i+1;
			    	falg=false;
				};
			}
			if(falg || div1.children.length == 0){
				var jobRequest = $("#experience").val();
				if(jobRequest != ""){
					$("#experience").val(jobRequest+","+s);
				}else{
					$("#experience").val(s);
				}
				 $("#yixuanjlbq").append("<span name=\"tagName"+num+"\" id=\""+s+"\" onclick=\"yixjlbiaoqz('"+s+"',this)\">"+s+"</span>");
				  spn.outerHTML = "";
				  $("#jltishi").text("");
				  return;
			}
		}else{
			$("#jltishi").text("您最多只能选八个标签！");
		}
	}    
	   
	function yixjlbiaoqz(s,obj){
		var spn = document.getElementById(""+s+"");
		if(obj=="tieshang"){
			spn.outerHTML = "";
			var jobRequest = $("#experience").val();
			if(jobRequest != "" && jobRequest.substring(0,jobRequest.indexOf(",")) != s){
				if(jobRequest.indexOf(",") == -1){
					$("#experience").val(jobRequest.replace(s,""));
				}else{
					$("#experience").val(jobRequest.replace(","+s,""));
				}
			}else {
				$("#experience").val(jobRequest.replace(s+",",""));
			}
		}else{
			var div1 = document.getElementById("weixuanjlbq");
			var falg = true;
			for(var i=0 ;i<div1.children.length;i++){
				var tag = div1.children[i].innerHTML;
		    	if(s == tag){
			    	falg=false;
				};
			} 
			if(falg || div1.children.length == 0){
				  $("#weixuanjlbq").append("<span id=\""+s+"\" onclick=\"weixjlbiaoqz('"+s+"')\">"+s+"</span>");
				  $("#jltishi").text("");
			}
			spn.outerHTML = "";
			var jobRequest = $("#experience").val();
			if(jobRequest != "" && jobRequest.substring(0,jobRequest.indexOf(",")) != s){
				if(jobRequest.indexOf(",") == -1){
					$("#experience").val(jobRequest.replace(s,""));
				}else{
					$("#experience").val(jobRequest.replace(","+s,""));
				}
			}else {
				$("#experience").val(jobRequest.replace(s+",",""));
			}
		}
	}
	function tiejlbiaoq(){
		var zdybiaoq = $("#zdyjlbiaoq").val();
		var div1 = document.getElementById("weixuanjlbq");
		var div2 = document.getElementById("yixuanjlbq");
		var a=/^.{1,6}$/;
		var falg = true;
		var fals = true;
		if(a.test(zdybiaoq)){
			if(div2.children.length<8){
				for(var i=0 ;i<div1.children.length;i++){
					var tag = div1.children[i].innerHTML;
					if(zdybiaoq == tag){
						falg=false;
					};
				};
				if(falg){	
					for(var i=0 ;i<div2.children.length;i++){
						var tag2 = div2.children[i].innerHTML;
					    if(zdybiaoq == tag2){
					    	fals=false;
						};
					}
			    	if(fals || div2.children.length == 0){
			    		var jobRequest = $("#experience").val();
						if(jobRequest != ""){
							$("#experience").val(jobRequest+","+zdybiaoq);
						}else{
							$("#experience").val(zdybiaoq);
						}
					    $("#yixuanjlbq").append("<span id=\""+zdybiaoq+"\" onclick=\"yixjlbiaoqz('"+zdybiaoq+"','tieshang')\">"+zdybiaoq+"</span>");
					    //$("#zdybiaoq").val("");
					    $("#jltishi").text("");
					    return;
			    	}else{
			    		$("#jltishi").text("该标签已添加！");
			    	}
				}else{
					$("#jltishi").text("该标签已添加！");
				}		
			}else{
				$("#jltishi").text("您最多只能选八个标签！");
			}
	    }else{
	    	$("#jltishi").text("输入字符必须是1-6位！");
	    }
	}
	
	
	
	
	
	
	function weixahbiaoqz(s){
		var div1 = document.getElementById("yixuanahbq");
		var spn = document.getElementById(""+s+"");
		var falg = true;
		var num = 0;
		if(div1.children.length<8){
			for(var i=0 ;i<div1.children.length;i++){
				var tag = div1.children[i].innerHTML;
			    if(s == tag){
			    	num = i+1;
			    	falg=false;
				};
			}
			if(falg || div1.children.length == 0){
				var jobRequest = $("#hobby").val();
				if(jobRequest != ""){
					$("#hobby").val(jobRequest+","+s);
				}else{
					$("#hobby").val(s);
				}
				 $("#yixuanahbq").append("<span name=\"tagName"+num+"\" id=\""+s+"\" onclick=\"yixahbiaoqz('"+s+"',this)\">"+s+"</span>");
				  spn.outerHTML = "";
				  $("#ahtishi").text("");
				  return;
			}
		}else{
			$("#ahtishi").text("您最多只能选八个标签！");
		}
	}    
	   
	function yixahbiaoqz(s,obj){
		var spn = document.getElementById(""+s+"");
		if(obj=="tieshang"){
			spn.outerHTML = "";
			var jobRequest = $("#hobby").val();
			if(jobRequest != "" && jobRequest.substring(0,jobRequest.indexOf(",")) != s){
				if(jobRequest.indexOf(",") == -1){
					$("#hobby").val(jobRequest.replace(s,""));
				}else{
					$("#hobby").val(jobRequest.replace(","+s,""));
				}
			}else {
				$("#hobby").val(jobRequest.replace(s+",",""));
			}
		}else{
			var div1 = document.getElementById("weixuanahbq");
			var falg = true;
			for(var i=0 ;i<div1.children.length;i++){
				var tag = div1.children[i].innerHTML;
		    	if(s == tag){
			    	falg=false;
				};
			} 
			if(falg || div1.children.length == 0){
				  $("#weixuanahbq").append("<span id=\""+s+"\" onclick=\"weixahbiaoqz('"+s+"')\">"+s+"</span>");
				  $("#ahtishi").text("");
			}
			spn.outerHTML = "";
			var jobRequest = $("#hobby").val();
			if(jobRequest != "" && jobRequest.substring(0,jobRequest.indexOf(",")) != s){
				if(jobRequest.indexOf(",") == -1){
					$("#hobby").val(jobRequest.replace(s,""));
				}else{
					$("#hobby").val(jobRequest.replace(","+s,""));
				}
			}else {
				$("#hobby").val(jobRequest.replace(s+",",""));
			}
		}
	}
	function tieahbiaoq(){
		var zdybiaoq = $("#zdyahbiaoq").val();
		var div1 = document.getElementById("weixuanahbq");
		var div2 = document.getElementById("yixuanahbq");
		var a=/^.{1,6}$/;
		var falg = true;
		var fals = true;
		if(a.test(zdybiaoq)){
			if(div2.children.length<8){
				for(var i=0 ;i<div1.children.length;i++){
					var tag = div1.children[i].innerHTML;
					if(zdybiaoq == tag){
						falg=false;
					};
				};
				if(falg){	
					for(var i=0 ;i<div2.children.length;i++){
						var tag2 = div2.children[i].innerHTML;
					    if(zdybiaoq == tag2){
					    	fals=false;
						};
					}
			    	if(fals || div2.children.length == 0){
			    		var jobRequest = $("#hobby").val();
						if(jobRequest != ""){
							$("#hobby").val(jobRequest+","+zdybiaoq);
						}else{
							$("#hobby").val(zdybiaoq);
						}
					    $("#yixuanahbq").append("<span id=\""+zdybiaoq+"\" onclick=\"yixahbiaoqz('"+zdybiaoq+"','tieshang')\">"+zdybiaoq+"</span>");
					    //$("#zdybiaoq").val("");
					    $("#ahtishi").text("");
					    return;
			    	}else{
			    		$("#ahtishi").text("该标签已添加！");
			    	}
				}else{
					$("#ahtishi").text("该标签已添加！");
				}		
			}else{
				$("#ahtishi").text("您最多只能选八个标签！");
			}
	    }else{
	    	$("#ahtishi").text("输入字符必须是1-6位！");
	    }
	}
	
	