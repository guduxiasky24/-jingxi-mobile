<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="decorator" content="index_template" />
    <title>注册</title>
	<meta content="app-id=518966501" name="apple-itunes-app" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link href="/css/login.css" rel="stylesheet" type="text/css" />
    <script src="/js/register.js" language="javascript" type="text/javascript"></script>
  </head>
  
 <body class="g-acc-bg">
    <div class="h5-1yyg-v1" id="content">
        <section>
        <div class="registerCon">
	        <ul>
    	        <li><input id="userMobile" type="tel" name="userName" placeholder="请输入您的手机号码" class="rText"><s class="rs1"></s></li>
                <li><a id="btnNext" class="nextBtn  orgBtn">下一步</a></li>
                <li><span id="isCheck"><em></em>我已阅读并同意</span><a href="/help/agreement.html"><%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>用户服务协议</a></li>
            </ul>
        </div>
        </section>
        
   </div>
 </body>
</html>
