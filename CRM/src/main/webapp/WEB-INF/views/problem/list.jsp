<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<section id="problemTablePanel" class="">
	<!-- 常见问题列表 -->
	<div class="row">
		<article class="col-md-12">
			<div class="widget " >
				<div>
					<div class="widget-body-toolbar">
						<button class="add-problem-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="problem" id="problem" placeholder="常见问题" type="text">
						<button class="search-problem-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-problem-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="problemTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>常见问题编号</th>
									<th>问题</th>
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
    var problemTable;
    var $problemTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "code"
        }, {
            "data" : "problem"
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
        problemTable = $qingshixun.dataTable($('#problemTable'), {
            "ajax" : {
                "url" : "problem/list/data",
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
                    editproblem(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteproblem(data.id);
                });

            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.problem = $("#problem").val();
            }
        });

        $problemTablePanel = $("#problemTablePanel");

        // 初始化新增按钮
        $problemTablePanel.find('.add-problem-btn').click(function() {
            loadContent("problem/form/0");
        });

        // 初始化查询按钮
        $problemTablePanel.find('.search-problem-btn').click(function() {
            problemTable.ajax.reload();
        });

        // 初始化重置按钮
        $problemTablePanel.find('.reset-problem-btn').click(function() {
            $("#problem").val("");
            problemTable.ajax.reload();
        });
    });

    // 编辑常见问题
    function editproblem(problemId) {
        loadContent("problem/form/" + problemId);
    }

    // 删除常见问题
    function deleteproblem(problemId) {
        $.confirm({
            title : false,
            content : '是否确认删除该常见问题？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'problem/delete/' + problemId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示该删除删除的时候被引用
                        if (result.status == -1) {
                            toastr.error('该常见问题已被订单引用,不能删除！');
                            return;
                        }
                        problemTable.ajax.reload();
                        toastr.success('常见问题删除成功！');
                    }
                });
            },
            cancel : function() {

            }
        });
    }

    // 更改常见问题状态操作
    function changeproblemStatus(problemId) {
        $.confirm({
            title : false,
            content : '是否修改该常见问题状态？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'problem/change/' + problemId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        problemTable.ajax.reload();
                        toastr.success('状态修改成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }
</script>



