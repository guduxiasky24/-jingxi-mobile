var ShareUrl = "";
var ShareTitle = "";
var EHad = null;
$(function() {
	var d = "http://skin.1ypg.com";
	var c = $("#hidRefTitle");
	var b = $("#txtInfo");
	var a = function() {
		var l = $www;
		l += "/share.html?uid=";
		var f = $("#btnCopy");
		ShareTitle = "我刚发现一个很好很好玩的网站，1元就能买IPhone 哦，快去看看吧！";
		var k = function() {
			if (c.val() == "") {
				c.val(ShareTitle)
			}
			b.val(c.val() + "\n" + ShareUrl);
			var g = function(n) {
				try {
					window.clipboardData.clearData();
					window.clipboardData.setData("Text", n);
					OKDialog("\u590d\u5236\u6210\u529f\uff01")
				} catch (m) {
				}
			};
			f
					.click(function() {
						if (/(msie\s|trident.*rv:)([\w.]+)/
								.test(navigator.userAgent.toLowerCase())) {
							var m = new RegExp("\n", "g");
							g(b.val().replace(m, ""))
						} else {
							$
									.PageDialog(
											'<dl class="sAltFail"><dd>\u5bf9\u4e0d\u8d77\uff0c\u60a8\u4f7f\u7528\u7684\u662f\u975eIE\u6838\u5fc3\u6d4f\u89c8\u5668\uff0c\u8bf7\u624b\u52a8\u590d\u5236\u5185\u5bb9\u3002</dd></dl>',
											{
												W : 408,
												H : 50,
												autoClose : true
											});
							b.select()
						}
					});
			f.show();
			$.getScript($skin + "/js/bdshare.js")
		};
		var e = $("#hidUID").val();
		if (parseInt(e) > 0) {
			var h = function() {
				return l + e
			};
			var i = function(g) {
				if (g.urls.length > 0 && g.urls[0].result) {
					ShareUrl = g.urls[0].url_short;
					k()
				}
			};
			$.get("/getshorturl.html?uid=" + h() + "&callback=?", i)
		} else {
			ShareUrl = l;
			k()
		}
		var j = function() {
			var g = function(n, o) {
				$(n).parent().remove()
			};
			this.off = function(n, o) {
				g(n, o)
			}
		};
		EHad = new j();
		$("#ColseMessage").click(function() {
			EHad.off($(this), 1)
		})
	};
	a()
});