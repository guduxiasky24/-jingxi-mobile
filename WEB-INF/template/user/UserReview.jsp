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
<title>代理商家</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<link rel="stylesheet" type="text/css" href="/css/comm2.css" />
<link rel="stylesheet" type="text/css" href="/css/member2.css" />
<script src="/js/jquery190.js" language="javascript" type="text/javascript"></script>
</head>
<body>
	<header class="g-header">
	<div class="head-l">
		<a href="javascript:;" onclick="history.go(-1)" class="z-HReturn"><s></s><b>返回</b></a>
	</div>
	<h2>申请代理商</h2>
	<div class="head-r">
		<a href="/user/UserBusiness.html" class="z-Member"></a>
	</div>
	</header>
	<div class="clearfix businessall">
		<img class="reviewimg" src="/Images/business.png"/>
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
	</div>
	<section class="clearfix g-member">
	<div class="mission">
		<div class="useragents useragents1">
			<div id="openagents" class="maxagents">点击申请</div>
		</div>
		<div id="openagents2" class="useragents" style="display:none">
			<h2>申请资料填写</h2>
			<ul>
				<li>
					<span>等&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</span>
					<s:select list="#request.agentGradeList"  listKey="id" listValue="name" name="gradeId"  headerKey="0" headerValue="请选择代理等级"></s:select >
				</li>
				<li>
					<span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span>
					<input id="realName" name="realName" class="reviewtip2" type="text" maxlength="10" size="10" value="${user.realName}"  placeholder="请输入真实姓名"/>
				</li>
				<li>
					<span>微&nbsp;信号：&nbsp;</span>
					<input id="wechat" name="wechat" class="reviewtip2" type="text"  value="${user.qq}" placeholder="请输入手机号码"/>
				</li>
				<li>
					<span>手&nbsp;机号：&nbsp;</span>
					<input id="mobilePhone" name="mobilePhone" class="reviewtip2" type="text" maxlength="11" size="11" value="${user.mobilePhone}" placeholder="请输入手机号码"/>
				</li>
				<li>
					<span>授权区域：</span>
					<input id="agentAddress" name="agentAddress" style="max-width:40%;" class="reviewtip2" type="text" maxlength="50" value="${user.agentAddress}" placeholder="请输入授权区域"/>
				</li>
				<p>
					<input id="reviewsubmit" class="reviewbtn" type="submit" value="提交申请"/>
					<span id="closeagents" class="reviewbtn2">关闭申请</span>
				</p>
			</ul>
		</div>
		<div class="welfare2 review">
			<h3>申请成为代理商的好处</h3>
			<ol>
				<li><%=ApplicationListenerImpl.sysConfigureJson.getShortName() %>中心_<%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%></>首推代理商功能 本着平等 共赢 发展 创新 共同开拓市场为宗旨！</li>
				<li>申请成为代理商。获得更大的佣金提成！拥有独立的入口和独立推广二维码！</li>
				<li>亲赶紧行动吧！全国以县为单位的申请机制，先到先得！</li>
				<li>结算机制，由此代理商推广的用户为代理商推广用户!</li>
				<li>终身拥有授权代理机制，发放授权牌匾和证书，最高获得27%佣金。</li>
				<li>拥有独立的代理功能，由代理商推荐产生的会员都归算到代理商名下坐着赚钱：</li>
				<!-- <ol class="welfareol">
					<li><b>★</b>如：代理商推荐了张三，张三推荐了李四，李四推荐了王五，王五消费量1000元，那么李四提成40元 张三提成30元 代理商提成20元+180元.以此类推！</li>
					<li><b>★</b>一级4%、二级3%、三级2%。</li>
				</ol> -->
				<li>招募100位精英代理</li>
				<ol class="welfareol">
					<li>代理商分为：</li>
					<s:iterator value="#request.agentGradeList">
						<li><b>★</b>${name}：${commissionRate}%&nbsp;需交纳保证金${bailMoney}元</li>					
					</s:iterator>
				</ol>
				<li>市场开拓营销支持 线下各类营销活动互动，礼品奖品支持 公司委派市场营销人员不定时指导工作！</li>
				<li>全国统一客服电话：400-006-2772</li>
				<p>最终解释权归 | 赫华网络科技</p>
			</ol>
		</div>
	</div><input id="userstate" type="hidden" value="${user.agentState}"/>
	</section>
