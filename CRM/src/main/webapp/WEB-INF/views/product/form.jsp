<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 选择供应商窗口 -->
<div class="modal fade" id="selectSupplierModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog modal-product">
		<div id="supplierSelectBody" class="modal-content"></div>
	</div>
</div>

<div class="widget">
	<header role="heading">
		<h2>编辑产品</h2>
	</header>
	<div role="content">
		<div id="productPanel" class="widget-body no-padding">
			<form method="post" id="productForm" name="product" class="smart-form" enctype="multipart/form-data" onSubmit="return false;">
			     <input type="hidden" name="id" value="${productModel.id }" /> 
			     <input name="createTime" type="hidden" value="${productModel.createTime }" /> 
			     <input type="hidden" name="picture" value="${productModel.picture }"> 
			     <input type="hidden" id="categoryId" value="${productModel.category.id }"> 
				<fieldset>
					<div class="row">
						<section class="col col-md-6">
							<label class="label">产品名称</label> <label class="input"> 
							     <input name="name" value="${productModel.name }" type="text" data-rule="required;">
							</label>
						</section>
						<section class="col col-md-6">
							<label class="label">产品编号</label> <label class="input"> 
							     <input type="text" name="code" value="${productModel.code }" placeholder="自动生成产品编号" readonly="readonly">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">类别</label> <label class="select"> 
								<select name="category.id" id="category">
	
								</select> <i></i>
							</label>
						</section>

						<section class="col col-md-6">
							<label class="label">选择供应商:</label> <label class="input"> 
							     <input class="supplier-id" name="supplier.id" value="${productModel.supplier.id }" type="hidden" /> 
							     <input class="supplier-select" name="supplierName" readonly="readonly" value="${productModel.supplier.name }" type="text" data-rule="required" maxlength="100" />
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">价格</label> <label class="input"> 
							     <input type="text" name="price" value="${productModel.price }" data-rule="required; range[0.0~1000000.0];">
							</label>
						</section>

						<section class="col col-md-6">
							<label class="label">库存</label> <label class="input"> 
							     <input type="text" name="inventory" value="${productModel.inventory }" data-rule="required; integer; range[0~2147483647];">
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-6">
							<label class="label">图片</label> <label> 
							     <input type="file" name="file" id="mainImage" style="display: none;" value="${productModel.picture }" /> 
							     <a href="javascript:void(0);" onclick="selectProductImage()"> <img id="mainPicture" class="product-img" <c:if test='${productModel.picture != null }'>src="${ctx}/${imagePath}${productModel.picture }"</c:if>
									<c:if test='${productModel.picture == null }'>src="${ctx}/assets/img/add.png"</c:if> border="1" />
							     </a> 
							     <input type="hidden" id="picSpan" data-rule="required;" value="${ctx}/${imagePath}${productModel.picture }" /> 
							     <span class="msg-box n-right pic-tip" for="picSpan"></span> <span class="span-red">*</span>
							</label>
						</section>
					</div>

					<div class="row">
						<section class="col col-md-12">
							<label class="label">描述</label> <label class="input"> 
							     <textarea class="form-control description" rows="3" name="description" maxlength="1500">${productModel.description }</textarea>
							</label>
						</section>
					</div>
				</fieldset>
				<footer>
					<button type="submit" name="submit" class="save-product-btn btn btn-primary">保存</button>
					<button type="button" class="btn btn-default product-cancel">取消</button>
				</footer>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
    var $productPanel;
    $(function() {
        $productPanel = $("#productPanel");
        // 供应商选择操作
        $productPanel.find('.supplier-select').click(function() {
            supplierSelect();
        });

        //初始化产品类别
        initProductCategory();

        //套图主图预览
        $("#mainImage").uploadPreview({
            Img : "mainPicture",
            Width : 150,
            Height : 120
        });

        // 重新选择图片
        $('#mainImage').change(function() {
            if (null == $('#mainImage').val() || $('#mainImage').val() == '') {
                $('#picSpan').val('');
                $('#mainPicture').attr('src', 'static/images/add.png');
            } else {
                $('#picSpan').val('0');
            }
        });

        // 初始化取消操作
        $productPanel.find('.product-cancel').click(function() {
            cancelProduct();
        });

        // 保存产品
        $('.save-product-btn').click(function(e) {
            if (!$('#productForm').isValid()) {
                return false;
            }
            $("#productForm").ajaxSubmit({
                url : ctx + "/product/save",
                type : 'POST',
                success : function(result) {
                    // 如果返回的状态是0表示操作成功
                    if (result.status == 0) {
                        loadContent("product/list");
                    } else {
                        toastr.error('保存失败！');
                    }
                }
            });
        })
    });

    // 供应商选择
    function supplierSelect() {
        // 打开选择客户modal
        $("#selectSupplierModal").modal("show");
        $('#supplierSelectBody').load('${ctx}/supplier/supplier', function(e) {

        });
    }

    //选择供应商的回调方法
    function setSelectedSupplier(supplierId,supplierName) {
        $productPanel.find('.supplier-id').val(supplierId);
        $productPanel.find('.supplier-select').val(supplierName);
    }
    
    //点击选择图片
    function selectProductImage() {
        // a标签绑定onclick事件
        $('#mainImage').click();
    }

    //初始化产品类别
    function initProductCategory() {
        var url = "category/list/data";
        $.post(url, function(result) {
            // 如果返回的结果不是null
            if (null != result) {
                var content = "";
                
                $.each(result.data, function(i, item) {
                    content += "<option  value='"
							+ item.id
							+ "'>" + item.name + "</option>";
                });
                $('#category').append(content);
                
                //编辑时显示当前产品分类
                var categoryId = $("#categoryId").val();
                if (categoryId != "") {
                    $("#category").val(categoryId);
                }
            } else {
                toastr.error('获取产品类别失败！');
            }
        });
    }

    //取消编辑按钮
    function cancelProduct() {
        loadContent("product/list");
    }
</script>

