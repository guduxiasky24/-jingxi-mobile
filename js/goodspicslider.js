(function(b){b.picslider=function(l,n){var k=b(l),j=b.extend({},b.picslider.defaults,n),i=("ontouchstart" in window)||window.DocumentTouch&&document instanceof DocumentTouch,m=(i)?"touchend":"click",a={};b.data(l,"picflexslider",k);a={init:function(){k.animating=false;k.currentSlide=j.startAt;k.animatingTo=k.currentSlide;k.containerSelector=j.selector.substr(0,j.selector.search(" "));k.slides=b(j.selector,k);k.container=b(k.containerSelector,k);k.count=k.slides.length;k.viewMaxW=j.viewMaxW;k.prop="marginLeft";k.padding=0;k.x=0;k.args={};k.transitions=(function(){var c=document.createElement("div"),d=["perspectiveProperty","WebkitPerspective","MozPerspective","OPerspective","msPerspective"];for(var e in d){if(c.style[d[e]]!==undefined){k.pfx=d[e].replace("Perspective","").toLowerCase();k.prop="-"+k.pfx+"-transform";return true}}return false}());if(j.controlsContainer!==""){k.controlsContainer=b(j.controlsContainer).length>0&&b(j.controlsContainer)}k.doMath();k.setup();if(j.directionNav){a.directionNav.setup()}if(i&&j.touch){a.touch()}b(window).bind("resize focus",a.resize)},directionNav:{setup:function(){var c=b('<ul class="direction-nav"><li class="prev"></li><li class="next"></li></ul>');if(k.controlsContainer){b(k.controlsContainer).append(c);k.directionNav=b(".direction-nav li",k.controlsContainer)}else{k.append(c);k.directionNav=b(".direction-nav li",k)}a.directionNav.update();k.directionNav.bind(m,function(e){e.preventDefault();if(k.direction=="touch"){return}var d=(b(this).hasClass("next"))?k.getTarget("next"):k.getTarget("prev");k.flexAnimate(d,true)})},update:function(){k.directionNav.hide().width((k.w-j.itemW)/2-5).fadeIn("fast")}},touch:function(){var e,g,u,d,y,w,c,v,f=true;l.addEventListener("touchstart",h,false);function h(o){if(k.animating){o.preventDefault()}else{if(o.touches.length===1){d=k.computedW;w=0;u=(k.currentSlide+k.cloneOffset)*d-k.padding;e=o.touches[0].pageX;g=o.touches[0].pageY;l.addEventListener("touchmove",x,false);l.addEventListener("touchend",z,false)}}}function x(o){y=e-o.touches[0].pageX;f=(Math.abs(y)<Math.abs(o.touches[0].pageY-g));if(!f){k.direction="touch";o.preventDefault();if(Math.abs(y-w)>3){w=y;if(k.transitions){k.setProps(u+y,"setTouch")}}}}function z(o){o.preventDefault();if(k.animatingTo===k.currentSlide&&!f&&!(y===null)){var p=y,q=(p>0)?k.getTarget("next"):k.getTarget("prev");if(k.canAdvance(q)){k.flexAnimate(q,true)}else{k.flexAnimate(k.currentSlide,true,true)}k.direction=""}l.removeEventListener("touchmove",x,false);l.removeEventListener("touchend",z,false);e=null;g=null;y=null;u=null}},resize:function(){k.doMath();k.setProps(k.computedW,"setTotal");a.directionNav.update()}};k.flexAnimate=function(e,c,s){if(!k.animating&&(k.canAdvance(e)||s)&&k.is(":visible")){k.animating=true;k.animatingTo=e;k.slides.removeClass("active-slide").eq(e).addClass("active-slide");var g=k.computedW,h,r,t,f=true,d;if(k.currentSlide===0&&e===k.count-1&&k.direction!=="next"){r=k.x-k.count*g;d=k.count*g}else{if(k.currentSlide===k.last&&e===0&&k.direction!=="prev"){r=k.x+k.count*g;d=g}else{r=(e+k.cloneOffset)*g;f=false}}if(f){k.setProps(-r,"init",0);setTimeout(function(){k.setProps(d,"",j.animationSpeed)},100)}else{k.setProps(r,"",j.animationSpeed)}if(k.transitions){k.animating=false;k.currentSlide=k.animatingTo;k.container.unbind("webkitTransitionEnd transitionend");k.container.bind("webkitTransitionEnd transitionend",function(){k.wrapup(g)})}}};k.wrapup=function(c){if(k.currentSlide===0&&k.animatingTo===k.last){k.setProps(c,"jumpEnd")}else{if(k.currentSlide===k.last&&k.animatingTo===0){k.setProps(c,"jumpStart")}}k.animating=false;k.currentSlide=k.animatingTo};k.canAdvance=function(c){return(c===k.currentSlide)?false:true};k.getTarget=function(c){k.direction=c;if(c==="next"){return(k.currentSlide===k.last)?0:k.currentSlide+1}else{return(k.currentSlide===0)?k.last:k.currentSlide-1}};k.setProps=function(c,f,e){var d=(function(){var g=(function(){switch(f){case"setTotal":return(k.currentSlide+k.cloneOffset)*c-k.padding;case"setTouch":return c;case"init":return c;case"jumpEnd":return k.count*c-k.padding;case"jumpStart":return c-k.padding;default:return c-k.padding}}());k.x=g*-1;return k.x+"px"}());if(k.transitions){d="translate3d("+d+",0,0)";e=(e!==undefined)?(e/1000)+"s":"0s";k.container.css("-"+k.pfx+"-transition-duration",e)}k.args[k.prop]=d;if(k.transitions||e===undefined){k.container.css(k.args)}};k.setup=function(){k.viewport=b('<div class="flex-viewport"></div>').css({overflow:"hidden",position:"relative"}).appendTo(k).append(k.container);k.cloneCount=0;k.cloneOffset=0;k.cloneCount=2;k.cloneOffset=1;k.container.append(k.slides.first().clone().addClass("clone")).prepend(k.slides.last().clone().addClass("clone"));k.newSlides=b(j.selector,k);k.newSlides.css({width:k.computedW,"float":"left",display:"block"});var c=k.currentSlide+k.cloneOffset;k.container.width((k.count+k.cloneCount)*100+"%");var d=parseInt((k.viewMaxW-k.w)/2);k.setProps(d,"init");setTimeout(function(){k.find("div.loading").remove();k.container.show()},100)};k.doMath=function(){k.w=k.parent().width();if(k.w>k.viewMaxW){k.w=k.viewMaxW}k.width(k.w);k.padding=(k.w-j.itemW)/2;k.pagingCount=k.count;k.last=k.count-1;k.computedW=j.itemW};a.init()};b.picslider.defaults={selector:".slides > li",startAt:0,slideshowSpeed:5000,animationSpeed:400,itemW:210,viewMaxW:630,touch:true,directionNav:true,prevText:"",nextText:"",controlsContainer:"",};b.fn.picslider=function(a){a=a||{};return this.each(function(){var e=b(this);if(a.selector===undefined){a.selector=".slides > li"}var f=e.find(a.selector);if(f.length===0){return}else{if(f.length===1){e.find("div.loading").remove();f.parent().fadeIn(400)}else{if(e.data("picslider")===undefined){new b.picslider(this,a)}}}})}})(jQuery);
