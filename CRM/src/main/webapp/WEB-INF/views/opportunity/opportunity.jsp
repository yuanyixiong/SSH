<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 销售机会头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">选择销售机会</h4>
</div>

<!-- 销售机会列表 -->
<div>
	<table id="selectOpportunityTable" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>请选择</th>
				<th>销售机会名称</th>
				<th>客户名称</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<div id="selectCampOperate" class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="opportunity-select-save btn btn-primary">确定</button>
</div>

<script type="text/javascript">
    var $selectOpportunityTable;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "id"
        }, {
            "data" : "name"
        }, {
            "data" : "customer.name"
        } ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化销售机会列表
        $selectOpportunityTable = $qingshixun.dataTable($('#selectOpportunityTable'), {
            "bDestroy" : true,
            "lengthMenu" : [ [ 5 ], [ 5 ] ],
            "ajax" : {
                "url" : "opportunity/list/select",
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                orderable : false, // 禁止排序
                targets : [ 0 ]
            } ],
            "createdRow" : function(row, data, index) {
                $('td', row).eq(0).html("<input type='radio' name='opportunity' value=" + data.id + ">");
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
        $("#selectCampOperate").find('.opportunity-select-save').click(function() {
            selectOpportunity();
        });
    });

    // 保存勾选的销售机会信息
    function selectOpportunity() {
        var opportunityId = $('input:radio[name=opportunity]:checked').val();
        // 如果没有选择销售机会
        if (undefined == opportunityId) {
            toastr.error('最少选择一条数据！');
            return;
        }
        $.ajax({
            type : "post",
            async : false,
            url : 'opportunity/getSelectedOpportunity/' + opportunityId,
            data : {

            },
            dataType : "json",
            success : function(result) {
                // 关闭弹出层
                $("#selectOpportunityModal").modal("hide");
                // 如果返回结果不是null加载选择销售机会
                if (null != result) {
                    setSelectedOpportunity(result.data.id, result.data.name);
                } else {
                    toastr.error('获取销售机会信息失败！');
                }
            }
        });
    }
</script>



