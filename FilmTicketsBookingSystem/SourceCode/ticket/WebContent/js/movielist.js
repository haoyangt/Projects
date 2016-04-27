;(function($){
    movieList = {
        curPage : 1,
        showPage : 10,
        totalPage : 1,
        groupCount :15 ,
        url : '',
        groupData : [],
        main : function(){
            this.pageEvent();
        },
        getData : function(desc){
            var that = this;
            var curPage = this.curPage;
            var str = "";
            if(desc){ str ="&"+desc;}
            var url = '/?do=cinemagoods_ajax&id='+cinemaId+'&pageno=' + curPage+str;
            this.url = url;
            var data = this.groupData;
            if(data[url]){
                that.assemblyGroup();
                that.assemblyPage();
            }else{
                $.getJSON(url,function(data){
                    if(data){
                        that.groupData[url] = data;
                        that.assemblyGroup();
                        that.assemblyPage();
                    }
                });
            }
        },
        assemblyPage : function(){
            var groupData = this.groupData[this.url];
            var data = groupData.data;
            var total = groupData.total;
            var curPage = this.curPage;
            var showPage = this.showPage;
            var totalPage = Math.ceil(total/this.groupCount);
            this.totalPage = totalPage;
            var pageCount;
            var pageNum = $('#page_num');
            var pagehtml = '';
            pageNum.html('');
            if(curPage < showPage)
            {
                if(totalPage > showPage) pageCount=showPage;
                else pageCount = totalPage;
                for (i=1;i<pageCount+1;i++) 
                {
                    if (i == curPage) 
                    {
                        pagehtml += '<a class=\"current\">'+i+'</a>';
                    }
                    else
                    {
                        pagehtml += '<a href=\"#\">'+i+'</a>';
                    }
                }
                if(totalPage > showPage)
                {
                    pagehtml += ' ... ' + '<a href=\"#\">'+totalPage+'</a>';
                }
                pageNum.append(pagehtml);
            }
            else
            {
                if(curPage > totalPage-showPage)
                {
                    if(totalPage > showPage){pagehtml += '<a href=\"#\">1</a>' + ' ... ';}
                    for (i=totalPage-showPage+1;i<totalPage+1;i++) 
                    {
                        if (i == curPage) 
                        {
                            pagehtml += '<a class=\"current\">'+i+'</a>';
                        }
                        else
                        {
                            pagehtml += '<a href=\"#\">'+i+'</a>';
                        }
                    }
                    pageNum.append(pagehtml);
                }
                else
                {
                    if(totalPage > showPage){pagehtml += '<a href=\"#\">1</a>' + ' ... ';}
                    var startpageint = parseInt((curPage+curPage/showPage)/showPage);
                    var startpage = startpageint*showPage-(startpageint-1);
                    for (i=startpage;i<startpage+showPage;i++) 
                    {
                        if (i == curPage) 
                        {
                            pagehtml += '<a class=\"current\">'+i+'</a>';
                        }
                        else
                        {
                            pagehtml += '<a href=\"#\">'+i+'</a>';
                        }
                    }
                    if(totalPage > showPage){pagehtml += ' ... ' + '<a href=\"#\">'+totalPage+'</a>';}
                    pageNum.append(pagehtml);
                }
            }
            if(curPage == 1)
            {
                if(curPage == totalPage){
                    $('#next').hide();
                }
                $('#pre').hide();
                if(totalPage>1)
                {
                    $('#next').show();
                }

            }
            else
            {
                if(curPage == totalPage)
                {
                    $('#next').hide();
                    if(totalPage>1)
                    {
                        $('#pre').show();
                    }
                }
                else
                {
                    $('#pre').show();
                    $('#next').show();
                }
            }
        },
        assemblyGroup : function(){
            var groupList = '';
            var groupData = this.groupData[this.url];
            var data = groupData.data;
            for(var i=0,len=data.length;i<len;i++){
                var curData = data[i];
                var imgSrc = curData.img_url;
                var goodsUrl = curData.goods_url;
                var title = curData.description;
                var salePrice = curData.sale_price_yuan;
                var originalPrice = curData.original_price_yuan;
                var discount = curData.zhekou;
                var gkey = curData.gkey;
                var groupTitle = '';
                var siteName = encodeURIComponent(curData.sitename);
                if(curData.isDouble){
                    groupTitle += '<a href="/'+curData.citycode+'/s_'+encodeURIComponent('双人')+'.html?clazz=203&qforce=1" target="_blank">双人票</a>';
                }
                if(curData.is3D){
                    groupTitle += '<a href="/'+curData.citycode+'/s_'+encodeURIComponent('3D')+'.html?clazz=203&qforce=1" target="_blank">3D通兑</a>';
                }
                if((!curData.isDouble || !curData.is3D) && curData.isNolimit){
                    groupTitle += '<a href="/'+curData.citycode+'/s_'+encodeURIComponent('不限时段')+'.html?clazz=203&qforce=1" target="_blank">不限时段</a>';
                }

                groupList += '<li>\
                    <div class="title">\
                    <a href="/'+curData.citycode+'/s_'+siteName+'.html?clazz=203&qforce=1" target="_blank">'+curData.sitename+'</a>\
                    <span class="address">'+groupTitle+'</span>\
                    </div>\
                    <a href="'+goodsUrl+'" class="pic" target="_blank"><img alt="" src="'+imgSrc+'"></a>\
                    <h3><a href="'+goodsUrl+'" target="_blank">'+title+'</a></h3>\
                    <div class="meta">\
                    <strong class="price">'+salePrice+'</strong><span class="discount">￥<del>'+originalPrice+'</del> | '+discount+'折</span><a href="'+goodsUrl+'" class="go" target="_blank">去看看</a>\
                    </div>\
                    </li>'
            }
        $('#group_list li').remove();
        $('#group_list').append(groupList);
        },
        pageEvent : function(){
            var that = this;
            $('#page_num a').live('click',function(){
                that.curPage = $(this).text();
                var index = $("dl.sort dd a.cur").index();
                if(index ==0){
                    that.getData("o=price&odir=asc");
                }else{
                    that.getData("o=salenum&odir=desc");
                }
                return false;
            });
            $('#movie_price').live('click',function(){
                that.getData("o=price&odir=asc");
                $(this).addClass("cur").siblings().removeClass("cur");
                return false;
            });
            $('#movie_salenum').live('click',function(){
                that.getData("o=salenum&odir=desc");
                $(this).addClass("cur").siblings().removeClass("cur");
                return false;
            });
            $('#movie_default').live('click',function(){
                that.curPage = 0;
                that.getData();
                $(this).addClass("cur").siblings().removeClass("cur");
                return false; 
            });
            $('#pre').click(function(){ 
                if(that.curPage<=1){
                    that.curPage = 1;
                }else{
                    that.curPage--;
                }
                var index = $("dl.sort dd a.cur").index();
                if(index ==0){
                    that.getData("o=price&odir=asc");
                }else{
                    that.getData("o=salenum&odir=desc");
                }
                return false;
            });
            $('#next').click(function(){
                that.totalPage = $('#page_num a:last').text();
                if(that.curPage<that.totalPage){
                    that.curPage++;
                }else{
                    that.curPage = that.totalPage;
                }
                var index = $("dl.sort dd a.cur").index();
                if(index ==0){
                    that.getData("o=price&odir=asc");
                }else{
                    that.getData("o=salenum&odir=desc");
                }
                return false;
            });
        }
    }
    movieList.main();
})(jQuery);
;(function($){
    String.prototype.mix = function (data) {
        return this.replace(/\{(\S+?)\}/gi, function (a, b) {
            return typeof data[b] === "undefined" ? a : data[b];
        });
    };
    $(function(){
        var arrangeHTML = function(data){
            var htmlTemp = '<li >\
                <a href="/?do=film&id={filmid}&cid={$id}{if $from}&from={$from}{/if}" target="_blank" class="movies-img"><img src="{img}" /></a>\
                <div class="movies-info">\
                <p class="movieName"><a href="/?do=film&id={filmid}&cid={$id}{if $from}&from={$from}{/if}" target="_blank">{name}</a><span class="movies-time">{opendate}上映</span></p>\
                <dl><dt>主演：</dt><dd>{actors}</dd></dl>\
                <dl><dt>导演：</dt><dd>{director}</dd></dl>\
                {e3d1}\
                <dl><dt>时间：</dt><dd>{eori}</dd></dl>\
                {hasTicket1}\
                </div>\
                <div class="ranking cinemaSchedule-ranking">\
                <div class="wrap clearfix">\
                <div class="movies-score">\
                <p class="star"><span style="width:{rating}%"></span></p>\
                <span class="score">{rating_precision}<small>.{rating_scale}</small></span>\
                </div>\
                </div>\
                <p class="db-comment">豆瓣有{numraters}人评价</p>\
                </div>\
                </li> '; 
            var htmlStr = "";
            for(var i=0,len = data.length;i<len;i++){
                if(data[i].e3d){
                    data[i].e3d1 = '<dl><dt>导演：</dt><dd>'+data[i].e3d+'</dd></dl>'
                }else{
                    data[i].e3d1= ""; 
                }
                if(data[i].hasTicket!=0 && data[i].cinemaid && data[i].filmid){
                    data[i].hasTicket1 ='<a class="seat-selection" cid="'+data[i].cinemaid+'" fid="'+data[i].filmid+'" href="#">在线选座</a>';
                }else{
                    data[i].hasTicket1 = ""; 
                }

                if(data[i].rating) {
                    data[i].rating = data[i].rating * 10;
                }
                htmlStr += htmlTemp.mix(data[i]);        
    }
    return htmlStr;
    }
    $("#ticket_grade").live("click",function(){
        $.getJSON("/?do=cinematicket_ajax&cid="+cinemaId+"&o=grade&odir=desc",function(data){
            if(data){
                $("#movie_cinema").html(arrangeHTML(data.data));
            }
        });
        $(this).addClass("cur").siblings().removeClass("cur");
        return false;
    });
    $("#ticket_opendate").live("click",function(){
        $.getJSON("/?do=cinematicket_ajax&cid="+cinemaId+"&o=opendate&odir=desc",function(data){
            if(data){
                $("#movie_cinema").html(arrangeHTML(data.data));
            }
        });
        $(this).addClass("cur").siblings().removeClass("cur");
        return false;
    });


});




})(window.jQuery);
