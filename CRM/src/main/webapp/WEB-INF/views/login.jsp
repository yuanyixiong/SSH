<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.authentication.BadCredentialsException"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="utf-8">
<title>实训在线-CRM</title>

<meta name="description" content="实训在线">
<meta name="author" content="实训在线">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/assets/plugins/bootstrap/bootstrap.min.css">

<!-- 字体图标css 官网地址http://fontawesome.dashgame.com/ -->
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/assets/plugins/font-awesome/css/font-awesome.min.css">

<!-- 基于bootstrap的提示框架 下载地址https://github.com/CodeSeven/toastr -->
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/assets/plugins/bootstrap-toastr/toastr.min.css">

<!-- 自定义css文件 -->
<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/assets/css/style.css">

</head>

<body id="login" class="animated fadeInDown">
	<header id="header">
		<div id="logo-group">
			<span id="logo"> 实训在线 CRM </span>
		</div>
	</header>

	<div id="main" role="main">
		<div id="content" class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm">
					<h1 class="txt-color-red login-header-big">实训在线-客户关系管理系统</h1>
					<div class="hero">
						<div class="pull-left login-desc-box-l">
							<h4 class="paragraph-header">CRM（Customer Relationship Management）。企业利用相应的信息技术以及互联网技术来协调企业与顾客间在销售、营销和服务上的交互，从而提升其管理方式，向客户提供创新式的个性化的客户交互和服务的过程。</h4>
							<hr>
							<h4>演示用户：admin/admin 或 sales/sales</h4> 
							<br>
							<h4>为保证演示数据完整性，系统中“更新”和“删除”操作已经屏蔽</h4>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
					<div class="well no-padding">
						<form action="${ctx }/dologin" method="post" id="login-form" class="smart-form">
							<header> 系统登录 </header>

							<fieldset>
								<section>
									<label class="label">登录名</label> <label class="input"> <i class="icon-append fa fa-user"></i> <input type="text" name="username"> <b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> 请输入登录名</b>
									</label>
								</section>

								<section>
									<label class="label">登录密码</label> <label class="input"> <i class="icon-append fa fa-lock"></i> <input type="password" name="password"> <b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> 请输入登录密码</b>
									</label>
								</section>
								<div class="row">
									<section class="col col-md-6">
										<label class="label">验证码</label> <label class="input"> <input type="text" id="captchaValue" name="captcha">
										</label>
										<div class="note">
											<br>
										</div>
									</section>
									<section class="col col-md-6">
										<label class="label login-label">&nbsp;</label> <label class="input"> <img class="login-captcha" id="captcha" alt="验证码" onclick="changeCaptcha()">
										</label>
									</section>
								</div>

								<%
								    Object error = session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
											if (error != null) {
								%>
								<div class="alert alert-warning fade in">
									<%
									    String errorMessage = ((Exception) error).getMessage();
													String errorHitKey = errorMessage;
													if (errorMessage == null || errorMessage.equals("Bad credentials")) {
														errorHitKey = "errors.password.mismatch";
													}
													session.removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");
									%>
									<fmt:message key="<%=errorHitKey%>" />
								</div>
								<%
								    }
								%>
							</fieldset>
							<footer>
								<button type="button" class="btn btn-primary btn-block" onclick="validation()">登录</button>
							</footer>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery压缩库，版本号query-2.0.2 jquey官网地址https://jquery.com -->
	<script src="${ctx}/assets/plugins/jquery-2.0.2.min.js"></script>

	<script src="${ctx}/assets/plugins/jquery-ui-1.10.3.min.js"></script>

	<!-- jQuery UI 是一个建立在 jQuery JavaScript 库上的小部件和交互库 官网地址http://jqueryui.com/download -->
	<script src="${ctx}/assets/plugins/bootstrap/bootstrap.min.js"></script>

	<!-- jquery校验框架 官网地址https://jqueryvalidation.org/-->
	<script src="${ctx}/assets/plugins/jquery-validate/jquery.validate.min.js"></script>

	<!-- 基于bootstrap的提示框架 下载地址https://github.com/CodeSeven/toastr -->
	<script src="${ctx}/assets/plugins/bootstrap-toastr/toastr.min.js"></script>

	<script type="text/javascript">
        $(function() {
            // 初始化验证码
            changeCaptcha();

            // 登录form校验
            $("#login-form").validate({
                // 校验规则
                rules : {
                    username : {
                        required : true
                    },
                    password : {
                        required : true,
                        minlength : 3,
                        maxlength : 20
                    }
                },

                // 校验提示
                messages : {
                    username : {
                        required : '请输入登录名'
                    },
                    password : {
                        required : '请输入密码'
                    }
                },

                // 不要改变一下的代码(使用方式)
                errorPlacement : function(error, element) {
                    error.insertAfter(element.parent());
                }
            });
        });

        // 刷新验证码
        function changeCaptcha() {
            $("#captcha").attr("src", "${ctx}/captcha/generate?temp=" + Math.random());
        }

        //回车触发登录
        $(document).keyup(function(event) {
            //点击回车触发
            if (event.keyCode == 13) {
                validation();
            }
        });

        // 利用 Ajax 方式验证码校验
        function validation() {
            $.ajax({
                type : "post",
                url : '${ctx}/captcha/check',
                data : {
                    "captcha" : $("#captchaValue").val()
                },
                success : function(result) {
                    // 如果返回的状态是0表示操作成功
                    if (result.status == 0) {
                        $("#login-form").submit();
                    } else {
                        toastr.error('验证码错误！');
                        $("#captchaValue").focus();
                    }
                }
            });
        }
    </script>
</body>
</html>