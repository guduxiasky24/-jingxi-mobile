$(function() {
	var k = $("#hidCodeID").val();
	var q = $("#calResult");
	var n = $("#hidRaffleTime").val();
	var p = $("#sscNumber").val();
	var r = $("#sscPeriod").val();
	if (p != "") {
		$
				.ajax({
					url : "/lotteryDetail/getCalResult.action",
					data : "id=" + k,
					success : function(f) {
						if (f != "") {
							var g = '<div class="infoResult">';
							var c = f;
							var i = c.length;
							g += '<ul class="result1"><li class="iTitle"><span>'
									+ $shortName
									+ "\u65f6\u95f4</span><span>\u8f6c\u6362\u6570\u636e</span><span>\u4f1a\u5458\u8d26\u53f7</span></li></ul>";
							g += "<dl>\u622a\u6b62\u63ed\u6653\u65f6\u95f4\u3010"
									+ n
									+ "\u3011\u6700<em>\u540e50\u6761\u5168\u7ad9\u8d2d\u4e70\u65f6\u95f4\u8bb0\u5f55</em></dl>";
							if (i > 0) {
								g += '<ul class="result2">';
								for ( var e = 0; e < i; e++) {
									g += "<li><span>"
											+ c[e].buyDate
											+ "<dd>"
											+ c[e].buyTime
											+ "</dd></span><span>"
											+ c[e].dateSum
											+ "</span><span>"
											+ c[e].userName
											+ '</span><p><b class="z-arrow"></b></p></li>'
								}
								g += "</ul>"
							}
							g += "</div>";
							var j = $("#hidBaseNum").val();
							var h = $("#hidCodeQuantity").val();
							var b = $("#hidYuShu").val();
							var d = $("#hidCodeRno").val();
							var a = parseInt(b) + parseInt("10000001");
							g += '<div class="infoCount"><div class="infoCount2"><ul><li style="border:0 none;">\u8ba1\u7b97\u7ed3\u679c\uff1a</li><li>1\u3001\u6c42\u548c\uff1a<em>'
									+ j
									+ "</em> (\u4e0a\u976250\u6761"
									+ $shortName
									+ "\u8bb0\u5f55\u65f6\u95f4\u76f8\u52a0\u548c\u6700\u8fd1\u4e00\u671f<a href='http://caipiao.163.com/award/cqssc/'>\u201c\u65f6\u65f6\u5f69\u201d</a>\u5f00\u5956\u53f7\u7801\u4e4b\u548c)</li><li><p>2\u3001\u53d6\u4f59\uff1a"
									+ j
									+ "<em>(50\u6761\u65f6\u95f4\u8bb0\u5f55\u548c\u6700\u8fd1\u4e00\u671f\u201c\u65f6\u65f6\u5f69\u201d\u5f00\u5956\u53f7\u7801\u4e4b\u548c)</em><br>%"
									+ h
									+ "<em>(\u672c\u5546\u54c1\u603b\u9700\u53c2\u4e0e\u4eba\u6b21)</em>="
									+ b
									+ "<em>(\u4f59\u6570)</em></p></li><li>3\u3001\u8ba1\u7b97\u7ed3\u679c\uff1a"
									+ b
									+ "<em>(\u4f59\u6570)</em>+10000001=<span>"
									+ d + "</span><p></p></li></div></div>";
							q.html(g)
						} else {
							q.html(Gobal.NoneHtml)
						}
					}
				})
	} else {
		_ResultHtml = '\u5bf9\u4e0d\u8d77\uff0c\u8be5\u5546\u54c1\u5f00\u5956\u89c4\u5219\u4e3a\u5f53\u524d\u7684\u63ed\u6653\u673a\u5236\u63ed\u6653<br>\u6ca1\u6709\u91c7\u7528\u65f6\u65f6\u5f69\u5f00\u5956\u89c4\u5219\uff01</div>';
		q.html(_ResultHtml)
	}
	var t = false;
	var m = false;
	var o = $("#btnCalMethod");
	var l = '<div class="infoRule"><p><em>01</em>\u53d6\u8be5\u5546\u54c1\u6700\u540e\u8d2d\u4e70\u65f6\u95f4\u524d\u7f51\u7ad9\u6240\u6709\u5546\u54c1\u7684\u6700\u540e50\u6761\u8d2d\u4e70\u65f6\u95f4\u8bb0\u5f55\uff1b</p><p><em>02</em>\u6bcf\u4e2a\u65f6\u95f4\u8bb0\u5f55\u6309\u65f6\u3001\u5206\u3001\u79d2\u3001\u6beb\u79d2\u4f9d\u6b21\u6392\u5217\u53d6\u6570\u503c\uff1b</p><p><em>03</em>\u5c06\u8fd950\u4e2a\u6570\u503c\u4e4b\u548c\u9664\u4ee5\u8be5\u5546\u54c1\u603b\u53c2\u4e0e\u4eba\u6b21\u540e\u53d6\u4f59\u6570\uff0c\u4f59\u6570\u52a0\u4e0a10000001 \u5373\u4e3a"\u5e78\u8fd0'
			+ $shortName + '\u7801"\u3002</p><b class="z-arrow"></b></div>';
	var s = function(a) {
		if (a && a.stopPropagation) {
			a.stopPropagation()
		} else {
			window.event.cancelBubble = true
		}
	};
	var u = $('<div class="cMask"></div>');
	o.click(function(a) {
		if (!t) {
			if (!m) {
				$(this).parent().after(l);
				q.prepend(u)
			} else {
				$(this).parent().next("div.infoRule").show()
			}
			u.show();
			m = true;
			t = true
		} else {
			$(this).parent().next("div.infoRule").hide();
			u.hide();
			t = false
		}
		s(a)
	});
	$("div.h5-1yyg-v1").click(function() {
		if (t) {
			o.parent().next("div.infoRule").hide();
			u.hide();
			t = false
		}
	})
});
