$(function() {
    var u = $("#hidGoodsID").val();
    var n = $("#divPostLoading");
    var q = $("#btnLoadMore");
    var s = $("#postList");
    var o = null;
    var t = 10;
    var x = 0;
    var m = {
        GoodsID: u,
        FIdx: 1,
        EIdx: t,
        isCount: 1
    };
    var w = function(a) {
        if (a && a.stopPropagation) {
            a.stopPropagation()
        } else {
            window.event.cancelBubble = true
        }
    };
    var r = function() {
        var a = function() {
            return "id=" + m.GoodsID + "&pageNo=" + m.FIdx + "&pageSize=" + m.EIdx + "&isCount=" + m.isCount
        };
        var b = function() {
            n.show();
            q.hide();
            $.ajax({
                url: "/shareShow/productInfoShareListByProductId.action",
                data: a(),
                success: function(i) {
                    if (i != "") {
                        if (m.isCount == 1) {
                            x = i.length;
                            s.before('<p class="cEntry">\u5df2\u6709<em class="orange">' + i.length + "</em>\u4e2a\u5e78\u8fd0\u8005\u6652\u5355</p>").show()
                        }
                        var h = "";
                        var j = i;
                        var k = j.length;
                        for (var c = 0; c < k; c++) {
                            var g = j[c].userFace.indexOf("http") != -1 ? j[c].userFace: $img + j[c].userFace;
                            h += '<div class="cSingleInfo">';
                            h += '<dl class="fl"><a href="/u/' + j[c].userId + '.html"><img src="' + g + '"><b></b></a></dl>';
                            h += '<div class="cSingleR m-round" id="' + j[c].uid + '">';
                            h += "<ul>";
                            h += '<li><em class="blue" uweb="' + j[c].userId + '">' + j[c].userName + "</em><strong>\uff1a</strong><span>" + j[c].shareTitle + "</span></li>";
                            h += "<li><h3><b>\u7b2c" + j[c].productPeriod + "\u671f\u6652\u5355</b> " + j[c].shareDate + "</h3></li>";
                            h += "<li><p>" + j[c].shareContent + "</p></li>";
                            h += '<li class="maxImg">';
                            var f = j[c].shareimageList;
                            for (var d = 0; d < f.length; d++) {
                                h += '<img src="' + $img + "/UserPost/Small/" + f[d].images + '" />'
                            }
                            h += "</li>";
                            h += "<li><dd><s></s><strong>" + j[c].upCount + "</strong>\u4eba\u7fa1\u6155\u5ac9\u5992</dd><dd><i></i><strong>" + j[c].replyCount + "</strong>\u6761\u8bc4\u8bba</dd></li>";
                            h += "</ul>";
                            h += '<b class="z-arrow"></b>';
                            h += "</div>";
                            h += "</div>"
                        }
                        s.children('a[name="lookAll"]').remove();
                        var e = $(h);
                        e.find("div.cSingleR").click(function() {
                            location.href = "/shareShow/" + $(this).attr("id") + ".html"
                        }).find("em.blue").click(function(l) {
                            w(l);
                            location.href = "/u/" + $(this).attr("uweb") + ".html"
                        });
                        s.append(e);
                        s.append('<a name="lookAll" href="/share/new20.html" class="lookAll m-round">\u67e5\u770b\u6240\u6709\u6652\u5355\u5206\u4eab<b class="fr z-arrow"></b></a>');
                        if (m.EIdx >= x) {
                            v = true
                        } else {
                            q.show()
                        }
                        loadImgFun()
                    } else {
                        if (m.FIdx == 1) {
                            n.before(Gobal.NoneHtml)
                        }
                    }
                    n.hide();
                    p = false
                }
            })
        };
        this.initData = function() {
            b()
        };
        this.getNextPage = function() {
            m.FIdx = m.FIdx + 1;
            m.EIdx = t;
            b()
        }
    };
    o = new r();
    o.initData();
    var v = false;
    var p = false;
    q.click(function() {
        if (!p && !v) {
            p = true;
            o.getNextPage()
        }
    })
});