$.fn.StartTimeOut = function(c) {
    var d = $(this);
    $.ajax({
        url: "/products/isLottery.action",
        data: "id=" + c,
        success: function(a) {
            var H = a.spStatus;
            var F = parseInt(a.date);
            if (H == 2) {
                var N = new Date();
                N.setSeconds(N.getSeconds() + F);
                var A = 0;
                var x = 0;
                var y = 0;
                var B = function() {
                    var e = new Date();
                    if (N > e) {
                        var g = parseInt((N.getTime() - e.getTime()) / 1000);
                        var f = g % 60;
                        A = parseInt(g / 60);
                        x = parseInt(f);
                        if (f >= x) {
                            y = parseInt((f - x) * 10)
                        } else {
                            y = 0
                        }
                        setTimeout(B, 3000)
                    }
                };
                var G = d.find("span");
                var M = G.eq(0);
                var C = G.eq(1);
                var K = G.eq(2);
                var b = G.eq(3);
                var I = 9;
                var z = function() {
                    I--;
                    if (I < 0) {
                        I = 9;
                    }
                    b.html(I);
                    setTimeout(z, 10);
                };
                var L = function() {
                    b.html("0");
                    d.removeClass("clearfix").html('<div class="pCalculation"><h4>\u8868\u7740\u6025\uff01\u8ba1\u7b97\u673a\u6b63\u5728\u52aa\u529b\u8ba1\u7b97\u4e2d\u2026\u2026</h4><div class="loading-progress"><span class="loading-pgbar"><span class="loading-pging"></span></span></div></div>');
                    var e = null;
                    var f = function() {
                        $.ajax({
                            url: "/lottery/lotteryUtil.html",
                            data: "id=" + c,
                            success: function(g) {
                                if (g == "true") {
                                    $.ajax({
                                        url: "/lottery/LatestlotteryByProductId.html",
                                        data: "id=" + c,
                                        success: function(h) {
                                            if (h != "false") {
                                                location.replace("/lotteryDetail/" + c + ".html")
                                            }
                                        }
                                    })
                                }
                            }
                        })
                    };
                    e = setInterval(f, 2000)
                };
                var D = function() {
                    y--;
                    if (y < 1) {
                        if (x < 1) {
                            if (A < 1) {
                                L();
                                return
                            } else {
                                A--;
                            }
                            x = 59;
                        } else {
                            x--;
                        }
                        y = 9;
                    }
                    setTimeout(D, 100)
                };
                var J = 0,
                w = 0;
                var E = function() {
                    K.html(y);
                    if (J != x) {
                        if (x < 10) {
                            C.html("0" + x)
                        } else {
                            C.html(x)
                        }
                        J = x
                    }
                    if (w != A) {
                        if (A < 10) {
                            M.html("0" + A)
                        } else {
                            M.html(A)
                        }
                        w = A
                    }
                    setTimeout(E, 100)
                };
                B();
                D();
                z();
                E()
            }
        }
    })
};