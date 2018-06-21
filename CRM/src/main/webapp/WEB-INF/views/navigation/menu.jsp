<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<table class="nav-table">
	<tr>
		<td class="nav-td">
			<ul>
				<!-- 首页 -->
				<li class="">
					<a href="JavaScript:loadContent('dashboard')" title="Dashboard"> <i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">统计分析</span>
					</a>
				</li>
				<!-- 其他菜单模块 -->
				<c:forEach var="topMenu" items="${userMenus}" begin="0" end="2" step="1">
					<!-- 一级菜单 -->
					<li class="sub-menu">
						<a> <i class="${topMenu.icon }"></i> <span class="menu-item-parent">${topMenu.name }</span>
						</a>
						<!-- 二级菜单 -->
						<ul class="sub">
							<c:forEach var="subMenu" items="${topMenu.children}">
								<li>
									<a href="JavaScript:loadContent('${subMenu.url }')">${subMenu.name}</a>
								</li>
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</td>
		<td class="nav-menu">
			<ul>
				<!-- 其他菜单模块 -->
				<c:forEach var="topMenu" items="${userMenus}" begin="3" step="1">
					<!-- 一级菜单 -->
					<li class="sub-menu">
						<a> <i class="${topMenu.icon }"></i> <span class="menu-item-parent">${topMenu.name }</span>
						</a>
						<!-- 二级菜单 -->
						<ul class="sub">
							<c:forEach var="subMenu" items="${topMenu.children}">
								<li>
									<a href="JavaScript:loadContent('${subMenu.url }')">${subMenu.name}</a>
								</li>
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</td>
	</tr>
</table>


