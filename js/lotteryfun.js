$(function() {
	var u = null;
	var w = 100;
	var B = 0;
	var s = {
		FIdx : 1,
		EIdx : w,
		isCount : 1
	};
	var y = $("#divLotteryLoading");
	var q = $("#btnLoadMore");
	var p = false;
	var z = function(a) {
		if (a && a.stopPropagation) {
			a.stopPropagation()
		} else {
			window.event.cancelBubble = true
		}
	};
	var A = function() {
		var b = function() {
			return "pageNo=" + s.FIdx + "&pageSize=" + s.EIdx + "&isCount="
					+ s.isCount
		};
		var a = function() {
			y.show();
			$
					.ajax({
						url : "/lottery/getLotteryList.action",
						data : b(),
						success : function(g) {
							if (g != "") {
								var h = g;
								if (s.isCount == 1) {
									B = h.length
								}
								var e = h.length;
								for (var i = 0; i < e; i++) {
									var f = h[i].userFace.indexOf("http") != -1 ? h[i].userFace
											: $img + h[i].userFace;
									var c = '<ul id="'
											+ h[i].spellbuyProductId
											+ '"><li class="revConL">'
											+ (h[i].announcedType == 1 ? '<span class="z-limit-tips">\u9650\u65f6\u63ed\u6653</span>'
													: "")
											+ '<img src="'
											+ $img
											+ h[i].productImg
											+ ' "><cite><em>第'+h[i].productPeriod+'云</em><i></i></cite></li><li class="revConR"><dl>'
											+'<dt>\u83b7\u5f97\u8005<strong>\uff1a</strong><a name="uName" uweb="'
											+h[i].userId
											+'" class="blue">'
											+ h[i].userName
											+ '</a></dt>'
											+'<dd>\u5546\u54c1\u4ef7\u503c<strong>\uff1a</strong>￥'
											+ h[i].productPrice
											+'</dd>'
											+ '<dd>\u672c\u671f\u4e91\u8d2d<strong>\uff1a</strong><em class="orange arial">'
											+ h[i].buyNumberCount
											+ '</em>\u4eba\u6b21</dd>'
											+'<dd class="jx_time">\u63ed\u6653\u65f6\u95f4\uff1a'
											+ h[i].announcedTime
											+ '</dd></li></ul>';
									var d = $(c);
									d
											.click(
													function() {
														location.href = "/lotteryDetail/"
																+ $(this).attr(
																		"id")
																+ ".html"
													})
											.find('img[name="uImg"]')
											.click(
													function(j) {
														location.href = "/u/"
																+ $(this).attr(
																		"uweb");
														z(j)
													});
									d.find('a[name="uName"]').click(
											function(j) {
												location.href = "/u/"
														+ $(this).attr("uweb")
														+ ".html";
												z(j)
											});
									y.before(d)
								}
								if (s.EIdx >= B) {
									p = false;
									q.show()
								}
							}
							y.hide()
						}
					})
		};
		this.getInitPage = function() {
			a()
		};
		this.getNextPage = function() {
			s.FIdx += 1;
			s.EIdx = w;
			s.isCount = 1;
			a()
		}
	};
	q.click(function() {
		if (!p) {
			p = true;
			q.hide();
			u.getNextPage()
		}
	});
	u = new A();
	u.getInitPage();
	var x = ",";
	var o = false;
	var v = 0;
	var t = $("#divLottery");
	var r = function() {
		$.ajax({
			url : "/lottery/lotteryproductutilList.html",
			data : "json=" + new Date().getTime(),
			success : function(b) {
				if (b != null) {
					a(b)
				}
				setTimeout(r, 5000);
			}
		});
		var a = function(b) {
			var c = function(e) {
				for (var g = e.length - 1; g > -1; g--) {
					var f = e[g];
					if (x.indexOf("," + f.lotteryProductId + ",") < 0) {
						x += f.lotteryProductId + ",";
						var d = $('<ul class="rNow rFirst" id="'
								+ f.lotteryProductId
								+ '"><li class="revConL"><img src="'
								+ $img
								+ f.lotteryProductImg
								+ '"></li><li class="revConR"><h4>(\u7b2c'
								+ f.lotteryProductPeriod
								+ "\u671f)"
								+ f.lotteryProductName
								+ "</h4><h5>\u4ef7\u503c\uff1a\uffe5"
								+ CastMoney(f.lotteryProductPrice)
								+ '</h5><p name="pTime"><s></s>\u63ed\u6653\u5012\u8ba1\u65f6 <strong><em>00</em> : <em>00</em> : <em>0</em><em>0</em></strong></p><b class="fr z-arrow"></b></li><div class="rNowTitle">\u6b63\u5728\u63ed\u6653</div></ul>');
						d.click(function() {
							location.href = "/products/" + $(this).attr("id")
									+ ".html"
						});
						t.prepend(d);
						d.next().removeClass("rFirst");
						d.StartTimeOut(f.lotteryProductId,
								parseInt(f.lotteryProductEndDate))
					}
				}
			};
			if (o) {
				c(b)
			} else {
				$.getScript("/js/lotterytime.js", function() {
					o = true;
					c(b)
				})
			}
		}
	};
	$.getScript("/js/comm.js", r)
});
