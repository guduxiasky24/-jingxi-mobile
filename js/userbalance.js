$(function() {
    var b = function() {
        var E = $("#ulRechage");
        var H = $("#ulConsumption");
        var M = $("#divLoad");
        var N = $("#btnLoadMore");
        var O = $("#btnRecharge");
        var K = $("#btnConsumption");
        var a = $("#userId").val();
        var v = false;
        var B = false;
        var J = 10;
        var I = null;
        var L = null;
        var D = 0;
        var A = false;
        var C = false;
        var F = false;
        var G = $("#loadDataType").val() === "1";
        var y = function() {
            var c = 0;
            var e = {
                FIdx: 1,
                EIdx: J,
                isCount: 1
            };
            var d = function() {
                return "pageNo=" + e.FIdx + "&pageSize=" + e.EIdx + "&isCount=" + e.isCount + "&userId=" + a
            };
            var f = function() {
                M.show();
                $.ajax({
                    url: "/user/ConsumeListByDeltaAjaxPage.action",
                    data: d(),
                    success: function(h) {
                        if (h.length > 0) {
                            var k = "";
                            if (e.isCount == 1) {
                                c = h.length;
                                e.isCount = 0;
                                k = '<li class="m-userMoneylst-tt"><span>\u5145\u503c\u65f6\u95f4</span><span>\u5145\u503c\u91d1\u989d</span><span>\u5145\u503c\u6e20\u9053</span></li>'
                            }
                            var j = h;
                            var g = j.length;
                            for (var i = 0; i < g; i++) {
                                k += '<li class="' + (i + 1 == g ? "bornone": "") + '"><span>' + j[i].date + "</span><span>\uffe5" + j[i].money + "</span><span>";
                                if (j[i].interfaceType == "tenPay") {
                                    k += "\u8d22\u4ed8\u901a"
                                } else {
                                    if (j[i].interfaceType == "aliPay") {
                                        k += "\u652f\u4ed8\u5b9d"
                                    } else {
                                        if (j[i].interfaceType == "yeePay") {
                                            k += "\u6613\u4ed8\u5b9d"
                                        } else {
                                            k += j[i].interfaceType
                                        }
                                    }
                                }
                                k += "</span></li>"
                            }
                            if (e.FIdx > 1) {
                                E.children("li").last().removeClass("bornone")
                            }
                            E.append(k);
                            if (e.EIdx >= c) {
                                N.show()
                            } else {
                                C = true;
                                N.hide()
                            }
                        } else {
                            if (e.FIdx == 1) {
                                C = true;
                                E.append(Gobal.NoneHtml);
                                N.hide()
                            }
                        }
                        M.hide();
                        v = true;
                        A = false
                    }
                })
            };
            this.initPage = function() {
                f()
            };
            this.getNextPage = function() {
                e.FIdx += 1;
                e.EIdx = J;
                f()
            }
        };
        var w = function() {
            var c = 0;
            var e = {
                FIdx: 1,
                EIdx: J,
                isCount: 1
            };
            var d = function() {
                return "pageNo=" + e.FIdx + "&pageSize=" + e.EIdx + "&isCount=" + e.isCount + "&userId=" + a
            };
            var f = function() {
                M.show();
                $.ajax({
                    url: "/user/ConsumeListAjaxPage.action",
                    data: d(),
                    success: function(h) {
                        if (h.length > 0) {
                            var k = "";
                            if (e.isCount == 1) {
                                e.isCount = 0;
                                c = h.length;
                                k = '<li class="m-userMoneylst-tt"><span>\u6d88\u8d39\u65f6\u95f4</span><span>\u6d88\u8d39\u91d1\u989d</span></li>'
                            }
                            var j = h;
                            var g = j.length;
                            for (var i = 0; i < g; i++) {
                                k += '<li class="' + (i + 1 == g ? "bornone": "") + '"><span>' + j[i].date + "</span><span>\uffe5" + j[i].money + "</span></li>"
                            }
                            if (e.FIdx > 1) {
                                H.children("li").last().removeClass("bornone")
                            }
                            H.append(k);
                            if (e.EIdx >= c) {
                                N.show()
                            } else {
                                F = true;
                                N.hide()
                            }
                        } else {
                            if (e.FIdx == 1) {
                                H.append(Gobal.NoneHtml);
                                F = true;
                                N.hide()
                            }
                        }
                        M.hide();
                        B = true;
                        A = false
                    }
                })
            };
            this.initPage = function() {
                f()
            };
            this.getNextPage = function() {
                e.FIdx += 1;
                e.EIdx = J;
                f()
            }
        };
        I = new y();
        L = new w();
        var z = function() {
            D = 0;
            O.removeClass("z-MoneyNav-crt02");
            K.addClass("z-MoneyNav-crt01");
            E.hide();
            H.show();
            if (!F) {
                N.show()
            } else {
                N.hide()
            }
            if (!B) {
                L.initPage()
            }
        };
        var x = function() {
            D = 1;
            O.addClass("z-MoneyNav-crt02");
            K.removeClass("z-MoneyNav-crt01");
            E.show();
            H.hide();
            if (!C) {
                N.show()
            } else {
                N.hide()
            }
            if (!v) {
                I.initPage()
            }
        };
        if (G) {
            x()
        } else {
            z()
        }
        K.click(z);
        O.click(x);
        N.click(function() {
            if (!A) {
                A = true;
                N.hide();
                if (D == 1) {
                    I.getNextPage()
                } else {
                    L.getNextPage()
                }
            }
        })
    };
    $.getScript("/js/comm.js?v=130826", b)
});