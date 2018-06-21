<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 角色编辑窗口 -->
<div class="modal fade" id="addRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div id="roleBody" class="modal-content"></div>
	</div>
</div>

<!-- 角色列表 -->
<section id="roleTablePanel" class="">
	<div class="row">
		<article class="col-md-12">
			<div class="widget " >
				<div>
					<div class="widget-body-toolbar">
						<button class="add-role-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="name" id="name" placeholder="角色名..." type="text">
						<button class="search-role-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-role-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="roleTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>角色名</th>
									<th>创建时间</th>
									<th>更新时间</th>
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
    var roleTable;
    var $roleTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "name"
        }, {
            "data" : "createTime"
        }, {
            "data" : "updateTime"
        }, {
            "data" : ""
        }, ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化表格信息
        roleTable = $qingshixun.dataTable($('#roleTable'), {
            "ajax" : {
                "url" : "role/list/data",
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                "data" : null,
                "defaultContent" : "<button type='button' title='修改' class='btn btn-primary btn-xs  edit'>" + "<i class='fa fa-pencil'></i>" + "</button>" + "&nbsp;&nbsp;" + "<button type='button' title='删除' class='btn btn-danger btn-xs delete'>" + "<i class='fa fa-trash-o'></i>" + "</button>",

                roleBodyable : false, // 禁止排序
                targets : [ columnNumber ]
            // 指定的列
            } ],
            "createdRow" : function(row, data, index) {

            },
            rowCallback : function(row, data) {
                // 编辑操作
                $('td', row).last().find(".edit").click(function() {
                    editRole(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteRole(data.id);
                });

                // 更改状态操作
                $('td', row).last().find(".status").click(function() {
                    changeRoleStatus(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.name = $("#name").val();
            }
        });

        $roleTablePanel = $("#roleTablePanel");

        // 初始化新增按钮
        $roleTablePanel.find('.add-role-btn').click(function() {
            editRole(0);
        });

        // 初始化查询按钮
        $roleTablePanel.find('.search-role-btn').click(function() {
            roleTable.ajax.reload();
        });

        // 初始化重置按钮
        $roleTablePanel.find('.reset-role-btn').click(function() {
            $("#name").val("");
            roleTable.ajax.reload();
        });
    });

    // 编辑角色
    function editRole(roleId) {
        $("#addRoleModal").modal("show");
        $('#roleBody').load('${ctx}/role/form/' + roleId, function(e) {

        });
    }

    // 删除角色
    function deleteRole(roleId) {
        $.confirm({
            title : false,
            content : '是否确认删除该角色？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "DELETE",
                    async : false,
                    url : 'role/delete/' + roleId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        if (result.status == -1) {
                            toastr.error('该角色已被引用,不能删除！');
                            return;
                        }
                        roleTable.ajax.reload();
                        toastr.success('角色删除成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }

    // 更改角色状态操作
    function changeRoleStatus(roleId) {
        $.confirm({
            title : false,
            content : '是否修改该角色状态？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'role/change',
                    data : {
                        "roleId" : roleId
                    },
                    dataType : "json",
                    success : function(result) {
                        roleTable.ajax.reload();
                        toastr.success('修改成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }
</script>