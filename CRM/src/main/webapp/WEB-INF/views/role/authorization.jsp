<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 角色列表 -->
<section id="roleAuthorizationTablePanel">
	<div class="row">
		<!-- 角色列表 -->
		<article class="col-md-6">
			<div class="widget ">
				<div>
					<div class="widget-body-toolbar">
						<input class="form-control list-search-contact" name="name" id="name" placeholder="角色名..." type="text">
						<button class="search-role-btn btn btn-success" type="button">
							<i class="fa fa-search"></i>
						</button>
						<button class="reset-role-btn btn btn-default" type="button">
							<i class="fa fa-mail-reply"></i>
						</button>
					</div>
					<div class="widget-body no-padding">
						<table id="roleAuthorizationTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>角色名</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</article>

		<!-- 菜单树 -->
		<div id="resourceTreePanel" class="col-md-6"></div>
	</div>
</section>

<script type="text/javascript">
    var roleAuthorizationTable;
    var $roleAuthorizationTablePanel;
    var $resourceTreePanel;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "name"
        }, ];

        // 显示列数
        var columnNumber = columnData.length - 1;
        $resourceTreePanel = $('#resourceTreePanel');

        //初始化表格信息
        roleAuthorizationTable = $qingshixun.dataTable($('#roleAuthorizationTable'), {
            "ajax" : {
                "url" : "role/list/data",
                "type" : "POST"
            },
            "columns" : columnData,
            "createdRow" : function(row, data, index) {

            },
            rowCallback : function(row, data) {
                $('td', row).click(function() {
                    loadPowerTree(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.name = $("#name").val();
            }
        });

        $roleAuthorizationTablePanel = $("#roleAuthorizationTablePanel");

        //初始化查询按钮
        $roleAuthorizationTablePanel.find('.search-role-btn').click(function() {
            roleAuthorizationTable.ajax.reload();
        });

        //初始化重置按钮
        $roleAuthorizationTablePanel.find('.reset-role-btn').click(function() {
            $("#name").val("");
            roleAuthorizationTable.ajax.reload();
        });

        // 隐藏每页显示多少项区域
        $("#roleAuthorizationTable_length").children().hide();

        // 选择的行变换颜色
        $('#roleAuthorizationTable tbody').on('click', 'tr', function() {
            // 如果点击的行有样式warning
            if ($(this).hasClass('warning')) {
                $(this).removeClass('warning');
            } else {
                roleAuthorizationTable.$('tr.warning').removeClass('warning');
                $(this).addClass('warning');
            }
        });
    });

    //根据角色加载对应的权限树
    function loadPowerTree(roleId) {
        $resourceTreePanel.load('${ctx}/role/resourceTree/' + roleId, function(e) {

        });
    }
</script>