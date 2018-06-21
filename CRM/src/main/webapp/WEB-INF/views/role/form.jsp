<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 角色头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">编辑角色</h4>
</div>

<!-- 角色编辑区域 -->
<div class="modal-body">
	<form id="roleForm" action="role/save" method="post" class="">
		<input name="id" type="hidden" value="${roleModel.id }" /> <input name="createTime" type="hidden" value="${roleModel.createTime }" />
		<div class="form-group">
			<label for="roleName">角色名称:</label> <input name="name" type="text" class="form-control" id="roleName" value="${roleModel.name }" data-rule="required" maxlength="100" placeholder="角色名称..." />
		</div>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="role-save btn btn-primary">保存</button>
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
</div>


<script type="text/javascript">
    $(function() {
        // 保存角色
        $("#roleBody").find('.role-save').click(function() {
            saveRole();
        });
    });

    //保存角色
    function saveRole() {
        if (!$('#roleForm').isValid()) {
            return false;
        }
        $("#roleForm").ajaxSubmit({
            url : "role/save",
            dataType : "json",
            data : {

            },
            success : function(result) {
                // 返回状态是0代表操作成功
                if (result.status == 0) {
                    $("#addRoleModal").modal("hide");
                    roleTable.ajax.reload();
                } else {
                    toastr.error('保存失败！');
                }
            }
        });
    }
</script>
