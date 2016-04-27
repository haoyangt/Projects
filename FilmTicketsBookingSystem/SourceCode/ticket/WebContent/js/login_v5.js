function showLoginError(obj)
{
    var e = ELogin;
    if(e.errNum > 4)
    {
        alert(e.msgInfo.moreErr);
        location.href = 'http://i.360.cn/login?src=reg&type=wrongPasswd&&destUrl='+escape(location.href);
    }
    e.errNum++;
    e.showErr(obj.errMsg);
}

function showLoginSucc(obj)
{
    $.extend(ELogin.userInfo,obj);
    ELogin.userInfo.username = obj.userName;
    window.qid = ELogin.userInfo.userid = obj.qid;
    $('#closeLogin').click();
    ELogin.execFuns('login');
}
ELogin = 
{
    errNum:0,
    options:{
        ischeck:false,
        title:'团购导航',
        loginid:'',
        logoutid:'',
        loginevent:null,
        logoutevent:null
    },
    msgInfo: {
        moreErr:'多次登录失败，将跳转到用户中心!',
        ajaxstart:'登录中...',
        inputName:'登录邮箱/用户名',
        defaultInfo:'请使用您的360帐号登录',
        needName:'登录失败，您没有输入帐号',
        needPsd:'登录失败，您没有输入密码',
        loginFail:'登录失败，你输入的帐号或密码有误'
    },
    userInfo:{
        userid:'',
        username:''
    },
    funs:{},
    haveFun:function(funName) 
    {
        for(var key in this.funs) {
            if(key.indexOf(funName) > -1) return true;
        }
        return;
    },
    regLogoutFun:function(key,fun,isUnset) 
    {
        var isUnset = isUnset ? '__unset' : '';
        this.funs['logout__'+key+isUnset] = fun;
    },
    regLoginFun:function(key,fun,isUnset) 
    {
        var isUnset = isUnset ? '__unset' : '';
        this.funs['login__'+key+isUnset] = fun;
    },
    execFun:function(name,prefix,isUnset)
    {
        if(name && prefix)
        {
            var isUnset = isUnset ? '__unset' : '';
            if(this.haveFun(name)) {
                var rname = prefix+'__'+name+isUnset;
                this.funs[rname]();
                if(isUnset) delete this.funs[rname];
            }
        }
    },
    execFuns:function(prefix) 
    {
        for(var key in this.funs)
        {
            try{
                if(key.indexOf(prefix+'__')>-1) this.funs[key]();
                if(key.indexOf('__unset') > -1) delete this.funs[key];
            }catch(e){
                continue;
            }
        }
    },
    unsetFuns:function()
    {
        this.funs = {};
    },
    logout:function()
    {
        var that = this;
        var logout = 'http://login.360.cn/?op=logout&crumb='+this.userInfo.crumb;
        var img = new Image();
        logout+= '&t='+(+new Date);
        img.onerror = img.onload = function(){
            that.userInfo = {};
            window.qid = '';
            that.execFuns('logout');
        };
        img.src = logout;
    },
    login:function()
    {
        if(!$('#loginmark')[0])
        {
            this.assemblyLoginHtml();
            this.handleEvnet();
        }
        var h = $(document).height() > $(window).height() ? $(document).height() : $(window).height();
        $('#loginmark').css({'height':h}).show(); 
        $('#loginDiv').css('top',$(window).scrollTop()+($(window).height()-264)/2).show(); 
    },
    assemblyLoginHtml:function() 
    {//{{{
        var style = '<style> body,div,ul,li,form,fieldset,legend,input,button,textarea,p{margin:0;padding:0;} button,input{font:100% arial,sans-serif,\5b8b\4f53;} ul,ol{list-style-type:none;} img,fieldset{border:0;} .g-login{z-index:100000000;position:absolute;left:50%;width:580px;margin-left:-290px;} .g-logint{ height:8px; background:url(http://p1.qhimg.com/t01a740cd7c5f69117a.png) no-repeat 0 0;  _background-image:none;_filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true,sizingMethod=scale,src="http://p1.qhimg.com/t01a740cd7c5f69117a.png ");font-size:0;} .g-loginb{height:8px;background:url(http://p1.qhimg.com/t012aea12ea556b4acf.png) no-repeat 0 0; _background-image:none;_filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true,sizingMethod=scale,src="http://p1.qhimg.com/t012aea12ea556b4acf.png ");font-size:0;} .g-loginc{height:100%; margin:0 auto; background:url(http://p1.qhimg.com/t01650ab2a204e60508.png) repeat-y 0 0;_background-image:none;_filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true,sizingMethod=scale,src="http://p1.qhimg.com/t01650ab2a204e60508.png"); } .g-loginbox{width:564px; margin:0 auto;} .login-hd{ height:34px; line-height:34px; padding:0 10px; background-color:#b00; border-bottom:1px solid #fff; font-size:14px; font-weight:bold; color:#fff;position:relative;} .login-bd{position:relative; overflow:hidden; *zoom:1;padding:35px 0 30px 0; background-color:#f5f5f5;} .login-box{float:left;width:305px; padding-left:30px; border-right:1px solid #dfdfdf;} .login-share{float:left;width:195px; padding-left:30px;border-left:1px solid #fff;} .login-box label{display:inline-block;width:50px;} .login-input1{width:215px; height:18px; padding:3px 0; border:1px solid #c8c8c8;box-shadow:2px 2px 2px #ebebeb inset;} .login-but{display:inline-block;width:85px; height:30px;line-height:30px;text-align:center; border:none; background:url(http://p2.qhimg.com/t01e3dbc4ce6ab4b2ac.png) no-repeat 0 0 ; color:#b00; font-size:14px; font-weight:bold; cursor:pointer;} label.login-remember{ margin-left:10px; vertical-align:top; width:100px;} .login-lost{margin-left:10px; color:#2e74d3;text-decoration:none;} .login-box legend{display:none;} .login-share p{ margin-bottom:15px;} .login-mar a{ display:inline-block; overflow:hidden; width:81px; height:22px; margin-right:10px;} .login-sina{margin-top:-63px;} .login-ren{margin-top:-86px;} .login-error{ position:absolute;display:none; left:90px; top:50px; height:18px; line-height:18px; padding-left:20px;background:url(http://p2.qhimg.com/t010d91e2a51682eaa4.png) no-repeat 0 -31px; color:#f00;}.login-close{ position:absolute; right:12px; top:12px; display:inline-block; width:10px; height:10px; cursor:pointer; background:url(http://p2.qhimg.com/t01e3dbc4ce6ab4b2ac.png) no-repeat 0 -51px; font-size:0;} .loginmar-b10{margin-bottom:10px;} .loginmar-b15{ margin-bottom:15px;} .loginmar-b30{ margin-bottom:30px;} .loginmar-l50{ margin-left:50px;} .loginmark{display:none;width:100%;z-index:99999;background:#000;position:absolute;top:0;left:0;opacity:0.6;-ms-filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=60);filter:alpha(opacity=60);zoom:1}</style>';
            var reg = /^(?:.*\.)?(.*?)\.360\.cn$/;
            var key = reg.exec(location.host);
            var eTag = key[1];
            var destUrl = encodeURIComponent(location.href);
            var html = '<div class="loginmark" id="loginmark"></div><div class="g-login" id="loginDiv"> <div class="g-logint"></div> <div class="g-loginc"> <div class="g-loginbox"> <div class="login-hd">登录360'+this.options.title+'<span class="login-close" id="closeLogin"></span></div> <div class="login-bd"> <div class="login-box"> <fieldset> <legend>登录</legend> <ul> <li class="loginmar-b10"><label for="userName">用户名：</label><input type="text" name="" id="userName" class="login-input1" /></li> <li class="loginmar-b10"><label for="pwd">密　码：</label><input type="password" name="" id="pwd" class="login-input1" /></li> <li class="loginmar-b15 loginmar-l50"><input name="remember" type="checkbox" id="isKeepAlive" checked/><label class="login-remember" for="isKeepAlive">下次自动登录</label></li> <li class="loginmar-l50"><input type="button" class="login-but" id="login_submit" value="登 录" /><a href="http://i.360.cn/findpwd/?src=login" class="login-lost">忘记密码?</a></li> </ul> </fieldset> </div> <div class="login-share"> <p>还没有360账号？</p> <a  class="login-but loginmar-b30"  href="http://i.360.cn/reg?src='+eTag+'&destUrl='+destUrl+'" >轻松注册</a> <p >你可以通过以下方式登录：</p>            <span class="login-mar" ><a href="http://i.360.cn/oauth/loginByOauth?c=Sina&f='+eTag+'&destUrl='+destUrl+'" ><img src="http://p2.qhimg.com/t01e3dbc4ce6ab4b2ac.png" class="login-sina" /></a><a href="http://i.360.cn/oauth/loginByOauth?c=RenRen&f='+eTag+'&destUrl='+destUrl+'" ><img src="http://p2.qhimg.com/t01e3dbc4ce6ab4b2ac.png " class="login-ren"  /></a></span> </div> </div> <div class="login-error" id="login_tip">密码错误，请重新输入！</div> </div> </div> <div class="g-loginb"></div> </div>';
            $('head').append(style);
            $('body').append(html);
},//}}}
showErr:function(data)
{
    $('#login_tip').html(data).show();
},
handleEvnet:function()
{
    //{{{
    var that = this;
    var nameDomObj = $('#userName'),psdDomObj = $('#pwd');
    var info = this.msgInfo;
    psdDomObj.keydown(function(e){ 
        if(e.keyCode == 13) 
            $('#login_submit').click(); 
    });
    nameDomObj.focus(function(){ 
        if($(this).val() == info.inputName) 
            $(this).val(''); 
    });
    $('#closeLogin').click(function(){ 
        $('#loginmark,#loginDiv').hide(); 
        $('#login_tip').hide(); 
        psdDomObj.val(''); 
    });
    $('#login_submit').live('click',function(){
        var name = $.trim(nameDomObj.val());
        if(!name || name == info.inputName) { 
            that.showErr(info.needName); 
            nameDomObj.focus(); 
            return false; 
        }
        var psd = psdDomObj.val();
        if(!psd) { 
            that.showErr(info.needPsd); 
            psdDomObj.focus(); 
            return false; 
        }
        that.showErr(info.ajaxstart); 
        if(that.loadLoginJS) {
            login.getToken();
        }else{
            $.ajaxSetup({cache:true});
            $.getScript('http://s.login.360.cn/md5.js',function(){
                $.getScript('http://s.login.360.cn/totalLogin_jquery.js',function(){
                    that.loadLoginJS = true;
                    login.getToken();
                    $.ajaxSetup({cache:false});
                });
            });
        }
    });
    //}}}
},
init:function(options) 
{//{{{
    var that = this;
    var topOptions = this.options;
    $.extend(topOptions,options);
    this.regLoginFun('init', topOptions.loginevent);
    this.regLogoutFun('init', topOptions.logoutevent);
    $(function(){
        if(topOptions.ischeck) {
            $.getJSON('http://js.login.360.cn/?o=sso&m=info&func=ELogin.check&callback=?');
        }
        $(topOptions.loginid).live('click',function(){ 
            that.login();
            return false;
        });
        $(topOptions.logoutid).live('click',function(){
            that.logout();
            return false;
        });
    });
},//}}}
check:function(userinfo)
{
    var userId = userinfo.qid;
    if(userId && userId != '145558123')
    {
        this.userInfo = userinfo;
        window.qid = this.userInfo.userid = userinfo.qid;
        this.execFun('init','login');
    }else{
        this.execFun('init','logout');
    }
    if(typeof this.checkFun === 'function'){
        this.checkFun();
    }
}
};
