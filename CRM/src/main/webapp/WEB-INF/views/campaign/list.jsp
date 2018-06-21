<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<section id="campaignTablePanel" class="">
	<!-- 营销活动列表 -->
	<div class="row">
		<article class="col-md-12">
			<div class="widget " >
				<div>
					<div class="widget-body-toolbar">
						<button class="add-campaign-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="name" id="name" placeholder="营销活动名称" type="text">
						<button class="search-campaign-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-campaign-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="campaignTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>营销活动编号</th>
									<th>营销活动名称</th>
									<th>产品名称</th>
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
    var campaignTable;
    var $campaignTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "code"
        }, {
            "data" : "name"
        }, {
            "data" : "product.name"
        }, {
            "data" : "status.name"
        }, {
            "data" : ""
        }, ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化表格信息
        campaignTable = $qingshixun.dataTable($('#campaignTable'), {
            "ajax" : {
                "url" : "campaign/list/data",
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
                    editCampaign(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteCampaign(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.name = $("#name").val();
            }
        });

        $campaignTablePanel = $("#campaignTablePanel");

        // 初始化新增按钮
        $campaignTablePanel.find('.add-campaign-btn').click(function() {
            loadContent("campaign/form/0");
        });

        // 初始化查询按钮
        $campaignTablePanel.find('.search-campaign-btn').click(function() {
            campaignTable.ajax.reload();
        });

        // 初始化重置按钮
        $campaignTablePanel.find('.reset-campaign-btn').click(function() {
            $("#name").val("");
            campaignTable.ajax.reload();
        });

    });

    // 编辑营销活动
    function editCampaign(campaignId) {
        loadContent("campaign/form/" + campaignId);
    }

    // 删除营销活动
    function deleteCampaign(campaignId) {
        $.confirm({
            title : false,
            content : '是否确认删除该营销活动？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'campaign/delete/' + campaignId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示该删除删除的时候被引用
                        if (result.status == 3) {
                            toastr.error('该营销活动已被引用,不能删除！');
                            return;
                        }
                        campaignTable.ajax.reload();
                        toastr.success('营销活动删除成功！');
                    }
                });
            },
            cancel : function() {

            }
        });
    }

    // 更改营销活动状态操作
    function changeCampaignStatus(campaignId) {
        $.confirm({
            title : false,
            content : '是否修改该营销活动状态？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'campaign/change/' + campaignId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        campaignTable.ajax.reload();
                        toastr.success('状态修改成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }
</script>



