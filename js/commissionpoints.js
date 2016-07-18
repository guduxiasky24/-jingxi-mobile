$(function() {
    var b = function() {
        var w = $("#dlList");
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
        var G = function() {
            var c = 0;
            var e = {
                FIdx: 1,
                EIdx: y,
                isCount: 1
            };
            var d = function() {
                return "pageNo=" + e.FIdx + "&pageSize=" + e.EIdx + "&isCount=" + e.isCount + "&userId=" + A
            };
            var f = function() {
                C.show();
                $.ajax({
                    url: "/user/CommissionPointsAjaxPage.action",
                    data: d(),
                    success: function(h) {
                        if (h.length > 0) {
                            var k = "";
                            if (e.isCount == 1) {
                                e.isCount = 0;
                                c = h.length;
                                k = '<dt><i class="gray6">福分明细</i><b></b></dt>'
                            }
                            var j = h;
                            var g = j.length;
                            for (var i = 0; i < g; i++) {
                                k += '<dd class="colorbbb"><span class="gray6">' 
                                   + j[i].detailed
                                   + '</span>'
                                   + j[i].date
                                   +'<em class="green">'+j[i].pay+'</em>'
                                   +'</dd>';
                            }
//                            if (e.FIdx > 1) {
//                                w.children("dd").last().removeClass("bornone")
//                            }
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