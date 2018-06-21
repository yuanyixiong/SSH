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
		<h2>编辑常见问答</h2>
	</header>
	<div role="content">
		<div id="problemPanel" class="widget-body no-padding">
			<form method="post" id="problemForm" name="problem" class="smart-form"  onSubmit="return false;">
			     <input type="hidden" name="id" value="${problemModel.id }" /> 
			     <input name="createTime" type="hidden" value="${problemModel.createTime }" /> 
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">选择产品</label> <label class="input">
							     <input class="product-id" name="product.id" type="hidden" value="${problemModel.product.id }"  />
							     <input class="product-select" name="productName" readonly="readonly" value="${problemModel.product.name }" type="text" data-rule="required" maxlength="100" placeholder="点击选择产品" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">常见问答编号</label> <label class="input"> 
							     <input type="text" name="code" value="${problemModel.code }" placeholder="自动生成常见问答编号" readonly="readonly">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">状态</label> <label class="select"> 
							     <input type="hidden" id="statusCode" value="${problemModel.status.code }"> 
							     <select name="status.code" id="status">
										<option value="PROB_Draft">草稿</option>
										<option value="PROB_Reviewed">已审阅</option>
										<option value="PROB_Published">已发布</option>
										<option value="PROB_Expired">过期</option>
								</select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-12">
							<label class="label">问题</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="problem" data-rule="required;" maxlength="1500">${problemModel.problem }</textarea>
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-md-12">
							<label class="label">回答</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="answer" data-rule="required;" maxlength="1500">${problemModel.answer }</textarea>
							</label>
						</section>
					</div>
				</fieldset>
				<footer>
					<button type="submit" name="submit" class="save-problem-btn btn btn-primary">保存</button>
					<button type="button" class="btn btn-default problem-cancel">取消</button>
				</footer>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
    var $problemPanel;
    $(function() {
        $problemPanel = $("#problemPanel");
        // 产品选择操作
        $problemPanel.find('.product-select').click(function() {
            productSelect();
        });

        // 初始化状态
        initProblemStatus();

        // 初始化取消操作
        $problemPanel.find('.problem-cancel').click(function() {
            cancelProblem();
        });

        // 保存常见问答
        $('.save-problem-btn').click(function(e) {
            if (!$('#problemForm').isValid()) {
                return false;
            }
            $("#problemForm").ajaxSubmit({
                url : ctx + "/problem/save",
                type : 'POST',
                success : function(result) {
                    // 如果返回的状态是0表示操作成功
                    if (result.status == 0) {
                        loadContent("problem/list");
                    } else {
                        toastr.error('保存失败！');
                    }
                }
            });
        })
    });

    // 初始化常见问答状态
    function initProblemStatus() {
        var statusValue = $("#statusCode").val();
        if (statusValue != "") {
            $("#status").val(statusValue);
        }
    }

    // 产品选择
    function productSelect() {
        // 打开选择产品modal
        $("#selectProductModal").modal("show");
        $('#productSelectBody').load('${ctx}/product/product', function(e) {

        });
    }

    //选择产品后的回调方法
    function setSelectedProduct(productId, productName) {
        $problemPanel.find('.product-id').val(productId);
        $problemPanel.find('.product-select').val(productId);
    }
    
    //取消编辑按钮
    function cancelProblem() {
        loadContent("problem/list");
    }
</script>

