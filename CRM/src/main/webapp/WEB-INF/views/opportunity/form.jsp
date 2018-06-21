<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 选择客户窗口 -->
<div class="modal fade" id="selectCustomerModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="customerSelectBody" class="modal-content"></div>
	</div>
</div>

<!-- 选择营销活动窗口 -->
<div class="modal fade" id="selectCampaignModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="campaignSelectBody" class="modal-content"></div>
	</div>
</div>

<div class="widget">
	<header role="heading">
		<h2>编辑销售机会</h2>
	</header>
	<div id="opportunityPanel" role="content">
		<div class="widget-body no-padding">
			<form method="post" id="opportunityForm" name="opportunity" class="smart-form"  onSubmit="return false;">
			     <input type="hidden" name="id" value="${opportunityModel.id }" /> 
			     <input name="createTime" type="hidden" value="${opportunityModel.createTime }" /> 
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">名称</label> <label class="input"> 
							     <input name="name" value="${opportunityModel.name }" type="text" data-rule="required;">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">销售机会编号</label> <label class="input"> 
							     <input type="text" name="code" value="${opportunityModel.code }" placeholder="自动生成销售机会编号" readonly="readonly">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">负责人</label> <label class="select"> 
							     <input type="hidden" id="userCode" value="${opportunityModel.user.id }"> 
							     <select name="user.id" id="user">
							     </select> <i></i>
							</label>
						</section>

						<section class="col col-md-6">
							<label class="label">合计</label> <label class="input"> 
							     <input type="text" name="total" value="${opportunityModel.total }" data-rule="required; integer; range[0~2147483647];">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">选择客户</label> <label class="input"> 
							     <input class="customer-id" name="customer.id" value="${opportunityModel.customer.id }" type="hidden" /> 
							     <input class="customer-select" name="customerName" readonly="readonly" value="${opportunityModel.customer.name }" type="text" data-rule="required" placeholder="点击选择客户" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">来自营销活动</label> <label class="input"> 
							     <input class="campaign-id" name="campaign.id" value="${opportunityModel.campaign.id }" type="hidden" /> 
							     <input class="campaign-select" name="campaignName" readonly="readonly" value="${opportunityModel.campaign.name }" type="text" data-rule="required" placeholder="点击选择营销活动" />
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">销售机会来源</label> <label class="select"> <input type="hidden" id="resourceCode" value="${opportunityModel.resource.code }"> <select name="resource.code" id="resource">
									<option value="CUSTOMER_Telemarketing">电话营销</option>
									<option value="CUSTOMER_Existing">既有客户</option>
									<option value="CUSTOMER_Emaimarketing">邮件营销</option>
									<option value="CUSTOMER_Other">其他</option>
							</select> <i></i>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">销售阶段</label> <label class="select"> <input type="hidden" id="statusCode" value="${opportunityModel.status.code }"> <select name="status.code" id="status">
									<option value="OPPOR_Interested">有意向</option>
									<option value="OPPOR_Price">价格比较</option>
									<option value="OPPOR_Signed">签单</option>
									<option value="OPPOR_Lost">丢单</option>
							</select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">可能性(%)</label> <label class="input"> 
							     <input type="text" name="probability" value="${opportunityModel.probability }" data-rule="required; integer; range[0~2147483647];">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">预计结束日期:</label> <label class="input"> 
							     <input readonly="readonly" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="endDate" value="${opportunityModel.endDate }" data-rule="required">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-12">
							<label class="label">描述</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="description" maxlength="1500">${opportunityModel.description }</textarea>
							</label>
						</section>
					</div>
				</fieldset>
				<footer>
					<button type="submit" name="submit" class="save-opportunity-btn btn btn-primary">保存</button>
					<button type="button" class="btn btn-default opportunity-cancel">取消</button>
				</footer>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
    var $opportunityPanel;
    $(function() {
        $opportunityPanel = $("#opportunityPanel");
        // 客户选择操作
        $opportunityPanel.find('.customer-select').click(function() {
            customerSelect();
        });

        // 营销活动选择操作
        $opportunityPanel.find('.campaign-select').click(function() {
            campaignSelect();
        });

        // 初始化负责人
        initOpportunityUser();

        // 初始化问题单状态
        initOpportunityStatus();

        // 初始化优先级
        initOpportunityResource();

        // 初始化取消操作
        $opportunityPanel.find('.opportunity-cancel').click(function() {
            cancelOpportunity();
        });

        // 保存销售机会
        $('.save-opportunity-btn').click(function(e) {
            if (!$('#opportunityForm').isValid()) {
                return false;
            }
            $("#opportunityForm").ajaxSubmit({
                url : ctx + "/opportunity/save",
                type : 'POST',
                success : function(result) {
                    // 如果返回的状态是0表示操作成功
                    if (result.status == 0) {
                        loadContent("opportunity/list");
                    } else {
                        toastr.error('保存失败！');
                    }
                }
            });
        })
    });

    // 客户选择
    function customerSelect() {
        // 打开选择客户modal
        $("#selectCustomerModal").modal("show");
        $('#customerSelectBody').load('${ctx}/customer/customer', function(e) {

        });
    }

    //选择客户后的回调方法
    function setSelectedCustomer(customerId, customerName) {
        $opportunityPanel.find('.customer-id').val(customerId);
        $opportunityPanel.find('.customer-select').val(customerName);
    }

    // 营销活动选择
    function campaignSelect() {
        // 打开选择产品modal
        $("#selectCampaignModal").modal("show");
        $('#campaignSelectBody').load('${ctx}/campaign/campaign', function(e) {

        });
    }

    //选择营销活动后的回调方法
    function setSelectedCampaign(customerId, customerName) {
        $opportunityPanel.find('.campaign-id').val(customerId);
        $opportunityPanel.find('.campaign-select').val(customerName);
    }

    // 初始负责人
    function initOpportunityUser() {
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

    // 初始化销售机会状态
    function initOpportunityStatus() {
        var statusValue = $("#statusCode").val();
        if (statusValue != "") {
            $("#status").val(statusValue);
        }
    }

    // 初始化销售机会来源 
    function initOpportunityResource() {
        var resourceValue = $("#resourceCode").val();
        if (resourceValue != "") {
            $("#resource").val(resourceValue);
        }
    }

    //取消编辑按钮
    function cancelOpportunity() {
        loadContent("opportunity/list");
    }
</script>

