<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 联系人头信息 -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">选择联系人</h4>
</div>

<!-- 联系人列表 -->
<div>
	<table id="selectContactTable" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>请选择</th>
				<th>联系人名称</th>
				<th>电话</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>

<div id="selectContactOperate" class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	<button type="button" class="contact-select-save btn btn-primary">确定</button>
</div>

<script type="text/javascript">
    var $selectContactTable;
    $(function() {
        // 定义数据列
        var columnData = [ {
            "data" : "id"
        }, {
            "data" : "name"
        }, {
            "data" : "phone"
        } ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化联系人列表
        $selectContactTable = $qingshixun.dataTable($('#selectContactTable'), {
            "bDestroy" : true,
            "lengthMenu" : [ [ 5 ], [ 5 ] ],
            "ajax" : {
                "url" : "contact/list/select",
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                orderable : false, // 禁止排序
                targets : [ 0 ]
            } ],
            "createdRow" : function(row, data, index) {
                $('td', row).eq(0).html("<input type='radio' name='contact' value=" + data.id + ">");
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
        $("#selectContactOperate").find('.contact-select-save').click(function() {
            selectContact();
        });
    });

    // 保存勾选的联系人信息
    function selectContact() {
        var contactId = $('input:radio[name=contact]:checked').val();
        // 如果没有选择联系人
        if (undefined == contactId) {
            toastr.error('最少选择一条数据！');
            return;
        }
        $.ajax({
            type : "post",
            async : false,
            url : 'contact/getSelectedContact/' + contactId,
            data : {

            },
            dataType : "json",
            success : function(result) {
                // 关闭弹出层
                $("#selectContactModal").modal("hide");
                // 如果返回结果不是null加载选择联系人
                if (null != result) {
                    setSelectedContact(result.data.id, result.data.name);
                } else {
                    toastr.error('获取联系人信息失败！');
                }
            }
        });
    }
</script>



