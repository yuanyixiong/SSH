<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 角色头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">修改密码</h4>
</div>

<!-- 角色编辑区域 -->
<div class="modal-body">
	<form id="updatePasswordForm" method="post">
		<input name="userId" type="hidden" value="${userId}" />
		<div class="form-group">
			<label for="roleName">输入新密码:</label> <input name="password" type="password" class="form-control" data-rule="required" maxlength="100" placeholder="请输入密码..." />
		</div>
		<div class="form-group">
			<label for="roleName">再次输入新密码:</label> <input name="passwordAgain" type="password" class="form-control" data-rule="required" maxlength="100" placeholder="请再次输入密码..." />
		</div>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="password-save btn btn-primary">保存</button>
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
</div>


<script type="text/javascript">
    $(function() {
        // 保存角色
        $("#updatePasswordModal").find('.password-save').click(function() {
            doUpdatePassword();
        });
    });

    //保存角色
    function doUpdatePassword() {
        if (!$('#updatePasswordForm').isValid()) {
            return false;
        }
        $("#updatePasswordForm").ajaxSubmit({
            url : "user/password/update",
            dataType : "json",
            data : {

            },
            success : function(result) {
                // 返回状态是0代表操作成功
                if (result.status == 0) {
                    toastr.success('密码保存成功！');
                    $("#updatePasswordModal").modal("hide");
                } else {
                    toastr.error('保存失败！' + result.data);
                }
            }
        });
    }
</script>
