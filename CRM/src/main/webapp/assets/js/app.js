// 菜单展开速度
$.menu_speed = 200;
$.navbar_height = 49;
$.root_ = $('body');
$.left_panel = $('#left-panel');
$.shortcut_dropdown = $('#shortcut');
$.bread_crumb = $('#ribbon ol.breadcrumb');
container = $('#content');

$(document).ready(function() {
    // 初始化左侧菜单
    if (!null) {
        $('nav ul').leftNavMenu({
            accordion : true,
            speed : $.menu_speed,
            closedSign : '<em class="fa fa-expand-o"></em>',
            openedSign : '<em class="fa fa-collapse-o"></em>'
        });
    } else {
        alert("Error - 菜单初始化失败");
    }

    // 左侧菜单折叠处理
    $('.minifyme').click(function(e) {
        $('body').toggleClass("minified");
        $(this).effect("highlight", {}, 500);
        e.preventDefault();
    });

    // 快速导航弹出菜单
    $('#activity').click(function(e) {
        var $this = $(this);
        if ($this.find('.badge').hasClass('bg-color-red')) {
            $this.find('.badge').text("0");
        }

        if (!$this.next('.ajax-dropdown').is(':visible')) {
            $this.next('.ajax-dropdown').fadeIn(150);
            $this.addClass('active');
        } else {
            $this.next('.ajax-dropdown').fadeOut(150);
            $this.removeClass('active')
        }

        var mytest = $this.next('.ajax-dropdown').find('.btn-group > .active > input').attr('id');
        e.preventDefault();
    });

    $('input[name="activity"]').change(function() {
        var $this = $(this);
        url = $this.attr('url');
        var notifications = $('.ajax-notifications');

        loadURL(url, notifications);
    }).first().click();

    //点击 ajax-dropdown 以外区域，关闭 ajax-dropdown 窗口
    $(document).mouseup(function(e) {
        if (!$('.ajax-dropdown').is(e.target) && $('.ajax-dropdown').has(e.target).length === 0) {
            $('.ajax-dropdown').fadeOut(150);
            $('.ajax-dropdown').prev().removeClass("active")
        }
    });

});

// 自定义左侧菜单
$.fn.extend({
    leftNavMenu : function(options) {
        var defaults = {
            accordion : 'true',
            speed : 200,
            closedSign : '[+]',
            openedSign : '[-]'
        };

        var opts = $.extend(defaults, options);
        var $this = $(this);

        $this.find("li").each(function() {
            if ($(this).find("ul").size() != 0) {
                $(this).find("a:first").append("<b class='collapse-sign'>" + opts.closedSign + "</b>");

                if ($(this).find("a:first").attr('href') == "#") {
                    $(this).find("a:first").click(function() {
                        return false;
                    });
                }
            }
        });

        // 展开菜单
        $this.find("li.active").each(function() {
            $(this).parents("ul").slideDown(opts.speed);
            $(this).parents("ul").parent("li").find("b:first").html(opts.openedSign);
            $(this).parents("ul").parent("li").addClass("open")
        });

        $this.find("li a").click(function() {
            if ($(this).parent().find("ul").size() != 0) {
                if (opts.accordion) {
                    if (!$(this).parent().find("ul").is(':visible')) {
                        parents = $(this).parent().parents("ul");
                        visible = $this.find("ul:visible");
                        visible.each(function(visibleIndex) {
                            var close = true;
                            parents.each(function(parentIndex) {
                                if (parents[parentIndex] == visible[visibleIndex]) {
                                    close = false;
                                    return false;
                                }
                            });
                            if (close) {
                                if ($(this).parent().find("ul") != visible[visibleIndex]) {
                                    $(visible[visibleIndex]).slideUp(opts.speed, function() {
                                        $(this).parent("li").find("b:first").html(opts.closedSign);
                                        $(this).parent("li").removeClass("open");
                                    });

                                }
                            }
                        });
                    }
                }
                if ($(this).parent().find("ul:first").is(":visible") && !$(this).parent().find("ul:first").hasClass("active")) {
                    $(this).parent().find("ul:first").slideUp(opts.speed, function() {
                        $(this).parent("li").removeClass("open");
                        $(this).parent("li").find("b:first").delay(opts.speed).html(opts.closedSign);
                    });

                } else {
                    $(this).parent().find("ul:first").slideDown(opts.speed, function() {
                        $(this).parent("li").addClass("open");
                        $(this).parent("li").find("b:first").delay(opts.speed).html(opts.openedSign);
                    });
                }
            }
        });
    }
});

