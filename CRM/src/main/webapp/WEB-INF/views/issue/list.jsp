<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<section id="issueTablePanel" class="">
	<!-- 问题单列表 -->
	<div class="row">
		<article class="col-md-12">
			<div class="widget " >
				<div>
					<div class="widget-body-toolbar">
						<button class="add-issue-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="title" id="title" placeholder="问题单名称" type="text">
						<button class="search-issue-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-issue-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="issueTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>问题单编号</th>
									<th>标题</th>
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
    var issueTable;
    var $issueTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "code"
        }, {
            "data" : "title"
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
        issueTable = $qingshixun.dataTable($('#issueTable'), {
            "ajax" : {
                "url" : "issue/list/data",
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
                    editIssue(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteIssue(data.id);
                });

                // 更改状态操作
                $('td', row).last().find(".status").click(function() {
                    changeIssueStatus(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.title = $("#title").val();
            }
        });

        $issueTablePanel = $("#issueTablePanel");

        // 初始化新增按钮
        $issueTablePanel.find('.add-issue-btn').click(function() {
            loadContent("issue/form/0");
        });

        // 初始化查询按钮
        $issueTablePanel.find('.search-issue-btn').click(function() {
            issueTable.ajax.reload();
        });

        // 初始化重置按钮
        $issueTablePanel.find('.reset-issue-btn').click(function() {
            $("#title").val("");
            issueTable.ajax.reload();
        });
    });

    // 编辑问题单
    function editIssue(issueId) {
        loadContent("issue/form/" + issueId);
    }

    // 删除问题单
    function deleteIssue(issueId) {
        $.confirm({
            title : false,
            content : '是否确认删除该问题单？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'issue/delete/' + issueId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示该删除删除的时候被引用
                        if (result.status == -1) {
                            toastr.error('该问题单已被订单引用,不能删除！');
                            return;
                        }
                        issueTable.ajax.reload();
                        toastr.success('问题单删除成功！');
                    }
                });
            },
            cancel : function() {

            }
        });
    }

    // 更改问题单状态操作
    function changeIssueStatus(issueId) {
        $.confirm({
            title : false,
            content : '是否修改该问题单状态？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'issue/change/' + issueId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        issueTable.ajax.reload();
                        toastr.success('状态修改成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }
</script>



