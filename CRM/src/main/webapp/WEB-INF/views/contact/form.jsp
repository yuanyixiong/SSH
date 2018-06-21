<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="widget">
	<header role="heading">
		<h2>编辑联系人</h2>
	</header>
	<div id="contactBoy" role="content">
		<div class="widget-body no-padding">
			<form id="contactForm" action="contact/save" method="post" class="smart-form">
			     <input name="id" type="hidden" value="${contactModel.id }" /> 
			     <input name="customer.id" type="hidden" value="${contactModel.customer.id }" />
			     <input name="createTime" type="hidden" value="${contactModel.createTime }" />  
			     <input type="hidden" id="gender" value="${contactModel.gender }" />
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">联系人名称:</label> <label class="input"> <i class="icon-append fa fa-user"></i> 
								<input name="name" type="text" value="${contactModel.name }" data-rule="required" maxlength="100" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">联系人编号</label> <label class="input"> 
							     <input type="text" name="code" value="${contactModel.code }" placeholder="自动生成联系人编号" readonly="readonly">
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">性别:</label>
							<div class="inline-group">
								<label class="radio"> <input name="gender" value="男" checked="checked" type="radio"> <i></i> 男
								</label> <label class="radio"> <input name="gender" value="女" type="radio"> <i></i> 女
								</label>
							</div>
						</section>
						<section class="col col-md-6">
							<label class="label">邮箱:</label> <label class="input"> 
							     <input name="email" type="text" value="${contactModel.email }" data-rule="required;email;" maxlength="100" />
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">生日:</label> <label class="input"> 
							     <input readonly="readonly" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="birthday" value="${contactModel.birthday }" data-rule="required">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">手机:</label> <label class="input"> 
							     <input name="phone" type="text" value="${contactModel.phone }" data-rule="required;mobile;" maxlength="11" /> <i></i>
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">职位:</label> <label class="input"> 
							     <input name="position" type="text" value="${contactModel.position }" data-rule="required" maxlength="100" /> <i></i>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">地址:</label> <label class="input"> 
							     <input name="address" type="text" value="${contactModel.address }" data-rule="required" maxlength="100" />
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">负责人</label> <label class="select"> 
							     <input type="hidden" id="userCode" value="${contactModel.user.id }"> 
							     <select name="user.id" id="user">

							     </select> <i></i>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">客户来源</label> <label class="select"> 
							     <input type="hidden" id="resourceCode" value="${contactModel.resource.code }"> 
							     <select name="resource.code" id="resource">
										<option value="CUSTOMER_Telemarketing">电话营销</option>
										<option value="CUSTOMER_Existing">既有客户</option>
										<option value="CUSTOMER_Emaimarketing">邮件营销</option>
										<option value="CUSTOMER_Other">其他</option>
								</select> <i></i>
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-md-12">
							<label class="label">描述</label> <label class="input"> 
							     <textarea class="form-control description" rows="5" name="description" maxlength="1500">${contactModel.description }</textarea>
							</label>
						</section>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="contact-cancel btn btn-default ">取消</button>
			<button type="button" class="contact-save btn btn-primary">保存</button>
		</div>
	</div>
</div>


<script type="text/javascript">
    $(function() {
        // 初始化性别信息
        initContactSex();

        // 初始化负责人
        initContactUser();

        // 初始化客户来源
        initCustomerResource();

        // 初始化保存操作
        $("#contactBoy").find('.contact-save').click(function() {
            saveContact();
        });

        // 初始化取消操作
        $("#contactBoy").find('.contact-cancel').click(function() {
            cancelContact();
        });
    });

    // 初始化性别信息
    function initContactSex() {
        var genderObj = $('input[name="gender"]');
        // 设置选择的性别选中
        for (var i = 0; i < genderObj.length; i++) {
            if (genderObj[i].value == $("#gender").val()) {
                genderObj[i].checked = true;
            }
        }
    }

    // 初始负责人
    function initContactUser() {
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

    // 初始化客户来源
    function initCustomerResource() {
        var resourceValue = $("#resourceCode").val();
        if (resourceValue != "") {
            $("#resource").val(resourceValue);
        }
    }

    //保存联系人
    function saveContact() {
        // 如果校验不通过
        if (!$('#contactForm').isValid()) {
            return false;
        }
        // 校验通过提交联系人信息
        $("#contactForm").ajaxSubmit({
            url : "contact/save",
            dataType : "json",
            data : {

            },
            success : function(result) {
                // 如果返回的状态是0表示操作成功
                if (result.status == 0) {
                    loadContent("customer/list");
                } else {
                    toastr.error('保存失败！');
                }
            }
        });
    }

    // 取消编辑按钮
    function cancelContact() {
        loadContent("customer/list");
    }
</script>