<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 产品头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">选择产品</h4>
</div>

<!-- 选择产品列表 -->
<div>
	<table id="relateProTable" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>请选择</th>
				<th>产品名称</th>
				<th>价格</th>
				<th>库存</th>
				<th>图片</th>
				<th>状态</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<div id="relateOperate" class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="select-save btn btn-primary">确定</button>
</div>

<script type="text/javascript">
    var $relateProTable;
    $(function() {
        // 获取选择的产品id
        var valArr = new Array;
        $("input[name='productId']").each(function(i) {
            valArr[i] = $(this).val();
        });
        var productIds = valArr.join(',');

        // 定义数据列
        var columnData = [ {
            "data" : "id"
        }, {
            "data" : "name"
        }, {
            "data" : "price"
        }, {
            "data" : "inventory"
        }, {
            "data" : "picture"
        }, {
            "data" : "status.name"
        } ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化产品列表
        $relateProTable = $qingshixun.dataTable($('#relateProTable'), {
            "bDestroy" : true,
            "lengthMenu" : [ [ 5 ], [ 5 ] ],
            "ajax" : {
                "url" : "product/list/select?productIds=" + productIds,
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                orderable : false, // 禁止排序
                targets : [ 0 ]
            } ],
            "createdRow" : function(row, data, index) {
                // 添加勾选框
                $('td', row).eq(0).html("<input type='checkbox' value=" + data.id + ">");
            },
            rowCallback : function(row, data) {
                // 显示图片
                $('td', row).eq(4).html("<img width='50px;' height='50px;' src=${ctx}/${imagePath}"+data.picture+" />");
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.name = $("#name").val();
            }
        });

        // 保存选择产品信息
        $("#relateOperate").find('.select-save').click(function() {
            selectProducts();
        });
    });

    //保存选择产品信息
    function selectProducts() {
        var checkBox = $("#relateProTable tbody tr").find('input[type=checkbox]:checked');
        var ids = checkBox.getInputId();
        // 如果未选择则不可以提交
        if (ids == false) {
            return;
        }
        // 提交选择的产品信息
        $.ajax({
            type : "post",
            async : false,
            url : 'product/getSelectedProducts/' + ids,
            data : {

            },
            dataType : "json",
            success : function(result) {
                // 关闭弹出层
                $("#selectProModal").modal("hide");
                // 如果返回的结果不是null加载选择的产品
                if (null != result) {
                    var content = "";
                    $.each(result.data, function(i, item) {
                        content += "<tr role='row' ><td style='display: none;'><input type='text' name='itemId' value='null' /></td>" 
                                + "<td style='display: none;'><input type='text' name='productId' value='"+item.id+"' /></td>" 
                                + "<td>" + item.name + "</td><td style='display: none;'><input type='text' name='price' value='"+item.price+"' /></td>"
                                + "<td><input type='text' id='"+item.id+"' name='quantity' value='"+1+"' data-rule='required; integer;range[1~]' /></td>" 
                                + "<td><input type='text' name='inventory' value='"+item.inventory+"' disabled='disabled' /></td>" 
                                + "<td><img width='100px;' height='100px;' src='${ctx}/${imagePath}"+item.picture+"' /></td>"
                                + "<td>" + item.status.name + "</td>" + "<td>" + "<button type='button' onclick='deletePro(this,0)' title='删除' class='btn btn-danger btn-xs delete'>" + "<i class='fa fa-trash-o'></i>" + "</button>" + "</td>" + "</tr>";
                    });
                    $('#detailTbody').append(content);
                } else {
                    toastr.error('加载产品信息失败！');
                }
            }
        });
    }
</script>



