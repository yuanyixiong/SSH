<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="smart-form no-padding">
	<!-- 四个基本信息 -->
	<div class="row">
		<section class="col col-md-3">
			<div class="mini-stat clearfix">
				<span class="mini-stat-icon orange"><i class="fa fa-user"></i></span>
				<div class="mini-stat-info">
					<span>${customer }</span> 今天新增客户
				</div>
			</div>
		</section>
		<section class="col col-md-3">
			<div class="mini-stat clearfix">
				<span class="mini-stat-icon tar"><i class="fa fa-group"></i></span>
				<div class="mini-stat-info">
					<span>${customers }</span> 当月新增客户
				</div>
			</div>
		</section>
		<section class="col col-md-3">
			<div class="mini-stat clearfix">
				<span class="mini-stat-icon pink"><i class="fa fa-money"></i></span>
				<div class="mini-stat-info">
					<span>${quantity }</span> 当月产品销量
				</div>
			</div>
		</section>
		<section class="col col-md-3">
			<div class="mini-stat clearfix">
				<span class="mini-stat-icon green"><i class="fa fa-eye"></i></span>
				<div class="mini-stat-info">
					<span>${amount }元</span> 当月产品销售额
				</div>
			</div>
		</section>
	</div>

	<!-- 折线图区域 -->
	<div class="row">
		<section class="col col-md-12">
			<fieldset>
				<canvas id="monthSalesLine" width="850" height="300"></canvas>
			</fieldset>
		</section>
	</div>

	<!-- 柱状图和饼状图区域 -->
	<div class="row ">
		<section class="col col-md-6">
			<fieldset>
				<canvas id="monthSaleProductBar"></canvas>
			</fieldset>
		</section>
		<section class="col col-md-6">
			<fieldset>
				<canvas id="customerNumberPie"></canvas>
			</fieldset>
		</section>
	</div>

	<!-- 地图区域 -->
	<div class="row ">
		<section class="col col-md-12">
			<fieldset>
				<div id="customerMap" class="map-height"></div>
			</fieldset>
		</section>
	</div>
</div>

<script type="text/javascript">
	// 获取折线图竖轴数据
	var getlineValues = function() {
		var value = ${lineValues};
		return value;
	};
	
	// 获取柱状图竖轴数据
	var getBarValues = function() {
		var value = ${barValues};
		return value;
	};
	
	//获取饼图横轴数据
	var getPieNames = function() {
		var name = ${pieNames};
		return name;
	};
	
	//获取饼图竖轴数据
	var getPieValues = function() {
		var value = ${pieValues};
		return value;
	};
	
	// 折线图参数
	var configLine = {
	        type: 'line',
	        data: {
	            labels: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
	            datasets: [{
	                label: "销售额",
	                fillColor : "rgba(151,187,205,0.5)",
	    			strokeColor : "rgba(151,187,205,1)",
	    			pointColor : "rgba(151,187,205,1)",
	    			pointStrokeColor : "#fff",
	                data: getlineValues(),
	                fill: true,
	                borderDash: [5, 5],
	            }]
	        },
	        options: {
	            responsive: true,
	            tooltips: {
	                mode: 'label',
	                callbacks: {
	                    
	                }
	            },
	            hover: {
	                mode: 'dataset'
	            },
	            title: {
	                display: true,
	                text: '每月销售额统计'
	            }
	        }
	    };
	
	//柱状图参数
	var configBar = {
		     type: 'bar',
		     data: {
		         labels: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
		         datasets: [{
		         	label: '销售产品数量',
		            backgroundColor: "rgba(151,187,205,1)",
		            data: getBarValues()
		         }]
		     },
		     options: {
	             responsive: true,
	             legend: {
	                 position: 'top',
	             },
	             title: {
	                 display: true,
	                 text: '每月销售产品数量统计'
	             }
	         },
		 };
	
	//饼图参数
	var configPie = {
	     type: 'pie',
	     data: {
	         datasets: [{
	             data: getPieValues(),
	             backgroundColor: [
	                 "#F7464A",
	                 "#46BFBD",
	                 "#FDB45C",
	                 "#949FB1",
	                 "#4D5360",
	                 "#FF906F",
	                 "#9AFF02",
	             ],
	         }],
	         labels: getPieNames()
	     },
	     options: {
	         responsive: true,
	         title: {
	             display: true,
	             text: '区域客户数量统计'
	         }
	     },
	 };
	
	// 初始化
	$(function() {
	     // 柱状图
	     var ctxbar = document.getElementById("monthSaleProductBar").getContext("2d");
	     window.myBar = new Chart(ctxbar, configBar);
	     
	     // 饼图
	     var ctxPie = document.getElementById("customerNumberPie").getContext("2d");
	     window.myPie = new Chart(ctxPie, configPie);
	     
	  	 // 折线图
		 var ctxline = document.getElementById("monthSalesLine").getContext("2d");
	     window.myLine = new Chart(ctxline, configLine);
	     
	     // 地图从后台获取数据源
	     var data = [
	         ${data}
	     ];
	
	     $('#customerMap').highcharts('Map', {
	         title : {
	             text : '客户地区分布'
	         },
	         subtitle : {
	             text : '地区分布'
	         },
	         // 缩放按钮
	         mapNavigation: {
	             enabled: true,
	             enableDoubleClickZoomTo: true
	         },
	         colorAxis: {
	             min: 0
	         },
	         // 地图的连线图主要是通过Highcharts.map读取china-data.js的数据来实现地图连线构造地图模型
	         series : [{
	             data : data,
	             mapData: Highcharts.maps['countries/china'],
	             joinBy: 'hc-key',
	             name: '客户地区分布',
	             states: {
	                 hover: {
	                     color: '#BADA55'
	                 }
	             },
	             dataLabels: {
	                 enabled: true,
	                 format: '{point.name}'
	             }
	         }]
	     });
	});
 
</script>
