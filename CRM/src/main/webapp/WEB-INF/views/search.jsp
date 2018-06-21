<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 营销活动列表 -->
<c:if test="${campaignList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">营销活动搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>营销活动编号</th>
					<th>营销活动名称</th>
					<th>产品名称</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${campaignList }" var="campaign">
					<tr>
						<td>${campaign.code }</td>
						<td>${campaign.name }</td>
						<td>${campaign.product.name }</td>
						<td>${campaign.status.name }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('campaign',${campaign.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'campaign',${campaign.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<!-- 潜在客户列表 -->
<c:if test="${prospectiveList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">潜在客户搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>潜在客户编号</th>
					<th>姓名</th>
					<th>手机</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${prospectiveList }" var="prospective">
					<tr>
						<td>${prospective.code }</td>
						<td>${prospective.name }</td>
						<td>${prospective.mobile }</td>
						<td>${prospective.status.name }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('prospective',${prospective.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'prospective',${prospective.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<!-- 客户列表 -->
<c:if test="${customerList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">客户搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>客户账号</th>
					<th>姓名</th>
					<th>手机</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customerList }" var="customer">
					<tr>
						<td>${customer.account }</td>
						<td>${customer.name }</td>
						<td>${customer.mobile }</td>
						<td>${customer.status.name }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('customer',${customer.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'customer',${customer.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<!-- 联系人列表 -->
<c:if test="${contactList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">联系人搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>联系人编号</th>
					<th>姓名</th>
					<th>手机</th>
					<th>邮箱</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${contactList }" var="contact">
					<tr>
						<td>${contact.code }</td>
						<td>${contact.name }</td>
						<td>${contact.phone }</td>
						<td>${contact.email }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('contact',${contact.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'contact',${contact.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<!-- 销售机会列表 -->
<c:if test="${opportunityList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">销售机会搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>销售机会编号</th>
					<th>名称</th>
					<th>销售阶段</th>
					<th>客户来源</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${opportunityList }" var="opportunity">
					<tr>
						<td>${opportunity.code }</td>
						<td>${opportunity.name }</td>
						<td>${opportunity.status.name }</td>
						<td>${opportunity.resource.name }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('opportunity',${opportunity.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'opportunity',${opportunity.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<!-- 报价单列表 -->
<c:if test="${quotationList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">报价单搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>报价单编号</th>
					<th>标题</th>
					<th>客户名称</th>
					<th>销售机会名称</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${quotationList }" var="quotation">
					<tr>
						<td>${quotation.code }</td>
						<td>${quotation.title }</td>
						<td>${quotation.customer.name }</td>
						<td>${quotation.opportunity.name }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('quotation',${quotation.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'quotation',${quotation.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<!-- 销售订单列表 -->
<c:if test="${salesOrderList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">销售订单搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>销售订单编号</th>
					<th>主题</th>
					<th>客户名称</th>
					<th>销售机会名称</th>
					<th>报价单名称</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${salesOrderList }" var="salesOrder">
					<tr>
						<td>${salesOrder.code }</td>
						<td>${salesOrder.theme }</td>
						<td>${salesOrder.customer.name }</td>
						<td>${salesOrder.opportunity.name }</td>
						<td>${salesOrder.quotation.title }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('salesOrder',${salesOrder.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'salesOrder',${salesOrder.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<!-- 问题单列表 -->
<c:if test="${issueList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">问题单搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>问题单编号</th>
					<th>标题</th>
					<th>联系人名称</th>
					<th>产品名称</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${issueList }" var="issue">
					<tr>
						<td>${issue.code }</td>
						<td>${issue.title }</td>
						<td>${issue.contact.name }</td>
						<td>${issue.product.name }</td>
						<td>${issue.status.name }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('issue',${issue.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'issue',${issue.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<!-- 常见问题列表 -->
<c:if test="${problemList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">常见问题搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>常见问题编号</th>
					<th>问题</th>
					<th>产品名称</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${problemList }" var="problem">
					<tr>
						<td>${problem.code }</td>
						<td>${problem.problem }</td>
						<td>${problem.product.name }</td>
						<td>${problem.status.name }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('problem',${problem.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'problem',${problem.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<!-- 产品列表 -->
<c:if test="${productList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">产品搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>产品编号</th>
					<th>名称</th>
					<th>价格</th>
					<th>库存</th>
					<th>图片</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${productList }" var="product">
					<tr>
						<td>${product.code }</td>
						<td>${product.name }</td>
						<td>${product.price }</td>
						<td>${product.inventory }</td>
						<td><img style="width: 50px; height: 50px;" src="${imagePath }${product.picture }"></td>
						<td>${product.status.name }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('product',${product.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'product',${product.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<!-- 供应商列表 -->
<c:if test="${supplierList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">供应商搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>供应商编号</th>
					<th>名称</th>
					<th>电话</th>
					<th>邮箱</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${supplierList }" var="supplier">
					<tr>
						<td>${supplier.code }</td>
						<td>${supplier.name }</td>
						<td>${supplier.mobile }</td>
						<td>${supplier.email }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('supplier',${supplier.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'supplier',${supplier.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<!-- 采购订单列表 -->
<c:if test="${purchaseOrderList.size() != 0 }">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">采购订单搜索结果</h3>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>采购订单编号</th>
					<th>主题</th>
					<th>厂商名称</th>
					<th>联系人名称</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${purchaseOrderList }" var="purchase">
					<tr>
						<td>${purchase.code }</td>
						<td>${purchase.theme }</td>
						<td>${purchase.supplier.name }</td>
						<td>${purchase.contactName }</td>
						<td>${purchase.status.name }</td>
						<td>
							<button title="修改" class="btn btn-primary btn-xs" onclick="goEdit('purchaseOrder',${purchase.id })">
								<i class="fa fa-pencil"></i>
							</button>
							<button title="删除" class="btn btn-danger btn-xs" onclick="doDelete(this,'purchaseOrder',${purchase.id })">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>

<script type="text/javascript">
// 编辑操作
function goEdit(url,id){
    loadContent(url+"/form/" + id);
}

// 删除操作
function doDelete(self,url,id){
	$.confirm({
		title : false,
		content : '是否确认删除该条数据？',
		confirmButton : '确认',
		cancelButton : '取消',
		confirm : function() {
			// 执行删除
			$.ajax({
				type : "post",
				async : false,
				url : url+'/delete/'+id,
				data : {
					
				},
				dataType : "json",
				success : function(result) {
					// 如果返回的状态是-1表示该删除删除的时候被引用
					if(result.status == -1){
						toastr.error('该数据已被引用,不能删除！');
						return;
					}
					// 页面上刪除数据
					$(self).parent().parent().remove();
					toastr.success('删除成功！');
				}
			});
		},
		cancel : function() {
			
		}
	});
}
</script>
