$(function() {
	var f = $("#hidGoodsID").val();
	var p = $("#hidCodeID").val();
	var sp = $("#hidSinglePrice").val();
	var sur = $("#hidSurplus").val();
	var m = $("#hidShowTime").val() == "1";
	if (m) {
		$("#divPic").addClass("pPicBor");
		$.getScript("/js/goodstime.js", function() {
			$("#divLotteryTime").StartTimeOut(p);
		});
	} else {
		var d = function(q) {
			$.PageDialog.fail(q)
		};
		var h = function(q) {
			$.PageDialog.ok("<s></s>" + q)
		};
		var l = function(r) {
			$
					.ajax({
						url : "/list/isStatus.action",
						data : "id=" + p,
						success : function(data) {
							if (data == "false") {
								d("\u6dfb\u52a0\u5931\u8d25")
							} else {
								var sgp;
								if(sp > sur){
									sgp = sur;
								}else{
									sgp = sp;
								}
								if (r == 0) {
									var count = parseInt(data);
									var codeid = p;
									var json = getCookie("products");
									if (json == null || json == "") {
										var val = "[{'pId':" + codeid
												+ ",'num':" + sgp + "}]";
										SetCookieByExpires("products", val, 1)
									} else {
										var flag = false;
										json = eval("(" + json + ")");
										$
												.each(
														json,
														function(n, value) {
															if (codeid == value.pId) {
																value.num = (parseInt(value.num) + parseInt(sgp));
																if ((parseInt(value.num) + parseInt(sgp)) > count) {
																	value.num = count
																}
																flag = true
															}
														});
										if (!flag) {
											json.push({
												pId : +codeid,
												num : sgp
											})
										}
										json = JSON.stringify(json);
										SetCookieByExpires("products", json, 1)
									}
									addNumToCartFun(data);
									h("\u6dfb\u52a0\u6210\u529f")
								} else {
									var count = parseInt(data);
									var codeid = p;
									var json = getCookie("products");
									if (json == null || json == "") {
										var val = "[{'pId':" + codeid
												+ ",'num':" + sgp + "}]";
										SetCookieByExpires("products", val, 1)
									} else {
										var flag = false;
										json = eval("(" + json + ")");
										$
												.each(
														json,
														function(n, value) {
															if (codeid == value.pId) {
																value.num = (parseInt(value.num) + parseInt(sgp));
																if ((parseInt(value.num) + parseInt(sgp)) > count) {
																	value.num = count
																}
																flag = true
															}
														});
										if (!flag) {
											json.push({
												pId : +codeid,
												num : sgp
											})
										}
										json = JSON.stringify(json);
										SetCookieByExpires("products", json, 1)
									}
									addNumToCartFun(data);
									location.href = "/mycart/index.html"
								}
							}
						},
						error : function() {
							d("\u6dfb\u52a0\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5")
						}
					});
		};
		var i = function() {
			var q = $("#btnBuyBox");
			q.children("a").eq(0).click(function() {
				l(1);
			});
			q.children("a").eq(1).click(function() {
				l(0);
			});
		};
		$.getScript("/js/pagedialog.js", i);
		var g = $("#divAutoRTime");
		if (g.length > 0) {
			var o = g.attr("time");
			if (o) {
				var e = parseInt(o);
				g
						.html("<p><span>\u9650\u65f6\u63ed\u6653</span>\u5269\u4f59\u65f6\u95f4\uff1a<em>00</em>\u65f6<em>00</em>\u5206<em>00</em>\u79d2</p>");
				var k = function() {
					window.location.replace("/products/" + p + ".html")
				};
				$.getScript("/js/countdownfun.js", function() {
					g.countdowntime(e, k);
				});
				var n = function() {
					$.ajax({
						url : "/list/isStatus.action",
						data : "id=" + p,
						success : function(q) {
							if (q == "false") {
								k();
							}
						}
					})
				};
				setInterval(n, 30000);
			} else {
				var j = g.attr("timeAlt").split("-");
				g
						.html("<p><span>\u9650\u65f6\u63ed\u6653</span>\u63ed\u6653\u65f6\u95f4\uff1a<em>"
								+ j[0]
								+ "</em>\u6708<em>"
								+ j[1]
								+ "</em>\u65e5<em>" + j[2] + "</em>\u70b9</p>")
			}
		}
		var c = function(q) {
			if (q && q.stopPropagation) {
				q.stopPropagation();
			} else {
				window.event.cancelBubble = true;
			}
		};
		var b = $("#prevPeriod");
		b.click(
				function() {
					location.href = "/lotteryDetail/" + $(this).attr("codeid")
							+ ".html"
				}).find("li.fl").click(function(q) {
			c(q);
			location.href = "/u/" + $(this).parent().attr("uweb") + ".html"
		});
		b.find("em.blue").addClass("orange").click(
				function(q) {
					c(q);
					location.href = "/u/"
							+ $(this).parent().parent().parent().attr("uweb")
							+ ".html";
				});
		
		$.getScript("/js/wxshare.js?v=151104", function() {
			//var n = "对不起，这么晚才告诉你！全场1块钱可夺，快点参与";
			var n = "送你一个福利，1元商城全场一元可中奖、花小钱中大奖！";
			var q = $("#hidShareDesc").val();
			var o = $www + "/products/" + p + ".html";
			var p1 = $("#hidShareImg").val();
			wxShareFun({
				shareLink : o,
				shareImg : p1,
				shareDesc : q,
				shareTitle : n,
				showMask : false
			});
			$.getScript("/js/wxshare.js?v=151104", function() {
				$("#btnShare").bind("click", function() {
					wxShowMaskFun();
					return false;
				});
			});
		});
				
	}
	var a = function() {
		$("#divPeriod").touchslider();
		$.getScript("/js/goodspicslider.js", function() {
			$("#sliderBox").picslider();
		});
	};
	$.getScript("/js/periodslider.js", a);
});
