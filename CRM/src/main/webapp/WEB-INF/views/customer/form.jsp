<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="widget">
	<header role="heading">
		<h2>编辑客户</h2>
	</header>
	<div role="content">
		<div class="widget-body no-padding">
			<form id="customerForm" action="customer/save" novalidate="novalidate" method="post" class="smart-form">
			     <input name="id" type="hidden" value="${customerModel.id }" /> 
			     <input name="createTime" type="hidden" value="${customerModel.createTime }" />
			     <input name="status.code" type="hidden" value="${customerModel.status.code }" /> 
			     <input id="regionId" type="hidden" value="${customerModel.region.id }" /> 
                <input id="proCode" type="hidden" value="${customerModel.province.code }" /> 
                <input id="cityCode" type="hidden" value="${customerModel.city.code }" /> 
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">客户名称:</label> <label class="input"> <i class="icon-append fa fa-user"></i> 
							     <input name="name" type="text" value="${customerModel.name }" data-rule="required" maxlength="100" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">账号</label> <label class="input"> 
							     <input type="text" name="code" value="${customerModel.account }" placeholder="自动生成" readonly="readonly">
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">公司名称:</label> <label class="input"> 
							     <input name="company" type="text" value="${customerModel.company }" data-rule="required" maxlength="200" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">是否是VIP:</label>
							<div class="inline-group">
								<label class="radio"> <input name="isVIP" value="0" checked="checked" type="radio"> <i></i> 否
								</label> <label class="radio"> <input name="isVIP" value="1" type="radio"> <i></i> 是
								</label>
							</div>
						</section>
					</div>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">电话:</label> <label class="input"> 
							     <input name="mobile" type="text" value="${customerModel.mobile }" data-rule="required;mobile;" maxlength="100" />
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">邮箱:</label> <label class="input"> 
							     <input name="email" type="text" value="${customerModel.email }" data-rule="required;email;" maxlength="100" />
							</label>
						</section>
					</div>
					<div class="row">
						<section class="col col-md-12">
							<label class="label">客户地址:</label> <label class="input"> 
							     <input name="address" type="text" value="${customerModel.address }" data-rule="required" maxlength="100" />
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">负责人</label> <label class="select"> 
							     <input type="hidden" id="userCode" value="${customerModel.owner.id }"> 
							     <select name="owner.id" id="user">

							     </select> <i></i>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">区域:</label> <label class="select"> 
							     <select name="region.id" id="region">

							     </select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">省份:</label> <label class="select"> 
								<select name="province.code" id="province" onchange="getCity(this.value)">
	
								</select> <i></i>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">城市:</label> <label class="select"> 
								<select name="city.code" id="city">
	
								</select> <i></i>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">付款地址</label> <label class="input"> 
							     <textarea class="form-control description" rows="2" name="payAddress" maxlength="1500">${customerModel.payAddress }</textarea>
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">收货地址</label> <label class="input"> 
							     <textarea class="form-control description" rows="2" name="receiveAddress" maxlength="1500">${customerModel.receiveAddress }</textarea>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-12">
							<label class="label">描述</label> <label class="input"> 
							     <textarea class="form-control description" rows="2" name="description" maxlength="1500">${customerModel.description }</textarea>
							</label>
						</section>
					</div>
				</fieldset>
				<footer>
					<button type="button" name="submit" class="btn btn-primary save-customer-btn">保存</button>
					<button type="button" class="btn btn-default customer-cancel">取消</button>
				</footer>
			</form>
		</div>
	</div>
</div>


<script type="text/javascript">
    $(function() {
        // 加载负责人信息
        initCustomerUser();
        // 加载区域信息
        initCustomerRegion();
        // 加载省份信息
        initCustomerProvince($("#proCode").val(), $("#cityCode").val());
        // 初始化保存按钮
        $('.save-customer-btn').click(function(e) {
            saveCustomer();
        })
        // 初始化取消按钮
        $('.customer-cancel').click(function(e) {
            cancelCustomer();
        })
    });

    // 初始负责人
    function initCustomerUser() {
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

    // 初始化地区信息
    function initCustomerRegion() {
        var url = "region/list/data";
        $.post(url, function(result) {
            // 如果返回的結果不是null
            if (null != result) {
                var content = "";
                $.each(result.data, function(i, item) {
                    content += "<option  value='"
							+ item.id
							+ "'>" + item.name + "</option>";
                });
                $('#region').append(content);
                // 修改设置选中
                var regionId = $("#regionId").val();
                // 如果区域id不为空，设置区域选中
                if ("" != regionId) {
                    $('#region').val(regionId);
                }
            } else {
                toastr.error('获取区域列表失败!');
            }
        });
    }

    // 初始化省份信息
    function initCustomerProvince(proCode, cityCode) {
        var url = "province/list/data";
        $.post(url, function(result) {
            if (null != result) {
                var content = "";
                if ("" != proCode) {
                    $.each(result.data, function(i, item) {
                        content += "<option  value='"
								+ item.code
								+ "'>" + item.name + "</option>";
                    });
                    getCity(proCode);
                    $('#city').val(cityCode);
                } else {
                    $.each(result.data, function(i, item) {
                        content += "<option  value='"
								+ item.code
								+ "'>" + item.name + "</option>";
                        // 加载第一个省份的城市信息
                        if (i == 0) {
                            getCity(item.code);
                        }
                    });
                }
                $('#province').append(content);
                // 如果省份编码不是0设置省份选中
                if (proCode != 0) {
                    $('#province').val(proCode);
                }
            } else {
                toastr.error('获取省份列表失败!');
            }
        });
    }

    //加载城市信息
    function getCity(proCode) {
        $("#city").find("option").remove();
        var url = "city/list/data";
        $.post(url, {
            proCode : proCode
        }, function(result) {
            // 如果返回的结果不是null加载选择框城市数据
            if (null != result) {
                var content = "";
                $.each(result.data, function(i, item) {
                    content += "<option  value='"
							+ item.code
							+ "'>" + item.name + "</option>";
                });
                $('#city').append(content);
            } else {
                toastr.error('获取城市列表失败!');
            }
        });
    }

    // 保存客户信息
    function saveCustomer() {
        // 如果校验不通过
        if (!$('#customerForm').isValid()) {
            return false;
        }
        $("#customerForm").ajaxSubmit({
            url : "customer/save",
            dataType : "json",
            data : {

            },
            success : function(result) {
                // 如果返回状态是0表示操作成功
                if (result.status == 0) {
                    loadContent("customer/list");
                } else {
                    toastr.error('保存失败！');
                }
            }
        });
    }

    //取消编辑按钮
    function cancelCustomer() {
        loadContent("customer/list");
    }
</script>