<script language="javascript" type="text/javascript">
$(function(){
	$("#openagents").click(function(){
		$("#openagents2").show();
		$("#openagents").hide();
	});
	$("#closeagents").click(function(){
		$("#openagents2").hide();
		$("#openagents").show();
	});
	if($("#userstate").val()=="0"){
		$("#openagents2").remove();
		$("#openagents").html("审核中...").unbind("click").show();
	}
	var reviewData = function(){
		//授权资料判断
		var a = $("#realName");	//姓名
		var b = $("#sex");	//性别 ss
		var c = $("#age");	//年龄 ss
		var d = $("#mobilePhone");	//手机号码
		var e = $("#job");	//职业 ss
		var f = $("#location");	//地址   ss
		var g = $("#agentAddress");	//授权区域
		var a1 = $("#name");	//姓名提示
		var c1 = $("#age1");	//年龄提示
		var d1 = $("#phone");	//手机号码提示
		var e1 = $("#professional");	//职业提示
		var f1 = $("#address");	//地址 请输入年龄提示
		var g1 = $("#district");	//授权区域提示
		var h = ["请输入真实姓名","请输入性别","请输入年龄","请输入手机号码","请输入职业","请输入地址","请输入授权区域","申请成功,请等待审核","操作失败，请稍后再试！","网络错误，请稍后再试！"];
		var i = ["姓名只能是汉字，请重新输入","请输入性别，如：男","年龄只能是数字，请重新输入","请输入正确的手机号码","职业最少两个汉字，请重新输入","请输入有效的住址","授权区域只能是汉字，请重新输入"];
		//var meuber = new RegExp("^[0-9]*$");
		var name = /^[\u4E00-\u9FA5]{2,10}$/;	//姓名筛选
		//var sex = /^['男'|'女']$/;	//性别筛选
		var age = /^([0-9])|([1-9][0-9])|([1-9][0-9][0-9])$/;	//年龄筛选
		var phone = /^(((13[0-9]{1})|(15[0-9]{1})|(170)|(18[0-9]{1}))+\d{8})$/;	//手机号筛选
		var professional = /^[\w\u4e00-\u9fa5\-]{1,20}$/;	//职业筛选
		var address = /[\w\u4e00-\u9fa5]/;	//住址筛选
		var district = /^[\u4E00-\u9FA5]{2,30}$/;	//授权区域筛选
		a.focus(function() {	//姓名判断
			if (a.val() == h[0]) {
				a.val("").removeClass("reviewtip1").addClass("reviewtip2");
			}
		}).blur(function() {
			if (a.val() == "") {
				//a1.html(j[0]);
				a.val(h[0]).removeClass("reviewtip2").addClass("reviewtip1");
			}
			if (a.val() != h[0] && !name.test(a.val())) {
				a1.html(i[0]).removeClass("reviewtip2").addClass("reviewtip1");
			}else if(a.val() != h[0] ){
				a1.html("").removeClass("reviewtip1").addClass("reviewtip2");
			}
		});
		d.focus(function() {	//手机号码判断
			if (d.val() == h[3]) {
				d.val("").removeClass("reviewtip1").addClass("reviewtip2");
			}
		}).blur(function() {
			if (d.val() == "") {
				//d1.html(j[3]);
				d.val(h[3]).removeClass("reviewtip2").addClass("reviewtip1");
			}
			if (d.val() != h[3] && !phone.test(d.val())) {
				d1.html(i[3]).removeClass("reviewtip2").addClass("reviewtip1");
			}else if(d.val() != h[3] ){
				d1.html("").removeClass("reviewtip1").addClass("reviewtip2");
			}
		});
		g.focus(function() {	//授权区域判断
			if (g.val() == h[6]) {
				//g1.html(j[6]);
				g.val("").removeClass("reviewtip1").addClass("reviewtip2");
			}
		}).blur(function() {
			if (g.val() == "") {
				//g1.html(j[6]);
				g.val(h[6]).removeClass("reviewtip2").addClass("reviewtip1");
			}
			if ((g.val() != h[6] && !district.test(g.val())) ||(g.val().length < 2)) {
				g1.html(i[6]).removeClass("reviewtip2").addClass("reviewtip1");
			}else if(g.val() != g[6] ){
				g1.html("").removeClass("reviewtip1").addClass("reviewtip2");
			}
		});
		$("#reviewsubmit").click(function(){
			if($("select[name='gradeId']").val()==0){
				$.PageDialog.fail('请选择代理等级');
				return false;
			}
			if (a.val() == h[0] || !name.test(a.val())) {	//姓名判断
				$.PageDialog.fail(i[0]);
				return false;	
			}
			if (d.val() == h[3] || !phone.test(d.val())) {	//手机号码判断
				$.PageDialog.fail(i[3]);
				return false;	
			}
			if (g.val() == h[6] || !district.test(g.val())) {	//授权区域判断
				$.PageDialog.fail(i[6]);
				return false;
			}else if(g.val().length < 2){
				$.PageDialog.fail(i[6]);
				return false;	
			}
			//“ S” 对应 all 传值 申请信息传值
			var S = {
				"gradeId":$("select[name='gradeId']").val(),
				"userId" : ${user.userId},
				"realName" : encodeURI(a.val()),
				"wechat":$("#wechat").val(),
				"mobilePhone" : d.val(),
				"agentAddress" : encodeURI(g.val())
			};
			$.ajax({
				url : '/user/joinAgent.action',
				data : S,
				error : erryFunction, //错误执行方法    
				success : succFunction //成功执行方法 
			});
			function succFunction(flag){
				if(flag=='1'){	//操作成功
					$.PageDialog.ok(h[7]);
					setTimeout(function() {
						location.replace(location.href)
					}, 1000);
				$("#openagents2").remove();
				$("#openagents").html("审核中...").unbind("click").show();
				$("#openbusiness").show();
				} else {	//操作失败
					$.PageDialog.fail(flag);
					setTimeout(function(){
						location.href="/user/UserRecharge.html";
					},2000);
				}
			}
			function erryFunction(data) {	//网络错误提示
				alert(h[9]);
				location.reload();
			}
		});
	};
	$.getScript("/js/pagedialog.js?v=2015092201", reviewData);
});
</script>
</body>
</html>
