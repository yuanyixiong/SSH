<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 联系人编辑窗口 -->
<div class="modal fade" id="contactModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="contactBoy" class="modal-content"></div>
		</div>
	</div>
</div>

<!-- 联系人所属客户id -->
<div id="customerId" style="display: none;">${customerId }</div>

<!-- 联系人列表 -->
<section id="contactTablePanel">
	<div class="row">
		<article class="col-md-12">
			<div class="widget " >
				<div>
					<div class="widget-body-toolbar">
						<div class="row">
							<div class="col-md-5">
								<button class="add-contact-btn btn btn-primary" type="button">
									<i class="fa fa-plus"></i> 新增
								</button>
							</div>
							<div class="col-md-7">
								<input class="form-control list-search-contact" name="name" id="contactName" placeholder="联系人名称..." type="text">
								<button class="search-contact-btn btn btn-success" type="button">
									<i class="fa fa-search"></i>
								</button>
								<button class="reset-contact-btn btn btn-default" type="button">
									<i class="fa fa-mail-reply"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="widget-body no-padding">
						<table id="contactTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>联系人名称</th>
									<th>性别</th>
									<th>电话</th>
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
    var contactTable;
    var $contactTablePanel;
    var customerId;
    $(function() {
        // 获取客户id
        customerId = $("#customerId").html();
        // 定义数据列
        var columnData = [ {
            "data" : "name"
        }, {
            "data" : "gender"
        }, {
            "data" : "phone"
        }, {
            "data" : ""
        }, ];
        // 显示列数
        var columnNumber = columnData.length - 1;
        // 初始化表格信息
        contactTable = $qingshixun.dataTable($('#contactTable'), {
            "bDestroy" : true,
            "ajax" : {
                "url" : "contact/list/data?customerId=" + customerId,
                "type" : "POST"
            },
            "columns" : columnData,
            "columnDefs" : [ {
                "data" : null,
                "defaultContent" : "<button type='button' title='修改' class='btn btn-primary btn-xs edit'>" + "<i class='fa fa-pencil'></i>" + "</button>" + "&nbsp;&nbsp;" + "<button type='button' title='删除' class='btn btn-danger btn-xs delete'>" + "<i class='fa fa-trash-o'></i>" + "</button>",
                orderable : false, // 禁止排序
                targets : [ columnNumber ]
            // 指定的列
            } ],
            "createdRow" : function(row, data, index) {

            },
            rowCallback : function(row, data) {
                // 编辑操作
                $('td', row).last().find(".edit").click(function() {
                    editContact(customerId, data.id);
                });

                // 删除操作
                $('td', row).last().find(".delete").click(function() {
                    deleteContact(data.id);
                });
            },
            "fnDrawCallback" : function(row) {

            },
            "fnServerParams" : function(aoData) {
                aoData.columnNumber = columnNumber;
                aoData.name = $("#contactName").val();
            }
        });

        $contactTablePanel = $("#contactTablePanel");

        // 初始化新增按钮
        $contactTablePanel.find('.add-contact-btn').click(function() {
            editContact(customerId, 0);
        });

        // 初始化查询按钮
        $contactTablePanel.find('.search-contact-btn').click(function() {
            contactTable.ajax.reload();
        });

        // 初始化重置按钮
        $contactTablePanel.find('.reset-contact-btn').click(function() {
            $("#contactName").val("");
            contactTable.ajax.reload();
        });
    });

    // 编辑操作
    function editContact(customerId, contactId) {
        loadContent("contact/form/" + customerId + "/" + contactId);
    }

    // 删除联系人
    function deleteContact(contactId) {
        $.confirm({
            title : false,
            content : '是否确认删除该联系人？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'contact/delete/' + contactId,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 如果返回的状态是-1表示该删除删除的时候被引用
                        if (result.status == 3) {
                            toastr.error('该联系人已被引用,不能删除！');
                            return;
                        }
                        contactTable.ajax.reload();
                        toastr.success('联系人删除成功！');
                    }
                });
            },
            cancel : function() {
            }
        });
    }
</script>



