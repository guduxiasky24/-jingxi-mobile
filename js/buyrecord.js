$(function() {
    var m = $("#hidCodeID").val();
    var t = $("#hidIsEnd").val() == "1";
    var s = $("#divBuyLoading");
    var u = $("#divRecordList");
    var o = $("#btnLoadMore");
    var v = null;
    var q = 10;
    var x = 0;
    var w = t ? "GetUserBuyListByCodeEnd": "GetUserBuyListByCode";
    var p = {
        codeID: m,
        FIdx: 1,
        EIdx: q,
        isCount: 1,
        sort: 0
    };
    var r = function() {
        var a = function() {
            return "id=" + p.codeID + "&pageNo=" + p.FIdx + "&pageSize=" + p.EIdx + "&isCount=" + p.isCount + "&sort=" + p.sort
        };
        var b = function() {
            s.show();
            $.ajax({
                url: "/products/ajaxPage.action",
                data: a(),
                success: function(e) {
                    if (e != "") {
                        if (p.isCount == 1) {
                            x = e.length;
                            u.show()
                        }
                        var d = "";
                        var f = null;
                        f = e;
                        var g = e.length;
                        for (var h = 0; h < g; h++) {
                            var c = f[h].userFace.indexOf("http") != -1 ? f[h].userFace: $img + f[h].userFace;
                            d += '<li><i class="fr z-set"></i><p><a href="/u/' + f[h].userId + '.html"><img src="' + c + '"></a></p><dl><dt><span class="fl"><a href="/u/' + f[h].userId + '.html" class="blue">'+ f[h].userName +'</a></span><cite class="fl">云购了<b class="orange">' + f[h].buyCount + '</b>人次</cite></dt><dd class="gray9">' + f[h].buyDate + "</dd></dl></li>"
                        }
                        u.append(d);
                        if (p.EIdx >= x) {
                            o.show()
                        } else {
                            t = true
                        }
                    } else {
                        if (p.FIdx == 1) {
                            t = true;
                            u.before(Gobal.NoneHtml).remove()
                        }
                    }
                    n = false;
                    s.hide()
                }
            })
        };
        this.initData = function() {
            p.FIdx = 1;
            p.EIdx = q;
            p.isCount = 1;
            b()
        };
        this.getNextPage = function() {
            p.FIdx = p.FIdx + 1;
            p.EIdx = q;
            b()
        }
    };
    v = new r();
    v.initData();
    var t = false;
    var n = false;
    o.click(function() {
        if (!n) {
            n = true;
            o.hide();
            v.getNextPage()
        }
    });
    $("#btnSort").click(function() {
        if (!n) {
            t = false;
            if (p.sort == 0) {
                $(this).html('<i></i>\u6392\u5e8f<s class="z-Sswt"></s><s class="z-Sswd"></s>');
                p.sort = 1
            } else {
                $(this).html('<i></i>\u6392\u5e8f<s class="z-SswOn"></s><s class="z-SswNt"></s>');
                p.sort = 0
            }
            u.empty();
            v.initData()
        }
    })
});