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
    <title>商品详情</title>
    <meta content="app-id=518966501" name="apple-itunes-app" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link href="/css/goods.css" rel="stylesheet" type="text/css" />
    <script src="/js/goodsinfo.js" language="javascript" type="text/javascript"></script>
  </head>
<body>
	<input name="hidGoodsID" type="hidden" id="hidGoodsID" value="${productInfo.productId }" />
    <input name="hidCodeID" type="hidden" id="hidCodeID" value="${productInfo.spellbuyProductId }" />
    <input name="hidShowTime" type="hidden" id="hidShowTime" value="1" />
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
        <!--揭晓倒计时-->
        <div id="divLotteryTime" class="Countdown-con clearfix">
            <div class="g-Countdown">
                <p class="orange">已满员，揭晓结果即将公布</p>
                <div>
                    <cite>
                        <span>00</span>
                        <em>:</em>
                        <span>00</span>
                        <em>:</em>
                        <span><i>0</i><i>0</i></span>
                    </cite>
                </div>
            </div>
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
                		<li class="clone" style="width: 210px; float: left; display: block;"><img src="<%=ApplicationListenerImpl.sysConfigureJson.getImgUrl()%>/productImg/imagezoom/${productimages.piProductId  }/${productimages.image }_mid${productimages.imageType }"/></li>
	                </s:iterator>
	              </c:if>
                </ul>
                </div><ul class="direction-nav"><li class="prev" style="display: block; width: 50px;"></li><li class="next" style="display: block; width: 50px;"></li></ul></div>
                <dl id="PicPostion">
                    <dd class="hover"></dd><dd></dd><dd></dd><dd></dd><dd></dd><dd></dd>
                </dl>
            </div>
        </div>
        <!-- 产品信息 -->
        <div class="pro_info">
            <h2 class="gray6">
                
                (第${productInfo.productPeriod }期)
                ${productInfo.productName }<span>${productInfo.productTitle}</span>
            </h2>
           <div class="purchase-txt gray9 clearfix">
                价值：￥${productInfo.productPrice }.00
            </div>
            <div class="clearfix">
                
                <div class="gRate">
                    
                </div>
            </div>
            <!--本商品已结束-->
            
        </div>

        <div class="ann_btn">
            <!--所有参与记录-->
            <a href="/products/buyrecords-${productInfo.spellbuyProductId  }.html">参与记录<s class="fr"></s></a>
            <!--商品详情-->
            <a href="products/goodsdesc-${productInfo.spellbuyProductId  }.html">图文详情<em>（建议WIFI下使用）</em><s class="fr"></s></a>
            <!--商品晒单-->
            <a href="/products/goodspost-${productInfo.productId  }.html">商品晒单<s class="fr"></s></a>
        </div>

        
            <div class="pro_foot">
                <a href="javascript:;" id="a_sc" class="z-set2 z-foot-fans fl"></a>
                <a href="/mycart/index.html" id="btnCart"><i class="fr"></i></a>
                <div class="btn">
                    <ul>
                    	<c:if test="${productInfo.productId !=null}">
      					<li class="conductBtn" codeid="${productInfo.productId }">
      					 <a id="btnGoing" href="javascript:;">第${productJSON.productPeriod }期正在进行中<span class="dotting"></span></a>
      					</li> 
       				 </c:if>
                    </ul>
                </div>
            </div>
        
    </div>
</body>
</html>