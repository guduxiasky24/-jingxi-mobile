<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="index_template" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%></title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <link href="/css/index.css?v=151106" rel="stylesheet" type="text/css" />
    <script id="pageJS" data="/js/index.js" language="javascript" type="text/javascript"></script>
</head>
<body fnav="3">
	<!-- 头部 -->
    <div class="h5-1yyg-index" id="loadingPicBlock">
        <!--app广告-->
        <input name="hidAppType" type="hidden" id="hidAppType" value="0" />
        <div class="app-icon-wrapper">
            <div id="divDownApp" class="app-icon" style="display: none;">
                <a id="downLink" href="javascript:;" target="_blank">
                    <img src="http://mskin.1yyg.com/weixin/images/download-app.jpg" alt="一元云购" width="320" height="50" /></a>
                <a href="javascript:;" class="close"></a>
            </div>
        </div>
        <!-- 焦点图 -->
        <section id="sliderBox" class="hotimg">
            <div class="loading clearfix"><b></b>正在加载</div>
        </section>
		
		<!-- 最新揭晓 -->
    <section class="g-main">
	    <div class="m-tt1">
		    <h2 class="fl"><a href="/lottery/index.html">最新揭晓</a></h2>
		    <div class="fr u-more">
			    <a class="u-rs-m1" href="/lottery/index.html"><b class="z-arrow"></b></a>
		    </div>
	    </div>
	    <article class="h5-1yyg-w310 m-round m-lott-li" >
	    	<ul class="clearfix"  id="divLottery">
	    		<s:iterator var="latestlotterys" value="latestlotteryList">
	    			<li>
		                <a href="/lotteryDetail/${latestlotterys.spellbuyProductId }.html" class="u-lott-pic">
		                    <img src="/Images/pixel.gif" src2="<%=ApplicationListenerImpl.sysConfigureJson.getImgUrl()%>${latestlotterys.productImg }" border="0" alt="">
		                        <div class="pPurchase" style='display:none'>限购</div>
                          </a>
                        <p><em>获得者</em><span><a href="/u/${latestlotterys.userId }.html" class="blue z-user">${latestlotterys.buyUser}</a></span></p>
			        </li>
		        </s:iterator>
	    	</ul>
