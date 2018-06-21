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

<!-- 选择报价单窗口 -->
<div class="modal fade" id="selectQuotationModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="quotationSelectBody" class="modal-content"></div>
	</div>
</div>


<div class="widget">
	<header role="heading">
		<h2>编辑销售订单</h2>
	</header>
	<div id="salesOrderPanel" role="content">
		<div class="widget-body no-padding">
			<form method="post" id="salesOrderForm" name="salesOrder" class="smart-form"  onSubmit="return false;">
				<input id="salesOrderId" type="hidden" name="id" value="${salesOrderModel.id }" />
				<input name="createTime" type="hidden" value="${salesOrderModel.createTime }" /> 
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">主题</label> <label class="input"> 
							     <input name="theme" value="${salesOrderModel.theme }" type="text" data-rule="required;">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">销售订单编号</label> <label class="input"> 
							     <input type="text" name="code" value="${salesOrderModel.code }" placeholder="自动生成销售订单编号" readonly="readonly">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">负责人</label> <label class="select"> 
							     <input type="hidden" id="userCode" value="${salesOrderModel.user.id }"> <select name="user.id" id="user">
							</select> <i></i>
							</label>
						</section>

						<section class="col col-md-6">
							<label class="label">承运单位</label> <label class="select"> 
							     <input type="hidden" id="freightCode" value="${salesOrderModel.freight.code }"> 
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
							     <input class="opportunity-id" name="opportunity.id" value="${salesOrderModel.opportunity.id }" type="hidden" /> 
							     <input class="opportunity-select" name="opportunityName" readonly="readonly" value="${salesOrderModel.opportunity.name }" type="text" data-rule="required" placeholder="点击选择销售机会" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">销售订单状态</label> <label class="select"> 
							     <input type="hidden" id="statusCode" value="${salesOrderModel.status.code }"> 
							     <select name="status.code" id="status">
									<option value="SALESORDER_Commit">已提交</option>
									<option value="SALESORDER_Reviewed">已审阅</option>
									<option value="SALESORDER_Canceled">已取消</option>
							     </select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">选择客户</label> <label class="input"> 
							     <input class="customer-id" name="customer.id" value="${salesOrderModel.customer.id }" type="hidden" /> 
							     <input class="customer-select" name="customerName" readonly="readonly" value="${salesOrderModel.customer.name }" type="text" data-rule="required" placeholder="点击选择客户" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">选择联系人</label> <label class="input"> 
							     <input class="contact-id" name="contact.id" value="${salesOrderModel.contact.id }" type="hidden" /> 
							     <input class="contact-select" name="contactName" readonly="readonly" value="${salesOrderModel.contact.name }" type="text" data-rule="required" placeholder="点击选择联系人" />
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">选择报价单</label> <label class="input"> 
							     <input class="quotation-id" name="quotation.id" value="${salesOrderModel.quotation.id }" type="hidden" /> 
							     <input class="quotation-select" name="quotationName" readonly="readonly" value="${salesOrderModel.quotation.title }" type="text" data-rule="required" placeholder="点击选择报价单" />
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">付款地址</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="payAddress" maxlength="1500">${salesOrderModel.payAddress }</textarea>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">送货地址</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="receiveAddress" maxlength="1500">${salesOrderModel.receiveAddress }</textarea>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-12">
							<label class="label">说明信息</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="instruction" maxlength="1500">${salesOrderModel.instruction }</textarea>
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-4">
							<button class="product-select-btn btn btn-primary order-button" type="button">选择产品</button>
							<button class="save-salesorder-btn save-btn btn btn-danger order-button" type="button">保存</button>
							<button class="cancel-salesorder-btn btn btn-default order-button" type="button">取消</button>
						</section>
					</div>
				</fieldset>
				<!-- 订单产品编辑区域 -->
				<section>
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
				</section>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
    var $salesOrderPanel;
    $(function() {
        $salesOrderPanel = $("#salesOrderPanel");

        // 初始化订单详情信息
        var salesOrderId = $("#salesOrderId").val();
        if ('' != salesOrderId) {
            // 初始化订单信息
            initSalesOrderDetail(salesOrderId);
        }

        // 客户选择操作
        $salesOrderPanel.find('.customer-select').click(function() {
            customerSelect();
        });

        // 联系人选择操作
        $salesOrderPanel.find('.contact-select').click(function() {
            contactSelect();
        });

        // 销售机会选择操作
        $salesOrderPanel.find('.opportunity-select').click(function() {
            opportunitySelect();
        });

        // 产品选择按钮
        $salesOrderPanel.find('.product-select-btn').click(function() {
            productSelect();
        });

        // 报价单选择操作
        $salesOrderPanel.find('.quotation-select').click(function() {
            quotationSelect();
        });

        // 初始化负责人
        initSalesOrderUser();

        // 初始化问题单状态
        initSalesOrderStatus();

        // 初始化优先级
        initSalesOrderFreight();

        // 初始化取消操作
        $salesOrderPanel.find('.cancel-salesorder-btn').click(function() {
            cancelSalesOrder();
        });

        // 订单保存按钮
        $salesOrderPanel.find('.save-salesorder-btn').click(function() {
            saveSalesOrder();
        });
    });

    // 订单保存
    function saveSalesOrder() {
        // 校验不通过
        if (!$('#salesOrderForm').isValid()) {
            return false;
        }
        // 没有添加产品
        if ($("input[name='productId']").length < 1) {
            toastr.warning('未添加产品！');
            return false;
        }

        var salesOrderId = $("#salesOrderId").val();
        // 只在新建销售订单保存时验证库存
        if ('' == salesOrderId) {
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
        }

        // 执行保存销售订单
        $("#salesOrderForm").ajaxSubmit({
            url : ctx + "/salesorder/save",
            type : 'POST',
            success : function(result) {
                // 如果返回的状态是0表示操作成功
                if (result.status == 0) {
                    loadContent("salesorder/list");
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
        $salesOrderPanel.find('.customer-id').val(customerId);
        $salesOrderPanel.find('.customer-select').val(customerName);
    }

    //选择联系人
    function contactSelect() {
        // 打开选择联系人modal
        $("#selectContactModal").modal("show");
        $('#contactSelectBody').load('${ctx}/contact/contact', function(e) {

        });
    }
    
    //选择联系人后的回调方法
    function setSelectedContact(contactId,contactName){
        $salesOrderPanel.find('.contact-id').val(contactId);
        $salesOrderPanel.find('.contact-select').val(contactName);
    }

    // 销售机会选择
    function opportunitySelect() {
        // 打开选择营销活动modal
        $("#selectOpportunityModal").modal("show");
        $('#opportunitySelectBody').load('${ctx}/opportunity/opportunity', function(e) {

        });
    }

    //选择销售机会后的回调方法
    function setSelectedOpportunity(opportunityId,opportunityName){
        $salesOrderPanel.find('.opportunity-id').val(opportunityId);
        $salesOrderPanel.find('.opportunity-select').val(opportunityName);
    }
    
    // 报价单选择
    function quotationSelect() {
        // 打开选择报价单modal
        $("#selectQuotationModal").modal("show");
        $('#quotationSelectBody').load('${ctx}/quotation/quotation', function(e) {

        });
    }

    //选择报价单后的回调方法
    function setSelectedQuotation(quotationId,quotationName){
        $salesOrderPanel.find('.quotation-id').val(quotationId);
        $salesOrderPanel.find('.quotation-select').val(quotationName);
    }
  
    // 初始负责人
    function initSalesOrderUser() {
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

    // 初始化销售订单状态
    function initSalesOrderStatus() {
        var statusValue = $("#statusCode").val();
        if (statusValue != "") {
            $("#status").val(statusValue);
        }
    }

    // 初始化承运单位
    function initSalesOrderFreight() {
        var freightValue = $("#freightCode").val();
        if (freightValue != "") {
            $("#freight").val(freightValue);
        }
    }

    //修改操作初始化订单详情
    function initSalesOrderDetail(salesOrderId){
        var url="salesorderitem/list/data/"+salesOrderId;
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
                            +"<td>"+"<button type='button' onclick='deleteProductFromSalesOrderDetail(this,"+item.id+")' title='删除' class='btn btn-danger btn-xs delete'>" + "<i class='fa fa-trash-o'></i>" + "</button>"+"</td>"
                        +"</tr>";
                    });
                $('#detailTbody').append(content);
             }else{
                 toastr.error('获取订单详情失败！');
            }
        });
    }
  
    //删除产品
    function deleteProductFromSalesOrderDetail(self, id) {
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
                    url : 'salesorderitem/delete/' + id,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 找到tr删除
                        $(self).parent().parent().remove();
                    }
                });
            },
            cancelSalesOrder : function() {

            }
        });

    }

    //取消编辑按钮
    function cancelSalesOrder() {
        //返回销售订单列表
        loadContent("salesorder/list");
    }
</script>

