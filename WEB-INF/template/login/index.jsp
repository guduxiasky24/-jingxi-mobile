<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  	<meta name="decorator" content="index_template" />
    <title>登录</title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <meta content="app-id=518966501" name="apple-itunes-app" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link href="/css/login.css" rel="stylesheet" type="text/css" />
    <script src="/js/login.js" language="javascript" type="text/javascript"></script>
  </head>
  
  <body class="g-acc-bg">
   <div class="h5-1yyg-v1" id="content">
   <input type="hidden" id="forward" value="${forward }"/>
   <input name="hidQQAppID" type="hidden" id="hidQQAppID" value="<%=ApplicationListenerImpl.sysConfigureJson.getQqAppId() %>" />
   <input name="hidWxAppID" type="hidden" id="hidWxAppID" value="<%=ApplicationListenerImpl.sysConfigureJson.getWeixinAppId()/*.getWxAppID()*/ %>" />
   <section>
   	<div class="registerCon">
    	        <ul>
        	        <li class="accAndPwd">
            	        <dl><input id="txtAccount" type="text" placeholder="请输入您的手机号码/邮箱" class="lEmail" /><s class="rs4"></s></dl>
                        <dl>
                            <input type="password" id="txtPassword" class="lPwd" placeholder="密码" />
                            <s class="rs3"></s>
                        </dl>
                    </li>
                    <li><a href="javascript:;" id="btnLogin" class="nextBtn  orgBtn">登 录</a><input name="forward" type="hidden" id="forward" value="/user/index.html" /></li>
                    <li class="rSelect"><a href="/getbackpwd/index.html">忘记密码？</a><b></b><a href="/register/index.html">立即注册</a></li>
                </ul>
                <div class="c_login_way wap" style="">
                       <p></p>
                       <span>其他登录方式</span>
                </div>
				<div class="c_rest_way b_rest_way1 wap" style="">
					<%
					if(ApplicationListenerImpl.sysConfigureJson.getQqAppStatus()==0){
					%>
                	<a id="qqlogin" href="javascript:void(0);">
                     <img src="/Images/login2.png" width="20">
                       <i>QQ登录</i>
                    </a>
                    <%
				    }
				    %>
				    <%
				    if(ApplicationListenerImpl.sysConfigureJson.getWxAppStatus()==0){
				    %>
                     <a id="wxlogin" href="javascript:void(0);">
                     <img src="/Images/login3.png" width="26">
                       <i>微信登录</i>
                      </a>
                    <%
				    }
				    %>
                      <!--
                      <a href="javascript:void(0);">
                      <img src="/Images/wb.png" width="27">
                       <i>微博登录</i>
                     </a>
                      -->
                </div>
                
	        </div>
        </section>
</div>

<script language="javascript" type="text/javascript">
$(function(){
	$('#qqlogin').attr('href',"http://openapi.qzone.qq.com/oauth/show?which=ConfirmPage&response_type=code&client_id="
			+ $("#hidQQAppID").val()
			+ "&redirect_uri="
			+ escape($skin +"/qcback.html")
			+ "&state=qq&scope=get_user_info&display=mobile");
	$('#wxlogin').attr('href',"https://open.weixin.qq.com/connect/oauth2/authorize?appid="
			+ $("#hidWxAppID").val()
			+ "&redirect_uri="
			+ escape($www + "/WxTransit.html")
			+ "&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect");
	/* $('#wxlogin').attr('href',"https://open.weixin.qq.com/connect/qrconnect?appid="
			+ $("#hidWxAppID").val()
			+ "&redirect_uri="
			+ escape($www + "/wxback.html")
			+ "&response_type=code&scope=snsapi_login&state=wx#wechat_redirect"); */
	/* $('#wxlogin').attr('href',"https://open.weixin.qq.com/connect/qrconnect?appid="
			+ $("#hidWxAppID").val()
			+ "&redirect_uri="
			+ escape($skin + "/wxback.html")
			+ "&response_type=code&scope=snsapi_login&state=wx#wechat_redirect"); */
});
</script>
</body>
</html>