// 全屏显示
function launchFullscreen(element) {
    if (!$.root_.hasClass("full-screen")) {
        $.root_.addClass("full-screen");
        if (element.requestFullscreen) {
            element.requestFullscreen();
        } else if (element.mozRequestFullScreen) {
            element.mozRequestFullScreen();
        } else if (element.webkitRequestFullscreen) {
            element.webkitRequestFullscreen();
        } else if (element.msRequestFullscreen) {
            element.msRequestFullscreen();
        }
    } else {
        $.root_.removeClass("full-screen");

        if (document.exitFullscreen) {
            document.exitFullscreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.webkitExitFullscreen) {
            document.webkitExitFullscreen();
        }
    }
}

if ($('nav').length) {
    checkURL();
}

// 点击左侧菜单，加载菜单对应页面
$(document).on('click', 'nav a[href!="#"]', function(e) {
    e.preventDefault();
    var $this = $(e.currentTarget);
    if (!$this.parent().hasClass("active") && !$this.attr('target')) {
        if (window.location.search) {
            window.location.href = window.location.href.replace(window.location.search, '').replace(window.location.hash, '') + '#' + $this.attr('href');
        } else {
            window.location.hash = $this.attr('href');
        }
    }
    checkURL();
});

$(document).on('click', 'nav a[target="_blank"]', function(e) {
    e.preventDefault();
    var $this = $(e.currentTarget);

    window.open($this.attr('href'));
});

$(document).on('click', 'nav a[target="_top"]', function(e) {
    e.preventDefault();
    var $this = $(e.currentTarget);

    window.location = ($this.attr('href'));
});

$(document).on('click', 'nav a[href="#"]', function(e) {
    e.preventDefault();
});

function checkURL() {
    var url = location.hash.replace(/^#/, '');

    if (url) {
        $('nav li.active').removeClass("active");
        $('nav li:has(a[href="' + url + '"])').addClass("active");
        var title = ($('nav a[href="' + url + '"]').attr('title'))

        document.title = (title || document.title);

        loadURL(url + location.search, container);
    } else {
        var $this = $('nav > ul > li:first-child > a[href!="#"]');
        window.location.hash = $this.attr('href');
    }
}

//利用 Ajax 技术，根据指定 url 加载页面内容
function loadURL(url, container) {
    $.ajax({
        type : "GET",
        url : url,
        dataType : 'html',
        cache : false,
        beforeSend : function() {
            container.html('<h1><i class="fa fa-cog fa-spin"></i> Loading...</h1>');
            if (container[0] == $("#content")[0]) {
                drawBreadCrumb();
                // 页面向上滚动
                $("html").animate({
                    scrollTop : 0
                }, "fast");
            }
        },
        success : function(data) {
            container.css({
                opacity : '0.0'
            }).html(data).delay(50).animate({
                opacity : '1.0'
            }, 300);

        },
        error : function(xhr, ajaxOptions, thrownError) {
            container.html('<h4 style="margin-top:10px; display:block; text-align:left"><i class="fa fa-warning txt-color-orangeDark"></i> Error 404! Page not found.</h4>');
        },
        async : false
    });
}

// 加载主页面内容
function loadContent(url) {
    loadURL(url, container)
}

// 加载页面导航名称
function drawBreadCrumb() {
    var nav_elems = $('nav li.active > a'), count = nav_elems.length;
    $.bread_crumb.empty();
    $.bread_crumb.append($("<li>首页</li>"));
    nav_elems.each(function() {
        $.bread_crumb.append($("<li></li>").html($.trim($(this).clone().children(".badge").remove().end().text())));
        if (!--count)
            document.title = $.bread_crumb.find("li:last-child").text();
    });

}

$('nav a[href!="#"]').first().click();