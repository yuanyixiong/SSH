<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="widget">
	<header role="heading">
		<h2>编辑潜在客户</h2>
	</header>
	<div role="content">
		<div class="widget-body no-padding">
			<form method="post" id="prospectiveForm" name="prospective" class="smart-form" onSubmit="return false;">
			     <input type="hidden" name="id" value="${prospectiveModel.id }" /> 
			     <input name="createTime" type="hidden" value="${prospectiveModel.createTime }" /> 
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">姓名</label> <label class="input"> 
							     <input name="name" value="${prospectiveModel.name }" type="text" data-rule="required;">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">潜在客户编号</label> <label class="input"> 
							     <input type="text" name="code" value="${prospectiveModel.code }" placeholder="自动生成潜在客户编号" readonly="readonly">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">手机</label> <label class="input"> 
							     <input type="text" name="mobile" value="${prospectiveModel.mobile }" data-rule="required; mobile;">
							</label>
						</section>

						<section class="col col-md-6">
							<label class="label">邮箱</label> <label class="input"> 
							     <input type="text" name="email" value="${prospectiveModel.email }" data-rule="required; email;">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">公司</label> <label class="input"> 
							     <input type="text" name="company" value="${prospectiveModel.company }" data-rule="required;">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">职位</label> <label class="input"> 
							     <input type="text" name="position" value="${prospectiveModel.position }" data-rule="required;">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">潜在客户来源</label> <label class="select"> 
							     <input type="hidden" id="resourceCode" value="${prospectiveModel.resource.code }"> 
								 <select name="resource.code" id="resource">
										<option value="CUSTOMER_Telemarketing">电话营销</option>
										<option value="CUSTOMER_Existing">既有客户</option>
										<option value="CUSTOMER_Emaimarketing">邮件营销</option>
										<option value="CUSTOMER_Other">其他</option>
								  </select> <i></i>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">潜在客户状态</label> <label class="select"> 
							     <input type="hidden" id="statusCode" value="${prospectiveModel.status.code }"> 
							     <select name="status.code" id="status">
										<option value="CUSS_Active">正常合作客户</option>
										<option value="CUSS_Potential">可以发展的潜在客户</option>
										<option value="CUSS_Invalid">无效客户</option>
								</select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">负责人</label> <label class="select">
							     <input type="hidden" id="userCode" value="${prospectiveModel.user.id }">  
							     <select name="user.id" id="user">

							     </select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-12">
							<label class="label">说明信息</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="description" maxlength="1500">${prospectiveModel.description }</textarea>
							</label>
						</section>
					</div>
				</fieldset>
				<footer>
					<button type="submit" name="submit" class="save-prospective-btn btn btn-primary">保存</button>
					<button type="button" class="btn btn-default prospective-cancel">取消</button>
				</footer>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
    $(function() {
        // 初始化负责人
        initProspectiveUser();

        // 初始化问题单状态
        initProspectiveStatus();

        // 初始化优先级
        initCustomerResource();

        // 初始化取消操作
        $('.prospective-cancel').click(function() {
            cancelProspective();
        });

        // 保存潜在客户
        $('.save-prospective-btn').click(function(e) {
            if (!$('#prospectiveForm').isValid()) {
                return false;
            }
            $("#prospectiveForm").ajaxSubmit({
                url : ctx + "/prospective/save",
                type : 'POST',
                success : function(result) {
                    // 如果返回的状态是0表示操作成功
                    if (result.status == 0) {
                        loadContent("prospective/list");
                    } else {
                        toastr.error('保存失败！');
                    }
                }
            });
        })
    });

    // 初始负责人
    function initProspectiveUser() {
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

    // 初始化潜在客户状态
    function initProspectiveStatus() {
        var statusValue = $("#statusCode").val();
        if (statusValue != "") {
            $("#status").val(statusValue);
        }
    }

    // 初始化潜在客户来源 
    function initCustomerResource() {
        var resourceValue = $("#resourceCode").val();
        if (resourceValue != "") {
            $("#resource").val(resourceValue);
        }
    }

    //取消编辑按钮
    function cancelProspective() {
        loadContent("prospective/list");
    }
</script>

