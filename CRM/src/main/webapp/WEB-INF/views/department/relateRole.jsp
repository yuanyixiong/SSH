<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 部门头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">选择部门角色</h4>
</div>

<!-- 角色列表 -->
<div>
	<table id="relateTable" class="table table-striped table-bordered table-hover dataTable">
		<thead>
			<tr>
				<th><input type="checkbox" onclick="$qingshixun.checkAll(this)" /></th>
				<th>角色名</th>
				<th>创建时间</th>
				<th>更新时间</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<div id="relateOperate" class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="select-relate-role-btn btn btn-primary">确定</button>
</div>

<script type="text/javascript">
    var relateTable;
    //当前选择的部门ID
    var currentDepartmentId = "${departmentId }";
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "id"
        }, {
            "data" : "name"
        }, {
            "data" : "createTime"
        }, {
            "data" : "updateTime"
        } ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化角色表
        relateTable = $qingshixun.dataTable($('#relateTable'), {
            "bDestroy" : true,
            "ajax" : {
                "url" : "role/list/data?name=" + '',
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                orderable : false, // 禁止排序
                targets : [ 0 ]
            // 指定的列
            } ],
            "createdRow" : function(row, data, index) {
                $('td', row).eq(0).html("<input type='checkbox' value=" + data.id + ">");
            },
            rowCallback : function(row, data) {

            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
            }
        });

        // 保存勾选的角色信息
        $("#relateOperate").find('.select-relate-role-btn').click(function() {
            selectDepartmentRole();
        });
    });

    // 保存方法
    function selectDepartmentRole() {
        // 获取勾选的角色id
        var checkBox = $("#relateTable tbody tr").find('input[type=checkbox]:checked');
        var ids = checkBox.getInputId();
        $.ajax({
            type : "DELETE",
            async : false,
            url : 'department/relateSave/' + ids + "/" + currentDepartmentId,
            data : {

            },
            dataType : "json",
            success : function(result) {
                // 关闭编辑窗口
                $("#relateRoleModal").modal("hide");
                // 刷新当前部门角色列表
                initRoleTable(currentDepartmentId);
                toastr.success('角色选择成功！');
            }
        });
    }
</script>



