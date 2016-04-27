function showLoginWindow(){
    	document.getElementById('window_login').style.display='block';
    	document.getElementById('fade').style.display='block';
    }
    function closeLoginWindow(){
    	document.getElementById('window_login').style.display='none';
    	document.getElementById('fade').style.display='none';
    }
    function showChangePwdWindow(){
    	document.getElementById('window_changepwd').style.display='block';
    	document.getElementById('fade').style.display='block';
    }
    function closeChangePwdWindow(){
    	document.getElementById('window_changepwd').style.display='none';
    	document.getElementById('fade').style.display='none';
    }
    function showRegisterWindow(){
    	document.getElementById('window_register').style.display='block';
    	document.getElementById('fade').style.display='block';
    }
    function closeRegisterWindow(){
    	document.getElementById('window_register').style.display='none';
    	document.getElementById('fade').style.display='none';
    }
    function showAddFilmWindow(){
    	document.getElementById('window_addfilm').style.display='block';
    	document.getElementById('fade').style.display='block';
    }
    function closeAddFilmWindow(){
    	document.getElementById('window_addfilm').style.display='none';
    	document.getElementById('fade').style.display='none';
    }
  //验证密码框
    function checkpwd(){
    	var newpwd=document.getElementById("newpwd");
    	var newpwdimg=document.getElementById("newpwdimg");//显示span对象
    	//密码强度图片span
    	var magnitude=document.getElementById("magnitude");
    	//改变文本框边框颜色
    	newpwd.style.border="solid 1px #cccccc";	
    	//改变文本框颜色
    	newpwd.style.backgroundColor="#ffffff";
    	//密码不能为空
    	if(newpwd.value==""){
    		//密码强度div隐藏
    		magnitude.style.display="none";
    		newpwdimg.innerHTML="&nbsp;&nbsp;<img src='image/error.png' />";
    	}
    	//不足6位密码
    	else if(newpwd.value!=""&& 0<newpwd.value.length && newpwd.value.length<6){
    		//密码强度div隐藏
    		magnitude.style.display="none";
    		newpwdimg.innerHTML="&nbsp;&nbsp;<img src='image/error.png' />";
    	}
    	//强度为弱
    	else if(newpwd.value!=""&& newpwd.value.length>=6 && newpwd.value.length<14){
    		newpwdimg.innerHTML="&nbsp;&nbsp;<img src='image/success.png' />";
    		magnitude.style.display="block";
    		magnitude.innerHTML="&nbsp;&nbsp;<img src='image/low.gif' />";
    	}
    	//强度为中
    	else if(newpwd.value!=""&& newpwd.value.length>=14 && newpwd.value.length<22){
    		newpwdimg.innerHTML="&nbsp;&nbsp;<img src='image/success.png' />";
    		magnitude.style.display="block";
    		magnitude.innerHTML="&nbsp;&nbsp;<img src='image/middle.gif' />";
    	}
    	//强度为强
    	else if(newpwd.value!=""&& newpwd.value.length>=22 && newpwd.value.length<30){
    		newpwdimg.innerHTML="&nbsp;&nbsp;<img src='image/success.png' />";
    		magnitude.style.display="block";
    		magnitude.innerHTML="&nbsp;&nbsp;<img src='image/high.gif' />";
    	}
    }
  //验证确认密码
    function checkvpwd(){
    	var vpwd=document.getElementById("vpwd");//确认密码框对象
        //改变文本框边框颜色
    	vpwd.style.border="solid 1px #cccccc";	
    	//改变文本框颜色
    	vpwd.style.backgroundColor="#ffffff";	
    	//span对象
    	var vpwdimg=document.getElementById("vpwdimg");
    	//第一次设置密码框对象
    	var newpwd=document.getElementById("newpwd");
    	//确定确认密码正确   
    	if(newpwd.value==vpwd.value&&newpwd.value.length==vpwd.value.length&&vpwd.value.length>=6){
    		vpwdimg.innerHTML="&nbsp;&nbsp;<img src='image/success.png' />";
    	}
    	//判断是否为空
    	else if(vpwd.value==""){
    		vpwdimg.innerHTML="&nbsp;&nbsp;<img src='image/error.png' />";
    	}
    	//判断两次密码不同
    	else {
    		vpwdimg.innerHTML="&nbsp;&nbsp;<img src='image/error.png' />";
    	}
    }

    
    //验证用户名是否存在
    var xmlHttp;
    function isExist()
    {
      
      if(window.ActiveXObject)
      {
       xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
      else
      {
       xmlHttp=new XMLHttpRequest();
      }
    
      var s="checkUsername.jsp?username="+document.getElementById("rusername").value.toString();
         
      xmlHttp.onreadystatechange=handlStateChage;
      xmlHttp.open("GET",s,true);
       
      xmlHttp.send(null);
          
    }
    function handlStateChage()
    {
       
     if(xmlHttp.readyState==4) //代表请求完成，0=未初始化；1=正在加载；2=加载完成;3=交互中；4=完成
       {
         if(xmlHttp.status==200) //请求状态，200表示正常返回
         {
           document.getElementById("result").innerHTML=xmlHttp.responseText;
         }
       }
    }