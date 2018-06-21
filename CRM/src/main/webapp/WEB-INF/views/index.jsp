<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="utf-8">
<title>实训在线-CRM</title>
<meta name="description" content="实训在线">
<meta name="author" content="实训在线">

<!-- Bootstrap是Twitter推出的一个用于前端开发的开源工具包 -->
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/assets/plugins/bootstrap/bootstrap.min.css">

<!-- 字体图标css 官网地址 http://fontawesome.dashgame.com/ -->
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/assets/plugins/font-awesome/css/font-awesome.min.css">

<!-- jquery确认提示框样式文件  官网jquery-confirm -->
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/assets/plugins/jquery-confirm/jquery-confirm.min.css">

<!-- 基于bootstrap的提示框架 -->
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/assets/plugins/bootstrap-toastr/toastr.min.css">

<!-- 自定义css样式文件 -->
<link href="${ctx}/assets/plugins/jstree/themes/default/style.min.css" rel="stylesheet" />

<!-- jquery拖动排序插件样式文件 -->
<link rel="stylesheet" type="text/css" href="${ctx}/assets/plugins/nestable/jquery.nestable.css" />

<!-- 自定义样式文件 -->
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/assets/css/style.css">

<script type="text/javascript">
    // 全局的 ContextPath 变量
    var ctx = '${ctx}';
</script>

</head>

