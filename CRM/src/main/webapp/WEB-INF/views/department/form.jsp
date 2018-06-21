<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 部门头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">编辑部门</h4>
</div>

<div class=" modal-body">
	<form id="departmentForm" action="department/save" method="post" class="smart-form">
	    <input name="id" type="hidden" value="${departmentModel.id }" /> 
	    <input name="createTime" type="hidden" value="${departmentModel.createTime }" /> 
		<div class="form-group">
			<label class="label">部门名称:</label> <label class="input"> 
			     <input name="name" type="text" value="${departmentModel.name }" data-rule="required" maxlength="100" />
			</label>
		</div>
	</form>
</div>

<div class="modal-footer">
	<button type="button" class="department-save btn btn-primary">保存</button>
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
</div>

<script type="text/javascript">
    $(function() {
        // 保存方法
        $("#departmentBody").find('.department-save').click(function() {
            saveDepartment();
        });
    });

    //保存部门信息
    function saveDepartment() {
        if (!$('#departmentForm').isValid()) {
            return false;
        }
        $("#departmentForm").ajaxSubmit({
            url : "department/save",
            dataType : "json",
            data : {

            },
            success : function(result) {
                // 如果返回状态是0表示操作成功
                if (result.status == 0) {
                    // 关闭编辑窗口
                    $("#departmentModal").modal("hide");
                    // 刷新部门列表
                    departmentTable.ajax.reload();
                } else if (result.status == 2) {
                    toastr.error('部门名已存在！');
                } else {
                    toastr.error('保存失败！');
                }
            }
        });
    }
</script>
