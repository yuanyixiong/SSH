<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- excel导出编辑窗口 -->
<div class="modal fade" id="exportModal" tabindex="-1" department="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">导出客户</h4>
			</div>
			<div class="modal-body">
				<label>导出文件名称:</label><input type="text" class="file form-control" maxlength="100" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="save btn btn-primary">确定</button>
			</div>
		</div>
	</div>
</div>

<!-- 潜在客户列表区域 -->
<c:if test="${prospectiveList.size() != 0 }">
	<button class="excel-customer-btn btn btn-primary" type="button">
		<i class="fa fa-folder-open-o"></i> 导出
	</button>
	<div class="panel panel-success statics">
		<div class="panel-heading">
			<h3 class="panel-title">潜在客户列表</h3>
		</div>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>潜在客户编号</th>
					<th>姓名</th>
					<th>手机</th>
					<th>来源</th>
					<th>状态</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${prospectiveList }" var="prospective">
					<tr>
						<td>${prospective.code }</td>
						<td>${prospective.name }</td>
						<td>${prospective.mobile }</td>
						<td>${prospective.resource.name }</td>
						<td>${prospective.status.name }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</c:if>
<div class="smart-form">
	<!-- 折线图区域 -->
	<fieldset>
		<div class="row">
			<section class="col col-md-6">
				<canvas id="canvasline" width="850" height="300"></canvas>
			</section>
			<section class="col col-md-6">
				<fieldset>
					<canvas id="canvasbar"></canvas>
				</fieldset>
			</section>
		</div>
	</fieldset>

</div>

<script type="text/javascript">
    // 获取折线图竖轴数据
    var getlineValues = function() {
        var value = eval('${lineValues}');
        return value;
    };

    // 获取柱状图竖轴数据
    var getBarValues = function() {
        var value = eval('${barValues}');
        return value;
    };

    // 折线图参数
    var configLine = {
        type : 'line',
        data : {
            labels : [ "电话营销", "既有客户", "邮件营销", "其他" ],
            datasets : [ {
                label : "潜在客户来源",
                fillColor : "rgba(151,187,205,0.5)",
                strokeColor : "rgba(151,187,205,1)",
                pointColor : "rgba(151,187,205,1)",
                pointStrokeColor : "#fff",
                data : getlineValues(),
                fill : true,
                borderDash : [ 5, 5 ],
            } ]
        },
        options : {
            responsive : true,
            tooltips : {
                mode : 'label',
                callbacks : {

                }
            },
            hover : {
                mode : 'dataset'
            },
            title : {
                display : true,
                text : '潜在客户来源统计'
            }
        }
    };

    //柱状图参数
    var configBar = {
        type : 'bar',
        data : {
            labels : [ "电话营销", "既有客户", "邮件营销", "其他" ],
            datasets : [ {
                label : '潜在客户来源',
                backgroundColor : "rgba(151,187,205,1)",
                data : getBarValues()
            } ]
        },
        options : {
            responsive : true,
            legend : {
                position : 'top',
            },
            title : {
                display : true,
                text : '潜在客户来源统计'
            }
        },
    };

    // 初始化
    $(function() {
        // 柱状图
        var ctxbar = document.getElementById("canvasbar").getContext("2d");
        window.myBar = new Chart(ctxbar, configBar);

        // 折线图
        var ctxline = document.getElementById("canvasline").getContext("2d");
        window.myLine = new Chart(ctxline, configLine);

        var $exportModal = $("#exportModal");
        // 初始化导出excel按钮
        $('.excel-customer-btn').click(function() {
            $exportModal.modal("show");
        });

        // 导出保存按钮
        $exportModal.find('.save').click(function() {
            // 关闭导出文件modal
            $exportModal.modal("hide");
            // 获取导出文件名称
            var fileName = $exportModal.find('.file').val();
            window.location.href = "${ctx}/statistics/doExport/" + fileName;
        });
    });
</script>
