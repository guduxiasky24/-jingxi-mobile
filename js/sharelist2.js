$(function() {
	var b = function(e) {
		$.PageDialog.fail(e)
	};
	var c = function(e) {
		$.PageDialog.ok("<s></s>" + e)
	};
	var d = function() {
		var f = $("#m_popUp");
		var e = function() {
			f.fadeToggle(1000, function() {
				f.hide()
			})
		};
		f.bind("click", e);
		$("#btnShare").bind("click", function(g) {
			f.fadeToggle(1000, function() {
				f.show()
			})
		});
		/*Base.getScript("http://res.wx.qq.com/open/js/jweixin-1.0.0.js",
			function() {
				var k = "http://m.weinog.com/Images/iphone6s.jpg?v=150918";
				var n = $("#hidShareLink").val();
				var i = "微信授权登录，双11购物狂欢节，免费抢购6S！";
				var j = "我邀你一起免费抢购6S，微信授权认证！";
				var h = $("#hidAppID").val();
				var l = $("#hidTimeSpan").val();
				var m = $("#hidNonceStr").val();
				var g = $("#hidSignature").val();
				if (h == "" || l == "" || m == "" || g == "") {
					return
				}
				// alert("timestamp="+l+",signature="+g);
				wx.config({
					debug : false,
					appId : h,
					timestamp : l,
					nonceStr : m,
					signature : g,
					jsApiList : [ "checkJsApi",
							"onMenuShareAppMessage",
							"onMenuShareTimeline",
							"onMenuShareWeibo", "onMenuShareQQ" ]
				});
				
				wx.ready(function() {
					wx.onMenuShareAppMessage({
						title : i,
						desc : j,
						link : n,
						imgUrl : k,
						success : function() {
						},
						cancel : function() {
						}
					});
					wx.onMenuShareTimeline({
						title : j,
						link : n,
						imgUrl : k,
						success : function() {
						},
						cancel : function() {
						}
					});
					wx.onMenuShareWeibo({
						title : i,
						desc : j,
						link : n,
						imgUrl : k,
						success : function() {
						},
						cancel : function() {
						}
					});
					wx.onMenuShareQQ({
						title : i,
						desc : j,
						link : n,
						imgUrl : k,
						success : function() {
						},
						cancel : function() {
						}
					})
				});
				wx.error(function(o) {
				})
			})*/
	};
	var a = function() {
		var t = "http://m.weinog.com";
		var w = $("#userMobile");
		var A = $("#mobileCode");
		var o = $("#btnGetCode");
		var q = $("#btnBind");
		var g = function(E) {
			var D = /^\d+$/;
			return D.test(E)
		};
		var i = function(E) {
			var D = /^1\d{10}$/;
			return D.test(E)
		};
		var p = function(E) {
			var D = /^[0-9a-zA-Z]{6,}$/;
			return D.test(E)
		};
		var s = {
			txtMobileStr : "请输入您的手机号码",
			txtCodeStr : "请输入手机验证码",
			merror : "请输入正确的手机号码",
			cerror : "请输入正确的验证码",
			many : "验证码请求次数过多，请稍后再试",
			retry : "验证码发送失败，请重试",
			sendok : "验证码发送成功",
			bindok : "绑定成功",
			bindfail : "绑定失败,请重试",
			outtime : "验证码错误或过期",
			isbind : "已被绑定，请更换手机号码"
		};
		var x = {
			btncode : "获取验证码",
			btnbind : "立即绑定",
			getcode : "重新发送",
			binding : "正在绑定..."
		};
		var l = false;
		var r = function() {
			if (l) {
				return
			}
			if (u()) {
				var E = B;
				var D = function(F) {
					if (E == B) {
						if (F.state == 1) {
							b(s.isbind)
						} else {
							if (F.state == 0) {
								f();
								return
							} else {
								b(s.retry)
							}
						}
					}
					l = false;
					o.html(x.btncode).bind("click", r).removeClass("notClick")
				};
				l = true;
				o.html(x.getcode).addClass("notClick").unbind("click");
				GetDominData("http://m.weinog.com", "getpassportdata",
						"action=checkname&name=" + E, D)
			}
		};
		var f = function() {
			var E = B;
			var D = function(F) {
				if (F.state == 0) {
					b(s.sendok);
					q.unbind("click").bind("click", C)
				} else {
					if (F.state == 2) {
						b(s.many)
					} else {
						b(s.retry)
					}
				}
			};
			m();
			GetDominData("http://m.weinog.com", "getpassportdata",
					"action=send2Msg&userMobile=" + E, D)
		};
		var B = "";
		var u = function() {
			B = w.val();
			if (B == "" || B == s.txtMobileStr) {
				b(s.txtMobileStr);
				return false
			} else {
				if ((B.length < 11 || B.length >= 11) && !i(B)) {
					b(s.merror);
					return false
				}
			}
			return true
		};
		var j = false;
		var C = function() {
			if (j) {
				return
			}
			if (u()) {
				var E = A.val();
				if (E == "" || E == s.txtCodeStr) {
					b(s.txtCodeStr);
					return
				} else {
					if (!p(E)) {
						b(s.cerror);
						return
					} else {
						var D = function(F) {
							if (F.state == 0) {
								z();
								return
							} else {
								b(s.outtime)
							}
							j = false;
							q.html(x.btnbind).removeClass("notClick").bind(
									"click", C)
						};
						j = true;
						q.html(x.binding).addClass("notClick").unbind("click");
						GetDominData("http://m.weinog.com",
								"getpassportdata",
								"action=verifymobilesn&mobile=" + w.val()
										+ "&sn=" + E, D)
					}
				}
			}
		};
		var z = function() {
			var D = function(E) {
				if (E.code == 0) {
					b(s.bindok);
					window.location.reload();
					return
				} else {
					b(s.bindfail)
				}
				j = false;
				q.html(x.btnbind).removeClass("notClick").bind("click", C)
			};
			GetJPData("", "bindusermobile", "mobile=" + w.val(), D)
		};
		var m = function() {
			o.html(x.getcode).addClass("notClick").unbind("click");
			w.attr("disabled", true);
			var E = 120;
			var D = function() {
				if (E < 1) {
					o.html(x.btncode).bind("click", r).removeClass("notClick");
					l = false;
					w.attr("disabled", false);
					return
				} else {
					E--;
					o.html(x.getcode + "(" + E + ")")
				}
				setTimeout(D, 1000)
			};
			D()
		};
		var k = true;
		var v = true;
		var n = "";
		var e = function() {
			var D = w.val();
			if (g(D) || D == "" || D == s.txtMobileStr) {
				h = D
			} else {
				w.val(h).focus()
			}
			if (k) {
				setTimeout(e, 200)
			}
		};
		var h = "";
		var y = function() {
			var D = A.val();
			if (h != D) {
				if (g(D) || D == "" || D == s.txtCodeStr) {
					h = D
				} else {
					A.val(h).focus()
				}
			}
			if (v) {
				setTimeout(y, 200)
			}
		};
		w.bind("focus", function() {
			if ($(this).val() == s.txtMobileStr) {
				$(this).val("")
			}
			k = true;
			e()
		}).bind("blur", function() {
			k = false;
			if ($(this).val() == "") {
				$(this).val(s.txtMobileStr)
			}
		});
		A.bind("focus", function() {
			if ($(this).val() == s.txtCodeStr) {
				$(this).val("")
			}
			v = true;
			y()
		}).bind("blur", function() {
			v = false;
			if ($(this).val() == "") {
				$(this).val(s.txtCodeStr)
			}
		});
		o.bind("click", r);
		q.bind("click", function() {
			b("请先获取短信验证码")
		});
	};
	//Base.getScript(Gobal.Skin + "/JS/pageDialog.js?v=140917", function() {
		//a();
		d();
	//});
});