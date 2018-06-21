<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 产品头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">选择产品</h4>
</div>

<!-- 产品列表 -->
<div>
	<table id="selectProductTable" class="table table-striped table-bordered table-hover dataTable">
		<thead>
			<tr>
				<th>请选择</th>
				<th>产品名称</th>
				<th>价格</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<div id="selectOperate" class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="select-save btn btn-primary">确定</button>
</div>

<script type="text/javascript">
    var $selectProductTable;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "id"
        }, {
            "data" : "name"
        }, {
            "data" : "price"
        } ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化产品列表
        $selectProductTable = $qingshixun.dataTable($('#selectProductTable'), {
            "bDestroy" : true,
            "lengthMenu" : [ [ 5 ], [ 5 ] ],
            "ajax" : {
                "url" : "product/list/problem",
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                orderable : false, // 禁止排序
                targets : [ 0 ]
            //第1列禁止排序
            } ],
            "createdRow" : function(row, data, index) {
                $('td', row).eq(0).html("<input type='radio' name='product' value=" + data.id + ">");
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
        $("#selectOperate").find('.select-save').click(function() {
            selectProduct();
        });
    });

    // 保存勾选的产品信息
    function selectProduct() {
        var productId = $('input:radio[name=product]:checked').val();
        // 如果没有选择产品
        if (undefined == productId) {
            toastr.error('最少选择一条数据！');
            return;
        }
        $.ajax({
            type : "post",
            async : false,
            url : 'product/getSelectedProduct/' + productId,
            data : {

            },
            dataType : "json",
            success : function(result) {
                // 关闭弹出层
                $("#selectProductModal").modal("hide");
                // 如果返回结果不是null加载选择产品
                if (null != result) {
                    setSelectedProduct(result.data.id, result.data.name);
                } else {
                    toastr.error('获取产品信息失败！');
                }
            }
        });
    }
</script>



