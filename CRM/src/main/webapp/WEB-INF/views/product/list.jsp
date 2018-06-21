<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<section id="productTablePanel" class="">
	<!-- 产品列表 -->
	<div class="row">
		<article class="col-md-12">
			<div class="widget " >
				<div>
					<div class="widget-body-toolbar">
						<button class="add-product-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="name" id="name" placeholder="产品名称" type="text">
						<button class="search-product-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-product-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="productTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>产品编号</th>
									<th>产品名称</th>
									<th>价格</th>
									<th>库存</th>
									<th>图片</th>
									<th>状态</th>
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
    var productTable;
    var $productTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "code"
        }, {
            "data" : "name"
        }, {
            "data" : "price"
        }, {
            "data" : "inventory"
        }, {
            "data" : "picture"
        }, {
            "data" : "status.name"
        }, {
            "data" : ""
        }, ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化表格信息
        productTable = $qingshixun.dataTable($('#productTable'), {
            "ajax" : {
                "url" : "product/list/data",
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                "data" : null,
                "defaultContent" : "<button type='button' title='修改' class='btn btn-primary btn-xs edit'>" + "<i class='fa fa-pencil'></i>" + "</button>" + "&nbsp;&nbsp;" + "<button type='button' title='删除' class='btn btn-danger btn-xs delete'>" + "<i class='fa fa-trash-o'></i>" + "</button>" + "&nbsp;&nbsp;" + "<button type='button' title='更改状态' class='btn btn-xs status'>"
                        + "<i class='fa fa-arrow-circle-up checkStatus'></i>" + "</button>",
                orderable : false, // 禁止排序
                targets : [ columnNumber ]
            //指定的列
            } ],
            "createdRow" : function(row, data, index) {

            },
            rowCallback : function(row, data) {
                // 渲染样式
                if (data.status.code == "PROS_Sale") {
                    $('td', row).last().find(".status").addClass("btn-warning");
                    $('td', row).last().find(".status").attr("title", "禁用");
                    $('td', row).last().find(".checkStatus").removeClass().addClass("fa fa-arrow-circle-down");
                } else {
                    $('td', row).last().find(".status").addClass("btn-default");
                    $('td', row).last().find(".status").attr("title", "正常");
                    $('td', row).last().find(".checkStatus").removeClass().addClass("fa fa-arrow-circle-up");
                }

                // 显示图片
                $('td', row).eq(4).html("<img width='50px;' height='50px;' src=${ctx}/${imagePath}"+data.picture+" />");

                // 编辑操作
                $('td', row).last().find(".edit").click(function() {
                    editProduct(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteProduct(data.id);
                });

                // 更改状态操作
                $('td', row).last().find(".status").click(function() {
                    changeProductStatus(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.name = $("#name").val();
            }
        });

        $productTablePanel = $("#productTablePanel");

        // 初始化新增按钮
        $productTablePanel.find('.add-product-btn').click(function() {
            loadContent("product/form/0");
        });

        // 初始化查询按钮
        $productTablePanel.find('.search-product-btn').click(function() {
            productTable.ajax.reload();
        });

        // 初始化重置按钮
        $productTablePanel.find('.reset-product-btn').click(function() {
            $("#name").val("");
            productTable.ajax.reload();
        });
    });

    // 编辑产品
    function editProduct(productId) {
        loadContent("product/form/" + productId);
    }

    // 删除产品
    function deleteProduct(productId) {
        $.confirm({
            title : false,
            content : '是否确认删除该产品？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'product/delete/' + productId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示该删除删除的时候被引用
                        if (result.status == 3) {
                            toastr.error('该产品已被引用,不能删除！');
                            return;
                        }
                        productTable.ajax.reload();
                        toastr.success('产品删除成功！');
                    }
                });
            },
            cancel : function() {

            }
        });
    }

    // 更改产品状态操作
    function changeProductStatus(productId) {
        $.confirm({
            title : false,
            content : '是否修改该产品状态？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'product/change/' + productId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        productTable.ajax.reload();
                        toastr.success('状态修改成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }
</script>



