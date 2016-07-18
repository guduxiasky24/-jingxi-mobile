<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="decorator" content="index_template" />
    <title>我的<%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>中心_<%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%> 一元<%=ApplicationListenerImpl.sysConfigureJson.getShortName() %> <%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>网</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0"/>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" type="text/css" href="/css/member.css" />
  </head>
  
<body>
 <div class="h5-1yyg-v11">
    
<!-- 栏目页面顶部 -->


<!-- 内页顶部 -->

 <!--   <header class="g-header">
        <div class="head-l">
	        <a href="javascript:;" onclick="history.go(-1)" class="z-HReturn"><s></s><b>返回</b></a>
        </div>
        <h2>我的<%=ApplicationListenerImpl.sysConfigureJson.getShortName() %></h2>
        <div class="head-r">
	        <a href="/" class="z-Home"></a>
        </div>
    </header>
  -->
    <section class="clearfix g-member">
	    <div class="clearfix m-round m-name"><div class="fl f-Himg"><a href="/u/${user.userId }.html" class="z-Himg">
	    <c:choose>
	    	<c:when test="${fn:indexOf(user.faceImg,'http')!=-1}">
	    		 <img src="${user.faceImg }" border=0 />
	    	</c:when>
	    	<c:otherwise>
	    		 <img src="<%=ApplicationListenerImpl.sysConfigureJson.getImgUrl() %>${user.faceImg }" border=0 />
	    	</c:otherwise>
	    </c:choose>
	    </a>
	    
	    </div>
	    <div class="m-name-info"><p class="u-name"><b class="z-name gray01">${user.userName }</b><em>(
	    <s:if test="user.phone!=null">
	        ${user.phone }
        </s:if>
        <s:elseif test="user.mail!=null">
        	 ${user.mail }
        </s:elseif>
        <s:else>
        	 ID:${user.userId }
        </s:else>)</em></p>
		<s:if test="user.commissionPoints<300">
            <span class="z-class-icon01 gray02"><s></s>少尉</span>
           </s:if>
           <s:elseif test="user.commissionPoints<600">
           	<span class="z-class-icon02"><s></s>中尉</span>
           </s:elseif>
           <s:elseif test="user.commissionPoints<1200">
           	<span class="z-class-icon03"><s></s>上尉</span>
           </s:elseif>
           <s:elseif test="user.commissionPoints<2400">
           	<span class="z-class-icon04"><s></s>少校</span>
           </s:elseif>
           <s:elseif test="user.commissionPoints<4800">
           	<span class="z-class-icon05"><s></s>中校</span>
           </s:elseif>
           <s:elseif test="user.commissionPoints<9600">
           	<span class="z-class-icon06"><s></s>上校</span>
           </s:elseif>
           <s:elseif test="user.commissionPoints<19200">
           	<span class="z-class-icon07"><s></s>大校</span>
           </s:elseif>
           <s:elseif test="user.commissionPoints<38400">
           	<span class="z-class-icon07"><s></s>少将</span>
           </s:elseif>
           <s:elseif test="user.commissionPoints<76800">
           	<span class="z-class-icon07"><s></s>中将</span>
           </s:elseif>
            <s:elseif test="user.commissionPoints<5000000">
           	<span class="z-class-icon07"><s></s>上将</span>
           </s:elseif>
		   经验值 <span class="orange2">${user.commissionPoints }</span>
		</div>
		</div>
		<ul class="clearfix u-mbr-info">
	    <li><a href="/user/MemberPoints.html"><span class="orange3">${user.commissionPoints }</span>可用福分 </a></li>
	    <li><a href="/user/UserBalance.html"><span class="orange3">￥${user.balance}</span>余额  </a></li>
		<a href="/user/UserRecharge.html" class="fr z-Recharge-btn">去充值</a>
		</ul>
	    <div class="m-round m-member-nav">
		    <ul id="ulFun">
		        <!-- <li><a href="/user/Userwelfarepor.html"><b class="z-arrow"></b><s2 class="user-arrow0"></s2>福利大放送</a></li>-->
		    	<li><a href="/user/UserBusiness.html"><b class="z-arrow"></b><s2 class="m_s10"></s2>商家代理中心</a></li>
			    <li><a href="/user/UserBuyList.html"><b class="z-arrow"></b><s2 class="m_s1"></s2>我的夺宝记录</a></li>
			    <li><a href="/user/OrderList.html"><b class="z-arrow"></b><s2 class="m_s2"></s2>获得的商品</a></li>
               <!-- <li><a href="/user/MemberPoints.html"><b class="z-arrow"></b>我的福分</a></li>               
                <li><a href="/user/CommissionQuery.html"><b class="z-arrow"></b>佣金明细</a></li>
				<li><a href="/user/UserBalance.html"><b class="z-arrow"></b>帐户明细</a></li>-->
			    <li><a href="/user/PostSingleList.html"><b class="z-arrow"></b><s2 class="m_s3"></s2>我的晒单</a></li>
				<li><a href="/user/MemberPoints.html"><b class="z-arrow"></b><s2 class="m_s4"></s2>我的福分</a></li> 
				<li><a href="/user/ShareList.html"><b class="z-arrow"></b><s2 class="m_s5"></s2>分享赚钱 <span class="orange8"><%=ApplicationListenerImpl.sysConfigureJson.getInvite()%>福分和<%=ApplicationListenerImpl.sysConfigureJson.getCommission()*100%>%现金奖励等你来拿！</span></a></li>
				<li><a href="/help/index.html"><b class="z-arrow"></b><s2 class="m_s6"></s2>帮助中心</a></li> 
				<li><a href="/user/AddressList.html"><b class="z-arrow"></b><s2 class="m_s7"></s2>收货地址管理</a></li>
			    <li><a href="/user/SafeSettings.html?userId=${user.userId }"><b class="z-arrow"></b><s2 class="m_s8"></s2>安全设置</a></li>
				<li><a href="/logout/index.html"><b class="z-arrow"></b><s2 class="m_s9"></s2>退出登录</a></li>
		    </ul>
	    </div>
    </section>
</div>
<jsp:include page="/WEB-INF/template/include/footer.jsp">
	<jsp:param name="pageType" value="4"/>
</jsp:include> 
</body>
</html>
