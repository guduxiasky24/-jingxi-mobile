<%@page import="com.eypg.service.UserService"%>
<%@page import="com.eypg.util.CookieUtil"%>
<%@page import="com.eypg.pojo.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta name="decorator" content="index_template" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<link href="/Images/touch-icon.png" rel="apple-touch-icon-precomposed" />
<link href="favicon.ico" rel="shortcut icon" />
<link href="/css/index2.css?v=20151225" rel="stylesheet" type="text/css" />
<link href="/css/useractivity.css?v=2015122523" rel="stylesheet"
	type="text/css" />
<link href="/css/goods2.css?v=2" rel="stylesheet"
	type="text/css" />
<script src="/js/jquery190.js" language="javascript"
	type="text/javascript"></script>
<script language="javascript" type="text/javascript"
	src="/js/index.js?data=20151225"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="/js/wechat/jweixin.js?v=4"></script>
<script type="text/javascript">
var p = 1;
	(function() {
		weinog.share.title = "一元幸运购，惊喜天天有！微信授权认证，品质保证！";
		weinog.share.desc = "微信邀您一起一元幸运购,首次免费抢iphone 6s等商品！";
		weinog.share.link = "http://m.weinog.com/user/ActivityShop.html?userId=<%=CookieUtil.getCookieValue(request, "userId")%>";
		weinog.share.imgUrl = "http://m.weinog.com/help1/images/20151212151919shareimg.jpg";
		weinog.share.success = function() {
			$.ajax({
				url : "/asset/activityShare.htm",
				type : "GET",
				dataType : "text",
				//error : erryFunction, //错误执行方法    
				success : succFunction
			//成功执行方法 
			});
			function succFunction(data) {
				if(data!='0'){
					alert("分享成功,获得"+data+"个幸运币,请到个人中心中查看");
				}else{
					alert("分享成功");
				}
			}
		};
		weinog.share.cancel = function() {
			alert("取消分享");
		};
	})();
	function loadNextPage(){
	++p;
		//ajax获取推荐产品
		$.ajax({
			url:"/user/activityShopByAjax.action",
			data:{
				pageNo:p
			},
			success:function(result){
			var r="";
				$.each(result,function(i,n){
					var c = ((n.currentBuyCount/n.productPrice)*100).toFixed(2);
					r+=('<li id="'+n.productId+ '"><span class="z-Limg"><a class="u-lott-pic" href="/products/'+n.productId +'.html"><img class="scrollLoading" src="'+n.headImage+'"/></a></span><div class="goodsListR">'
						+'<h2>'+(n.productName.length>13?(n.productName.substring(0,13)+'...'):n.productName)+'</h2><div class="pRate"><div class="Progress-bar"><p class="u-progress"><span style="width:'+c+'%;" class="pgbar"><span class="pging"></span></span></p><ul class="Pro-bar-li"><li class="P-bar01"><em>'+n.currentBuyCount+'</em>已参与</li><li class="P-bar02"><em>'+n.productPrice+'</em>总需人次</li> <li class="P-bar03"><em>'+(n.productPrice - n.currentBuyCount)+'</em>剩余</li> </ul> </div> </div> </div> <div class="Progress-right"> <a class="Prole" href="/products/'+n.productId+'.html">一元幸运go</a> <a id="btn_userpatty" name="btn_userpatty" class="Prori" href="#">分享好友再抢一次</a></div></li>');
				})
				 $(".goodsList").append(r);
			}
		})
	}
</script>
<title><%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%></title>
<style>
.Progress-right{
	       padding-top: 8px;
    padding-bottom: 5px;
	    width: 98%;
}
.goodsList .goodsListR .pRate{
	margin-top: 8px;
}
.list_p {
    margin-top: 5px;
}
.goodsList .goodsListR {
    margin-left: 150px;
}.goodsList span.z-Limg {
    width: 125px;
    padding-top: 8px;
    padding-left: 8px;
    height: 125px;
}.goodsList span img {
    width: 125px;
    height: 125px;
}.goodsList .goodsListR h2 {
    padding-top: 31px;
    padding-bottom: 18px;
}.activityshop li .Progress-right {
    width: 98%;
}
</style>
</head>

