<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<section id="supplierTablePanel" class="">
	<!-- 供应商列表 -->
	<div class="row">
		<article class="col-md-12">
			<div class="widget " >
				<div>
					<div class="widget-body-toolbar">
						<button class="add-supplier-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="name" id="name" placeholder="供应商名称" type="text">
						<button class="search-supplier-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-supplier-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="supplierTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>供应商编号</th>
									<th>供应商名称</th>
									<th>电话</th>
									<th>邮箱</th>
									<th>说明</th>
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
    var supplierTable;
    var $supplierTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "code"
        }, {
            "data" : "name"
        }, {
            "data" : "mobile"
        }, {
            "data" : "email"
        }, {
            "data" : "instruction"
        }, {
            "data" : ""
        }, ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化表格信息
        supplierTable = $qingshixun.dataTable($('#supplierTable'), {
            "ajax" : {
                "url" : "supplier/list/data",
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
                    editSupplier(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteSupplier(data.id);
                });

            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.name = $("#name").val();
            }
        });

        $supplierTablePanel = $("#supplierTablePanel");

        // 初始化新增按钮
        $supplierTablePanel.find('.add-supplier-btn').click(function() {
            loadContent("supplier/form/0");
        });

        // 初始化查询按钮
        $supplierTablePanel.find('.search-supplier-btn').click(function() {
            supplierTable.ajax.reload();
        });

        // 初始化重置按钮
        $supplierTablePanel.find('.reset-supplier-btn').click(function() {
            $("#name").val("");
            supplierTable.ajax.reload();
        });
    });

    // 编辑供应商
    function editSupplier(supplierId) {
        loadContent("supplier/form/" + supplierId);
    }

    // 删除供应商
    function deleteSupplier(supplierId) {
        $.confirm({
            title : false,
            content : '是否确认删除该供应商？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'supplier/delete/' + supplierId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示该删除删除的时候被引用
                        if (result.status == 3) {
                            toastr.error('该供应商已被引用,不能删除！');
                            return;
                        }
                        supplierTable.ajax.reload();
                        toastr.success('供应商删除成功！');
                    }
                });
            },
            cancel : function() {

            }
        });
    }

    // 更改供应商状态操作
    function changesupplierStatus(supplierId) {
        $.confirm({
            title : false,
            content : '是否修改该供应商状态？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'supplier/change/' + supplierId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        supplierTable.ajax.reload();
                        toastr.success('状态修改成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }
</script>



