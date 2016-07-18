<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="decorator" content="index_template" />
    <title>揭晓结果</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="app-id=518966501" name="apple-itunes-app" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link href="/css/goods.css" rel="stylesheet" type="text/css" />
    <script src="/js/lotterydetail.js" language="javascript" type="text/javascript"></script>
  </head>
<body class="g-acc-bg">
<div> 
    <input name="hidGoodsID" type="hidden" id="hidGoodsID" />
    <input name="hidCodeID" type="hidden" id="hidCodeID" />
   <!--期数信息--> 
	<div id="divPeriod" class="pNav">
            <div class="loading"><b></b>正在加载</div>
            <ul class="slides">
                <c:forEach items="${productPeriodList}" var="entry" varStatus="i" begin="0" end="18">
                    <c:choose>
                        <c:when test="${entry.key==productInfo.productPeriod}">
                            <li class="cur"><a href="javascript:;">第${productInfo.productPeriod }期</a><b></b></li>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${i.index==0 }">
                                    <li ><a href="/products/${entry.value}.html">第${entry.key }期</a><b></b></li>
                                </c:when>
                                <c:otherwise>
                                     <li><a href="/products/${entry.value}.html">第${entry.key }期</a><b></b></li>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </c:forEach> 
            </ul>
        </div> 
   <!--获得者信息--> 
   <div class="bgColor-white clearfix"> 
    <div class="g-winn-con clearfix"> 
     <div class="winn-info clearfix"> 
      <p class="fl"> <a href="/u/${latestlottery.userId }.html">
      	<img src="<%=ApplicationListenerImpl.sysConfigureJson.getImgUrl()%>${latestlottery.userFace }" /></a> 
      </p> 
      <dl class="gray9"> 
       <dt> 
        <a href="/u/${latestlottery.userId }.html" class="blue">${latestlottery.userName }</a>
       </dt> 
       <dd>
        本期参与： 
        <i class="orange"> ${latestlottery.buyNumberCount }</i>人次 
       </dd> 
       <dd>
        幸运云购码： 
        <i class="orange">${latestlottery.randomNumber}</i> 
       </dd> 
       <dd class="ann-time">
        揭晓时间： ${fn:substring(latestlottery.announcedTime,0,10) }&nbsp;&nbsp;${fn:substring(latestlottery.announcedTime,11,23) }
       </dd> 
      </dl> 
      <div class="rNowTitle">
       获得者
      </div> 
      <!--分享
      <div class="z-share-right"> 
       <a id="btnShare" class="colorbbb" href="javascript:;"> <i class="z-set"></i> 分享</a> 
      </div> --> 
     </div> 
    </div> 
   </div> 
   <!--商品信息--> 
   <div class="announced-detail clearfix"> 
    <ul> 
     <li class="fl ann-pic"> 
     	<img src="<%=ApplicationListenerImpl.sysConfigureJson.getImgUrl()%>${latestlottery.productImg }" />
     </li> 
     
     <li class="ann-con gray9"> 
     	<p class="gray6">(第${latestlottery.productPeriod }期)${latestlottery.productName }</p>
     		价值：￥${latestlottery.productPrice }.00
     </li> 
    </ul> 
   </div> 
   <div class="ann_btn clearfix"> 
    <!--商品详情--> 
    <a href="/products/goodsdesc-${latestlottery.spellbuyProductId }.html">图文详情<em>（建议WIFI下使用）</em>
     <s class="fr"></s></a> 
    <!--计算详情--> 
    <a href="/lotteryDetail/calResult-${latestlottery.spellbuyProductId }.html">计算详情
     <s class="fr"></s></a> 
    <!--所有参与记录--> 
    <a href="/products/buyrecords-${latestlottery.spellbuyProductId }.html">参与记录
     <s class="fr"></s></a> 
    <!--商品晒单--> 
    <a href="/products/goodspost-${latestlottery.productId }.html">商品晒单
     <s class="fr"></s></a> 
   </div> 
   <div class="pro_foot clearfix"> 
    <!--  <a href="javascript:;" id="a_sc" class="z-set z-foot-fans fl"></a> -->
    <a href="/mycart/index.html" id="btnCart"><i class="fr"></i></a> 
    <div class="btn"> 
     <ul> 

      <c:if test="${productJSON.productId !=null}">
      <li class="conductBtn" codeid="${productJSON.productId }">
      	 <a id="btnGoing" href="javascript:;">第${productJSON.productPeriod }期正在进行中<span class="dotting"></span></a>
      </li> 
        </c:if>
     </ul> 
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
	<!-- 浮动结束 -->
  </div>
</body>
</html>