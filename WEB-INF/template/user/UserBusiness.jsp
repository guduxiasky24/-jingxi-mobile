<%@page import="com.eypg.util.UserNameUtil"%>
<%@page import="com.eypg.util.UnicodeUtil"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta name="decorator" content="index_template" />
<title>商家中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<link rel="stylesheet" type="text/css" href="/css/comm2.css?v=11" />
<link rel="stylesheet" type="text/css" href="/css/member2.css" />
<link rel="stylesheet" type="text/css" href="/css/sharelist2.css" />
</head>
<body>
	<header class="g-header">
	<div class="head-l">
		<a href="/user/index.html" class="z-HReturn"><s></s><b>返回</b></a>
	</div>
	<h2>商家中心</h2>
	<div class="head-r">
		<a href="/user/index.html" class="z-Member"></a>
	</div>
	</header>
	<div class="businessall">
		<img src="/Images/business.png"/>
		<div class="businessuser">
			<img src="${user.faceImg}"/>
			<%-- <p><%=UnicodeUtil.decodeUnicode(UserNameUtil.convertEmojiToWechat(UserNameUtil.getUserName(request)))%></p> --%>
			<p>
			<s:if test="user.agentState==1">
			${agentType}
			</s:if>
			<s:else>
			<s:if test="user.experience<10000">
            <span class="z-class-icon01 gray02"><s></s><%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>小将</span>
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
			</s:else>
			</p>
		</div>
		<div class="businessbottom">
			<span class="businessp1">今日收益：${thisTodaySum}&nbsp;&nbsp;&nbsp;&nbsp;</span>|<span class="businessp2">累计收益：${user.commissionCount}</span>
		</div>
	</div>
	<section class="clearfix">
		<div class="m-business-nav">
		    <ul>
		    	<li><a id="shopstate" href="javascript:void(0);"><b class="z-arrow"></b><span class="user-arrow9">申请成为授权代理商</span></a></li>
			    <li><a id="usershop" href="/user/ActivityShop.html?shopUserId=${ashop.fkUserId}"><b class="z-arrow"></b><span class="user-arrow8">我的店铺</span></a></li>
			    <li><span class="span-arrow1">店铺名：<div id="shopNameSpan"></div></span><span id="openshopame" class="span-arrow2">修改店铺</span></li>
		    </ul>
	    </div>
	    <div id="modifybusiness" class="divbusiness" style="display:none">
			<ul>
				<li><span>新店铺名：</span><b id="shopamename"  class="reviewtip2">（如：财神）</b></li>
				<li><input id="newshopame" class="newshopame" type="text" maxlength="10" size="10" placeholder="请输入新店铺名" value="${ashop.name}"/></li>
				<li><input id="okshopame" class="modifyshopame" type="button" value="确认修改" /> <input id="closeshopame" class="modifyshopame2" type="button" value="取消修改" /></li>
			</ul>
		</div>
    </section>
	<section class="clearfix">
	<!-- <div class="mission">
		<h3>代理系统中心</h3>
		<div class="businessCon">
			<div class="struserfri">
				<div class="userfri1 userfri">
					<p>一级</p>
					<p class="userfrip">提成：4%</p>
					<p>
						人数：<b>...</b>
					</p>
				</div>
				<div class="userfri2 userfri">
					<p>二级</p>
					<p class="userfrip">提成：3%</p>
					<p>
						人数：<b>...</b>
					</p>
				</div>
				<div class="userfri3 userfri">
					<p>三级</p>
					<p class="userfrip">提成：2%</p>
					<p>
						人数：<b>...</b>
					</p>
				</div>
			</div>
		</div> -->
		<div class="m-business-nav1">
		    <ul id="ulFun">
		    	<%-- <li><a id="usermargin" href="/user/ActivityShop.html?shopUserId=${ashop.userId}"><b class="z-arrow"></b><span class="user-arrow3">我的推广页面</span></a></li>
		    	<li><a id="usermargin" href="/user/MyShopProduct.action"><b class="z-arrow"></b><span class="user-arrow3">我的推广产品</span></a></li> --%>
		    	<li><a id="userrules" href="/user/ShareList.html"><b class="z-arrow"></b><span class="user-arrow0">分享赚钱</span></a></li>
                <li><a href="javascript:alert('拼命开发中');"><b class="z-arrow"></b><span class="user-arrow7">我的二维码</span></a></li>
		    	<li><a id="usermargin" href="javascript:;" onclick="goUserMargincall()"><b class="z-arrow"></b><span class="user-arrow3">我的保证金</span></a></li>
		    	<li><a id="userrules3" href="javascript:;"><b class="z-arrow"></b><span class="user-arrow0">代理商机制<b class="usertip">（必读）</b></span></a></li>
		    	<div id="userrules2" style="display:none" class="busirel">
					<h3>申请成为代理商的好处</h3>
					<ol>
						<li>1、<%=ApplicationListenerImpl.sysConfigureJson.getSaitName() %>首推代理商功能 本着平等 共赢 发展 创新 共同开拓市场为宗旨！</li>
						<li>2、申请成为代理商。获得更大的佣金提成！拥有独立的入口和独立推广二维码！</li>
						<li>3、亲赶紧行动吧！全国以县为单位的申请机制，先到先得！</li>
						<li>4、结算机制，由此代理商推广的用户为代理商推广用户!</li>
						<li>5、终身拥有授权代理机制，发放授权牌匾和证书，最高获得27%佣金。</li>
						<li>6、拥有独立的代理功能，由代理商推荐产生的会员都归算到代理商名下坐着赚钱：</li>
						<!-- <ol class="welfareol">
							<li><b>★</b>如：代理商推荐了张三，张三推荐了李四，李四推荐了王五，王五消费量1000元，那么李四提成40元 张三提成30元 代理商提成20元+180元.以此类推！</li>
							<li><b>★</b>一级4%、二级3%、三级2%。</li>
						</ol> -->
						<li>7、招募100位精英代理</li>
						<ol class="welfareol">
							<li><b></b>代理商分为：</li>
							<s:iterator value="#request.agentGradeList">
								<li><b>★</b>${name}：${commissionRate}% &nbsp;需交纳保证金${bailMoney}元</li>					
							</s:iterator>
						</ol>
						<li>8、市场开拓营销支持 线下各类营销活动互动，礼品奖品支持 公司委派市场营销人员不定时指导工作！</li>
						<li>全国统一客服电话：</li>
						<p>最终解释权归 | 果子狸科技</p>
					</ol>
				</div>
                <li><a id="openbuneimg" href="javascript:;"><b class="z-arrow"></b><span class="user-arrow7">如何获得代理佣金</span></a></li>
                <div id="closebuneimg" style="display: none;" class="closebune"><img src="/Images/help5.png"></div>
		    	<!-- <li><a href="/user/ShareList.html"><b class="z-arrow"></b><span class="user-arrow4">分享赚钱</span></a></li> -->
			</ul>
	    </div>
	</div><input id="userstate" type="hidden" value="${user.agentState}"/>
	<input id="userstate1" type="hidden" value="${user.faceImg}"/>
	</section>
	<script type="text/javascript">
	function goUserMargincall(){
		if($("#userstate").val() == "1"){	//*************保证金userwithdra
			location.href = "/user/UserMargincall.html";
		}else if($("#userstate").val() == "0"){
				alert("审核中...敬请谅解");
		}else{
				alert("无权查看，请先申请成为代理商！");
		}
	} 
	$(function(){
		$("#usershop").bind("click",function(){
			//if($("#userstate").val() == "1"){
			//	location.href = "/user/UserMyshop.html";
			//}
			if($("#userstate").val() == "1"){
				return true;
			}else{
				alert('您当前还不是代理会员');
				return false;
			}
		});
		var u = $("#userrules3");
		u.bind("click",function(){
			$("#userrules2").fadeToggle(500);
		});
		if($("#userstate").val() == "1"){	//*************申请
			$("#shopstate").remove();
		}else if($("#userstate").val() == "0"){
			$("#shopstate").bind("click",function(){	//审核中
				alert("审核中...敬请谅解");
			});
		}else if($("#userstate").val() == "" || $("#userstate").val() == "2" ){
			$("#shopstate").bind("click",function(){	//初次申请和审核失败
				location.href = "/user/UserReview.html";
			});
		}
		
		if($("#userstate").val() == "1"){	//*************申请提现
			$("#userwithdra").bind("click",function(){
				location.href = "/user/UserWithdrawal.html";
			});
		}else if($("#userstate").val() == "0"){
			$("#userwithdra").bind("click",function(){	//审核中
				alert("审核中...敬请谅解");
			});
		}else{
			$("#userwithdra").bind("click",function(){
				alert("无权查看，请先申请成为代理商！");
			});
		}
		var a = $("#openshopame");
		var b = $("#modifybusiness");
		var c = $("#closeshopame");
		var d = $("#openbuneimg");
		var e = $("#closebuneimg");
		a.bind("click",function(){
			if($("#userstate").val() == "1"){
				//alert("玩命开发中...请请谅解");
				b.show();
				a.hide();
			}else{
				alert("无权修改，请先申请成为代理商！");
				return;
			}
		});
		c.bind("click",function(){
			a.show();
			b.hide();
		});
		d.bind("click",function(){
			e.fadeToggle(500);
		});
		var businessData = function(){
			var d = $("#newshopame");
			var e = ["请输入新店铺名"];
			var f = ["（如：财神）"];
			var g = ["请输入有效店铺名","操作成功！","操作失败，请稍后再试！","网络错误，请稍后再试！","新店铺名不少于两个字"];
			var h = $("#okshopame");
			var d1 = $("#shopamename");
			var shopname = /^[\w\u4e00-\u9fa5\-]{1,16}$/;	//昵称筛选
			d.focus(function() {	//店铺判断
				if (d.val() == e[0]) {
					d.val("").removeClass("reviewtip1").addClass("reviewtip2");
				}
			}).blur(function() {
				if (d.val() == "") {
					d1.html(f[0]);
					d.val(e[0]).removeClass("reviewtip2").addClass("reviewtip1");
				}
				if (d.val() != e[0] && !shopname.test(d.val())) {
					d1.html(g[0]).removeClass("reviewtip2").addClass("reviewtip1");
				}else if(d.val() != e[0] ){
					d1.html("").removeClass("reviewtip1").addClass("reviewtip2");
				}
			});
			h.bind("click",function(){
				if (d.val() == e[0] || !shopname.test(d.val())) {	//昵称判断
					$.PageDialog.fail(g[0]);
					return false;	
				}else if(d.val().length < 2){
					$.PageDialog.fail(g[4]);
					return false;
				}
				var UID = $("#userId").val();	//代理商uid
				//“ S” 对应 all传值   修改店铺传值
				var S = {shopname : d.val()};
				var newshopname = $(".newshopame").val();
				$.ajax({
					url : "/user/updateShopName.action",
					data :{
						id:"${ashop.id}",
						shopname:encodeURI(newshopname)
					}, 
					type : "post",
					error : erryFunction, //错误执行方法    
					success : succFunction //成功执行方法 
				});
				function succFunction(data){
					$.PageDialog.ok(data);
					$("#shopNameSpan").val(decodeURI(newshopname));
					$("#closeshopame").click();
					//$(".shopnamespan").html(newshopname);
				}
				function erryFunction(data) {	//网络错误提示
					alert(g[3]);
					location.reload();
				}
			});
		};
		$.getScript("/js/pagedialog.js?v=2015092201", businessData);
	});
</script>
</body>
</html>