<!--	    <div id="154145" class="m-lott-conduct"><p class="z-lott-tt">(第2980期)小米（MIUI） 红米1S 3G手机 移动版 <b class="z-arrow"></b><span class="z-lott-time">揭晓倒计时<span class="minute">00</span>:<span class="second">17</span>:<span class="millisecond">7</span><span class="last">6</span></span></p></div>-->
<!--	    <div id="154415" class="m-lott-conduct"><p class="z-lott-tt">(第9855期)小米（MIUI）10400mAh移动电源<b class="z-arrow"></b><span class="z-lott-time">正在计算,请稍后...</span></p></div>-->
<!--	    <div id="130949" class="m-lott-conduct"><p onclick="location.href='/lottery/detail-130949.html'">恭喜<span class="z-user blue">不会中奖的命</span>获得 (第596期)闪迪（SanDisk）酷捷 (CZ51)16GB U盘 <b class="z-arrow"></b></p></div>-->
		    <%-- <ul class="clearfix">
		        <s:iterator var="latestlotterys" value="latestlotteryList">
			        <li>
		                <a class="u-lott-pic" href="/lotteryDetail/${latestlotterys.spellbuyProductId }.html">
		                	<img border="0" class="scrollLoading" data-url="<%=ApplicationListenerImpl.sysConfigureJson.getImgUrl()%>${latestlotterys.productImg }" src="/Images/pixel.gif" />
		                </a>
		                <span style="color:#fff; text-decoration:underline;">恭喜<a class="blue z-user" href="/u/${latestlotterys.userId }.html">${latestlotterys.buyUser}</a>获得</span>
			        </li>
		        </s:iterator>
		    </ul> --%>
	    </article>
    </section>
		
		
        <!--导航-->
        <input name="hidOrderFlag" type="hidden" id="hidOrderFlag" value="hot20" />
        <nav id="goodsNav" class="nav-wrapper">
            <div class="nav-inner">
                <ul id="ulOrder" class="nav-list clearfix">
				    <li order="hot20" class="current" ><a href="javascript:;"><span>人气</span></a></li>
                    <li order="date20"><a href="javascript:;"><span>最新</span></a></li>
                    <li order="surplus20"><a href="javascript:;"><span>即将揭晓</span></a></li>
                    <li type="price" order="priceAsc20"><a href="javascript:;"><span>价值</span></a></li>
                </ul>
            </div>
            <!--点击添加或移除current-->
            <div id="divSort" class="select-btn">
                <span class="select-icon">
                    <i></i><i></i><i></i><i></i>
                </span>
                分类
            </div>
            <!--分类-->
            <div class="select-total" style="display: none">
                <ul class="sort_list">
                    <li sortid="" class="all"><a href="javascript:;">全部分类</a></li>
                  <s:iterator var="protype" value="protypeList">
                    <li sortid="<s:property value='#protype.typeId'/>"><a href="javascript:;"><s:property value='#protype.typeName'/></a></li>
                  </s:iterator>
                    <!-- <li sortid="100" class="phone"><a href="javascript:;">手机数码</a></li>
                    <li sortid="106" class="computer"><a href="javascript:;">电脑办公</a></li>
                    <li sortid="104" class="device"><a href="javascript:;">家用电器</a></li>
                    <li sortid="2" class="makeup"><a href="javascript:;">化妆个护</a></li>
                    <li sortid="222" class="watches"><a href="javascript:;">钟表首饰</a></li>
                    <li sortid="397"><a href="javascript:;">食品饮料</a></li>
                    <li sortid="312" class="other"><a href="javascript:;">其他商品</a></li>
                    <li sortid="400" class="purchase"><a href="javascript:;">限购专区</a></li> -->
                </ul>
            </div>
        </nav>
        <!--商品列表-->
        <div class="goods-wrap marginB">
            <ul id="ulGoodsList" class="goods-list clearfix"></ul>
            <div class="loading clearfix"><b></b>正在加载</div>
        </div>	
	</div>
	<!-- 浮动按钮 -->
	<div id="div_fastnav" class="fast-nav-wrapper">
		<ul class="fast-nav">
			<li id="li_menu"><a href="javascript:;"><i class="nav-menu"></i></a></li>
			<li id="li_top" style="display: none;" onclick="topClick()"><a href="javascript:;" ><i class="nav-top"></i></a></li>
		</ul>
		<div class="sub-nav six" style="display:none;">
			<a href="/index.html"><i class="home"></i>1元商城</a>
			<a href="/lottery/index.html"><i class="announced"></i>最新揭晓</a>
			<a href="/share/new20.html"><i class="single"></i>晒单</a>
			<a href="/user/index.html"><i class="personal"></i>我的</a>
			<a href="/mycart/index.html"><i class="shopcar"></i>购物车</a>
			<a href="javascript:;" id="a_subscribe"><i class="follow"></i>关注微信号</a>
		</div>
	</div>
	<div id="pageDialogBG" class="pageDialogBG" style="height: 6825px; display: none;"></div>
	<div id="pageDialog" class="pageDialog" style="width: 300px; height: 300px; position: fixed; left: 10px; top: 90px; display: none;">
	<div class="index-code-wrap">
		<h6>长按识别二维码</h6>
		<div class="code"><img src="../Images/index-code.jpg" alt="1元云购官方微信"></div>
		<a href="javascript:;" class="close-code">
			<i class="z-set1"></i>
		</a>
	</div>
</div>
	<script>
		var dl=$(".sub-nav");
		$('#li_menu').click(function(){
		if(dl.css("display")=='none'){
			dl.show();			
			}else{
			dl.hide();
			}
		});
		var follow=$(".pageDialog");
		var bg=$(".pageDialogBG");
		$('#a_subscribe').click(function(){
		if(follow.css("display")=='none'){
			follow.show();	
			bg.show();
			dl.hide();		
			}else{
			follow.hide();
			bg.hide();
			}
		});
		$('#pageDialog').click(function(){
			follow.hide();
			bg.hide();
			});
	</script>
	<script>
	window.onload = function(){
  	var oTop = $("#li_top");
  	var top = $("#top");
  	window.onscroll = function(){
    		var t = document.documentElement.scrollTop || document.body.scrollTop;  
		if( t > 100 ) { 
			oTop.show();
		} else { 
			oTop.hide();
		}
  	}
	}; 
   function topClick(){
    document.documentElement.scrollTop = document.body.scrollTop =0;
  } 
</script>

  <input id="hidPageType" type="hidden" value="0" />
<jsp:include page="/WEB-INF/template/include/footer.jsp">
	<jsp:param name="pageType" value="0"/>
</jsp:include> 
<script language="javascript" type="text/javascript">
var $indexImg = ${indexImgList };
</script>
</body>
</html>
