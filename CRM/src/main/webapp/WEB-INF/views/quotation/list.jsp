<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<section id="quotationTablePanel" class="">
	<!-- 报价单列表 -->
	<div class="row">
		<article class="col-md-12">
			<div class="widget ">
				<div>
					<div class="widget-body-toolbar">
						<button class="add-quotation-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="title" id="title" placeholder="报价单名称" type="text">
						<button class="search-quotation-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-quotation-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="quotationTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>报价单编号</th>
									<th>标题</th>
									<th>客户名称</th>
									<th>销售机会名称</th>
									<th>负责人</th>
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
    var quotationTable;
    var $quotationTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "code"
        }, {
            "data" : "title"
        }, {
            "data" : "customer.name"
        }, {
            "data" : "opportunity.name"
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
        quotationTable = $qingshixun.dataTable($('#quotationTable'), {
            "ajax" : {
                "url" : "quotation/list/data",
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
                    editQuotation(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteQuotation(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.title = $("#title").val();
            }
        });

        $quotationTablePanel = $("#quotationTablePanel");

        // 初始化新增按钮
        $quotationTablePanel.find('.add-quotation-btn').click(function() {
            loadContent("quotation/form/0");
        });

        // 初始化查询按钮
        $quotationTablePanel.find('.search-quotation-btn').click(function() {
            quotationTable.ajax.reload();
        });

        // 初始化重置按钮
        $quotationTablePanel.find('.reset-quotation-btn').click(function() {
            $("#title").val("");
            quotationTable.ajax.reload();
        });
    });

    // 编辑报价单
    function editQuotation(quotationId) {
        loadContent("quotation/form/" + quotationId);
    }

    // 删除报价单
    function deleteQuotation(quotationId) {
        $.confirm({
            title : false,
            content : '是否确认删除该报价单？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'quotation/delete/' + quotationId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示该删除删除的时候被引用
                        if (result.status == 3) {
                            toastr.error('该报价单已被引用,不能删除！');
                            return;
                        }
                        quotationTable.ajax.reload();
                        toastr.success('报价单删除成功！');
                    }
                });
            },
            cancel : function() {

            }
        });
    }
</script>



