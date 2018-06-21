<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<section id="menuList" class="wrapper">
	<section class="panel">
		<div class="clearfix">
			<div class="btn-group">
				<button class="menu-add-main-btn btn btn-primary">
					<i class="icon-plus"></i> 新增
				</button>
			</div>
			<div class="btn-group">
				<button class="menu-save-sort-btn btn btn-primary">保存排序</button>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<section class="panel">
					<div class="panel-body">
						<div class="dd" id="nestable_list_1">
							<ol class="dd-list">
								<c:forEach var="item" items="${menuTreeData}">
									<li class="dd-item dd3-item" data-id="${item.id }">
										<div class="dd-handle dd3-handle"></div>
										<div class="dd3-content">${item.name }<div class="pull-right action-buttons">
												<a class="menu-edit-btn blue" href="#" target="${item.id }"> <i class="fa fa-pencil"></i>
												</a> <a class="menu-add-btn blue" href="#" target="${item.id }"> <i class="fa fa-plus"></i>
												</a> <a class="menu-remove-btn red" href="#" target="${item.id }"> <i class="fa fa-minus"></i>
												</a>
											</div>
										</div>

										<ol class="dd-list">
											<c:forEach var="citem_1" items="${item.children}">
												<li class="dd-item dd3-item" data-id="${citem_1.id }">
													<div class="dd-handle dd3-handle"></div>
													<div class="dd3-content">${citem_1.name }<div class="pull-right action-buttons">
															<a class="menu-edit-btn blue" href="#" target="${citem_1.id }"> <i class="fa fa-pencil"></i>
															</a> <a class="menu-remove-btn red" href="#" target="${citem_1.id }"> <i class="fa fa-minus"></i>
															</a>
														</div>
													</div>
												</li>
											</c:forEach>
										</ol>
									</li>
								</c:forEach>
							</ol>
						</div>
					</div>
				</section>
			</div>
			<div class="col-lg-6" id="menuForm"></div>
		</div>
	</section>
</section>

<script type="text/javascript">
    var sectionSortResult = "";
    $(function() {
        var updateOutput = function(e) {
            var list = e.length ? e : $(e.target);
            sectionSortResult = window.JSON.stringify(list.nestable('serialize'));
        };

        $('#nestable_list_1').nestable({
            // 菜单级数
            maxDepth : 2,
            group : 1
        }).on('change', updateOutput);

        // 保存排序
        $('.menu-save-sort-btn', '#menuList').click(function(e) {
            e.preventDefault();
            $.post("${ctx}/menu/sort", {
                sectionSortResult : sectionSortResult,
            }, function(response) {
                // 如果返回的状态是0表示操作成功
                if (response.status == '0') {
                    toastr.success('菜单排序保存成功！');
                } else {
                    toastr.warning('菜单排序保存失败！' + response.error);
                }
            });
        });

        // 菜单编辑按钮
        $('.menu-edit-btn', '#menuList').click(function(e) {
            e.preventDefault();
            var menuId = $(this).attr('target');
            var buttonType = "edit";
            $('#menuForm').load('${ctx}/menu/form/' + menuId + '/' + buttonType, function(e) {

            });
        });

        // 菜单新增按钮
        $('.menu-add-btn', '#menuList').click(function(e) {
            e.preventDefault();
            var menuId = $(this).attr('target');
            var buttonType = "add";
            $('#menuForm').load('${ctx}/menu/form/' + menuId + '/' + buttonType, function(e) {

            });
        });

        //删除菜单
        $('.menu-remove-btn', '#menuList').click(function(e) {
            e.preventDefault();
            var menuId = $(this).attr('target');
            $.confirm({
                title : false,
                content : '是否确认删除菜单？',
                confirmButton : '确认',
                cancelButton : '取消',
                confirm : function() {
                    //执行删除
                    $.ajax({
                        url : '${ctx}/menu/delete/' + menuId,
                        type : 'DELETE',
                        success : function(result) {
                            toastr.success('菜单删除成功！');
                        }
                    });
                },
                cancel : function() {
                }
            });
        });

        // 增加主菜单按钮
        $('.menu-add-main-btn', '#menuList').click(function(e) {
            e.preventDefault();
            var menuId = 0;
            var buttonType = "add";
            $('#menuForm').load('${ctx}/menu/form/' + menuId + '/' + buttonType, function(e) {

            });
        });

    });
</script>

