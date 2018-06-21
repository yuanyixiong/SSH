<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 选择产品窗口 -->
<div class="modal fade" id="selectProductModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="productSelectBody" class="modal-content"></div>
	</div>
</div>

<!-- 选择联系人窗口 -->
<div class="modal fade" id="selectContactModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="contactSelectBody" class="modal-content"></div>
	</div>
</div>

<div class="widget">
	<header role="heading">
		<h2>编辑问题单</h2>
	</header>
	<div role="content">
		<div id="issuePanel" class="widget-body no-padding">
			<form method="post" id="issueForm" name="issue" class="smart-form"  onSubmit="return false;">
			     <input type="hidden" name="id" value="${issueModel.id }" /> 
			     <input name="createTime" type="hidden" value="${issueModel.createTime }" /> 
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">标题</label> <label class="input">
							     <input name="title" value="${issueModel.title }" type="text" data-rule="required;" maxlength="50">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">问题单编号</label> <label class="input"> 
							     <input type="text" name="code" value="${issueModel.code }" placeholder="自动生成问题单编号" readonly="readonly">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">负责人</label> <label class="select"> 
							     <input type="hidden" id="userCode" value="${issueModel.user.id }"> 
							     <select name="user.id" id="user">

							     </select> <i></i>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">选择产品</label> <label class="input"> 
							     <input class="product-id" name="product.id" value="${issueModel.product.id }" type="hidden" /> 
							     <input class="product-select" name="productName" readonly="readonly" value="${issueModel.product.name }" type="text" data-rule="required" maxlength="100" placeholder="点击选择产品" />
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">选择联系人</label> <label class="input"> 
							     <input class="contact-id" name="contact.id" value="${issueModel.contact.id }" type="hidden" /> 
							     <input class="contact-select" name="contactName" readonly="readonly" value="${issueModel.contact.name }" type="text" data-rule="required" placeholder="点击选择联系人" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">优先级</label> <label class="select"> 
							     <input type="hidden" id="priorityCode" value="${issueModel.priority.code }"> 
							     <select name="priority.code" id="priority">
										<option value="ISSUE_Low">低</option>
										<option value="ISSUE_Common">一般</option>
										<option value="ISSUE_Hign">高</option>
										<option value="ISSUE_Urgent">紧急</option>
								</select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">状态</label> <label class="select"> 
							     <input type="hidden" id="statusCode" value="${issueModel.status.code }"> 
								     <select name="status.code" id="status">
										<option value="ISSUE_Opended">开启</option>
										<option value="ISSUE_Processing">处理中</option>
										<option value="ISSUE_Response">等待回应</option>
										<option value="ISSUE_Closed">关闭</option>
								</select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-12">
							<label class="label">描述</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="description" maxlength="1500">${issueModel.description }</textarea>
							</label>
						</section>
					</div>
				</fieldset>
				<footer>
					<button type="submit" name="submit" class="save-issue-btn btn btn-primary">保存</button>
					<button type="button" class="btn btn-default issue-cancel">取消</button>
				</footer>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
    var $issuePanel;
    $(function() {
        $issuePanel = $("#issuePanel");
        // 产品选择操作
        $issuePanel.find('.product-select').click(function() {
            productSelect();
        });

        // 产品选择操作
        $issuePanel.find('.contact-select').click(function() {
            contactSelect();
        });

        // 初始化负责人
        initIssueUser();

        // 初始化问题单状态
        initIssueStatus();

        // 初始化优先级
        initIssuePriority();

        // 初始化取消操作
        $issuePanel.find('.issue-cancel').click(function() {
            cancelIssue();
        });

        // 保存问题单
        $('.save-issue-btn').click(function(e) {
            if (!$('#issueForm').isValid()) {
                return false;
            }
            $("#issueForm").ajaxSubmit({
                url : ctx + "/issue/save",
                type : 'POST',
                success : function(result) {
                    // 如果返回的状态是0表示操作成功
                    if (result.status == 0) {
                        loadContent("issue/list");
                    } else {
                        toastr.error('保存失败！');
                    }
                }
            });
        })
    });

    // 产品选择
    function productSelect() {
        // 打开选择产品modal
        $("#selectProductModal").modal("show");
        $('#productSelectBody').load('${ctx}/product/product', function(e) {
a
        });
    }

    // 选择产品后的回调方法
    function setSelectedProduct(productId, productName) {
        $issuePanel.find('.product-id').val(productId);
        $issuePanel.find('.product-select').val(productName);
    }
    
    // 选择联系人
    function contactSelect() {
        // 打开选择联系人modal
        $("#selectContactModal").modal("show");
        $('#contactSelectBody').load('${ctx}/contact/contact', function(e) {

        });
    }

    //选择联系人后的回调方法
    function setSelectedContact(contactId, contactName) {
        $issuePanel.find('.contact-id').val(contactId);
        $issuePanel.find('.contact-select').val(contactName);
    }

    // 初始负责人
    function initIssueUser() {
        var url = "user/list/assign";
        $.post(url, function(result) {
            // 如果返回的结果不是null
            if (null != result) {
                var content = "";
                $.each(result.data, function(i, item) {
                    content += "<option  value='"
							+ item.id
							+ "'>" + item.name + "</option>";
                });
                $('#user').append(content);
                // 设置选中用户
                var userValue = $("#userCode").val();
                if (userValue != "") {
                    $("#user").val(userValue);
                }
            } else {
                toastr.error('获取负责人失败！');
            }
        });
    }

    // 初始化问题单状态
    function initIssueStatus() {
        var statusValue = $("#statusCode").val();
        if (statusValue != "") {
            $("#status").val(statusValue);
        }
    }

    // 初始化问题单状态
    function initIssuePriority() {
        var priorityValue = $("#priorityCode").val();
        if (priorityValue != "") {
            $("#priority").val(priorityValue);
        }
    }

    //取消编辑按钮
    function cancelIssue() {
        loadContent("issue/list");
    }
</script>

