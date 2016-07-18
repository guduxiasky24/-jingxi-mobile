<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="decorator" content="index_template" />
    <title>验证身份</title>
	<link rel="stylesheet" type="text/css" href="/css/login.css" />
  </head>
  
  <body class="g-acc-bg">
  	<div class="h5-1yyg-v1" id="content">
        <section>
	        <div class="registerCon">
    	        <ul>
        	        <li><input id="mobileCode" type="text" placeholder="请输入手机验证码" class="rText"><s class="rs2"></s></li>
                    <li><a id="btnSubmitVerify" href="javascript:;" class="nextBtn orgBtn">确认，下一步</a></li>
                    <li style="font-size:12px;">如未收到验证短信，请在150秒后点击重新发送。</li>
                    <li><a id="retrySend" class="resendBtn grayBtn">重新发送</a></li>
                </ul>
                <input name="hidRegMobile" type="hidden" id="hidRegMobile" value="${mail}" />
		        <input name="hidRegSN" type="hidden" id="hidRegSN" value="${sn }" />
		        <input name="checkSN" type="hidden" id="checkSN" value="${key }" />
	        </div>
        </section>
 </div>

    <script language="javascript" type="text/javascript" src="/js/findmobilecheck.js"></script>
  </body>
</html>
