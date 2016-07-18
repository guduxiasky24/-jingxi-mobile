<%@page import="com.eypg.util.UserNameUtil"%>
<%@page import="com.eypg.util.UnicodeUtil" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta name="decorator" content="index_template" />
<title>申请提现</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<link rel="stylesheet" type="text/css" href="/css/comm2.css" />
<link rel="stylesheet" type="text/css" href="/css/member2.css" />
</head>
<body>
	<header class="g-header">
	<div class="head-l">
		<a href="javascript:;" onclick="history.go(-1)" class="z-HReturn"><s></s><b>返回</b></a>
	</div>
	<h2>我的保证金</h2>
	<div class="head-r">
		<a href="/user/index.html" class="z-Member"></a>
	</div>
	</header>
	<div class="margincall">
		<div class="margintop">
			缴费时间：${shop.addTime}
		</div>
		<div class="margintop">
			合约时间：${shop.startTime}到${shop.endTime}
		</div>
		<div class="marginhb">
			<h3>￥:${shop.deposit }元</h3>
		</div>
	</div>
	<section class="clearfix g-member">
	<div class="mission">
		<div id="openagents2" class="useragents">
			<h2>申请资料预览</h2>
			<ul>
				<li>
					<span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span>
					<input id="realName" readonly="readonly" class="reviewtip1" type="text" value="<%=UnicodeUtil.decodeUnicode(UserNameUtil.convertEmojiToWechat(UserNameUtil.getUserName(request)))%>"/>
				</li>
				<li>
					<span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
					<input id="sex" readonly="readonly" class="reviewtip1" type="text" value="${user.sex}"/>
				</li>
				<li>
					<span>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</span>
					<input id="age" readonly="readonly" class="reviewtip1" type="text" value="${user.age}"/>
				</li>
				<li>
					<span>手&nbsp;机号：&nbsp;</span>
					<input id="mobilePhone" readonly="readonly" class="reviewtip1" type="text" value="${user.mobilePhone}"/>
				</li>
				<li>
					<span>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</span>
					<input id="job" readonly="readonly" class="reviewtip1" type="text" value="${user.job}"/>
				</li>
				<li>
					<span>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</span>
					<input id="location" readonly="readonly" class="reviewtip1" value="${user.location}"/>
				</li>
				<li>
					<span>授权区域：</span>
					<input id="agentAddress" readonly="readonly" class="reviewtip1" value="${user.agentAddress}"/>
				</li>
				<p>
					<input id="reviewsubmit" class="reviewbtn" type="submit" value="申请退款"/>
				</p>
			</ul>
		</div>
	</div>
	</section>
	<script>
	$(function(){
		$(".reviewbtn").click(function(){
			if(confirm('确认要退回保证金吗?退回后将取消您的代理商资格')){
				$.ajax({
					url : "/user/returnDeposit.action",
					data:{
						id:"${shop.id}"
					},success:function(result){
						alert(result);
					}
				})
			}
			})
	})
	</script>
</body>
</html>