<body>
	<div id="loadingPicBlock" class="h5-1yyg-v1">
		<!-- 栏目页面顶部 -->
		<header class="header">
		<h1 class="fl">
			<span><%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>一元抽奖</span><a
				href="/"></a>
		</h1>
		<div class="fl u-slogan"></div>
		<div class="fr head-r">
			<a class="z-Member" href="/user/index.html"></a> <a class="z-shop"
				href="/mycart/index.html" id="btnCart"></a>
		</div>
		</header>
		<!-- 内页顶部 -->
		<input type="hidden" value="0" id="hidStartAt" name="hidStartAt" />
		<!-- 焦点图 -->
		<section id="sliderBox" class="hotimg"></section>
		<!-- 热门推荐 -->
		<section class="g-main">
		<div class="m-tt1">
			<h2 class="fl">
				<a href="/list/m1.html">热门推荐</a>
			</h2>
			<div class="fr u-more">
				<a class="u-rs-m1" href="/list/m1.html"><b class="z-arrow"></b></a>
			</div>
		</div>
		<article class="clearfix m-round activityshop">
		<ul id="ulActivity" class="goodsList">
			<s:iterator var="hotProduct" value="hotProductList" status="index">
				<li id="${hotProduct.productId }">
				<span class="z-Limg">
				<a class="u-lott-pic" href="/products/${hotProduct.productId }.html">
						<img class="scrollLoading" data-url="${hotProduct.headImage }" src="/Images/defaultUserFace.png"/>
				</a>
				</span>
					<div class="goodsListR">
						<h2><s:property value="productName.length()>13?productName.substring(0,13)+'...':productName" /></h2>
						<div class="pRate">
							<div class="Progress-bar">
								<p class="u-progress">
									<span
										style="width:<fmt:formatNumber type="number" value="${(hotProduct.currentBuyCount/hotProduct.productPrice)*100 }" maxFractionDigits="2"/>%;"
										class="pgbar"><span
										class="pging"></span></span>
								</p>
								<ul class="Pro-bar-li">
									<li class="P-bar01"><em>${hotProduct.currentBuyCount}</em>已参与</li>
									<li class="P-bar02"><em>${hotProduct.productPrice}</em>总需人次</li>
									<li class="P-bar03"><em>${hotProduct.productPrice - hotProduct.currentBuyCount}</em>剩余</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="Progress-right">
								<a class="Prole" href="/products/${hotProduct.productId }.html">一元幸运go</a>
								<a id="btn_userpatty" name="btn_userpatty" class="Prori"
									href="#">分享好友再抢一次</a>
							</div>
				</li>
				
			</s:iterator>
		</ul>
		<p><center><a href="javascript:loadNextPage()">加载更多</a></center></p>
		</article> </section>
	</div>
	<!--弹出123-->
	<div class="m_popUp" id="m_popUp" style="display:none;">
		<div class="m_guide">
			<span></span>
			<div class="m_how">
				<h4>怎么分享好友？</h4>
				<p>1: 点击本页面右上角的三个点的图标</p>
				<p>2: 选择[发送给朋友]或[分享到朋友圈]</p>
				<p>3: 经您邀请的好友，成功参与幸运go后，您可获得一次免费抢购机会</p>
			</div>
		</div>
	</div>
	<c:if test="${user.openid != null && (user.subscribed == null || user.subscribed == 0)}">
	<!-- *关注判断*提示弹出框 strat -->
	<div class="nowopen" id="nowopen">
		<ul class="tbox">
			<li><a href="#"><span class="img_wrap"> <img
						src="/Images/icoweinog.png"></span></a></li>
			<li style="width:100%;">
				<p>关注幸运go，实时了解开奖详情！</p>
			</li>
			<li>
				<div class="topin">
					<a id="opengz" href="javascript:;">立即关注</a> <a href="javascript:;"
						id="icoclose" class="close"></a>
				</div>
			</li>
		</ul>
	</div>
	</c:if>
	<!-- 弹出框 end -->
	<!-- 二维码-->
	<div id="cart_gz" class="cart_gz">
		<div class="cart_gz2">
			<img src="/Images/cart_gz.jpg" />
			<p>
				请长按二维码关注幸运go<br />实时了解开奖详情！
			</p>
		</div>
	</div>
	<script language="javascript" type="text/javascript">
		var $indexImg = ${indexImgList };
	</script>
	<script language="javascript" type="text/javascript">
		//每日红包
		//stick the footer at the bottom of the page if we're on an iPad/iPhone due to viewport/page bugs in mobile webkit 
		if (/iphone|ipad|ipod/i.test(navigator.userAgent)) {
			$("#app3").css("position", "static");
		};
	<%if (request.getAttribute("islogin") != null) {%>
		$("#everymoney").show();
	<%}%>
		$(function() {
			var q = function() {
				var e = $indexImg;
				var c = $("<ul/>");
				c.addClass("slides");
				var h = "";
				for (var i = 0; i < e.length; i++) {
					var d = '<li style="background-color: rgb(f, f, f); width: 1903px; float: left; display: block;" class="clone"><a href="'
						+ e[i].proUrl
						+ '"><img width="640" height="110"  src="'
						+ $img
						+ e[i].proImg + '"></a></li>';
					c.append(d);
				}
				var g = $("#sliderBox");
				g.append(c).flexslider();
			};
			$.getScript("/js/flexslider.js", q);
		});
		$(function() {
			//活动登陆红包,仅限首次
			$.ajax({
				url : "/asset/activity.html",
				type : "GET",
				dataType : "text",
				//error : erryFunction, //错误执行方法    
				success : succFunction
			//成功执行方法 
			});
			function succFunction(data) {
			}
			function erryFunction(data) {
			}

			//分享弹窗
			var f = $("#m_popUp");
			$("[name=btn_userpatty]").click(function() {
				f.fadeToggle(800, function() {
					f.show();
				});
			});
			f.click(function() {
				f.fadeToggle(500, function() {
					f.hide();
				});
			});
			/*关注判断*/
			$("#opengz").click(function() {
				$("#cart_gz").show();
			});
			$("#cart_gz").click(function() {
				$("#nowopen").hide();
				$("#cart_gz").hide();
			});
			$("#icoclose").click(function() {
				$("#nowopen").hide();
			});
		});
	</script>
	<!-- 每日红包弹窗  -->
	<%-- <div id='everymoney' class="m_popUp" style="display: none">
		<div id='everymoney1' class="everymoney">
			<span class="everymoney2">每日红包</span> <span class="everymoney3">恭喜发财-幸运中奖！</span> <span class="everymoney4">立即领取</span>
		</div>
	</div> --%>
	<script language="javascript" type="text/javascript"
		src="/js/jquery.scrollloading-min.js"></script>
</body>
</html>