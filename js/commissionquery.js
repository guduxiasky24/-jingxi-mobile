$(function() {
	var b = function() {
		var w = $("#divList");
		var C = $("#divLoad");
		var D = $("#btnLoadMore");
		var E = $("#btnRecharge");
		var z = $("#btnConsumption");
		var A = $("#userId").val();
		var F = false;
		var l = false;
		var y = 10;
		var x = null;
		var B = null;
		var r = 0;
		var a = false;
		var q = false;
		var s = false;
		var v = $("#loadDataType").val() === "1";
		var level = $("#hidLevel").val();
		var G = function() {
			var c = 0;
			var e = {
				FIdx : 1,
				EIdx : y,
				isCount : 1
			};
			var d = function() {
				return "pageNo=" + e.FIdx + "&pageSize=" + e.EIdx + "&isCount="
						+ e.isCount + "&userId=" + A + "&level=" + level
			};
			var f = function() {
				C.show();
				$
						.ajax({
							url : "/user/CommissionQueryAjaxPage.action",
							data : d(),
							success : function(h) {
								if (h.length > 0) {
									var k = "";
									if (e.isCount == 1) {
										e.isCount = 0;
										c = h.length;
										k = '<dt><span>用户名</span><span>时间</span><span>云购金额(￥)</span><span>佣金(￥)</span></dt>';
									}
									var j = h;
									var g = j.length;
									for ( var i = 0; i < g; i++) {
										k += '<dd class="'
												+ (i + 1 == g ? "bornone" : "")
												+ '"><span><a href="#" class="blue"><em>'
												+ j[i].userName
												+ '</em></a></span><span>'
												+j[i].date
												+'</span><span>'
												+ j[i].buyMoney
												+'</span><span>+'
												+ j[i].commission
												+ "</span></dd>";
									}
									if (e.FIdx > 1) {
										w.children("dd").last().removeClass(
												"bornone");
									}
									w.append(k);
									if (e.EIdx >= c) {
										D.show()
									} else {
										s = true;
										D.hide()
									}
								} else {
									if (e.FIdx == 1) {
										w.append(Gobal.NoneHtml);
										s = true;
										D.hide()
									}
								}
								C.hide();
								l = true;
								a = false
							}
						})
			};
			this.initPage = function() {
				f()
			};
			this.getNextPage = function() {
				e.FIdx += 1;
				e.EIdx = y;
				f()
			}
		};
		B = new G();
		B.initPage();
		D.click(function() {
			if (!a) {
				a = true;
				D.hide();
				B.getNextPage()
			}
		})
	};
	$.getScript("/js/comm.js?v=130826", b)
});
