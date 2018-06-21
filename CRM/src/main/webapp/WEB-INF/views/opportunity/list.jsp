<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<section id="opportunityTablePanel" class="">
	<!-- 销售机会列表 -->
	<div class="row">
		<article class="col-md-12">
			<div class="widget ">
				<div>
					<div class="widget-body-toolbar">
						<button class="add-opportunity-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="name" id="name" placeholder="销售机会名称" type="text">
						<button class="search-opportunity-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-opportunity-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="opportunityTable" class="table table-striped table-hover list-table">
							<thead>
								<tr>
									<th>销售机会编号</th>
									<th>名称</th>
									<th>客户名称</th>
									<th>销售阶段</th>
									<th>潜在客户来源</th>
									<th>负责人</th>
									<th>预计结束日期</th>
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
    var opportunityTable;
    var $opportunityTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "code"
        }, {
            "data" : "name"
        }, {
            "data" : "customer.name"
        }, {
            "data" : "status.name"
        }, {
            "data" : "resource.name"
        }, {
            "data" : "user.name"
        }, {
            "data" : "endDate"
        }, {
            "data" : ""
        }, ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化表格信息
        opportunityTable = $qingshixun.dataTable($('#opportunityTable'), {
            "ajax" : {
                "url" : "opportunity/list/data",
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                "data" : null,
                "defaultContent" : "<button type='button' title='修改' class='btn btn-primary btn-xs edit'>" + "<i class='fa fa-pencil'></i>" + "</button>" + "&nbsp;&nbsp;" + "<button type='button' title='删除' class='btn btn-danger btn-xs delete'>" + "<i class='fa fa-trash-o'></i>" + "</button>",
                orderable : false, // 禁止排序
                targets : [ columnNumber ] // 最后一列禁止排序
            } ],
            "createdRow" : function(row, data, index) {

            },
            rowCallback : function(row, data) {
                // 编辑操作
                $('td', row).last().find(".edit").click(function() {
                    editOpportunity(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteOpportunity(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.name = $("#name").val();
            }
        });

        $opportunityTablePanel = $("#opportunityTablePanel");

        // 初始化新增按钮
        $opportunityTablePanel.find('.add-opportunity-btn').click(function() {
            loadContent("opportunity/form/0");
        });

        // 初始化查询按钮
        $opportunityTablePanel.find('.search-opportunity-btn').click(function() {
            opportunityTable.ajax.reload();
        });

        // 初始化重置按钮
        $opportunityTablePanel.find('.reset-opportunity-btn').click(function() {
            $("#name").val("");
            opportunityTable.ajax.reload();
        });
    });

    // 编辑销售机会
    function editOpportunity(opportunityId) {
        loadContent("opportunity/form/" + opportunityId);
    }

    // 删除销售机会
    function deleteOpportunity(opportunityId) {
        $.confirm({
            title : false,
            content : '是否确认删除该销售机会？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'opportunity/delete/' + opportunityId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示该删除删除的时候被引用
                        if (result.status == 3) {
                            toastr.error('该销售机会已被引用,不能删除！');
                            return;
                        }
                        opportunityTable.ajax.reload();
                        toastr.success('销售机会删除成功！');
                    }
                });
            },
            cancel : function() {

            }
        });
    }
</script>



