<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<img src="${ctx}/assets/img/leads_Map.png" border="0" usemap="#planetmap" alt="Planets" />

<map name="planetmap" id="planetmap">
	<!-- 营销活动 -->
	<area shape="rect" coords="10,120,95,240" class="pointer" onclick="loadContent('campaign/list')" />

	<!-- 潜在客户 -->
	<area shape="rect" coords="215,130,295,240" class="pointer" onclick="loadContent('prospective/list')" />

	<!-- 客户 -->
	<area shape="rect" coords="450,0,555,130" class="pointer" onclick="loadContent('customer/list')" />

	<!-- 联系人没有单独列表，因此先进客户列表页面 -->
	<area shape="rect" coords="460,150,545,250" class="pointer" onclick="loadContent('customer/list')" />

	<!-- 销售机会 -->
	<area shape="rect" coords="460,280,555,390" class="pointer" onclick="loadContent('opportunity/list')" />
</map>
