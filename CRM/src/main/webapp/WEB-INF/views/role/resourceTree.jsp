<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function() {
		// 初始化角色授权
		initResource(${roleId}, ${data});
	});
	
	//初始化角色授权
	function initResource(roleId, data) {
		$('#resourceTree').jstree({
			'plugins' : [ "wholerow", "checkbox" ],
			'core' : {
				'data' : data
			}
		});

		// 保存角色授权授权
		$('#saveAuthorizationBtn').click(function(e) {
			// 取得所有选中的节点，返回节点对象的集合
			var ids = "";
			var nodes = $("#resourceTree").jstree("get_checked");// 使用get_checked方法
			$.each(nodes, function(i, n) {
				ids += n + ",";
			});
			$.post('role/saveResource/' + roleId, {
				ids : ids,
			}, function(response) {
				// 返回状态是0代表操作成功
				if (response.status == '0') {
					toastr.success('角色授权成功！');

				} else {
					toastr.warning('角色授权失败！' + response.error);
				}
			});
		});
	}
</script>

<!-- 角色树 -->
<div id="resourceTree"></div>

<div class="row">
	<hr>
	<div class="col-md-12 text-center">
		<button id="saveAuthorizationBtn" type="button" class="btn btn-info">保存授权</button>
	</div>
</div>

