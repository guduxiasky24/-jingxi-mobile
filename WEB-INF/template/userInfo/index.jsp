<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="decorator" content="index_template" />
    <title>个人主页</title>
	<meta content="app-id=518966501" name="apple-itunes-app" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link href="/css/star.css" rel="stylesheet" type="text/css" />
    <script src="/js/userindex.js" language="javascript" type="text/javascript"></script>
  </head>
  
  <body>
    <div class="h5-1yyg-v1">
   <section>
	<div class="mainCon">
    	<div class="mBanner">
        	<ul>
            	<li class="mUserHead">
            		<c:choose>
				    	<c:when test="${fn:indexOf(user.faceImg,'http')!=-1}">
				    		 <img src="${user.faceImg }"/>
				    	</c:when>
				    	<c:otherwise>
				    		 <img src="<%=ApplicationListenerImpl.sysConfigureJson.getImgUrl() %>${user.faceImg }"/>
				    	</c:otherwise>
				    </c:choose>
            	</li>
            	<li class="mUserInfo"><p>${user.userName }</p><b></b><br/>经验值：${user.experience }
            	<s:if test="user.experience<10000">
		            <span class="z-class-icon01"><s></s><%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>小将</span>
	            </s:if>
	            <s:elseif test="user.experience<50000">
	            	<span class="z-class-icon02"><s></s><%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>少将</span>
	            </s:elseif>
	            <s:elseif test="user.experience<100000">
	            	<span class="z-class-icon03"><s></s><%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>中将</span>
	            </s:elseif>
	            <s:elseif test="user.experience<500000">
	            	<span class="z-class-icon04"><s></s><%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>上将</span>
	            </s:elseif>
	            <s:elseif test="user.experience<1000000">
	            	<span class="z-class-icon05"><s></s><%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>少校</span>
	            </s:elseif>
	            <s:elseif test="user.experience<2000000">
	            	<span class="z-class-icon06"><s></s><%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>中校</span>
	            </s:elseif>
	            <s:elseif test="user.experience<5000000">
	            	<span class="z-class-icon07"><s></s><%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>上校</span>
	            </s:elseif>
            	</li>
            </ul>
        </div>
        <div class="g-snav" id="divMidNav">
        	<span class="g-snav-lst mCurr"><a href="javascript:;"><%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>记录</a></span>
            <span class="g-snav-lst"><a href="javascript:;">获得的商品</a></span>
            <span class="g-snav-lst"><a href="javascript:;">晒单</a></span>
        </div>
        <input name="hdUserID" type="hidden" id="hdUserID" value="${user.userId }" />
        <!--<%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>记录-->
        <div id="divBuyRecord" class="mBuyRecord">
        
        </div>
        <!--获得商品-->
        <div id="divGetGoods" class="mBuyRecord" style="display:none">
   
        </div>
        <!--晒单-->
        <div id="divSingle" class="mSingle" style="display:none">
        	<ul>
             
            </ul>
        </div>
        <a id="btnLoadMore" class="loading" href="javascript:;" style="display:none;">点击加载更多</a>
        <div id="divLoading" class="loading"><b></b>正在加载</div>
    </div>
</section>
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
<!-- 浮动结束 --> 
  </div>
</body>
</html>
