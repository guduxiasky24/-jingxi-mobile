$(function() {
    var G = $("#postBox10");
    var t = $("#postBox20");
    var x = $("#postBox30");
    var w = $("#postLoading");
    var s = $("#btnLoadMore");
    var u = 10;
    var D = 10;
    var v = null;
    var r = false;
    var y = false;
    var z = false;
    var B = false;
    var E = {
        FIdx: 1,
        EIdx: u,
        isCount: 1
    };
    var F = {
        FIdx: 1,
        EIdx: u,
        isLoaded: 0
    };
    var H = {
        FIdx: 1,
        EIdx: u,
        isLoaded: 0
    };
    var C = function(a) {
        if (a && a.stopPropagation) {
            a.stopPropagation()
        } else {
            window.event.cancelBubble = true
        }
    };
    var A = function() {
        var b = 0;
        var c = function() {
            var d = "";
            if (D == 10) {
                d = "pageNo=" + E.FIdx + "&pageSize=" + E.EIdx + "&isCount=" + E.isCount + "&id=new20"
            } else {
                if (D == 20) {
                    d = "pageNo=" + F.FIdx + "&pageSize=" + F.EIdx + "&isCount=0&id=hot20"
                } else {
                    if (D == 30) {
                        d = "pageNo=" + H.FIdx + "&pageSize=" + H.EIdx + "&isCount=0&id=reply20"
                    }
                }
            }
            return d
        };
        var a = function() {
            s.hide();
            w.show();
            $.ajax({
                url: "/share/ajaxPage.action",
                data: c(),
                success: function(g) {
                    if (g != "") {
                        if (E.isCount == 1) {
                            b = g.length
                        }
                        var e = 0;
                        var h = g;
                        for (var j = 0; j < h.length; j++) {
                            var d = '<div class="cSingleInfo">';
                            var f = h[j].userFace.indexOf("http") != -1 ? h[j].userFace: $img + h[j].userFace;
                            d += '<dl class="fl"><a href="/u/' + h[j].userId + '"><img src="' + f + '"><b></b></a></dl>';
                            d += '<div class="cSingleR m-round" id="' + h[j].uid + '">';
                            d += "<ul>";
                            d += '<li><em class="blue" uweb="' + h[j].userId + '">' + h[j].userName + '</em><span><strong class="c9">\uff1a</strong>' + h[j].shareTitle + "</span> <h5>" + h[j].shareDate + "</h5></li>";
                            d += "<li><p>" + h[j].shareContent + "</p></li>";
                            d += '<li class="maxImg">';
                            var l = h[j].shareimageList;
                            for (var k = 0; k < l.length; k++) {
                                d += '<img src="' + $img + "/UserPost/Small/" + l[k].images + '" />'
                            }
                            d += "</li>";
                            d += "<li><dd><s></s><strong>" + h[j].upCount + "</strong>\u4eba\u7fa1\u6155\u5ac9\u5992</dd><dd><i></i><strong>" + h[j].replyCount + "</strong>\u6761\u8bc4\u8bba</dd></li>";
                            d += "</ul>";
                            d += '<b class="z-arrow"></b>';
                            d += "</div>";
                            d += "</div>";
                            var i = $(d);
                            i.children("div.cSingleR").click(function() {
                                location.href = "/shareShow/" + $(this).attr("id") + ".html"
                            }).find("em.blue").click(function(m) {
                                C(m);
                                location.href = "/u/" + $(this).attr("uweb") + ".html"
                            });
                            if (D == 10) {
                                e = E.EIdx;
                                G.append(i)
                            } else {
                                if (D == 20) {
                                    e = F.EIdx;
                                    F.isLoaded = 1;
                                    t.append(i)
                                } else {
                                    if (D == 30) {
                                        e = H.EIdx;
                                        H.isLoaded = 1;
                                        x.append(i)
                                    }
                                }
                            }
                        }
                        if (b < 10) {
                            if (D == 10) {
                                y = true
                            } else {
                                if (D == 20) {
                                    z = true
                                } else {
                                    if (D == 30) {
                                        B = true
                                    }
                                }
                            }
                        } else {
                            s.show()
                        }
                        loadImgFun(0)
                    }
                    w.hide();
                    r = false
                }
            })
        };
        this.initData = function() {
            a()
        };
        this.getNextPage = function() {
            a()
        }
    };
    v = new A();
    v.initData();
    $("#navBox").children("div").each(function(b) {
        var a = $(this);
        a.click(function() {
            a.addClass("z-sgl-crt");
            a.siblings().removeClass("z-sgl-crt");
            if (b == 0) {
                D = 10;
                G.show();
                t.hide();
                x.hide();
                if (!y) {
                    s.show()
                }
            } else {
                if (b == 1) {
                    D = 20;
                    G.hide();
                    t.show();
                    x.hide();
                    if (F.isLoaded == 0) {
                        v.initData()
                    } else {
                        if (!z) {
                            s.show()
                        }
                    }
                } else {
                    D = 30;
                    G.hide();
                    t.hide();
                    x.show();
                    if (H.isLoaded == 0) {
                        v.initData()
                    } else {
                        if (!B) {
                            s.show()
                        }
                    }
                }
            }
        })
    });
    s.click(function() {
        if (!r) {
            r = true;
            if (D == 10 && !y) {
                E.FIdx += 1;
                E.EIdx = u;
                v.getNextPage()
            } else {
                if (D == 20 && !z) {
                    F.FIdx += 1;
                    F.EIdx = u;
                    v.getNextPage()
                } else {
                    if (!B) {
                        H.FIdx += 1;
                        H.EIdx = u;
                        v.getNextPage()
                    }
                }
            }
        }
    })
});