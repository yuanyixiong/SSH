<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 产品类别头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">编辑产品类别</h4>
</div>

<div>
	<form id="categogyForm" action="categogy/save" method="post" class="smart-form">
		<fieldset>
			<div class="row">
				<section class="col col-md-6">
					<label class="label">类别名称:</label> <label class="input"> <input name="id" type="hidden" value="${productCategogyModel.id }" /> <input name="createTime" type="hidden" value="${productCategogyModel.createTime }" /> <input name="name" type="text" value="${productCategogyModel.name }" data-rule="required" maxlength="100" />
					</label>
				</section>
				<section class="col col-md-6">
					<label class="label">描述:</label> <label class="input"> <input name="description" type="text" value="${productCategogyModel.description }" data-rule="required" maxlength="100" /> <i></i>
					</label>
				</section>
			</div>
		</fieldset>
	</form>
</div>

<div class="modal-footer">
	<button type="button" class="categogy-save btn btn-primary">保存</button>
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
</div>

<script type="text/javascript">
    $(function() {
        // 初始化保存按钮事件
        $("#categoryBody").find('.categogy-save').click(function() {
            saveCategory();
        });
    });

    //保存产品类别
    function saveCategory() {
        if (!$('#categogyForm').isValid()) {
            return false;
        }
        $("#categogyForm").ajaxSubmit({
            url : "category/save",
            dataType : "json",
            data : {

            },
            success : function(result) {
                // 如果返回的状态是0表示保存成功
                if (result.status == 0) {
                    $("#categoryModal").modal("hide");
                    categoryTable.ajax.reload();
                    // 如果返回的状态是2表示该类别重复可，不能保存成功
                } else if (result.status == 2) {
                    toastr.error('类别名称不能重复！');
                } else {
                    toastr.error('保存失败！');
                }
            }
        });
    }
</script>
