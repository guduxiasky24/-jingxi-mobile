$(function() {
    var p = 10;
    var l = {
        FIdx: 1,
        EIdx: p,
        isCount: 1,
        state: -1
    };
    var s = 0;
    var m = null;
    var o = $("#divGoodsLoading");
    var k = $("#btnLoadMore");
    var n = $("#userId").val();
    var j = false;
    var r = false;
    var q = function() {
        var b = function() {
            return "pageNo=" + l.FIdx + "&pageSize=" + l.EIdx + "&isCount=" + l.isCount + "&state=" + l.state + "&userId=" + n
        };
        var a = function() {
            o.show();
            $.ajax({
                url: "/user/userBuyListAjaxPage.action",
                data: b(),
                success: function(d) {
                    if (d.length > 0) {
                        var g = d;
                        if (l.isCount == 1) {
                            s = d.length;
                            l.isCount = 0
                        }
                        var c = g.length;
                        var f = "";
                        var x = 0;
                        var w = 0;
                        var i = 0;
                        var v = 0;
                        for (var e = 0; e < c; e++) {
                            var h = parseInt(g[e].buyStatus);
                            f += "<li onclick=\"location.href='/user/userbuyDetail-" + g[e].productId + '.html\'"><a class="fl z-Limg">';
                            if (h == 0) {
                                f += '<span class="z-Imgbg z-ImgbgC01"></span><em class="z-Imgtxt">\u8fdb\u884c\u4e2d...</em>'
                            } else {
                                if (h == 2) {
                                    f += '<span class="z-Imgbg z-ImgbgC01"></span><em class="z-Imgtxt">\u5df2\u6ee1\u5458</em>'
                                } else {
                                    if (h == 1) {
                                        f += '<span class="z-Imgbg z-ImgbgC02"></span><em class="z-Imgtxt">\u5df2\u63ed\u6653</em>'
                                    }
                                }
                            }
                            f += '<img src="' + $img + g[e].productImg + '" border=0 alt=""></a><div class="u-sgl-r gray9"><p class="z-sgl-tt"><a class="gray6">(\u7b2c' + g[e].productPeriod + "期)" + g[e].productName + "</a></p>";
                            if (h == 0 || h == 2) {
                                x = parseInt(g[e].spellbuyCount);
                                w = parseInt(g[e].productPrice);
                                i = parseInt(w - x);
                                v = parseInt(x * 100) / w;
                                v = x > 0 && v < 1 ? 1 : v;
                                f += '<p>\u5df2\u53c2\u4e0e<em class="orange">' + g[e].buyCount + '</em>\u4eba\u6b21</p><div class="Progress-bar"><p class="u-progress">' + (x > 0 ? '<span style="width:' + v + '%;" class="pgbar"><span class="pging"></span></span>': "") + '</p><ul class="Pro-bar-li"><li class="P-bar01"><em>' + x + '</em>\u5df2\u53c2\u4e0e</li><li class="P-bar02"><em>' + w + '</em>\u603b\u9700\u4eba\u6b21</li><li class="P-bar03"><em>' + i + "</em>\u5269\u4f59</li></ul></div>"
                            } else {
                                if (h == 1) {
                                    f += '<p>\u83b7\u5f97\u8005\uff1a<em class="blue">' + g[e].winUser + '</em></p><p>\u63ed\u6653\u65f6\u95f4\uff1a<em class="gray6">' + g[e].winDate + "</em></p>"
                                }
                            }
                            f += '</div><b class="z-arrow"></b></li>'
                        }
                        if (l.FIdx > 1) {
                            o.prev().removeClass("bornone")
                        }
                        o.before(f).prev().addClass("bornone");
                        if (l.EIdx >= s) {
                            j = false;
                            k.show()
                        }
                        loadImgFun(0)
                    } else {
                        if (l.FIdx == 1) {
                            if (l.state == -1) {
                                r = true
                            }
                            o.before(Gobal.NoneHtml)
                        }
                    }
                    o.hide()
                }
            })
        };
        this.getInitPage = function() {
            l.FIdx = 1;
            l.EIdx = p;
            l.isCount = 1;
            a()
        };
        this.getNextPage = function() {
            l.FIdx += 1;
            l.EIdx = p;
            a()
        }
    };
    $("#navBox").children("div").each(function() {
        var a = $(this);
        a.click(function() {
            l.state = a.attr("state");
            a.addClass("z-sgl-crt").siblings().removeClass("z-sgl-crt");
            if (!r) {
                k.hide();
                o.prevAll().remove();
                m.getInitPage()
            }
        })
    });
    k.click(function() {
        if (!j) {
            j = true;
            k.hide();
            m.getNextPage()
        }
    });
    m = new q();
    m.getInitPage()
});