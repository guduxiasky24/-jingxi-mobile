<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="com.eypg.util.ApplicationListenerImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
          <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
          <html>
            
            <head>
              <meta name="decorator" content="index_template" />
              <title>福利大放送</title>
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no, maximum-scale=1.0" />
              <meta content="yes" name="apple-mobile-web-app-capable" />
              <meta content="black" name="apple-mobile-web-app-status-bar-style" />
              <meta content="telephone=no" name="format-detection" />
              <link rel="stylesheet" type="text/css" href="/css/comm_copy.css?v=20151115" />
              <link rel="stylesheet" type="text/css" href="/css/index_copy.css" /></head>
            
            <body>
              <div class="h5-1yyg-v1" id="loadingPicBlock">
                <!-- 栏目页面顶部 -->
                <!-- 内页顶部 -->
                <div class="shareall">
                  <div class="sharetop"></span>总计幸运积分(福分)：</div>
                  <div class="sharehb">
                    <h2>${taskmap["commissionPoints"]}</h2></div>
                  <div class="sharebottom">
                    <span class="sharesp1">今日收益：${taskmap["todayAsset"]}</span>
                    <span class="sharesp2">累计收益：${taskmap["allAsset"]}</span></div>
                </div>
                <section class="clearfix g-member">
                  <input id="wel8" type="hidden" value="${taskmap['activity']}">
                  <input id="wel1" type="hidden" value="${taskmap['acquaintance']}">
                  <input id="wel2" type="hidden" value="${taskmap['login']}">
                  <input id="wel3" type="hidden" value="${taskmap['share']}">
                  <input id="wel4" type="hidden" value="${taskmap['subscribed']}">
                  <input id="wel5" type="hidden" value="${taskmap['comm_first']}">
                  <input id="wel6" type="hidden" value="${taskmap['bal_first']}">
                  <input id="wel7" type="hidden" value="${taskmap['invite']}">
                  <div class="mission">
                    <div class="welfare">
                      <ol>
                        <li id="inwel22" class="misimg2">每日登录红包
                          <input id="inwel2" class="inwel1" onclick="getMoney()" type="button" value="未完成"></li>
                      <!--    <li id="inwel33" class="misimg3">
                          <a href="/user/ShareList.html">每日分享到朋友圈
                            <input id="inwel3" class="inwel1" type="button" value="未完成"></a></li>-->
                        <!-- <li class="misimg8"><a href="/user/Useractivity.html">最新活动
                        <input id="inwel8" class="inwel1" type="button"
                        value="未完成">
                        </a></li> -->
                        <%-- <li class="misimg1">
                          <a href="/help/index.html">了解
                            <%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>
                              <input id="inwel1" class="inwel1" type="button" value="未完成" onclick="know()"></a></li>--%>
                          <li id="inwel44" class="misimg4">关注
                            <%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>
                              <input id="inwel4" class="inwel1" type="button" value="未完成"></a></li>
                          <%-- <li class="misimg5">
                            <a href="/list/hot20.html">成功
                              <%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>一次
                                <input id="inwel5" class="inwel1" type="button" value="未完成"></a></li>
                            <li class="misimg6">
                              <a href="/list/hot20.html">每日成功微信或余额支付一次
                                <input id="inwel6" class="inwel1" type="button" value="未完成"></a></li>
                            <li class="misimg7">
                              <a href="/user/ShareList.html">获得好友消费返利
                                <input id="inwel7" class="inwel1" type="button" value="未完成"></a></li>--%>
                      </ol>
                    </div>
                    <div class="welfare2">
                      <h3>活动内容规则</h3>
                      <ol>
                        <li>活动对象：
                          <%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>所有用户。（1元 = 100福分）</li>
                        <li>用户通过完成以上任务，即可获得新手任务的奖励。</li>
                        <li>新手大礼包：</li>
                        <ol class="welfareol">
                          <li>
                            <b>★</b>了解
                            <%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>奖励随机10-300福分。</li>
                          <li>
                            <b>★</b>关注
                            <%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>公众号奖励100福分。</li>
                          <li>
                            <b>★</b>每天登入
                            <%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>可获得一个红包10-300福分。</li>
                          <li>
                            <b>★</b>每天一次分享好友或朋友圈奖10-300幸运币。</li>
                          <li>
                            <b>★</b>邀请好友佣金奖励5%，人数不封顶。</li>
                          <li>
                            <b>★</b>成功参加
                            <%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>一次 奖励10-300福分</li>
                          <li>
                            <b>★</b>成功充值支付一次奖励10-300幸运币</li>
                          <li>
                            <b>★</b>成功邀请好友并成功参加
                            <%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>一次10-300福分</li>
                          <li>
                            <b>★</b>奖品多多幸运多多！奖励直接发放至用户帐户上，请注意查收。</li>
                        </ol>
                        <li>本活动最终解释权归
                          <%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%>所有。</li></ol>
                      <p>声明：本活动的奖励与苹果公司（apple lnc）无关！</p>
                    </div>
                  </div>
                </section>
                <!--弹出-->
                <div class="m_popUp" id="m_popUp" style="display:none;">
                  <div class="m_guide">
                    <span></span>
                    <div class="m_how">
                      <h4>怎么赚钱？</h4>
                      <p>1: 点击本页面右上角的三个点的图标</p>
                      <p>2: 选择[发送给朋友]或[分享到朋友圈]</p>
                      <p>3: 经您邀请的好友，成功参与幸运go后，可获得好友6%的消费提成</p>
                    </div>
                  </div>
                </div>
                <!-- 关注二维码 -->
                <div id="cart_gz" class="cart_gz">
                  <div class="cart_gz2">
                    <img src="/Images/cart_gz.jpg" />
                    <p>请长按二维码关注
                      <%=ApplicationListenerImpl.sysConfigureJson.getSaitName()%></p></div>
                </div>
                <!-- 每日弹窗 -->
                 <div id='everymoney' class="m_popUp" style="display:none">
                  <div id='everymoney1' class="everymoney">
                    <span class="everymoney2">每日红包</spaeverymoney4n>
                    <span class="everymoney3">恭喜发财-幸运中奖！</span>
                    <span class="everymoney4">立即领取</span></div>
                </div>
                <script language="javascript" type="text/javascript">//福利中心
                  $(function() {
                    //判断是否完成的取值
                    var w1 = $("#wel1").val();
                    var w2 = $("#wel2").val();
                    var w3 = $("#wel3").val();
                    var w4 = $("#wel4").val();
                    var w5 = $("#wel5").val();
                    var w6 = $("#wel6").val();
                    var w7 = $("#wel7").val();
                    var w8 = $("#wel8").val();
                    //需要相应改变的变量
                    var i1 = $("#inwel1");
                    var i2 = $("#inwel2");
                    var i3 = $("#inwel3");
                    var i4 = $("#inwel4");
                    var i5 = $("#inwel5");
                    var i6 = $("#inwel6");
                    var i7 = $("#inwel7");
                    var i8 = $("#inwel8");
                    if (w1 == 1) { //了解
                      i1.removeClass('inwel1').addClass('inwel2').val("已完成");
                    }
                    if (w2 == 1) { //每日红包
                      i2.removeClass('inwel1').addClass('inwel2').val("已完成");
                    } else {
                      $("#everymoney").show();
                      $(".m_popUp").css({
                        'width': '100%',
                        'height': '100%',
                        'position': 'fixed',
                        'z-index': 100,
                        'top': 0,
                        'background': 'rgba(0,0,0,0.8)'
                      });
                      $(".everymoney").css({
                        'width': 220,
                        'height': 150,
                        'top': '50%',
                        'left': '50%',
                        'margin-left': -110,
                        'margin-top': -75,
                        'position': 'fixed',
                        'background': '#ff0000',
                        'border-radius': 10
                      });
                    }
                    if (w3 == 1) { //每日分享
                      i3.removeClass('inwel1').addClass('inwel2').val("已完成");
                    }
                    if (w4 == 1) { //关注幸运go
                      i4.removeClass('inwel1').addClass('inwel2').val("已完成");
                    }
                    if (w5 == 1) { //成功幸运go1次
                      i5.removeClass('inwel1').addClass('inwel2').val("已完成");
                    }
                    if (w6 == 1) { //成功微信支付1次
                      i6.removeClass('inwel1').addClass('inwel2').val("已完成");
                    }
                    if (w7 == 1) { //获得好友充值返利
                      i7.removeClass('inwel1').addClass('inwel2').val("已完成");
                    }
                    if (w8 == 1) { //获得好友充值返利
                      i8.removeClass('inwel1').addClass('inwel2').val("已完成");
                    }
                    $("#inwel44").click(function() { //else关注
                      $("#cart_gz").show();
                    });
                    $("#cart_gz").click(function() {
                      $("#cart_gz").hide();
                    });
                  });
                  </script>
            </body>
          
          </html>