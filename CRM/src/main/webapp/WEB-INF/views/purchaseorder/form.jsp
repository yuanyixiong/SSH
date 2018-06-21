<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 选择供应商窗口 -->
<div class="modal fade" id="selectSupplierModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="supplierSelectBody" class="modal-content"></div>
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
		<h2>编辑采购订单</h2>
	</header>
	<div id="purchaseOrderPanel" role="content">
		<div class="widget-body no-padding">
			<form method="post" id="purchaseOrderForm" name="purchaseOrder" class="smart-form"  onSubmit="return false;">
			    <input id="purchaseOrderId" type="hidden" name="id" value="${purchaseOrderModel.id }" /> 
			    <input name="createTime" type="hidden" value="${purchaseOrderModel.createTime }" /> 
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">主题</label> <label class="input"> 
							     <input name="theme" value="${purchaseOrderModel.theme }" type="text" data-rule="required;">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">采购订单编号</label> <label class="input"> 
							     <input type="text" name="code" value="${purchaseOrderModel.code }" placeholder="自动生成销售订单编号" readonly="readonly">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">负责人</label> <label class="select"> 
							     <input type="hidden" id="userCode" value="${purchaseOrderModel.user.id }"> 
							     <select name="user.id" id="user">
							     </select> <i></i>
							</label>
						</section>

						<section class="col col-md-6">
							<label class="label">承运单位</label> <label class="select"> 
							     <input type="hidden" id="freightCode" value="${purchaseOrderModel.freight.code }"> 
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
							<label class="label">选择供应商</label> <label class="input"> 
							     <input class="supplier-id" name="supplier.id" value="${purchaseOrderModel.supplier.id }" type="hidden" /> 
							     <input class="supplier-select" name="supplierName" readonly="readonly" value="${purchaseOrderModel.supplier.name }" type="text" data-rule="required" placeholder="点击选择供应商" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">联系人姓名</label> <label class="input"> 
							     <input name="contactName" value="${purchaseOrderModel.contactName }" type="text" data-rule="required;">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">联系人电话</label> <label class="input"> 
							     <input name="contactPhone" value="${purchaseOrderModel.contactPhone }" type="text" data-rule="required;">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">销售订单状态</label> <label class="select"> 
							     <input type="hidden" id="statusCode" value="${purchaseOrderModel.status.code }"> 
							     <select name="status.code" id="status">
										<option value="PURCHASE_Built">已创建</option>
										<option value="PURCHASE_Reviewed">已审核</option>
										<option value="PURCHASE_Delivered">已递送</option>
										<option value="PURCHASE_Canceled">已取消</option>
										<option value="PURCHASE_Received">收到发货</option>
								</select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">付款地址</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="payAddress" maxlength="1500">${purchaseOrderModel.payAddress }</textarea>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">送货地址</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="receiveAddress" maxlength="1500">${purchaseOrderModel.receiveAddress }</textarea>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-12">
							<label class="label">说明信息</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="instruction" maxlength="1500">${purchaseOrderModel.instruction }</textarea>
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-4">
							<button class="product-select-btn btn btn-primary order-button" type="button">选择产品</button>
							<button class="save-purchaseorder-btn btn btn-danger order-button" type="button">保存</button>
							<button class="cancel-purchaseorder-btn btn btn-default  order-button" type="button">取消</button>
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
    var $purchaseOrderPanel;
    $(function() {
        $purchaseOrderPanel = $("#purchaseOrderPanel");

        // 初始化订单详情信息
        var purchaseOrderId = $("#purchaseOrderId").val();
        if ('' != purchaseOrderId) {
            // 初始化订单信息
            initPurchaseOrderDetail(purchaseOrderId);
        }

        // 产品选择按钮
        $purchaseOrderPanel.find('.product-select-btn').click(function() {
            productSelect();
        });

        // 供应商选择操作
        $purchaseOrderPanel.find('.supplier-select').click(function() {
            supplierSelect();
        });

        // 初始化负责人
        initPurchaseOrderUser();

        // 初始化采购订单状态
        initPurchaseOrderStatus();

        // 初始化优先级
        initPurchaseOrderFreight();

        // 初始化取消操作
        $purchaseOrderPanel.find('.cancel-purchaseorder-btn').click(function() {
            cancelPurchaseOrder();
        });

        // 订单保存按钮
        $purchaseOrderPanel.find('.save-purchaseorder-btn').click(function() {
            savePurchaseOrder();
        });
    });

    // 订单保存
    function savePurchaseOrder() {
        // 校验不通过
        if (!$('#purchaseOrderForm').isValid()) {
            return false;
        }
        // 没有添加产品
        if ($("input[name='productId']").length < 1) {
            toastr.warning('未添加产品！');
            return false;
        }

        $("#purchaseOrderForm").ajaxSubmit({
            url : ctx + "/purchaseorder/save",
            type : 'POST',
            success : function(result) {
                // 如果返回的状态是0表示操作成功
                if (result.status == 0) {
                    loadContent("purchaseorder/list");
                } else {
                    toastr.error('保存失败！');
                }
            }
        });
    }

    //供应商选择
    function supplierSelect() {
        // 打开选择客户modal
        $("#selectSupplierModal").modal("show");
        $('#supplierSelectBody').load('${ctx}/supplier/supplier', function(e) {

        });
    }

    //选择供应商的回调方法
    function setSelectedSupplier(supplierId,supplierName) {
        $purchaseOrderPanel.find('.supplier-id').val(supplierId);
        $purchaseOrderPanel.find('.supplier-select').val(supplierName);
    }
    
    //产品选择按钮
    function productSelect() {
        // 打开选择产品modal
        $("#selectProModal").modal("show");
        $('#proSelectBody').load('${ctx}/product/products', function(e) {

        });
    }

    // 初始负责人
    function initPurchaseOrderUser() {
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

    // 初始化采购订单状态
    function initPurchaseOrderStatus() {
        var statusValue = $("#statusCode").val();
        if (statusValue != "") {
            $("#status").val(statusValue);
        }
    }

    // 初始化承运单位
    function initPurchaseOrderFreight() {
        var freightValue = $("#freightCode").val();
        if (freightValue != "") {
            $("#freight").val(freightValue);
        }
    }

    //修改操作初始化订单详情
    function initPurchaseOrderDetail(purchaseOrderId){
        var url="purchaseorderitem/list/data/"+purchaseOrderId;
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
                            +"<td>"+"<button type='button' onclick='deleteProductFromPurchaseOrderDetail(this,"+item.id+")' title='删除' class='btn btn-danger btn-xs delete'>" + "<i class='fa fa-trash-o'></i>" + "</button>"+"</td>"
                        +"</tr>";
                    });
                $('#detailTbody').append(content);
             }else{
                 toastr.error('获取订单详情失败！');
            }
        });
    }
  
    //删除产品
    function deleteProductFromPurchaseOrderDetail(self, id) {
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
                    url : 'purchaseorderitem/delete/' + id,
                    data : {

                    },
                    dataType : "json",
                    success : function(result) {
                        // 找到tr删除
                        $(self).parent().parent().remove();
                    }
                });
            },
            cancelPurchaseOrder : function() {

            }
        });

    }

    //取消编辑按钮
    function cancelPurchaseOrder() {
        loadContent("purchaseorder/list");
    }
</script>

