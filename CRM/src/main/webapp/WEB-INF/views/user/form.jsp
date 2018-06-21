<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="widget">
	<header role="heading">
		<h2>编辑用户</h2>
	</header>
	<div role="content">
		<div class="widget-body no-padding">
			<form novalidate="novalidate" action="#" method="post" id="userForm" class="smart-form">
			     <input type="hidden" id="userId" name="id" value="${userModel.id }" /> 
			     <input type="hidden" id="genderId" value="${userModel.gender }" /> 
			     <input name="createTime" type="hidden" value="${userModel.createTime }" /> 
			     <input name="status.code" type="hidden" value="${userModel.status.code }" />
				<fieldset>
					<div class="row">
						<section class="col col-4">
							<label class="label">登录名</label> <label class="input"> 
							      <input name="loginName" value="${userModel.loginName }" data-rule="required" type="text" maxlength="50">
							</label>
						</section>
						<section class="col col-4">
							<label class="label">用户名</label> <label class="input"> 
							     <input type="text" value="${userModel.name }" data-rule="required" name="name" maxlength="50">
							</label>
						</section>
						<section id="password" class="col col-4">
							<label class="label">密码</label> <label class="input"> 
							     <input type="password" value="${userModel.password }" data-rule="required" name="password" maxlength="20">
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-4">
							<label class="label">邮箱</label> <label class="input"> 
							     <input type="email" name="email" value="${userModel.email }" data-rule="required; email;">
							</label>
						</section>
						<section class="col col-4">
							<label class="label">电话</label> <label class="input"> 
							     <input type="text" name="phone" value="${userModel.phone }" data-rule="required;mobile;">
							</label>
						</section>
						<section class="col col-4">
							<label class="label">性别:</label>
							<div class="inline-group">
								<label class="radio"> <input name="gender" value="男" checked="checked" type="radio"> <i></i> 男
								</label> <label class="radio"> <input name="gender" value="女" type="radio"> <i></i> 女
								</label>
							</div>
						</section>
					</div>

					<div class="row">
						<section class="col col-12">
							<label class="label">授权角色</label>
							<div class="inline-group" id="roles">
							<c:forEach var="item" items="${userModel.roles}">
							     <input type="hidden" class="user-role" value="${item.id }" /> 
							</c:forEach>
							</div>
						</section>
					</div>
				</fieldset>

				<footer>
					<button type="button" class="user-save btn btn-primary">保存</button>
				</footer>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(function() {
        // 加载角色信息
        initUserRole();

        // 修改的时候初始化性别选项
        initUserGender();

        // 初始化密码输入框
        if ($("#userId").val() != "") {
            $("#password").css("display", "none");
        }

        // 初始化保存按钮
        $("#userForm").find('.user-save').click(function() {
            saveUser();
        });
    });

    // 修改的时候初始化性别选项
    function initUserGender() {
        var typeObj = $('input[name="gender"]');
        // 设置选择的类型选中
        for (var i = 0; i < typeObj.length; i++) {
            if (typeObj[i].value == $("#genderId").val()) {
                typeObj[i].checked = true;
            }
        }
    }

    // 初始化角色信息
    function initUserRole() {
        //获取用户已经拥有的角色，存储在一个数组中
        var userRoles = new Array();
        $("#userForm").find('.user-role').each(function(){
            userRoles.push(parseInt($(this).val()));
        });
        
        var url = "role/rolelist";
        $.post(url, function(result) {
            if (null != result) {
                var content = "";
                $.each(result.data, function(i, item) {
                    //用户已经拥有的角色，默认设置为选中状态
                    if ($.inArray(item.id, userRoles) !=  -1){
                        content += "<label class='checkbox' >" + "<input name='selectRole' type='checkbox' checked='checked' value='"+item.id+"'  />" + "<i></i>" + item.name + "</label>";
                    } else {
                        content += "<label class='checkbox' >" + "<input name='selectRole' type='checkbox' value='"+item.id+"'  />" + "<i></i>" + item.name + "</label>";
                    }
                });
                $('#roles').append(content);
            } else {
                toastr.error('获取角色列表失败!');
            }
        });
    }

    // 保存用户信息
    function saveUser() {
        // 验证是否为用户授权
        var selectRoleNumber = $("#userForm input[name='selectRole']:checked").size();
        if(selectRoleNumber == 0){
            toastr.error('请至少为用户选择一个角色！');
            return false;
        }
        
        // 校验不通过不提交
        if (!$('#userForm').isValid()) {
            return false;
        }
        // 校验通过提交
        $("#userForm").ajaxSubmit({
            url : "user/save",
            dataType : "json",
            data : {

            },
            success : function(result) {
                // 返回状态是0代表操作成功
                if (result.status == 0) {
                    toastr.success('保存成功！');
                    // 进入用户列表页面
                    loadContent("user/list");
                } else if (result.status == 2) {
                    toastr.error('登录名已存在！');
                } else {
                    toastr.error('保存失败！');
                }
            }
        });
    }
</script>

