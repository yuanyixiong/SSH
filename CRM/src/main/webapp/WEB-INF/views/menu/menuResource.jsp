<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		var $resourceForm = $('#menu-resource-form');
		var submitFormOptions = {
			url : 'menu/resource/save',
			type : 'POST',
			success : function(data) {
				// 如果返回状态是0表示操作成功
				if (data.status == '0') {
					toastr.success('资源保存成功！');
					loadMenuResoruceList();

				} else {
					toastr.warning('资源保存失败！' + data.error);
				}
			},
			error : function(context, xhr) {
			}
		};
		
		// 资源编辑提交
		$resourceForm.submit(function() {
			// 如果校验不通过
			 if (!$('#menu-resource-form').isValid()) {
					return false;
				}
			$(this).ajaxSubmit(submitFormOptions);
		});
	})
</script>

<br>
<br>
<!-- 资源编辑 -->
<div class="container">
	<div class="row">
		<div class=" address">
			<div class="contact-form">
			<form id="menu-resource-form" name="menu" role="form" onSubmit="return false;">
				<input type="hidden" name="menuId" value="${resourceModel.menuId }" />
				<input type="hidden" name="id"  value="${resourceModel.id }"  />
				<div class="row">
					<div class="form-group col-md-4">
						<label for="name">资源名称：</label>
						<input class="form-control" name="name" value="${resourceModel.name }" data-rule="required"
							placeholder="请输入资源名称..." maxlength="50" />
					</div>
					</div>
					<div class="row">
					<div class="form-group col-md-4">
						<label for="email">资源URL：</label>
						<input class="form-control" name="url" value="${resourceModel.url }" data-rule="required"
							placeholder="请输入资源URL..." maxlength="50" />
					</div>
					</div>
					<button class="btn btn-danger" type="submit">提交</button>
				</form>
			</div>
		</div>
	</div>
</div>
