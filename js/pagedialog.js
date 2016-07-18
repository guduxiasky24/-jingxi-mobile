(function(b) {
    b.PageDialog = function(v, a) {
        var s = {
            W: 255,
            H: 45,
            obj: null,
            oL: 0,
            oT: 0,
            autoClose: true,
            autoTime: 1000,
            ready: function() {},
            submit: function() {}
        };
        var u = {
            obj: null,
            oL: 0,
            oT: 0,
            autoClose: true,
            autoTime: 1000,
            ready: function() {},
            submit: function() {}
        };
        a = a || u;
        b.extend(s, a);
        var w = s.autoClose;
        var p = function(d) {
            var g = d.get(0);
            g.addEventListener("touchstart", e, false);
            function e(h) {
                if (h.touches.length === 1) {
                    g.addEventListener("touchmove", f, false);
                    g.addEventListener("touchend", c, false)
                }
            }
            function f(h) {
                h.preventDefault()
            }
            function c(h) {
                g.removeEventListener("touchmove", f, false);
                g.removeEventListener("touchend", c, false)
            }
        };
        var n = b("#pageDialogBG");
        if (!w && n.length == 0) {
            n = b('<div id="pageDialogBG" class="pageDialogBG"></div>');
            n.appendTo("body");
            p(n)
        }
        var q = b("#pageDialog");
        if (q.length == 0) {
            q = b('<div id="pageDialog" class="pageDialog" />');
            q.appendTo("body");
            if (!w) {
                p(q)
            }
        }
        var x = b(window);
        if (s.obj != null) {
            if (s.obj.length < 1) {
                s.obj = null
            }
        }
        q.css({
            width: s.W + "px",
            height: s.H + "px"
        });
        q.html(v);
        var o = function() {
            var f, d, c;
            if (s.obj != null) {
                var e = s.obj.offset();
                f = e.left + s.oL;
                d = e.top + s.obj.height() + s.oT;
                c = "absolute"
            } else {
                f = (x.width() - s.W) / 2;
                d = (x.height() - s.H) / 2;
                c = "fixed"
            }
            q.css({
                position: c,
                left: f,
                top: d
            })
        };
        o();
        x.resize(o);
        var r = function() {
            x.unbind("resize");
            if (w) {
                q.fadeOut("slow")
            } else {
                q.hide();
                n.hide()
            }
        };
        var t = function() {
            s.submit();
            r()
        };
        if (w) {
            q.fadeIn(500)
        } else {
            n.show();
            q.show()
        }
        q.ready = s.ready();
        if (w) {
            window.setTimeout(t, s.autoTime)
        }
        this.close = function() {
            t()
        };
        this.cancel = function() {
            r()
        }
    };
    b.PageDialog.ok = function(d, a) {
        b.PageDialog('<div class="Prompt">' + d + "</div>", {
            submit: (a === undefined ?
            function() {}: a)
        })
    };
    b.PageDialog.fail = function(h, i, g, a, j) {
        b.PageDialog('<div class="Prompt">' + h + "</div>", {
            obj: i,
            oT: g,
            oL: a,
            autoTime: 2000,
            submit: (j === undefined ?
            function() {}: j)
        })
    };
    b.PageDialog.confirm = function(h, l, a) {
        var j = null;
        var k = '<div class="clearfix m-round u-tipsEject"><div class="u-tips-txt">' + h + '</div><div class="u-Btn"><div class="u-Btn-li"><a href="javascript:;" id="btnMsgCancel" class="z-CloseBtn">\u53d6\u6d88</a></div><div class="u-Btn-li"><a id="btnMsgOK" href="javascript:;" class="z-DefineBtn">\u786e\u5b9a</a></div></div></div>';
        var i = function() {
            b("#btnMsgCancel").click(function() {
                j.cancel()
            });
            b("#btnMsgOK").click(function() {
                j.close()
            })
        };
        j = new b.PageDialog(k, {
            H: (a === undefined ? 126 : a),
            autoClose: false,
            ready: i,
            submit: l
        })
    }
})(jQuery);