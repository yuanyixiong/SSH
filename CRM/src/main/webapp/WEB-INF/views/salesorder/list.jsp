<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<section id="salesOrderTablePanel" class="">
	<!-- 销售订单列表 -->
	<div class="row">
		<article class="col-md-12">
			<div class="widget " >
				<div>
					<div class="widget-body-toolbar">
						<button class="add-salesOrder-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="theme" id="theme" placeholder="销售订单名称" type="text">
						<button class="search-salesOrder-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-salesOrder-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="salesOrderTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>订单编号</th>
									<th>主题</th>
									<th>客户名称</th>
									<th>报价单名称</th>
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
    var salesOrderTable;
    var $salesOrderTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "code"
        }, {
            "data" : "theme"
        }, {
            "data" : "customer.name"
        }, {
            "data" : "quotation.title"
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
        salesOrderTable = $qingshixun.dataTable($('#salesOrderTable'), {
            "ajax" : {
                "url" : "salesorder/list/data",
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
                    editSalesOrder(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteSalesOrder(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.theme = $("#theme").val();
            }
        });

        $salesOrderTablePanel = $("#salesOrderTablePanel");

        // 初始化新增按钮
        $salesOrderTablePanel.find('.add-salesOrder-btn').click(function() {
            loadContent("salesorder/form/0");
        });

        // 初始化查询按钮
        $salesOrderTablePanel.find('.search-salesOrder-btn').click(function() {
            salesOrderTable.ajax.reload();
        });

        // 初始化重置按钮
        $salesOrderTablePanel.find('.reset-salesOrder-btn').click(function() {
            $("#theme").val("");
            salesOrderTable.ajax.reload();
        });
    });

    // 编辑销售订单
    function editSalesOrder(salesOrderId) {
        loadContent("salesorder/form/" + salesOrderId);
    }

    // 删除销售订单
    function deleteSalesOrder(salesOrderId) {
        $.confirm({
            title : false,
            content : '是否确认删除该销售订单？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'salesorder/delete/' + salesOrderId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示该删除删除的时候被引用
                        if (result.status == 3) {
                            toastr.error('该销售订单已被引用,不能删除！');
                            return;
                        }
                        salesOrderTable.ajax.reload();
                        toastr.success('销售订单删除成功！');
                    }
                });
            },
            cancel : function() {

            }
        });
    }
</script>



