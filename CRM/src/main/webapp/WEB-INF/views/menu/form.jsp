<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#menu_form .menuIcon {
	display: block;
	width: 100%;
	height: 34px;
	padding: 5px 1px;
	font-size: 14px;
	line-height: 1.42857;
	vertical-align: middle;
	color: #FFF background-image: none;
}
</style>

<div class="modal-header">
	<div class="widget-header">
		<div class="widget-title lighter">菜单编辑</div>
	</div>
</div>

<!-- 菜单编辑区域 -->
<div class="panel-body">
	<form id="menu_form" name="menu" role="form" onSubmit="return false;">
		<input id="menuId" type="hidden" name="id" value="${menu.id }" /> <input id="icon" type="hidden" name="icon" value="${menu.icon }" /> <input id="parentId" type="hidden" name="parent.id" value="${menuId }" />

		<div class="row">
			<div class="form-group col-md-6">
				<label for="menuName">菜单名称（必填）：</label> <input class="form-control validate[required]" name="name" value="${menu.name}" data-rule="required" placeholder="菜单名称..." maxlength="50" />
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-6">
				<label for="menuUrl">菜单URL（必填）：</label> <input class="form-control validate[required]" name="url" value="${menu.url}" placeholder="菜单URL..." maxlength="50" />
			</div>

			<div class="col-md-6 table-form-item">
				<label for="menuIcon">菜单图标:</label> <a href="menu/selectMenuIcon" data-target="#menuIconForm" data-toggle="modal" class="menuIcon"><i id="menuIconView" class="${menu.icon }">选择图标</i> </a>
			</div>
		</div>

		<div class="row">
			<div class="modal fade" id="menuIconForm" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<span> &nbsp;&nbsp;亲，系统正在为你努力加载中... </span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<hr>
			<div class="col-md-12 text-center">
				<button type="submit" class="save-user-btn btn btn-primary">保存</button>
				<button type="button" class="add-resource btn btn-info" style="display: none;" data-id="${menu.id}">添加资源</button>
			</div>
		</div>

		<!-- 资源编辑区域 -->
		<div id="resourceForm"></div>
	</form>
</div>

<script type="text/javascript">
    var menuId = $("#menuId").val();
    var parentId = $("#parentId").val();
    $(function() {
        if (("" != menuId) && ("" != parentId)) {
            $(".add-resource").css("display", "inline");
            loadMenuResoruceList();
        }
        var $menuForm = $('#menu_form');

        // 提交参数
        var submitFormOptions = {
            url : 'menu/save',
            type : 'POST',
            success : function(response) {
                // 如果返回的状态是0表示操作成功
                if (response.status == '0') {
                    toastr.success('菜单保存成功！');
                    // 保存排序
                    $('.menu-save-sort-btn').click();
                } else {
                    toastr.warning('菜单保存失败！' + response.error);
                }
            },
            error : function(context, xhr) {
                $.alert({
                    title : '出现错误',
                    content : xhr,
                    confirmButton : '确定'
                });
            }
        };

        // 菜单提交
        $menuForm.submit(function() {
            // 如果校验不通过
            if (!$('#menu_form').isValid()) {
                return false;
            }
            $(this).ajaxSubmit(submitFormOptions);
        });

        // 添加资源按钮
        $('.add-resource').click(function() {
            loadMenuResoruce();
        });

    });

    // 进入角色资源信息编辑页面
    function loadMenuResoruce() {
        $('#resourceForm').load('menu/resource/' + menuId, function(e) {

        });
    }

    // 进入角色资源信息列表页面
    function loadMenuResoruceList() {
        $('#resourceForm').load('menu/resource/list/' + menuId, function(e) {

        });
    }

    // 选择图标操作
    function doConfirmSelectIcon(iconName) {
        $('#menuIconView').removeClass().addClass(iconName);
        $('#icon').val(iconName);
    }
</script>