<body class="index-body fixed-header fixed-ribbon fixed-navigation">
	<!-- 首页头部分 -->
	<header id="header">
		<!-- 标题和logo -->
		<div id="logo-group">
			<span id="logo"> 实训在线 CRM </span>

			<!-- 导航栏 -->
			<span title="导航" id="activity" class="activity-dropdown"> <i class="fa fa-lightbulb-o"></i>
			</span>

			<!-- 下拉菜单 -->
			<div class="ajax-dropdown">

				<!-- ID链接是通过Ajax获得的AJAX容器”Ajax的通知” -->
				<div class="btn-group btn-group-justified" data-toggle="buttons">
					<label class="btn btn-default"> <input type="radio" name="activity" url="index/navigation/business"> 商机导航
					</label> <label class="btn btn-default"> <input type="radio" name="activity" url="index/navigation/menu"> 所有菜单
					</label>
				</div>

				<!-- 通知的内容 -->
				<div class="ajax-notifications custom-scroll"></div>
			</div>
		</div>

		<!-- 右侧操作按钮部门 -->
		<div id="buttons" class="pull-right">
			<div class="user-info">欢迎您:${user.loginName }</div>

			<!-- 退出按钮 -->
			<div id="logout" class="btn-header transparent pull-right">
				<span> <a href="${ctx }/logout" title="退出系统" data-logout-msg="是否确认退出系统？"> <i class="fa fa-sign-out"></i>
				</a>
				</span>
			</div>

			<form action="" class="header-search pull-right">
				<input type="text" placeholder="快速搜索" id="search-fld">
				<button id="searchButton" class="search-button" type="button">
					<i class="fa fa-search"></i>
				</button>
				<a href="javascript:void(0);" id="cancel-search-js" title="Cancel Search"><i class="fa fa-times"></i></a>
			</form>

			<!-- 全屏按钮 -->
			<div id="fullscreen" class="btn-header transparent pull-right">
				<span> <a href="javascript:void(0);" onclick="launchFullscreen(document.documentElement);" title="Full Screen"> <i class="fa fa-fullscreen"></i>
				</a>
				</span>
			</div>
		</div>
	</header>

	<!-- 左侧菜单栏部分 -->
	<aside id="left-panel">
		<nav>
			<ul>
				<!-- 首页 -->
				<li class="dashboard">
					<a href="dashboard/" title="Dashboard"> <i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">统计分析</span>
					</a>
				</li>

				<!-- 其他菜单模块 -->
				<c:forEach var="topMenu" items="${userMenus}">
					<!-- 一级菜单 -->
					<li class="sub-menu">
						<a href="#"> <i class="${topMenu.icon }"></i> <span class="menu-item-parent">${topMenu.name }</span>
						</a>
						<!-- 二级菜单 -->
						<ul class="sub">
							<c:forEach var="subMenu" items="${topMenu.children}">
								<li>
									<a href="${subMenu.url }">${subMenu.name }</a>
								</li>
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</nav>
		<span class="minifyme"> <i class="fa fa-arrow-circle-left hit"></i>
		</span>
	</aside>

	<!-- 主界面 -->
	<div id="main" role="main">
		<!-- 菜单导航 -->
		<div id="ribbon">
			<ol class="breadcrumb">
			</ol>
		</div>

		<!-- 主面板 -->
		<div id="content"></div>
	</div>

	<!-- jQuery 官网地址 https://jquery.com -->
	<script src="${ctx}/assets/plugins/jquery-2.0.2.min.js"></script>
	<!-- 时间控件 -->
	<script src="${ctx}/assets/plugins/datePicker/WdatePicker.js"></script>

	<!-- jQuery UI 是一个建立在 jQuery JavaScript 库上的小部件和交互库 官网地址 http://jqueryui.com -->
	<script src="${ctx}/assets/plugins/jquery-ui-1.10.3.min.js"></script>

	<!-- Ajax form提交 官网地址 http://plugins.jquery.com/form/ -->
	<script src="${ctx}/assets/plugins/jquery.form.min.js"></script>

	<!-- Bootstrap是Twitter推出的一个用于前端开发的开源工具包 官网地址http://getbootstrap.com -->
	<script src="${ctx}/assets/plugins/bootstrap/bootstrap.min.js"></script>

	<!-- jquery表格插件 官网地址https://www.datatables.net -->
	<script src="${ctx}/assets/plugins/datatables/jquery.dataTables.min.js"></script>

	<!-- dataTables表格插件Bootstrap定制脚本  -->
	<script src="${ctx}/assets/plugins/datatables/DT_bootstrap.js"></script>

	<!-- nice validate数据校验框架 官网地址http://www.niceue.com/validator/ -->
	<script src="${ctx}/assets/plugins/nice-validator/jquery.validator.js"></script>

	<!-- nice validate校验框架中文包  官网地址http://www.niceue.com/validator -->
	<script src="${ctx}/assets/plugins/nice-validator/local/zh-CN.js"></script>

	<!-- 基于bootstrap的提示框架 下载地址https://github.com/CodeSeven/toastr -->
	<script src="${ctx}/assets/plugins/bootstrap-toastr/toastr.min.js"></script>

	<!-- jquery确认提示框  官网 http://craftpip.github.io/jquery-confirm/-->
	<script src="${ctx}/assets/plugins/jquery-confirm/jquery-confirm.min.js"></script>

	<!-- 树形菜单插件 官网地址https://www.jstree.com/ -->
	<script src="${ctx}/assets/plugins/jstree/jstree.min.js"></script>

	<!-- jquery拖动排序插件 下载地址 https://github.com/dbushell/Nestable  -->
	<script src="${ctx}/assets/plugins/nestable/jquery.nestable.js"></script>

	<!-- 上传图片本地预览插件 -->
	<script src="${ctx}/assets/plugins/uploadPreview.min.js"></script>

	<!-- 图标绘制插件 官网下载地址 http://www.chartjs.org -->
	<script src="${ctx}/assets/plugins/chart/Chart.min.js"></script>

	<!-- 基于html5创建web地图插件 官网地址http://www.hcharts.cn/product/highmaps.php -->
	<script src="${ctx}/assets/plugins/highmaps/highmaps.js"></script>

	<!-- 导出插件 官网地址 https://www.hcharts.cn -->
	<script src="${ctx}/assets/plugins/modules/exporting.js"></script>

	<!-- 中国地图插件 -->
	<script src="${ctx}/assets/js/china-data.js"></script>

	<!-- 自定义数据分页插件 -->
	<script src="${ctx}/assets/js/paging-table.js"></script>

	<!-- 自定义首页面初始化脚本 -->
	<script src="${ctx}/assets/js/app.js"></script>

	<script type="text/javascript">
        $(function() {
            $("#buttons").find('.search-button').click(function() {
                doAllSearch();
            });
        });

        // 全局搜索操作
        function doAllSearch() {
            var name = $("#search-fld").val();
            if (name == "") {
                toastr.warning('请输入搜索内容！');
                return;
            }
            $('#content').load('${ctx}/index/search/' + name, function(e) {

            });
        }
    </script>
</body>
</html>