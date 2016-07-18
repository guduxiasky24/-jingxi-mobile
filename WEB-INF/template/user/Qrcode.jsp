<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="decorator" content="index_template" />
    <title>我的二维码</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0"/>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" type="text/css" href="/css/comm.css" />
    <link rel="stylesheet" type="text/css" href="/css/member.css" />
    <style type="text/css">
/* .saom{ width:6.5rem; height:6.5rem; } */

/* @media screen and (min-width:568px) and (max-width:736px){
	.logo{width:18rem}
	.wx dd{ width:30rem;}
	.saom{width:10.9rem;}
}
@media screen and (min-width:375px) and (max-width:480px){
	.wx dd{ width:22rem;}
	.saom{width:8rem;}
} */
    </style>
  </head>
  
<body>
 <div class="h5-1yyg-v1" id="loadingPicBlock">
    
<!-- 栏目页面顶部 -->


<!-- 内页顶部 -->

    <!-- <header class="g-header">
        <div class="head-l">
	        <a href="/user/index.html" onclick="history.go(-1)" class="z-HReturn"><s></s><b>返回</b></a>
        </div>
        <h2>我的二维码</h2>
        <div class="head-r">
	        <a href="/user/index.html" class="z-Member"></a>
        </div>
    </header> -->
    
    <div class="m-simpleHeader" id="dvHeader" style="z-index: 9999">
	    <a href="javascript:;" onclick="history.go(-1)" data-pro="back" data-back="true" class="m-simpleHeader-back"><i class="ico-back"></i></a>
	    <h1>我的二维码</h1>
	</div>
	
	<!-- <img src="/user/QrImg.action" alt="二维码"> <br/>
    <h2>&nbsp;&nbsp;您的推广二维码已经生成成功。  请长按二维码进行保存和分享！</h2> -->
    <dl class="wx">
    	<dd>
		<div class="saom"><img src="/user/QrImg.action" alt="二维码" style="width:350px;">
		
			<table style="min-width:350px;margin-top:40px;" align="center">
				<tr>
					<td align="center" style="padding-top:30px;padding-bottom:30px;"><span style="font-size:24px;line-height:50px;">您的推广二维码已经生成成功。 <br/> 请长按二维码进行保存和分享！</span></td>
				</tr>
			</table>
		</div>
		
		</dd>
    </dl>
</div>
    <%-- <input id="hidPageType" type="hidden" value="4" />
<jsp:include page="/WEB-INF/template/include/footer.jsp">
	<jsp:param name="pageType" value="4"/>
</jsp:include> --%>
</body>
</html>
