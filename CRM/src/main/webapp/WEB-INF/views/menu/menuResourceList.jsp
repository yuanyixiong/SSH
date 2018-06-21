<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<style>
</style>
<script type="text/javascript">
 	var menuId = ${menuId};
	$(function() {
		// 删除资源
		$('.resource-remove-btn').click(function(e) {
			e.preventDefault();
			var resourceId = $(this).attr('target');
			$.confirm({
				title : false,
				content : '是否确认删除菜单资源？',
				confirmButton : '确认',
				cancelButton : '取消',
				confirm : function() {
					//执行删除
					$.ajax({
						url : "${ctx}/menu/resource/delete/" + resourceId+"/"+menuId,
						type : 'DELETE',
						success : function(result) {
							toastr.success('菜单资源删除成功！');
							loadMenuResoruceList();
						}
					});
				},
				cancel : function() {
				}
			});
		});
		
		// 资源编辑按钮
		$('.resource-edit-btn').click(
				function(e) {
					e.preventDefault();
					var resourceId = $(this).attr('target');
					$('#resourceForm').load(
							"${ctx}/menu/resource/form/"+resourceId+"/"+menuId ,
							function(e) {

							});
				});
	});
	
</script>

<!-- 资源列表展示 -->
<div class="row">
	<c:forEach var="item" items="${resources}">
		<li class="dd-item"  >
			<div class="dd3-content" >
				<div class="row">
					<div class="col-xs-12 col-lg-5">
					<p>名称：${item.name}</p> 
					</div>
					<div class="col-xs-12 col-lg-5">
						<p>url：${item.url}</p>
					</div>
					<div class="pull-right action-buttons col-xs-12 col-lg-2">
						<a class="resource-edit-btn blue" href="#" target="${item.id }">
							<i class="fa fa-pencil"></i>
						</a> <a class="resource-remove-btn red" href="#" target="${item.id }">
							<i class="fa fa-minus"></i>
						</a>
					</div>
				</div>
			</div>
		</li>
	</c:forEach>
</div>
