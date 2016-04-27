;(function(){
    var v = 1.1,
w = window,
ws = w.screen,
d = document,
dc = d.cookie,
dr = d.referrer,
dm=d.domain,
na = navigator,
ua = na.userAgent.toLowerCase(),
c,
I = 'http://haostat.qihoo.com/haoclk.gif?',/*'http://local.com/count/write.php?'*/
    en = encodeURIComponent,
lo = location, 
curHref = lo.href,
url = 'http://'+lo.host+'/index.html',
//rUrl = lo.href.split('?')[0],
//url = lo.host.indexOf('tuan.360.cn') != -1 ? en(rUrl.replace(/(.*)\/(.*)?$/,'\$1')+'/index.html'): en(/\.(s?htm|php)/.test(rUrl) ? rUrl: rUrl.replace(/\/$/, "") + "/index.html"),
id,
browerObj = {
    '360se':'360se',
'TT':'tencenttraveler',
'Maxthon':'maxthon',
'GreenBrowser':'greenbrowser',
'Sogou':'se 1.x / se 2.x',
'TheWorld':'theworld'
},
    // which brower
    isB = function(){
        var r;
        for(var p in browerObj){
            if(ua.indexOf(browerObj[p])>-1)
                return p;
        }
        r = ua.match(/(msie|chrome|safari|firefox)/)[0];
        if(r=='msie'){
            r = ua.match(/msie[^;]+/)
        }
        return r;
    },
    hash = function (s) {
        var h = 0,
        g = 0;
        for (var i = s.length - 1; i >= 0; i--) {
            var c = parseInt(s.charCodeAt(i));
            h = ((h << 6) & 0xfffffff) + c + (c << 14);
            if ((g = h & 0xfe00000) != 0) h = (h ^ (g >> 21))
        }
        return h
    },
    getGuid = function () {
        var s = [na.appName, na.version, na.language || na.browserLanguage, na.platform, na.userAgent, ws.width, 'x', ws.height, ws.colorDepth, d.referrer].join(""),
        k = s.length,
        o = history.length;
        while (o > 0) s += o--^k++;
        return (Math.round(Math.random() * 2147483647) ^ hash(s)) * 2147483647
    },
    getC = function (){
        var c = dc.match(/count=(\d+)/);
        return (c&&c[1]?c[1]:0)*1+1;
    },
    sd = function(s,statDomain) {
        if(s)
        {
            var stat = statDomain ? statDomain : I;
            var t = +new Date();
            var n = "log_"+ t;
            var img = window[n] = new Image();   
            img.onload = (img.onerror=function(){window[n] = null;img = null;});
            img.src = stat+s+'&v='+v+'&t='+ t +'&u='+url+'&cr='+en(curHref);
        }
    },
    inArray = function(arg,arr) {
        for(var i=0,len = arr.length;i<len;i++)
            if(arg === arr[i])
                return i;
        return -1;
    } ;
c = getC();
d.cookie = "count="+c+";path=/;expires=" + new Date(+new Date + 3600*1000*24*365).toGMTString();
id = dc.match(/sessionID=([^;]+)/);
if(!id||!id[1]){
    id = [hash(dm),getGuid(),+new Date+ Math.random()+Math.random()].join('.');
    d.cookie = "sessionID="+id+";path=/;expires=" + new Date(+new Date + 3600*1000*24*365).toGMTString();
}else{
    id = id[1];
}

function handleEvent(e){
    e = e || event;
    var et = e.type,t = e.target||e.srcElement;
    monitor.event = e;
    monitor.handleBiz(t,et);
}
d.attachEvent?d.attachEvent('onclick',handleEvent):d.addEventListener('click',handleEvent,false);
d.attachEvent?d.attachEvent('onkeydown',handleEvent):d.addEventListener('keydown',handleEvent,false);

monitor = {
    sessionID:id,
    funid:0,
    funs:{},
    ids:[],
    custom:{'click':null,'keydown':null},
    getContId : function(t)
    {
        var ids = this.ids;
        for(var i=0,node,len = ids.length;i<len;i++)
        {
            node=ids[i];
            if(!node) continue;
            var ci = d.getElementById(node);
            if(ci)
            {
                if(ci.contains?ci.contains(t):!!(ci.compareDocumentPosition(t) & 16)){
                    return ci.id ;
                }
            }
        }
        return t.tagName;
    },
    setCustomEvent:function(et,fun)
    {
        if(typeof fun == 'function')
        {
            if(typeof this.custom[et] == 'undefined')
                d.attachEvent?d.attachEvent('on'+et,fun):d.addEventListener(et,fun,false);
            else{
                this.custom[et] = fun;
            }
        }
    },
    clickFun:function(t)
    {
        var deep=0,contId,str,c,f;
        if(t.tagName == 'A')
        {
            contId = this.getContId(t);
            str = "&f="+en(t.href)+"&c="+en(t.innerHTML)+'&cId='+contId;
            sd(str);
            return;
        }
        if(t.tagName == 'IMG')
        {
            contId = this.getContId(t),f = c = t.alt || 'image';
            while(t = t.parentNode){
                if(t.tagName == 'A'){
                    f = t.href;
                }
            }
            str = "&f="+en(f)+"&c="+en(c)+'&cId='+contId;
            sd(str);
            return;
        }
        if(t.tagName == 'AREA')
        {
            contId = this.getContId(t);
            str = "&f="+en(t.href)+"&c=area:"+en(t.parentNode.name)+'&cId='+contId;
            sd(str);
            return;
        }
        if((t.tagName=='BUTTON'&&t.type=='submit')||(t.tagName=='INPUT'&&t.type=='submit'))
        {
            contId = this.getContId(t);
            while(t=t.parentNode){
                if(t.tagName=='FORM'){
                    str = "&f="+en(t.action)+"&c=form:"+(t.name||t.id)+'&cId='+contId;
                    sd(str);
                    return;
                }
            }
        }
        while(t = t.parentNode)
        {
            if(deep++>3)
                break;
            if(t.tagName == 'A')
            {
                contId = this.getContId(t);
                str = "&f="+en(t.href)+"&c="+en('deep'+deep)+'&cId='+contId;
                sd(str);
                break;
            }
        }
    },
    keydownFun:function()
    {
    },
    regEventFun:function(eventType,name,fun)
    {
        if(eventType && name && typeof fun =='function')
            this.funs[eventType+name] = fun;
        return this;
    },
    handleBiz:function(t,et)
    {
        if(this.custom[et])
        {
            try{ this.custom[et](t);}catch(e){};
        }else{
            if(t.id && this.funs[et+t.id])
            {
                try{this.funs[et+t.id](t);}catch(e){};
                return;
            }
            typeof this[et+'Fun'] == 'function' && this[et+'Fun'](t);
        }
    },
    sendInfo:function(str,statDomain)
    {
        if(typeof str == 'object')
        {
            var newstr='';
            for(var key in str)
                newstr+=key+"="+en(str[key])+'&';
            sd(newstr,statDomain);
        }else{
            sd(str,statDomain);
        }
    },
    getValByKey : function(key,ehref) {
                      var f = ehref || location.href;
                      if(f) {
                          var reg = eval('/'+key+'=([^&]*)/');
                          if(f.match(reg)) return f.match(reg)[1];
                      }
                      return '';
                  },
    getTrack: function(a) {
            var n = "log_"+ +new Date();
            var img = window[n] = new Image();   
            img.onload = (img.onerror=function(){window[n] = null;img = null;});
            img.src = 'http://haostat.qihoo.com/haopv.gif?b='+isB()+'&a='+(a===undefined?1:a)+'&u='+url+'&id='+id+'&c='+ c+'&r='+en(dr)+'&t='+ +new Date;
            //      d.write('<img src="http://haostat.qihoo.com/haopv.gif?b='+isB()+'&a='+(a===undefined?1:a)+'&u='+url+'&id='+id+'&c='+ c+'&r='+en(dr)+'&t='+ +new Date+'" style="display:none;width:1px;height:1px;" />' );
                  return this;
              },
    setId:function(ids)
    {
        this.ids = ids;
        /*
        for(var i=0,ci;ci=a[i++];){
            ci = d.getElementById(ci);
            ci&&this.ids.push(ci);
        }
        */
    }
}
})();
;(function(){
    var  m = monitor;
    m.getTrack();
    
   // m.setId(['cpc_hotsite','rem_items','hot_rem','sellwell_rem','cost_rem','guess_rem','lottery_rem','tuan_filter','tuan_m_food','tuan_m_entertaiment','tuan_m_beauty','tuan_m_shopping','tuan_m_tour','tuan_m_service','Paihangbang','Jinpin','Tonglei','Yilei','itembox','map_content']);
    if(typeof jQuery !== 'undefined') {
        var statDomain = 'http://tuan.stat.360safe.com/clk.gif?';
        var href = location.href, searchDef = '请输入商品或网站、或地址';
        var getCookie = function(name) {
            var search = name + "=" ;
            if(document.cookie.length > 0) { 
                offset = document.cookie.indexOf(search) ;
                if(offset != -1) { 
                    offset += search.length ;
                    end = document.cookie.indexOf(";", offset) ;
                    if(end == -1) {
                        end = document.cookie.length ;
                    }
                    return unescape(document.cookie.substring(offset, end)) ;
                }else return "" ;
            } 
        }
        var city = getCookie('_citycode') || m.getValByKey('city') || 'bei_jing';
        (function($){
            var ids = ['cpc_hotsite','rem_items','hot_rem','sellwell_rem','cost_rem','guess_rem','lottery_rem','tuan_filter','tuan_m_food','tuan_m_entertaiment','tuan_m_beauty','tuan_m_shopping','tuan_m_tour','tuan_m_service','Paihangbang','Jinpin','Tonglei','Yilei','itembox','map_content'];
            $('*[bk]').each(function(){
                var id = $(this).attr('id');
                id = id ? id : $(this).attr('bk');
                if($.inArray(id,ids) < 0) {
                    ids.push(id);
                }
            });
            m.setId(ids);

            $('a').live('click',function(){
                var _t = $(this),href = _t.attr('href'),c = $.trim(_t.text()),classN = _t.attr('classno'), sitekey = _t.attr('sitekey'),oauth = _t.attr('oauth'), cId=m.getContId(_t[0]),info;
                immediate = $(this).attr('immediate');
                c = c.indexOf('还剩') > -1 ? 'img'+_t.find('img').attr('alt') : c;
                m.sendInfo({'f':href,'c':c,'cId':cId});
                if(sitekey) {
                    info = {'f':href,'cId':cId,'ct':city,'s':sitekey,'ui':getCookie('sessionID'),'c':c};
                    if(cId != 'cpc_hotsite') info.cn = classN;
                    if(immediate) info.im = 1;
                    if(oauth)info.o = 1;
                    if(qid)info.q = qid;
                    m.sendInfo(info,statDomain);
                }
            })
            $('form').submit(function(){
                var val = $.trim($('input',this).val());
                m.sendInfo({'f':$(this).attr('action'),'c':val,'cId':'search','ui':getCookie('sessionID')});
            })
        })(jQuery);
        m.setCustomEvent('click',function(){ });
    }
})();
