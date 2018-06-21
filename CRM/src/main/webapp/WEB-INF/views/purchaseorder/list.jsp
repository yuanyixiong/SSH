<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<section id="purchaseOrderTablePanel" class="">
	<!-- 采购订单列表 -->
	<div class="row">
		<article class="col-md-12">
			<div class="widget " >
				<div>
					<div class="widget-body-toolbar">
						<button class="add-purchaseOrder-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="theme" id="theme" placeholder="采购订单主题" type="text">
						<button class="search-purchaseOrder-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-purchaseOrder-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="purchaseOrderTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>订单编号</th>
									<th>主题</th>
									<th>厂商名称</th>
									<th>负责人</th>
									<th>订单状态</th>
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
    var purchaseOrderTable;
    var $purchaseOrderTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "code"
        }, {
            "data" : "theme"
        }, {
            "data" : "supplier.name"
        }, {
            "data" : "user.name"
        }, {
            "data" : "status.name"
        }, {
            "data" : ""
        }, ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化表格信息
        purchaseOrderTable = $qingshixun.dataTable($('#purchaseOrderTable'), {
            "ajax" : {
                "url" : "purchaseorder/list/data",
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
                    editPurchaseOrder(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deletePurchaseOrder(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.theme = $("#theme").val();
            }
        });

        $purchaseOrderTablePanel = $("#purchaseOrderTablePanel");

        // 初始化新增按钮
        $purchaseOrderTablePanel.find('.add-purchaseOrder-btn').click(function() {
            loadContent("purchaseorder/form/0");
        });

        // 初始化查询按钮
        $purchaseOrderTablePanel.find('.search-purchaseOrder-btn').click(function() {
            purchaseOrderTable.ajax.reload();
        });

        // 初始化重置按钮
        $purchaseOrderTablePanel.find('.reset-purchaseOrder-btn').click(function() {
            $("#theme").val("");
            purchaseOrderTable.ajax.reload();
        });
    });

    // 编辑采购订单
    function editPurchaseOrder(purchaseOrderId) {
        loadContent("purchaseorder/form/" + purchaseOrderId);
    }

    // 删除采购订单
    function deletePurchaseOrder(purchaseOrderId) {
        $.confirm({
            title : false,
            content : '是否确认删除该采购订单？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'purchaseorder/delete/' + purchaseOrderId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示该删除删除的时候被引用
                        if (result.status == 3) {
                            toastr.error('该采购订单已被引用,不能删除！');
                            return;
                        }
                        purchaseOrderTable.ajax.reload();
                        toastr.success('采购订单删除成功！');
                    }
                });
            },
            cancel : function() {

            }
        });
    }
</script>



