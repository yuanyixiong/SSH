<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 选择产品窗口 -->
<div class="modal fade" id="selectProductModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="productSelectBody" class="modal-content"></div>
	</div>
</div>

<div class="widget">
	<header role="heading">
		<h2>编辑营销活动</h2>
	</header>
	<div role="content">
		<div id="campaignPanel" class="widget-body no-padding">
			<form method="post" id="campaignForm" name="campaign" class="smart-form" onSubmit="return false;">
			     <input type="hidden" name="id" value="${campaignModel.id }" /> 
			     <input name="createTime" type="hidden" value="${campaignModel.createTime }" />
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">营销活动名称</label> <label class="input">
							     <input name="name" value="${campaignModel.name }" type="text" data-rule="required;">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">营销活动编号</label> <label class="input">
							     <input type="text" name="code" value="${campaignModel.code }" placeholder="自动生成营销活动编号" readonly="readonly">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">负责人</label> <label class="select"> 
							     <input type="hidden" id="userCode" value="${campaignModel.user.id }"> 
							     <select name="user.id" id="user">

							     </select> <i></i>
							</label>
						</section>

						<section class="col col-md-6">
							<label class="label">营销活动状态</label> <label class="select"> 
							     <input type="hidden" id="statusCode" value="${campaignModel.status.code }"> 
							     <select name="status.code" id="status">
										<option value="CAMPAIGN_Planing">计划中</option>
										<option value="CAMPAIGN_Started">启用</option>
										<option value="CAMPAIGN_Stoped">停用</option>
										<option value="CAMPAIGN_Finished">已完成</option>
										<option value="CAMPAIGN_canceled">取消</option>
								</select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">营销活动类型</label> <label class="select"> 
							     <input type="hidden" id="typeCode" value="${campaignModel.type.code }"> 
							     <select name="type.code" id="type">
										<option value="CAMPAIGN_Workshop">研讨会</option>
										<option value="CAMPAIGN_Net">网络发表会</option>
										<option value="CAMPAIGN_Email">电子邮件</option>
										<option value="CAMPAIGN_Telemarketing">电话营销</option>
										<option value="CAMPAIGN_Other">其他</option>
								</select> <i></i>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">选择产品</label> <label class="input"> 
							     <input class="product-id" name="product.id" value="${campaignModel.product.id }" type="hidden" /> 
							     <input class="product-select" name="productName" readonly="readonly" value="${campaignModel.product.name }" type="text" data-rule="required" maxlength="100" placeholder="点击选择产品" />
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">发送数量</label> <label class="input"> 
							     <input type="text" name="quantity" value="${campaignModel.quantity }" data-rule="required; integer; range[0~2147483647];">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">预计结束日期:</label> <label class="input"> 
							     <input readonly="readonly" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="endDate" value="${campaignModel.endDate }" data-rule="required">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-12">
							<label class="label">说明信息</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="instruction" maxlength="1500">${campaignModel.instruction }</textarea>
							</label>
						</section>
					</div>
				</fieldset>
				<footer>
					<button type="submit" name="submit" class="save-campaign-btn btn btn-primary">保存</button>
					<button type="button" class="btn btn-default campaign-cancel">取消</button>
				</footer>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
    var $campaignPanel;
    $(function() {
        $campaignPanel = $("#campaignPanel");
        // 产品选择操作
        $campaignPanel.find('.product-select').click(function() {
            productSelect();
        });

        // 初始化负责人
        initCampaignUser();

        // 初始化问题单状态
        initCampaignStatus();

        // 初始化优先级
        initCampaignType();

        // 初始化取消操作
        $campaignPanel.find('.campaign-cancel').click(function() {
            cancelCampaign();
        });

        // 保存营销活动
        $('.save-campaign-btn').click(function(e) {
            if (!$('#campaignForm').isValid()) {
                return false;
            }
            $("#campaignForm").ajaxSubmit({
                url : ctx + "/campaign/save",
                type : 'POST',
                success : function(result) {
                    // 如果返回的状态是0表示操作成功
                    if (result.status == 0) {
                        loadContent("campaign/list");
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

        });
    }
    
    //选择产品后的回调方法
    function setSelectedProduct(productId, productName) {
        $campaignPanel.find('.product-id').val(productId);
        $campaignPanel.find('.product-select').val(productName);
    }

    // 初始负责人
    function initCampaignUser() {
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
                // 设置选中用户
                var userValue = $("#userCode").val();
                if (userValue != "") {
                    $("#user").val(userValue);
                }
                $('#user').append(content);
            } else {
                toastr.error('获取负责人失败！');
            }
        });
    }

    // 初始化营销活动状态
    function initCampaignStatus() {
        var statusValue = $("#statusCode").val();
        if (statusValue != "") {
            $("#status").val(statusValue);
        }
    }

    // 初始化营销活动类型
    function initCampaignType() {
        var typeValue = $("#typeCode").val();
        if (typeValue != "") {
            $("#type").val(typeValue);
        }
    }

    //取消编辑按钮
    function cancelCampaign() {
        loadContent("campaign/list");
    }
</script>

