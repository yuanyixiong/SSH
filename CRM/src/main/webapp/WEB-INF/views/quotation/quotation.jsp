<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 报价单头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">选择报价单</h4>
</div>

<!-- 报价单列表 -->
<div>
	<table id="selectQuotationTable" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>请选择</th>
				<th>报价单编号</th>
				<th>标题</th>
				<th>客户名称</th>
				<th>报价单状态</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<div id="selectQuotationOperate" class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="quotation-select-save btn btn-primary">确定</button>
</div>

<script type="text/javascript">
    var $selectQuotationTable;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "id"
        }, {
            "data" : "code"
        }, {
            "data" : "title"
        }, {
            "data" : "customer.name"
        }, {
            "data" : "status.name"
        } ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化报价单列表
        $selectQuotationTable = $qingshixun.dataTable($('#selectQuotationTable'), {
            "bDestroy" : true,
            "lengthMenu" : [ [ 5 ], [ 5 ] ],
            "ajax" : {
                "url" : "quotation/list/select",
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                orderable : false, // 禁止排序
                targets : [ 0 ]
            } ],
            "createdRow" : function(row, data, index) {
                $('td', row).eq(0).html("<input type='radio' name='quotation' value=" + data.id + ">");
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
        $("#selectQuotationOperate").find('.quotation-select-save').click(function() {
            selectQuotation();
        });
    });

    // 保存勾选的报价单信息
    function selectQuotation() {
        var quotationId = $('input:radio[name=quotation]:checked').val();
        // 如果没有选择报价单
        if (undefined == quotationId) {
            toastr.error('最少选择一条数据！');
            return;
        }
        $.ajax({
            type : "post",
            async : false,
            url : 'quotation/getSelectedQuotation/' + quotationId,
            data : {

            },
            dataType : "json",
            success : function(result) {
                // 关闭弹出层
                $("#selectQuotationModal").modal("hide");
                // 如果返回结果不是null加载选择报价单
                if (null != result) {
                    setSelectedQuotation(result.data.id, result.data.title);
                } else {
                    toastr.error('获取报价单信息失败！');
                }
            }
        });
    }
</script>



