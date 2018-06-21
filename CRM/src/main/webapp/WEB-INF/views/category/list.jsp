<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 产品类别编辑窗口 -->
<div class="modal fade" id="categoryModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="categoryBody" class="modal-content"></div>
		</div>
	</div>
</div>

<!-- 产品类别列表 -->
<section id="categoryTablePanel">
	<div class="row">
		<article class="col-md-12">
			<div class="widget ">
				<div>
					<div class="widget-body-toolbar">
						<button class="add-category-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="name" id="name" placeholder="类别名称" type="text">
						<button class="search-category-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-category-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<!-- widget content -->
					<div class="widget-body no-padding">
						<table id="categoryTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>类别名称</th>
									<th>描述</th>
									<th>创建时间</th>
									<th>更新时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>

<script type="text/javascript">
    var categoryTable;
    var $categoryTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "name"
        }, {
            "data" : "description"
        }, {
            "data" : "createTime"
        }, {
            "data" : "updateTime"
        }, {
            "data" : ""
        }, ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        //初始化表格信息
        categoryTable = $qingshixun.dataTable($('#categoryTable'), {
            "ajax" : {
                "url" : "category/page/data",
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                "data" : null,
                "defaultContent" : "<button type='button' title='修改' class='btn btn-primary btn-xs edit'>" + "<i class='fa fa-pencil'></i>" + "</button>" + "&nbsp;&nbsp;" + "<button type='button' title='删除' class='btn btn-danger btn-xs delete'>" + "<i class='fa fa-trash-o'></i>" + "</button>",
                orderable : false, // 禁止排序
                targets : [ columnNumber ]
            //指定的列
            } ],
            "createdRow" : function(row, data, index) {

            },
            rowCallback : function(row, data) {
                // 编辑操作
                $('td', row).last().find(".edit").click(function() {
                    editCategory(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteCategory(data.id);
                });

                // 更改状态操作
                $('td', row).last().find(".status").click(function() {
                    changeCategoryStatus(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.name = $("#name").val();
            }
        });

        $categoryTablePanel = $("#categoryTablePanel");
        // 初始化新增按钮
        $categoryTablePanel.find('.add-category-btn').click(function() {
            editCategory(0);
        });
        // 初始化查询按钮
        $categoryTablePanel.find('.search-category-btn').click(function() {
            categoryTable.ajax.reload();
        });
        // 初始化重置按钮
        $categoryTablePanel.find('.reset-category-btn').click(function() {
            $("#name").val("");
            categoryTable.ajax.reload();
        });
    });

    // 编辑类别
    function editCategory(categoryId) {
        $("#categoryModal").modal("show");
        $('#categoryBody').load('${ctx}/category/form/' + categoryId, function(e) {

        });
    }

    // 删除类别
    function deleteCategory(categoryId) {
        $.confirm({
            title : false,
            content : '是否确认删除该类别？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                //执行删除
                $.ajax({
                    type : "DELETE",
                    async : false,
                    url : 'category/delete/' + categoryId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示产品类别已经被引用不能删除
                        if (result.status == -1) {
                            toastr.error('该类别被产品引用,不能删除！');
                            return;
                        }
                        categoryTable.ajax.reload();
                        toastr.success('类别删除成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }

    // 更改类别状态操作
    function changeCategoryStatus(categoryId) {
        $.confirm({
            title : false,
            content : '是否修改该类别状态？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'category/change',
                    data : {
                        "categoryId" : categoryId
                    },
                    dataType : "json",
                    success : function(result) {
                        categoryTable.ajax.reload();
                        toastr.success('状态修改成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }
</script>



