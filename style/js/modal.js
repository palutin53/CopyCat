$(document).ready(function(e) {
    var mozillaPresente = false,
        mozilla = (function detectarNavegador(navegador) {
        if(navegador.indexOf("Firefox") != -1 ) {
            mozillaPresente = true;
        }   
    })(navigator.userAgent);
    function darEfecto(efecto) {
        el = $('.cajainterna');
        el.addClass(efecto);
        el.one('webkitAnimationEnd oanimationend msAnimationEnd animationend',
        function (e) {
            el.removeClass(efecto);
        });
    }
    function mostrar(e) {
        $(".cajaexterna").show();
        darEfecto("bounceIn");      
    }
    function ocultar() {
        $(".cajaexterna").fadeOut("fast", function() {
            if(mozillaPresente) {
            setTimeout(function() {
                $(".cajainterna").removeClass("bounceIn");
            }, 5);
        }
        });         
    }
    $("a.mostrarmodal").click(mostrar);
    $("a.cerrarmodal").click(ocultar);
});


$(document).ready(function(e) {
    var mozillaPresente = false,
        mozilla = (function detectarNavegador(navegador) {
        if(navegador.indexOf("Firefox") != -1 ) {
            mozillaPresente = true;
        }   
    })(navigator.userAgent);
    function darEfecto(efecto) {
        el = $('.cajainterna2');
        el.addClass(efecto);
        el.one('webkitAnimationEnd oanimationend msAnimationEnd animationend',
        function (e) {
            el.removeClass(efecto);
        });
    }
    function mostrar(e) {
        $(".cajaexterna2").show();
        darEfecto("bounceIn");      
    }
    function ocultar() {
        $(".cajaexterna2").fadeOut("fast", function() {
            if(mozillaPresente) {
            setTimeout(function() {
                $(".cajainterna2").removeClass("bounceIn");
            }, 5);
        }
        });         
    }
    $("a.mostrarmodal2").click(mostrar);
    $("a.cerrarmodal2").click(ocultar);
});


$(document).ready(function(e) {
    var mozillaPresente = false,
        mozilla = (function detectarNavegador(navegador) {
        if(navegador.indexOf("Firefox") != -1 ) {
            mozillaPresente = true;
        }   
    })(navigator.userAgent);
    function darEfecto(efecto) {
        el = $('.cajainterna3');
        el.addClass(efecto);
        el.one('webkitAnimationEnd oanimationend msAnimationEnd animationend',
        function (e) {
            el.removeClass(efecto);
        });
    }
    function mostrar(e) {
        $(".cajaexterna3").show();
        darEfecto("bounceIn");      
    }
    function ocultar() {
        $(".cajaexterna3").fadeOut("fast", function() {
            if(mozillaPresente) {
            setTimeout(function() {
                $(".cajainterna3").removeClass("bounceIn");
            }, 5);
        }
        });         
    }
    $("a.mostrarmodal3").click(mostrar);
    $("a.cerrarmodal3").click(ocultar);
});

$(document).ready(function(e) {
    var mozillaPresente = false,
        mozilla = (function detectarNavegador(navegador) {
        if(navegador.indexOf("Firefox") != -1 ) {
            mozillaPresente = true;
        }   
    })(navigator.userAgent);
    function darEfecto(efecto) {
        el = $('.cajainterna4');
        el.addClass(efecto);
        el.one('webkitAnimationEnd oanimationend msAnimationEnd animationend',
        function (e) {
            el.removeClass(efecto);
        });
    }
    function mostrar(e) {
        $(".cajaexterna4").show();
        darEfecto("bounceIn");      
    }
    function ocultar() {
        $(".cajaexterna4").fadeOut("fast", function() {
            if(mozillaPresente) {
            setTimeout(function() {
                $(".cajainterna4").removeClass("bounceIn");
            }, 5);
        }
        });         
    }
    $("a.mostrarmodal4").click(mostrar);
    $("a.cerrarmodal4").click(ocultar);
});

$(document).ready(function(e) {
    var mozillaPresente = false,
        mozilla = (function detectarNavegador(navegador) {
        if(navegador.indexOf("Firefox") != -1 ) {
            mozillaPresente = true;
        }   
    })(navigator.userAgent);
    function darEfecto(efecto) {
        el = $('.cajainterna5');
        el.addClass(efecto);
        el.one('webkitAnimationEnd oanimationend msAnimationEnd animationend',
        function (e) {
            el.removeClass(efecto);
        });
    }
    function mostrar(e) {
        $(".cajaexterna5").show();
        darEfecto("bounceIn");      
    }
    function ocultar() {
        $(".cajaexterna5").fadeOut("fast", function() {
            if(mozillaPresente) {
            setTimeout(function() {
                $(".cajainterna5").removeClass("bounceIn");
            }, 5);
        }
        });         
    }
    $("a.mostrarmodal5").click(mostrar);
    $("a.cerrarmodal5").click(ocultar);
});

$(document).ready(function(e) {
    var mozillaPresente = false,
        mozilla = (function detectarNavegador(navegador) {
        if(navegador.indexOf("Firefox") != -1 ) {
            mozillaPresente = true;
        }   
    })(navigator.userAgent);
    function darEfecto(efecto) {
        el = $('.cajainterna6');
        el.addClass(efecto);
        el.one('webkitAnimationEnd oanimationend msAnimationEnd animationend',
        function (e) {
            el.removeClass(efecto);
        });
    }
    function mostrar(e) {
        $(".cajaexterna6").show();
        darEfecto("bounceIn");      
    }
    function ocultar() {
        $(".cajaexterna6").fadeOut("fast", function() {
            if(mozillaPresente) {
            setTimeout(function() {
                $(".cajainterna5").removeClass("bounceIn");
            }, 5);
        }
        });         
    }
    $("a.mostrarmodal6").click(mostrar);
    $("a.cerrarmodal6").click(ocultar);
});

$(document).ready(function(e) {
    var mozillaPresente = false,
        mozilla = (function detectarNavegador(navegador) {
        if(navegador.indexOf("Firefox") != -1 ) {
            mozillaPresente = true;
        }   
    })(navigator.userAgent);
    function darEfecto(efecto) {
        el = $('.cajainterna7');
        el.addClass(efecto);
        el.one('webkitAnimationEnd oanimationend msAnimationEnd animationend',
        function (e) {
            el.removeClass(efecto);
        });
    }
    function mostrar(e) {
        $(".cajaexterna7").show();
        darEfecto("bounceIn");      
    }
    function ocultar() {
        $(".cajaexterna7").fadeOut("fast", function() {
            if(mozillaPresente) {
            setTimeout(function() {
                $(".cajainterna7").removeClass("bounceIn");
            }, 5);
        }
        });         
    }
    $("a.mostrarmodal7").click(mostrar);
    $("a.cerrarmodal7").click(ocultar);
});
