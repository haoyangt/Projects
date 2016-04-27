;(function(){
$(function(){
    $("#movie_calendar .have").hover(function(){
    $(this).addClass('hover');
//        $(".calendarTab-movieList",$(this)).show();
    },function(){
    $(this).removeClass('hover');
//        $(".calendarTab-movieList",$(this)).hide();
    })
    
    $("#movie_cinemalist h3 a,#movie_cinemalist div.extend ul li a").live("click",function(){
        var oftenCookie  = Qtool.cookie("often");
        var that = $(this);
        var txt = encodeURIComponent(that.parents("li.item").attr("name"));
        var id = that.attr("cid");
        var cookieValue = "";
        if(oftenCookie!=null){
            cookieArr = oftenCookie.split("###"); 
            for(var i=0,len=cookieArr.length;i<len;i++){
                if(cookieArr[i]==(txt+"&&"+id)){return;} 
            }
            if(cookieArr.length>1){
                cookieArr.shift(); 
            }
            cookieArr.push(txt+"&&"+id);
            cookieValue = cookieArr.join("###");
        }else{
            cookieValue = txt +"&&"+ id;
        } 
        Qtool.cookie("often",cookieValue); 
    });
var oftenGo = $("#movie_oftengo");
var arrangeHTML = function(often){
    var oftenArr = often.split("&&");
    $("dd",oftenGo).append("<a href='/ticket/cinemaDetail?cno="+oftenArr[1]+"'>"+decodeURIComponent(oftenArr[0])+"</a>"); 
}
var getOften  = function(){
    var oftenCookie  = Qtool.cookie("often");
    if(oftenCookie!=null){
        cookieArr = oftenCookie.split("###"); 
        $("dd",oftenGo).html("");
        for(var i=0,len=cookieArr.length;i<len;i++){
            arrangeHTML(cookieArr[i]);
        } 
    }else{
        oftenGo.hide(); 
    }
}
getOften();
Qtool.tab({operate:{wrap:'#movie_area .block-tag',eventType:'click',status:'current'},show:{wrap:'#movie_area .block-bd'}});
});
$("#movie_area .block-tag a").live("click",function(){
    return false;
});
Qtool.newsuggest({input:'#movie-search-box',
    nameSpace:'movie_cinema',
    url:'/?do=cinemasug&city='+Qtool.cookie('_citycode')+'&q=',
    key:'name',
    tpls:{base:'<div class="cinema_ediv">{name}</div>'},
style:'#moive_cinema .e_suggest_box{border:1px solid #67b3da;}#moive_cinema .cinema_ediv{padding-left:5px;line-height:22px;}'});
Qtool.newsuggest({input:'#qmovie .movieSearch-txt',
    nameSpace:'cinema_film',
    key:'name',
    url:'/?do=filmsug&city='+city+'&q=',
    tpls:{base:'<div class="cinema_ediv">{name}</div>'},
style:'#cinema_film .e_suggest_box{border:1px solid #67b3da;}#cinema_film .cinema_ediv{padding-left:5px;line-height:22px;}'});
String.prototype.mix = function (data) {
    return this.replace(/\{(\S+?)\}/gi, function (a, b) {
        return typeof data[b] === "undefined" ? a : data[b];
    });
};
$("#cinema_plan .seat-selection,#movie_cinema .seat-selection,#otherlist .seat-selection").live("click",function(){
    $.getJSON("/?do=filmplan4ticket&cid="+$(this).attr("cid")+"&fid="+$(this).attr("fid"),function(data){
        var dataJson = data.data.plans; 
        var strTemplate = '<tr url="{url}"><td>{showtime}<\/td><td>{lg}\/{dimensionanl}<\/td><td class="seat">{hallName}<span>{seatcount}座<\/span><\/td><td class="price">￥{uprice}\/<span>￥{vprice}<\/span><\/td><\/tr>';
        var htmlStr = "";
        if(dataJson){
        for(var i=0,len=dataJson.length;i<len;i++){
            htmlStr += strTemplate.mix(dataJson[i]);                
        }
        $("#movie_seat").html(htmlStr);     
        $("#movie_cinemaname").html(data.data.cinemaName);
        $("#movie_filmname").html(data.data.filmName);
        Qtool.pop({content:$("#movie_seatpop"),popWidth:674,popHeight:452,closeObj:".seatPop-close,#movie_seatpop .seatSub",zindex:9999});
        }else {return false;}
    });  
    return false;
});
$("#movie_seatpop td").live("click",function(){
    $(this).parent().addClass("select").siblings().removeClass("select");
    return false;
});
$("#movie_seatonline,#otherlist .seat-selection").live("click",function(){
    return false;
});
$("#movie_seatpop .seatSub").live("click",function(){
    var selectTr = $("tr.select");
    if(selectTr.length>0){
        window.open(selectTr.attr("url"),"_blank");
    }
    return false;
});

})(window.jQuery);
