<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 部门编辑窗口 -->
<div class="modal fade" id="departmentModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div id="departmentBody" class="modal-content"></div>
	</div>
</div>

<!-- 关联角色编辑窗口-->
<div class="modal fade" id="relateRoleModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="relateBody" class="modal-content"></div>
		</div>
	</div>
</div>

<!-- 部门列表 -->
<section id="departmentTablePanel">
	<!-- 部门列表 -->
	<div class="row">
		<article class="col-md-7">
			<div class="widget">
				<div>
					<div class="widget-body-toolbar">
						<button class="add-department-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="name" id="name" placeholder="部门名..." type="text">
						<button class="search-department-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-department-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="departmentTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>部门名</th>
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

		<!-- 角色列表 -->
		<article class="col-md-5">
			<div class="widget " id="wid-id-4">
				<div>
					<div class="widget-body-toolbar">部门角色</div>
					<div class="widget-body no-padding">
						<table id="roleTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>角色名</th>
									<th>创建时间</th>
									<th>更新时间</th>
								</tr>
							</thead>
							<tbody id="departmentTbody">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>

<script type="text/javascript">
    var departmentTable;
    var roleTable;
    var $departmentTablePanel;
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
    $(function() {
        //初始化表格信息
        departmentTable = $qingshixun.dataTable($('#departmentTable'), {
            "bDestroy" : true,
            "ajax" : {
                "url" : "department/list/data",
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                "data" : null,
                "defaultContent" : "<button type='button' title='修改' class='btn btn-primary btn-xs edit'>" + "<i class='fa fa-pencil'></i>" + "</button>" + "&nbsp;&nbsp;" + "<button type='button' title='删除' class='btn btn-danger btn-xs delete'>" + "<i class='fa fa-trash-o'></i>" + "</button>" + "&nbsp;&nbsp;" + "<button type='button' title='添加角色' class='btn btn-primary btn-xs add'>"
                        + "<i class='fa fa-plus'></i>" + "</button>",

                orderable : false,//禁止排序
                targets : [ columnNumber ]
            //指定的列
            } ],
            "createdRow" : function(row, data, index) {

            },
            rowCallback : function(row, data) {
                // 点击部门列表某列加载该部门下的角色信息
                $('td', row).click(function() {
                    initRoleTable(data.id);
                });

                // 编辑操作
                $('td', row).last().find(".edit").click(function() {
                    editDepartment(data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteDepartment(data.id);
                });

                // 关联角色操作
                $('td', row).last().find(".add").click(function() {
                    relateRole(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.name = $("#name").val();
            }
        });

        $departmentTablePanel = $("#departmentTablePanel");

        //初始化新增按钮
        $departmentTablePanel.find('.add-department-btn').click(function() {
            editDepartment(0);
        });

        //初始化查询按钮
        $departmentTablePanel.find('.search-department-btn').click(function() {
            departmentTable.ajax.reload();
        });

        //初始化重置按钮
        $departmentTablePanel.find('.reset-department-btn').click(function() {
            $("#name").val("");
            departmentTable.ajax.reload();
        });

        // 选择的行变换颜色
        $('#departmentTable tbody').on('click', 'tr', function() {
            if ($(this).hasClass('warning')) {
                $(this).removeClass('warning');
            } else {
                departmentTable.$('tr.warning').removeClass('warning');
                $(this).addClass('warning');
            }
        });
    });

    // 显示点击部门下的角色列表
    function initRoleTable(departmentId) {
        $('#departmentTbody').html("");
        var url = "department/role/" + departmentId;
        //利用 Ajax 获取当前部门下的所有角色数据
        $.post(url, function(result) {
            if (null != result) {
                var content = "";
                $.each(result.data, function(i, item) {
                    content += "<tr role='row'>" + "<td>" + item.name + "</td>" + "<td>" + item.createTime + "</td>" + "<td>" + item.updateTime + "</td>" + "</tr>";
                });
                $('#departmentTbody').append(content);
            } else {
                toastr.error('获取角色信息失败！');
            }
        });
    }

    //编辑部门
    function editDepartment(departmentId) {
        $("#departmentModal").modal("show");
        $('#departmentBody').load('${ctx}/department/form/' + departmentId, function(e) {

        });
    }

    //删除部门
    function deleteDepartment(departmentId) {
        $.confirm({
            title : false,
            content : '是否确认删除该部门？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "DELETE",
                    async : false,
                    url : 'department/delete/' + departmentId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        departmentTable.ajax.reload();
                        toastr.success('部门删除成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }

    // 关联角色
    function relateRole(departmentId) {
        $("#relateRoleModal").modal("show");
        //初始化角色表
        $('#relateBody').load('${ctx}/department/relate/' + departmentId, function(e) {

        });
    }

    //更改部门状态操作
    function changeDepartmentStatus(departmentId) {
        $.confirm({
            title : false,
            content : '是否修改该部门状态？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                //执行修改
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'department/change',
                    data : {
                        "departmentId" : departmentId
                    },
                    dataType : "json",
                    success : function(result) {
                        departmentTable.ajax.reload();
                        toastr.success('修改成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }
</script>



