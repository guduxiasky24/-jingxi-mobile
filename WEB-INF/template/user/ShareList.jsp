<%@page import="com.eypg.util.CookieUtil"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta name="decorator" content="index_template" />
<title>分享赚钱</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<link rel="stylesheet" type="text/css" href="/css/comm2.css" />
<link rel="stylesheet" type="text/css" href="/css/member2.css" />
<link rel="stylesheet" type="text/css" href="/css/sharelist2.css" />
<script type="text/javascript" src="/js/sharelist.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
</head>
<body>
	<div id="loadingPicBlock">
		<input name="hidAppID" type="hidden" id="hidAppID" value="${appId }" /> 
		<input name="hidTimeSpan" type="hidden" id="hidTimeSpan" value="${timeSpan }" /> 
		<input name="hidNonceStr" type="hidden" id="hidNonceStr" value="${nonceStr }" /> 
		<input name="hidSignature" type="hidden" id="hidSignature" value="${signature }" /> 
		<input name="hidShareLink" type="hidden" id="hidShareLink" value="${shareLink }" />
		<input name="lineLink" type="hidden" id="lineLink" value="${lineLink }" />
		<input name="jsapi_ticket" type="hidden" id="jsapi_ticket" value="${jsapi_ticket }" />
		<div class="wrapper m_share">
			<div class="shareCon">
				<div class="m_banner"></div>
				<dl>
					<dt>邀请好友成功参与<%=ApplicationListenerImpl.sysConfigureJson.getSaitName() %></>后，即可获得6%的佣金！</dt>
					<dd>
						<a id="btnShare" href="javascript:;" class="orangeBtn">立即赚钱</a>
					</dd>
					<dd>
						邀请好友：<em class="orange">${resultCount}</em>
					</dd>
					<dd>
						累计佣金收益：<em class="orange">${user.commissionBalance}</em> 佣金
					</dd>
				</dl>
				<!--loding.....  <div class="struserfri">
					<div class="userfri1 userfri">
						<p>A甲好友</p>
						<p class="userfrip">提成：5%</p>
						<p>
							人数：<b>123</b>
						</p>
					</div>
					<div class="userfri2 userfri">
						<p>B甲好友</p>
						<p class="userfrip">提成：4%</p>
						<p>
							人数：<b>456</b>
						</p>
					</div>
					<div class="userfri3 userfri">
						<p>C甲好友</p>
						<p class="userfrip">提成：3%</p>
						<p>
							人数：<b>789</b>
						</p>
					</div>
				</div> -->
			</div>
			<div class="sub_nav marginB">
				<a class="user-arrow2"href="/user/InvitedList.html">邀请记录<i></i></a>
				<a class="user-arrow1" onclick="cc();">佣金明细<i></i></a>
				<div style="display:none;" id="comqGrade"><a href="CommissionQuery.html?level=1" style="font-size:12px;">一级佣金<i></i></a>
				<a style="font-size:12px;" href="CommissionQuery.html?level=2">二级佣金<i></i></a>
				<a style="font-size:12px;" href="CommissionQuery.html?level=3">三级佣金<i></i></a></div>
				<a id="shareregular1" onclick="aa();" class="user-arrow3" href="javascript:;">邀请规则<span>（必读）</span><b class="z-arrow1f"></b></a>
				<div id="closeproimg1" style="display:none;"><img src="/Images/help5.png"/></div>
				<a id="shareregular2" onclick="bb();" class="user-arrow4" href="javascript:;">如何邀请更多好友<span>（必读）</span><b class="z-arrow1f"></b></a>
				<div id="closeproimg2" style="display:none;"><img src="/Images/help6.png"/></div>
			</div>
			<!--弹出-->
			<div class="m_popUp" id="m_popUp" style="display:none;">
				<div class="m_guide">
					<span></span>
					<div class="m_how">
						<h4>怎么赚钱？</h4>
						<p>1: 点击本页面右上角的三个点的图标</p>
						<p>2: 选择[发送给朋友]或[分享到朋友圈]</p>
						<p>3: 经您邀请的好友，成功参与英雄夺宝后，可获得好友5%的消费提成</p>
					</div>
				</div>
			</div>
			<input id="hidPageType" type="hidden" value="3" />
			<script type="text/javascript">
				var Base = {
					head : document.getElementsByTagName("head")[0] || document.documentElement,
					Myload : function(B, A) {
						this.done = false;
						B.onload = B.onreadystatechange = function() {
							if (!this.done && (!this.readyState || this.readyState === "loaded" || this.readyState === "complete")) {
								this.done = true;
								A();
								B.onload = B.onreadystatechange = null;
								if (this.head && B.parentNode) {
									this.head.removeChild(B)
								}
							}
						}
					},
					getScript : function(A, C) {
						var B = function() {
						};
						if (C != undefined) {
							B = C;
						}
						var D = document.createElement("script");
						D.setAttribute("language", "javascript");
						D.setAttribute("type", "text/javascript");
						D.setAttribute("src", A);
						this.head.appendChild(D);
						this.Myload(D, B);
					},
					getStyle : function(A, B) {
						var B = function() {
						};
						if (callBack != undefined) {
							B = callBack;
						}
						var C = document.createElement("link");
						C.setAttribute("type", "text/css");
						C.setAttribute("rel", "stylesheet");
						C.setAttribute("href", A);
						this.head.appendChild(C);
						this.Myload(C, B);
					}
				}
				function GetVerNum() {
					var D = new Date();
					return D.getFullYear().toString().substring(2, 4) + '.' + (D.getMonth() + 1) + '.' + D.getDate() + '.' + D.getHours() + '.' + (D.getMinutes() < 10 ? '0' : D.getMinutes().toString().substring(0, 1));
				}
				function aa(){$("#closeproimg1").fadeToggle(500);}
				function bb(){$("#closeproimg2").fadeToggle(500);}
				function cc(){$("#comqGrade").fadeToggle(100);}
			</script>
		</div>
	</div>
</body>
</html>
