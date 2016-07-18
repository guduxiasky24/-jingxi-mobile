<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="decorator" content="index_template" />
    <title>商品详请</title>
    <meta content="app-id=518966501" name="apple-itunes-app" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link href="/css/goods.css" rel="stylesheet" type="text/css" />
    <script src="/js/goodsinfo.js?v=160110" language="javascript" type="text/javascript"></script>
  </head>
<body class="g-acc-bg">
    <input name="hidGoodsID" type="hidden" id="hidGoodsID" value="${productInfo.productId }" />
    <input name="hidCodeID" type="hidden" id="hidCodeID" value="${productInfo.spellbuyProductId }" />
    <input name="hidSinglePrice" type="hidden" id="hidSinglePrice" value="${productInfo.singlePrice }" />
    <input name="hidSurplus" type="hidden" id="hidSurplus" value="${productInfo.productPrice - productInfo.spellbuyCount}" />
    <input name="hidShowTime" type="hidden" id="hidShowTime" value="0" />
    <input name="hidShareImg" type="hidden" id="hidShareImg" value="<%=ApplicationListenerImpl.sysConfigureJson.getImgUrl()%>${productInfo.headImage}" />
    <input name="hidShareDesc" type="hidden" id="hidShareDesc" value="${productInfo.productName }" />
    <!--微信分享初始参数-->
    <input name="hidAppID" type="hidden" id="hidAppID" value="${appId }" />
    <input name="hidTimeSpan" type="hidden" id="hidTimeSpan" value="${timeSpan }" />
    <input name="hidNonceStr" type="hidden" id="hidNonceStr" value="${nonceStr }" />
    <input name="hidSignature" type="hidden" id="hidSignature" value="${signature }" />
    <div>
        <!--期数列表-->
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
        
        <!-- 产品图 -->
        <div id="divPic" class="pPic">
            <div class="pPic2">
                <div id="sliderBox" class="pImg" style="width: 320px;">
                    <div class="flex-viewport">
                        
                    </div>
                    <ul class="direction-nav">
                        <li class="prev" style="display: block; width: 50px;"></li>
                        <li class="next" style="display: block; width: 50px;"></li>
                    </ul>
                <div class="flex-viewport" style="overflow: hidden; position: relative;">
                	<ul class="slides" style="width: 800%; transition: 0s; transform: translate3d(-155px, 0px, 0px); display: block;">
         				<c:if test="${fn:length(productimageList)!=0}">
	                    	<s:iterator value="productimageList" var="productimages">
	                    		<li><img  width="400" height="400" src="<%=ApplicationListenerImpl.sysConfigureJson.getImgUrl()%>/productImg/imagezoom/${productimages.piProductId  }/${productimages.image }_mid${productimages.imageType }"/></li>
	                    	</s:iterator>
	                   	</c:if>
                     </ul>
                 </div>
                 <ul class="direction-nav">
                 	<li class="prev" style="display: block; width: 50px;"></li><li class="next" style="display: block; width: 50px;"></li>
                 </ul>
                </div>
                <dl id="PicPostion">
                    <dd class="hover"></dd><dd></dd><dd></dd><dd></dd><dd></dd><dd></dd>
                </dl>
            </div>
        </div>
        <!-- 产品信息 -->
        <div class="pro_info">
            <h2 class="gray6">
                (第${productInfo.productPeriod }期)
                ${productInfo.productName}&nbsp;&nbsp;<span>${productInfo.productTitle}</span>
            </h2>
           <div class="purchase-txt gray9 clearfix">
                价值：￥${productInfo.productPrice }.00
            </div>
            <div class="clearfix">
                <div class="g-goods-share fr"><a id="btnShare" href="javascript:;"><p class="z-set1"></p>分享</a></div>
                <div class="gRate">
                    <div class="Progress-bar">
                    <p class="u-progress" title="已完成<fmt:formatNumber type="number" value="${(productInfo.spellbuyCount/productInfo.productPrice)*100 } " maxFractionDigits="2"/> %">
                    <span class="pgbar" style="width:<fmt:formatNumber type="number" value="${(productInfo.spellbuyCount/productInfo.productPrice)*100 } " maxFractionDigits="2"/>%;"><span class="pging"></span></span>
                    </p>
                    <ul class="Pro-bar-li">
                    	<li class="P-bar01"><em>${productInfo.spellbuyCount }</em>已参与</li>
                    	<li class="P-bar02"><em>${productInfo.productPrice }</em>总需人次</li>
                    	<li class="P-bar03"><em>${productInfo.productPrice - productInfo.spellbuyCount}</em>剩余</li>
                    	</ul>
                    </div>
                </div>
            </div>  
        </div>
        <!--本商品已结束-->  

        <div class="ann_btn">
            <!--所有参与记录-->
            <a href="/products/buyrecords-${productInfo.spellbuyProductId  }.html">参与记录<s class="fr"></s></a>
            <!--商品详情-->
            <a href="/products/goodsdesc-${productInfo.spellbuyProductId  }.html">图文详情<em>（建议WIFI下使用）</em><s class="fr"></s></a>
            <!--商品晒单-->
            <a href="/products/goodspost-${productInfo.productId  }.html">商品晒单<s class="fr"></s></a>
        </div>

        
            <div class="pro_foot">
                <a href="javascript:;" id="a_sc" class="z-set z-foot-fans fl"></a>
                <a href="/mycart/index.html" id="btnCart"><i class="fr"></i></a>
                <div id="btnBuyBox"  class="btn" codeid="${productInfo.spellbuyProductId  }">
	                <a href="javascript:;"  style="float: left;width: 43%;" class="orangeBtn">立即1元夺宝</a>
	                <a href="javascript:;" style="float: right;width: 43%;" class="blueBtn">加入购物车</a>

                </div>
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
</body>
</html>