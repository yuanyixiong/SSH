<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 供应商头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">选择供应商</h4>
</div>

<!-- 供应商列表 -->
<div>
	<table id="selectSupplierTable" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>请选择</th>
				<th>供应商名</th>
				<th>电话</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<div id="selectSupplierOperate" class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="supplier-select-save btn btn-primary">确定</button>
</div>

<script type="text/javascript">
    var $selectSupplierTable;
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
        // 初始化产品列表
        $selectSupplierTable = $qingshixun.dataTable($('#selectSupplierTable'), {
            "bDestroy" : true,
            "lengthMenu" : [ [ 5 ], [ 5 ] ],
            "ajax" : {
                "url" : "supplier/list/select",
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                orderable : false, // 禁止排序
                targets : [ 0 ]
            } ],
            "createdRow" : function(row, data, index) {
                $('td', row).eq(0).html("<input type='radio' name='supplier' value=" + data.id + ">");
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
        $("#selectSupplierOperate").find('.supplier-select-save').click(function() {
            selectSupplier();
        });
    });

    // 保存勾选的供应商信息
    function selectSupplier() {
        var supplierId = $('input:radio[name=supplier]:checked').val();
     	// 如果没有选择供应商
        if(undefined == supplierId){
        	toastr.error('最少选择一条数据！');
        	return;
        }
        $.ajax({
            type : "post",
            async : false,
            url : 'supplier/getSelectedSupplier/' + supplierId,
            data : {

            },
            dataType : "json",
            success : function(result) {
                // 关闭弹出层
                $("#selectSupplierModal").modal("hide");
                // 如果返回结果不是null加载选择供应商
                if (null != result) {
                    setSelectedSupplier(result.data.id,result.data.name);
                } else {
                    toastr.error('获取供应商信息失败！');
                }
            }
        });
    }
</script>



