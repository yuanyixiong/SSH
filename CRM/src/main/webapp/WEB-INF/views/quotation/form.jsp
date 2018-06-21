<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 选择客户窗口 -->
<div class="modal fade" id="selectCustomerModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="customerSelectBody" class="modal-content"></div>
	</div>
</div>

<!-- 选择联系人窗口 -->
<div class="modal fade" id="selectContactModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="contactSelectBody" class="modal-content"></div>
	</div>
</div>

<!-- 选择销售机会窗口 -->
<div class="modal fade" id="selectOpportunityModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="opportunitySelectBody" class="modal-content"></div>
	</div>
</div>

<!-- 选择产品窗口 -->
<div class="modal fade" id="selectProModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="proSelectBody" class="modal-content"></div>
	</div>
</div>

<div class="widget">
	<header role="heading">
		<h2>编辑报价单</h2>
	</header>
	<div id="quotationPanel" role="content">
		<div class="widget-body no-padding">
			<form method="post" id="quotationForm" name="quotation" class="smart-form" onSubmit="return false;">
			    <input class="quotation-id" type="hidden" name="id" value="${quotationModel.id }" /> 
			    <input name="createTime" type="hidden" value="${quotationModel.createTime }" /> 
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">标题</label> <label class="input"> 
							     <input name="title" value="${quotationModel.title }" type="text" data-rule="required;">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">报价单编号</label> <label class="input"> 
							     <input type="text" name="code" value="${quotationModel.code }" placeholder="自动生成报价单编号" readonly="readonly">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">负责人</label> <label class="select"> 
							     <input type="hidden" id="userCode" value="${quotationModel.user.id }"> 
							     <select name="user.id" id="user">

							     </select> <i></i>
							</label>
						</section>

						<section class="col col-md-6">
							<label class="label">承运单位</label> <label class="select"> 
							     <input type="hidden" id="freightCode" value="${quotationModel.freight.code }"> 
							     <select name="freight.code" id="freight">
										<option value="FREIGHT_Sf">顺丰物流</option>
										<option value="FREIGHT_Sto">申通物流</option>
										<option value="FREIGHT_Postal">邮政快递</option>
								</select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">选择销售机会</label> <label class="input"> 
							     <input class="opportunity-id" name="opportunity.id" value="${quotationModel.opportunity.id }" type="hidden" /> 
							     <input class="opportunity-select" name="opportunityName" readonly="readonly" value="${quotationModel.opportunity.name }" type="text" data-rule="required" placeholder="点击选择销售机会" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">报价单状态</label> <label class="select"> 
							     <input type="hidden" id="statusCode" value="${quotationModel.status.code }"> 
							     <select name="status.code" id="status">
										<option value="QUOTATION_Built">已建立</option>
										<option value="QUOTATION_Reviewed">已审阅</option>
										<option value="QUOTATION_Accepted">已接受</option>
										<option value="QUOTATION_Denied">被拒绝</option>
								</select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">选择客户</label> <label class="input"> 
							     <input class="customer-id" name="customer.id" value="${quotationModel.customer.id }" type="hidden" /> 
							     <input class="customer-select" name="customerName" readonly="readonly" value="${quotationModel.customer.name }" type="text" data-rule="required" placeholder="点击选择客户" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">选择联系人</label> <label class="input"> 
							     <input class="contact-id" name="contact.id" value="${quotationModel.contact.id }" type="hidden" /> 
							     <input class="contact-select" name="contactName" readonly="readonly" value="${quotationModel.contact.name }" type="text" data-rule="required" placeholder="点击选择联系人" />
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">发票地址</label> <label class="input">
							     <textarea class="form-control description" rows="3" name="invoiceAddress" maxlength="1500">${quotationModel.invoiceAddress }</textarea>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">送货地址</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="receiverAddress" maxlength="1500">${quotationModel.receiverAddress }</textarea>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-12">
							<label class="label">描述</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="description" maxlength="1500">${quotationModel.description }</textarea>
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-4">
							<button class="product-select-btn btn btn-primary order-button" type="button">选择产品</button>
							<button class="save-quotation-btn btn btn-danger order-button" type="button">保存</button>
							<button class="btn btn-default cancel-quotation-btn order-button" type="button">取消</button>
						</section>
					</div>
				</fieldset>
				<!-- 订单产品编辑区域 -->
				<section>
					<div>
						<table id="productTable" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>产品名称</th>
									<th>购买数量</th>
									<th>产品库存</th>
									<th>图片</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="detailTbody">
							</tbody>
						</table>
					</div>
				</section>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
    var $quotationPanel;
    $(function() {
        $quotationPanel = $("#quotationPanel");

        // 初始化订单详情信息
        var quotationId = $("#quotationPanel").find('.quotation-id').val();
        if ('' != quotationId) {
            // 初始化订单信息
            initQuotationDetail(quotationId);
        }

        // 客户选择操作
        $quotationPanel.find('.customer-select').click(function() {
            customerSelect();
        });

        // 联系人选择操作
        $quotationPanel.find('.contact-select').click(function() {
            contactSelect();
        });

        // 销售机会选择操作
        $quotationPanel.find('.opportunity-select').click(function() {
            opportunitySelect();
        });

        // 产品选择按钮
        $quotationPanel.find('.product-select-btn').click(function() {
            productSelect();
        });

        // 初始化负责人
        initQuotationUser();

        // 初始化问题单状态
        initQuotationStatus();

        // 初始化优先级
        initQuotationFreight();

        // 初始化取消操作
        $quotationPanel.find('.cancel-quotation-btn').click(function() {
            cancelQuotation();
        });

        // 订单保存按钮
        $quotationPanel.find('.save-quotation-btn').click(function() {
            saveQuotation();
        });

    });

    //订单保存
    function saveQuotation() {
        // 校验不通过
        if (!$('#quotationForm').isValid()) {
            return false;
        }
        // 没有添加产品
        if ($("input[name='productId']").length < 1) {
            toastr.warning('未添加产品！');
            return false;
        }

        //验证库存
        var quantity = $("input[name='quantity']");
        var inventory = $("input[name='inventory']");
        // 遍历输入产品数量
        for (var i = 0; i < quantity.length; i++) {
            // 如果输入产品数量大于库存
            if (parseInt(quantity[i].value) > parseInt(inventory[i].value)) {
                quantity[i].value = 1;
                quantity[i].focus();
                toastr.warning('库存不足！');
                return false;
            }
        }

        $("#quotationForm").ajaxSubmit({
            url : ctx + "/quotation/save",
            type : 'POST',
            success : function(result) {
                // 如果返回的状态是0表示操作成功
                if (result.status == 0) {
                    loadContent("quotation/list");
                } else {
                    toastr.error('保存失败！');
                }
            }
        });
    }

    //产品选择按钮
    function productSelect() {
        // 打开选择产品modal
        $("#selectProModal").modal("show");
        $('#proSelectBody').load('${ctx}/product/products', function(e) {

        });
    }

    // 客户选择
    function customerSelect() {
        // 打开选择客户modal
        $("#selectCustomerModal").modal("show");
        $('#customerSelectBody').load('${ctx}/customer/customer', function(e) {

        });
    }

    //选择客户后的回调方法
    function setSelectedCustomer(customerId,customerName){
        $quotationPanel.find('.customer-id').val(customerId);
        $quotationPanel.find('.customer-select').val(customerName);
    }
    
    //选择联系人
    function contactSelect() {
        // 打开选择联系人modal
        $("#selectContactModal").modal("show");
        $('#contactSelectBody').load('${ctx}/contact/contact', function(e) {

        });
    }

    //选择联系人后的回调方法
    function setSelectedContact(contactId, contactName) {
        $quotationPanel.find('.contact-id').val(contactId);
        $quotationPanel.find('.contact-select').val(contactName);
    }

    // 营销活动选择
    function opportunitySelect() {
        // 打开选择营销活动modal
        $("#selectOpportunityModal").modal("show");
        $('#opportunitySelectBody').load('${ctx}/opportunity/opportunity', function(e) {

        });
    }

    //选择销售机会后的回调方法
    function setSelectedOpportunity(opportunityId,opportunityName){
        $quotationPanel.find('.opportunity-id').val(opportunityId);
        $quotationPanel.find('.opportunity-select').val(opportunityName);
    }
    
    // 初始负责人
    function initQuotationUser() {
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

    // 初始化报价单状态
    function initQuotationStatus() {
        var statusValue = $("#statusCode").val();
        if (statusValue != "") {
            $("#status").val(statusValue);
        }
    }
    
    // 初始化承运单位
    function initQuotationFreight() {
        var freightValue = $("#freightCode").val();
        if (freightValue != "") {
            $("#freight").val(freightValue);
        }
    }

    //修改操作初始化订单详情
    function initQuotationDetail(quotationId){
        var url="quotationitem/list/data/"+quotationId;
        $.post(url,function(result){
                // 如果返回结果不是null，加载订单详情内容
                if (null != result) {
                var content = "";
                    $.each(result.data, function(i, item) {
                        content += "<tr role='row' >"
                            +"<td style='display: none;'><input type='text' name='itemId' value='"+item.id+"' />"+"</td>"
                            +"<td style='display: none;'><input type='text' name='productId' value='"+item.product.id+"' />"+"</td>"
                            +"<td>"+item.product.name+"</td>"
                            +"<td style='display: none;'><input type='text' name='price' value='"+item.product.price+"' />"+"</td>"
                            +"<td><input type='text' id='"+item.product.id+"' name='quantity' value='"+item.quantity+"' data-rule='required; integer[+1];' />"+"</td>"
                            +"<td><input type='text' name='inventory' value='"+item.product.inventory+"' disabled='disabled' />"+"</td>"
                            +"<td><img width='50px;' height='50px;' src='${ctx}/${imagePath}"+item.product.picture+"' />"+"</td>"
                            +"<td>"+item.product.status.name+"</td>"
                            +"<td>"+"<button type='button' onclick='deleteProductFromQuotationDetail(this,"+item.id+")' title='删除' class='btn btn-danger btn-xs delete'>" + "<i class='fa fa-trash-o'></i>" + "</button>"+"</td>"
                        +"</tr>";
                    });
                $('#detailTbody').append(content);
             }else{
                 toastr.error('获取订单详情失败！');
            }
        });
    }
  
    //删除产品
    function deleteProductFromQuotationDetail(self, id) {
        $.confirm({
            title : false,
            content : '是否确认删除该产品？',
            confirmButton : '确认',
            cancelButton : '取消',
            confirm : function() {
                // 执行删除
                $.ajax({
                    type : "post",
                    async : false,
                    url : 'quotationitem/delete/' + id,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 找到tr删除
                        $(self).parent().parent().remove();
                    }
                });
            },
            cancelQuotation : function() {

            }
        });

    }

    //取消编辑按钮
    function cancelQuotation() {
        loadContent("quotation/list");
    }
</script>

