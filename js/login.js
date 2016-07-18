$(function() {
    var f = "";
    var d = function() {
        var J = "_uName";
        var K = $("#txtAccount");
        var G = $("#txtPassword");
        var H = $("#showPWD");
        var M = $("#btnLogin");
        var b = $("#forward").val();
        var E = false;
        var L = function(g) {
            var h = /^1\d{10}$/;
            return h.test(g)
        };
        var N = function(g) {
            var h = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            return h.test(g)
        };
        var w = function(g) {
            var h = /^([\x00-\xff])+$/;
            return h.test(g)
        };
        var z = function(i) {
            var g = /^([\x00-\xff]){6,20}$/;
            var h = /^\S{6,20}$/;
            return g.test(i) && h.test(i)
        };
        var C = {
            txtStr: "\u8bf7\u8f93\u5165\u60a8\u7684\u624b\u673a\u53f7\u7801/\u90ae\u7bb1",
            txtpwd: "\u8bf7\u8f93\u5165\u60a8\u7684\u767b\u5f55\u5bc6\u7801",
            errorU: "\u8bf7\u8f93\u5165\u6b63\u786e\u7684\u624b\u673a\u53f7/\u90ae\u7bb1",
            errorP: "\u5bc6\u7801\u957f\u5ea6\u4e3a6-20\u4f4d\u5b57\u7b26",
            loginerr0: "\u767b\u5f55\u5bc6\u7801\u4e0d\u6b63\u786e",
            loginerr1: "\u767b\u5f55\u5e10\u53f7\u672a\u6ce8\u518c",
            loginerr2: "\u8d26\u53f7\u88ab\u51bb\u7ed3\uff0c\u8bf7\u4e0e\u5ba2\u670d\u8054\u7cfb",
            loginerr3: "\u5931\u8d25\u6b21\u6570\u8d85\u9650\uff0c\u88ab\u51bb\u7ed35\u5206\u949f",
            loginerr4: "\u767b\u5f55\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5",
            showPWD: "\u663e\u793a\u5bc6\u7801",
            loginerr5: "\u5fc5\u987b\u8f93\u5165\u5e10\u53f7\u548c\u5bc6\u7801",
            loginok: "\u767b\u5f55\u6210\u529f"
        };
        var x = {
            txtStr: "\u767b\u5f55",
            checkCode: "\u6b63\u5728\u767b\u5f55"
        };
        var c = function(g) {
            $.PageDialog.fail(g)
        };
        var I = function(g, h) {
            $.PageDialog.ok(g, h)
        };
        var A = function() {
            if (!isLoaded) {
                return
            }
            var i = K.val().trim();
            var h = G.val().trim();
            if (i == "" || i == C.txtStr) {
                c(C.txtStr);
                return
            } else {
                if (h == "" || h == C.txtpwd) {
                    c(C.txtpwd);
                    return
                } else {
                    if (!L(i) && !N(i)) {
                        c(C.errorU);
                        return
                    } else {
                        if (!z(h)) {
                            c(C.errorP)
                        } else {
                            var g = function(j) {
                                if (j == "userError") {
                                    c(C.loginerr1)
                                } else {
                                    if (j == "pwdError") {
                                        c(C.loginerr0)
                                    } else {
                                        if (j == "check") {
                                            c(C.loginerr0)
                                        } else {
                                            M.hide();
                                            if (j.userId) {
                                                SetCookieByExpires("userId", j.userId, 365);
                                                SetCookieByExpires("face", j.faceImg)
                                            }
                                            if (j.userName) {
                                                SetCookieByExpires("userName", j.userName, 365)
                                            } else {
                                                if (j.mail) {
                                                    SetCookieByExpires("userName", j.mail, 365);
                                                    SetCookieByExpires("loginUser", j.mail, 365)
                                                } else {
                                                    if (j.phone) {
                                                        SetCookieByExpires("userName", j.phone, 365);
                                                        SetCookieByExpires("loginUser", j.phone, 365)
                                                    }
                                                }
                                            }
                                            SetCookieByExpires("loginType", 0);
                                            if (b == "rego") {
                                                window.location.href = $www
                                            } else {
                                                if (b == "mycart") {
                                                    window.location.href = $www + "/mycart/payment.html"
                                                } else {
                                                    if (b == "myUser") {
                                                        window.location.href = $www + "/user/index.html"
                                                    } else {
                                                        if (b == "PostSingleList") {
                                                            window.location.href = $www + "/user/PostSingleList.html"
                                                        } else {
                                                            if (b == "auth") {
                                                                window.location.href = $www + "/referAuth.html"
                                                            } else {
                                                                if (b == "cartPay") {
                                                                    window.location.href = $www + "/cartPay/index.html"
                                                                } else {
                                                                    if (b == "userRecharge") {
                                                                        window.location.href = $www + "/user/UserRecharge.html"
                                                                    } else {
                                                                        window.location.href = $www
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            var k = function() {
                                                var l = $www;
                                                location.replace(l)
                                            };
                                            I(C.loginok, k)
                                        }
                                    }
                                }
                                isLoaded = true;
                                M.html(x.txtStr).removeClass("grayBtn").bind("click", A)
                            };
                            isLoaded = false;
                            M.html(x.checkCode).addClass("grayBtn").unbind("click");
                            $.ajax({
                                url: "/login/login.html",
                                type: "post",
                                data: "userName=" + i + "&pwd=" + escape(h),
                                success: function(j) {
                                    g(j)
                                }
                            })
                        }
                    }
                }
            }
        };
        var D = "";
        var F;
        var B = function() {
            var g = F.val();
            if (D != g) {
                if (w(g) || g == "") {
                    D = g
                } else {
                    F.val(D).focus()
                }
            }
            if (E) {
                setTimeout(B, 200)
            }
        };
        K.bind("focus",
        function() {
            $(this).attr("style", "color:#666666");
            E = true;
            F = $(this);
            B()
        }).bind("blur",
        function() {
            E = false
        });
        G.bind("focus",
        function() {
            $(this).attr("style", "color:#666666");
            E = true;
            F = $(this);
            B()
        }).bind("blur",
        function() {
            E = false
        });
        var y = function() {
            var g = $.cookie(J);
            if (g != null) {
                K.val(g).attr("style", "color:#666666")
            }
        };
        y();
        M.bind("click", A);
        isLoaded = true;
        var a = getCookie("loginUser");
        if (a != null && a != "null") {
            K.val(a);
            G.focus()
        } else {
            K.focus()
        }
    };
    var e = function() {
        $.getScript("/js/pagedialog.js", d)
    };
    $.getScript("/js/comm.js", e)
});