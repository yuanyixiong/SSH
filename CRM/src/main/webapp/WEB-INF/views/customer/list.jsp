<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- excel导出编辑窗口 -->
<div class="modal fade" id="exportModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">导出客户</h4>
			</div>
			<div class="modal-body">
				<label>导出文件名称:</label><input type="text" class="file form-control" maxlength="100" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="export-customer-btn btn btn-primary">确定</button>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<section id="customerTablePanel" class="col-md-6">
		<div class="row">
			<article class="col-md-12">
				<div class="widget ">
					<div>
						<div class="widget-body-toolbar">
							<div class="row">
								<div class="col-md-5">
									<button class="add-customer-btn btn btn-primary" type="button">
										<i class="fa fa-plus"></i> 新增
									</button>
									<button class="excel-customer-btn btn btn-default" type="button">
										<i class="fa fa-folder-open-o"></i> 导出
									</button>
								</div>
								<div class="col-md-7">
									<input class="form-control list-search-contact" name="name" id="name" placeholder="客户名..." type="text">
									<button class="search-customer-btn btn btn-success" type="button">
										<i class="fa fa-search"></i>
									</button>
									<button class="reset-customer-btn btn btn-default" type="button">
										<i class="fa fa-mail-reply"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="widget-body no-padding">
							<table id="customerTable" class="table table-striped table-hover">
								<thead>
									<tr>
										<th>客户名</th>
										<th>所在区域</th>
										<th>状态</th>
										<th width="20%">操作</th>
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

	<!-- 联系人区域 -->
	<div id="contactList" class="col-md-6"></div>
</div>

<script type="text/javascript">
    var customerTable;
    var $customerTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "name"
        }, {
            "data" : "region.name"
        }, {
            "data" : "status.name"
        }, {
            "data" : ""
        }, ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化表格信息

        customerTable = $qingshixun.dataTable($('#customerTable'), {
            "bDestroy" : true,
            "ajax" : {
                "url" : "customer/list/data",
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
                // 点击客户列表某行加载该客户下的联系人
                $('td', row).click(function() {
                    initContactTable(data.id);
                });

                // 渲染样式
                if (data.status.code == "USRS_Active") {
                    $('td', row).last().find(".status").addClass("btn-warning");
                    $('td', row).last().find(".status").attr("title", "禁用");
                    $('td', row).last().find(".checkStatus").removeClass().addClass("fa fa-arrow-circle-down");
                } else {
                    $('td', row).last().find(".status").addClass("btn-default");
                    $('td', row).last().find(".status").attr("title", "正常");
                    $('td', row).last().find(".checkStatus").removeClass().addClass("fa fa-arrow-circle-up");
                }

                // 编辑操作
                $('td', row).last().find(".edit").click(function() {
                    editCustomer(data.id);
                });

                //删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteCustomer(data.id);
                });

                // 更改状态操作
                $('td', row).last().find(".status").click(function() {
                    changeCustomerStatus(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.name = $("#name").val();
            }
        });

        $customerTablePanel = $("#customerTablePanel");

        // 初始化新增按钮
        $customerTablePanel.find('.add-customer-btn').click(function() {
            loadContent("customer/form/0");
        });

        // 初始化查询按钮
        $customerTablePanel.find('.search-customer-btn').click(function() {
            customerTable.ajax.reload();
        });

        // 初始化重置按钮
        $customerTablePanel.find('.reset-customer-btn').click(function() {
            $("#name").val("");
            customerTable.ajax.reload();
        });

        var $exportModal = $("#exportModal");

        // 初始化导出excel按钮
        $customerTablePanel.find('.excel-customer-btn').click(function() {
            $exportModal.modal("show");
        });

        // 导出保存按钮
        $exportModal.find('.export-customer-btn').click(function() {
            // 获取导出文件名称
            var fileName = $exportModal.find('.file').val();
            if($.trim(fileName) == ''){
                toastr.warning('请输入导出文件名称！');
                return false;
            }
            // 关闭导出文件modal
            $exportModal.modal("hide");
            window.location.href = "${ctx}/customer/doExport/" + fileName;
        });

        // 选择的行变换颜色
        $('#customerTable tbody').on('click', 'tr', function() {
            // 如果改行包含样式warning
            if ($(this).hasClass('warning')) {
                $(this).removeClass('warning');
            } else {
                customerTable.$('tr.warning').removeClass('warning');
                $(this).addClass('warning');
            }
        });
    });

    // 显示点击客户下的联系人
    function initContactTable(customerId) {
        $('#contactList').load('${ctx}/contact/list/' + customerId, function(e) {

        });
    }

    // 编辑客户
    function editCustomer(customerId) {
        loadContent("customer/form/" + customerId);
    }

    // 删除客户
    function deleteCustomer(customerId) {
        $.confirm({
            title : false,
            content : '是否确认删除该客户？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "Delete",
                    async : false,
                    url : 'customer/delete/' + customerId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示该删除删除的时候被引用
                        if (result.status == 3) {
                            toastr.error('该客户已被引用,不能删除！');
                            return;
                        }
                        // 刷新客户列表
                        customerTable.ajax.reload();
                        toastr.success('用户删除成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }

    // 更改客户状态操作
    function changeCustomerStatus(customerId) {
        $.confirm({
            title : false,
            content : '是否修改该客户状态？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行修改操作
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'customer/change/' + customerId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        customerTable.ajax.reload();
                        toastr.success('修改成功！');
                    }
                });
            },
            cancel : function() {

            }
        });
    }
</script>



