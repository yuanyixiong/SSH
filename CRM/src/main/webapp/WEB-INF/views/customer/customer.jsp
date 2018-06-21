<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 客户头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">选择客户</h4>
</div>

<!-- 客户列表 -->
<div>
	<table id="selectCustomerTable" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>请选择</th>
				<th>客户名称</th>
				<th>电话</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<div id="selectOperate" class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="customer-select-save btn btn-primary">确定</button>
</div>

<script type="text/javascript">
    var selectCustomerTable;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "id"
        }, {
            "data" : "name"
        }, {
            "data" : "mobile"
        } ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化客户列表
        selectCustomerTable = $qingshixun.dataTable($('#selectCustomerTable'), {
            "bDestroy" : true,
            "lengthMenu" : [ [ 5 ], [ 5 ] ],
            "ajax" : {
                "url" : "customer/list/select",
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                orderable : false, // 禁止排序
                targets : [ 0 ]
            } ],
            "createdRow" : function(row, data, index) {
                $('td', row).eq(0).html("<input type='radio' name='customer' value=" + data.id + ">");
            },
            rowCallback : function(row, data) {

            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
            }
        });

        // 设置
        $("#selectOperate").find('.customer-select-save').click(function() {
            selectCustomer();
        });
    });

    // 保存勾选的客户信息
    function selectCustomer() {
        var customerId = $('input:radio[name=customer]:checked').val();
        // 如果没有选择客户
        if (undefined == customerId) {
            toastr.error('最少选择一条数据！');
            return;
        }
        $.ajax({
            type : "post",
            async : false,
            url : 'customer/getSelectedCustomer/' + customerId,
            data : {

            },
            dataType : "json",
            success : function(result) {
                // 关闭弹出层
                $("#selectCustomerModal").modal("hide");
                // 如果返回结果不是null加载选择客户
                if (null != result) {
                    setSelectedCustomer(result.data.id, result.data.name);
                } else {
                    toastr.error('获取客户信息失败！');
                }
            }
        });
    }
</script>



