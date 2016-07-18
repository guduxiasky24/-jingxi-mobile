<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta name="decorator" content="index_template" />
    <title>佣金提现</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0"/>
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" type="text/css" href="/css/comm.css" />
    <link rel="stylesheet" type="text/css" href="/css/invite.css" />
    <script language="javascript" type="text/javascript" src="/js/mentionapply.js?data=201510291"></script>
  </head>
  
<body class="g-acc-bg">
<div class="h5-1yyg-v1" id="loadingPicBlock">
	<div class="commission-con gray6">
            <p class="gray6">佣金余额：<em class="orange" id="emCurrMoney">${user.commissionBalance}</em>元<i class="colorbbb">需满100元才可以申请哦</i></p>
            <ul class="gray9">
                <!--文本框默认提示颜色是 bbbbbb, 输入之后的颜色是 666666-->
                <li>
                    <span>提现金额：</span>
                    <input id="txtMoney" type="text" placeholder="请输入大于100正整数" />
                </li>
                <li>
                    <span>开&nbsp;&nbsp;户&nbsp;&nbsp;人：</span>
                    <input id="txtUserName" type="text" placeholder="如：张三" />
                </li>
                <li>
                    <span>银行名称：</span>
                    <input id="txtBank" type="text" placeholder="如：中国工商银行" />
                </li>
                <!-- <li>
                    <span>开户城市：</span>
                    <select id="selectAreaP"></select>
                    <b></b>
                    <select id="selectAreaC"></select>
                </li> -->
                <li>
                    <span>支行名称：</span>
                    <input id="txtSubBank" type="text" placeholder="请输入支行名称" />
                </li>
                <li>
                    <span>银行账号：</span>
                    <input id="txtAccount" type="text" maxlength="19" />
                </li>
                <li>
                    <span>联系电话：</span>
                    <input id="txtPhone" type="text" maxlength="15" />
                </li>
            </ul>
            <a id="btnSubmit" href="javascript:;" class="orangeBtn">确认</a>
       </div>
       <div class="weixin-mask" style="display:none;"></div>
	<input id="hidPageType" type="hidden" value="-1" />
</div>
	
</body>
</html>
