$(function() {
	var h = $www;
	var j = $("#userMobile");
	var g = $("#btnNext");
	var f = $("#isCheck");
	var i = function() {
		var v = 0;
		var y = "";
		var iCodeValid=false;
		var b = function(k) {
			var l = /^\d+$/;
			return l.test(k)
		};
		var t = function(k) {
			var l = /^1\d{10}$/;
			return l.test(k)
		};
		var u = {
			txtStr : "\u8bf7\u8f93\u5165\u60a8\u7684\u624b\u673a\u53f7\u7801",
			ishad : "\u5df2\u88ab\u6ce8\u518c\uff0c\u8bf7\u66f4\u6362\u624b\u673a\u53f7\u7801",
			error : "\u8bf7\u8f93\u5165\u6b63\u786e\u7684\u624b\u673a\u53f7\u7801",
			many : "\u9a8c\u8bc1\u7801\u8bf7\u6c42\u6b21\u6570\u8fc7\u591a\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5",
			retry : "\u9a8c\u8bc1\u7801\u53d1\u9001\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5",
			ok : "\u8be5\u53f7\u7801\u53ef\u4ee5\u6ce8\u518c"
		};
		var A = {
			txtStr : "\u4e0b\u4e00\u6b65",
			checkNO : "\u6b63\u5728\u9a8c\u8bc1",
			sendCode : "\u6b63\u5728\u53d1\u9001\u9a8c\u8bc1\u7801"
		};
		var x = function(k) {
			$.PageDialog.fail(k)
		};
		var e = function() {
			if (!isLoaded || v != 2 ||!iCodeValid) {
				return
			}
			var k = y;
			var l = function(m) {
				location.replace("/register/mobilecheck.html?phone=" + k);
				return;
				isLoaded = true;
				g.html(A.txtStr).removeClass("grayBtn").bind("click", z)
			};
			isLoaded = false;
			g.html(A.sendCode).addClass("grayBtn").unbind("click");
			l()
		};
		var d = function() {
			if (!isLoaded) {
				return
			}
			var k = y;
			var l = function(n) {
				if (k == y) {
					if (n == "false") {
						v = 1;
						x(u.ishad)
					} else {
						if (n == "true") {
							v = 2;
							isLoaded = true;
							e()
						} else {
							v = 0
						}
					}
				}
			};
			var c = $("#code").val();
			$.ajax({
				url : "/comm/validCatchca.html",
				data : "code=" + c,
				success : function(n) {
					if (n == "true") {
						iCodeValid=true;
					} else {
						x('验证码不正确');
						g.html(A.txtStr).removeClass("grayBtn").bind("click", z);
						$("#codeImg").attr('src','/comm/catchca.html?t='+new Date().getTime());
					}
				}
			});
			$.ajax({
				url : "/register/isExists.html",
				data : "userName=" + k,
				beforeSend : m,
				success : function(n) {
					if (n == "true") {
						l(n)
					} else {
						x(u.ishad);
						g.html(A.txtStr).removeClass("grayBtn")
								.bind("click", z)
					}
					isLoaded = true
				}
			});
			function m() {
				g.html(A.checkNO).addClass("grayBtn").unbind("click")
			}
		};
		var z = function() {
			y = j.val();
			if (w) {
				return
			}
			if (y == "" || y == u.txtStr) {
				x(u.txtStr)
			} else {
				if ((y.length < 11 || y.length >= 11) && !t(y)) {
					x(u.error)
				} else {
					if (t(y)) {
						d()
					}
				}
			}
		};
		var a = "";
		var B = function() {
			if (a != j.val()) {
				if (b(j.val()) || j.val() == "") {
					a = j.val()
				} else {
					j.val(a)
				}
			}
			if (checkSwitch) {
				setTimeout(B, 200)
			}
		};
		j.bind("focus", function() {
			$(this).attr("style", "color:#666666");
			checkSwitch = true;
			B()
		}).bind("blur", function() {
			checkSwitch = false
		});
		var w = false;
		var c = function() {
			if (!w) {
				f.addClass("noCheck");
				g.addClass("grayBtn").unbind("click")
			} else {
				f.removeClass("noCheck");
				var k = j.val();
				g.removeClass("grayBtn").bind("click", z)
			}
			w = !w
		};
		var changeCodeImage = function() {
			$("#codeImg").attr('src','/comm/catchca.html?t='+new Date().getTime());
		};
		g.bind("click", z);
		f.bind("click", c);
		$("#codeImg").bind("click",changeCodeImage);
		isLoaded = true
	};
	$.getScript("/js/pagedialog.js", i)
});
