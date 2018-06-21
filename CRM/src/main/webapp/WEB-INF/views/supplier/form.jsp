<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="widget">
	<header role="heading">
		<h2>编辑供应商</h2>
	</header>
	<div role="content">
		<div class="widget-body no-padding">
			<form method="post" id="supplierForm" name="supplier" class="smart-form" onSubmit="return false;">
			     <input type="hidden" name="id" value="${supplierModel.id }" /> 
			     <input name="createTime" type="hidden" value="${supplierModel.createTime }" /> 
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">供应商名称</label> <label class="input"> 
							     <input name="name" value="${supplierModel.name }" type="text">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">编号</label> <label class="input"> 
							     <input type="text" name="code" readonly="readonly" placeholder="自动生成编号" value="${supplierModel.code }">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">电话</label> <label class="input"> 
							     <input type="text" name="mobile" value="${supplierModel.mobile }" data-rule="required;mobile;">
							</label>
						</section>

						<section class="col col-md-6">
							<label class="label">邮箱</label> <label class="input"> 
							     <input type="text" name="email" value="${supplierModel.email }" data-rule="required; email;">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-12">
							<label class="label">说明</label> <label class="input"> 
							     <textarea class="form-control" rows="3" style="resize: none; width: 100%;" name="instruction" maxlength="500">${supplierModel.instruction }</textarea>
							</label>
						</section>
					</div>
				</fieldset>
				<footer>
					<button type="submit" name="submit" class="save-supplier-btn btn btn-primary">保存</button>
					<button type="button" class="btn btn-default supplier-cancel">取消</button>
				</footer>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
    $(function() {
        // 初始化保存按钮事件
        $("#supplierForm").find('.save-supplier-btn').click(function() {
            saveSupplier();
        });

        // 初始化取消操作
        $('.supplier-cancel').click(function() {
            cancelSupplier();
        });
    });

    //保存产品类别
    function saveSupplier() {
        if (!$('#supplierForm').isValid()) {
            return false;
        }
        $("#supplierForm").ajaxSubmit({
            url : "supplier/save",
            dataType : "json",
            data : {

            },
            success : function(result) {
                // 如果返回的状态是0表示保存成功
                if (result.status == 0) {
                    loadContent("supplier/list");
                } else {
                    toastr.error('保存失败！');
                }
            }
        });
    }

    //取消编辑按钮
    function cancelSupplier() {
        loadContent("supplier/list");
    }
</script>

