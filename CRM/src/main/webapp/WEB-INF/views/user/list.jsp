<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 修改密码窗口 -->
<div class="modal fade" id="updatePasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div id="updatePasswordBody" class="modal-content"></div>
    </div>
</div>

<section id="userTablePanel" >
	<div class="row">
		<article class="col-md-12">
			<div class="widget " >
				<div>
					<div class="widget-body-toolbar">
						<button class="add-user-btn btn btn-primary pull-left" type="button">
							<i class="fa fa-plus"></i> 新增
						</button>
						<input class="form-control list-search" name="name" id="name" placeholder="用户名..." type="text"> 
						<input class="form-control list-search-contact" name="phone" id="phone" placeholder="电话..." type="text" >
						<button class="search-user-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-user-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<!-- widget content -->
					<div class="widget-body no-padding">
						<table id="userTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>登录名</th>
									<th>用户名</th>
									<th>性别</th>
									<th>电话</th>
									<th>邮箱</th>
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
    var userTable;
    var $userTablePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "loginName"
        }, {
            "data" : "name"
        }, {
            "data" : "gender"
        }, {
            "data" : "phone"
        }, {
            "data" : "email"
        }, {
            "data" : "status.name"
        }, {
            "data" : ""
        }, ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化表格信息
        userTable = $qingshixun.dataTable($('#userTable'), {
            "ajax" : {
                "bRetrieve" : true,
                "url" : "user/list/data", //指定后端获取数据地址
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                "data" : null,
                //在数据最后一列定义相关操作按键
                "defaultContent" : "<button type='button' title='修改' class='btn btn-primary btn-xs edit'><i class='fa fa-pencil'></i></button>&nbsp;&nbsp;" 
                        + "<button type='button' title='删除' class='btn btn-danger btn-xs delete'><i class='fa fa-trash-o'></i></button>&nbsp;&nbsp;" 
                        + "<button type='button' title='修改密码' class='btn btn-warning btn-xs update-password'><i class='fa fa-key'></i></button>&nbsp;&nbsp;" 
                        + "<button type='button' title='更改状态' class='btn btn-xs update-status'><i class='fa fa-arrow-circle-up checkStatus'></i></button>",
                orderable : false, // 禁止排序
                targets : [ columnNumber ] //指定禁止排序的列（最后一列为操作按钮，不需要排序功能）
            } ],
            "createdRow" : function(row, data, index) {

            },
            rowCallback : function(row, data) {
                //渲染样式
                if (data.status.code == "USRS_Active") {
                    $('td', row).last().find(".status").addClass("btn-warning");
                    $('td', row).last().find(".status").attr("title", "禁用");
                    $('td', row).last().find(".checkStatus").removeClass().addClass("fa fa-arrow-circle-down");
                } else {
                    $('td', row).last().find(".status").addClass("btn-default");
                    $('td', row).last().find(".status").attr("title", "正常");
                    $('td', row).last().find(".checkStatus").removeClass().addClass("fa fa-arrow-circle-up");
                }

                // 编辑用户操作
                $('td', row).last().find(".edit").click(function() {
                    editUser(data.id);
                });

                // 删除用户操作
                $('td', row).last().find(".delete").click(function() {
                    deleteUser(data.id);
                });
                
                // 修改密码
                $('td', row).last().find(".update-password").click(function() {
                    userPassword(data.id);
                });

                // 更改状态操作
                $('td', row).last().find(".update-status").click(function() {
                    changeUserStatus(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                //定义数据查询参数，此参数将在后端 UserDao.java 类中的 getUserPage 方法中使用
                aoData.name = $("#name").val();
                aoData.phone = $("#phone").val();
            }
        });

        $userTablePanel = $("#userTablePanel");

        // 初始化新增按钮
        $userTablePanel.find('.add-user-btn').click(function() {
            loadContent("user/form/0");
        });

        // 初始化查询按钮
        $userTablePanel.find('.search-user-btn').click(function() {
            userTable.ajax.reload();
        });

        // 初始化重置按钮
        $userTablePanel.find('.reset-user-btn').click(function() {
            $("#name").val("");
            $("#phone").val("");
            userTable.ajax.reload();
        });
    });

    //编辑用户
    function editUser(userId) {
        loadContent("user/form/" + userId);
    }

    //修改密码
    function userPassword(userId) {
        $("#updatePasswordModal").modal("show");
        $('#updatePasswordBody').load('${ctx}/user/password/' + userId, function(e) {

        });
    }
 
    // 删除用户
    function deleteUser(userId) {
        $.confirm({
            title : false,
            content : '是否确认删除该用户？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                //执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'user/delete/' + userId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        userTable.ajax.reload();
                        toastr.success('用户删除成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }

    // 更改用户状态操作
    function changeUserStatus(userId) {
        $.confirm({
            title : false,
            content : '是否修改该用户状态？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                //执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'user/change/' + userId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 刷新页面
                        userTable.ajax.reload();
                        toastr.success('修改成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }
</script>



