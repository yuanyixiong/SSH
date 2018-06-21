<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
<!-- EL -->
<a href="javascript:history.go(-1)">添加数据</a>
 
 <table>
 	<thead>
 		<tr>
	 		<th>编号</th>
	 		<th>年龄</th>
	 		<th>姓名</th>
	 		<th>操作</th>
 		</tr>
 	</thead>
 	<tbody>
		<c:forEach items="${list }" var="temp" varStatus="vs">
	 		<tr
	 		  <%-- 
		 		   <c:if test="${vs.index%2==0 }">
		 				style="background-color: red"
		 		   </c:if>
		 		   <c:if test="${vs.index%2==1 }">
		 				style="background-color: green"
		 		   </c:if>
	 		   --%>
	 		>
	 			<td>${temp.id }</td>
	 			<td>${temp.age }</td>
	 			<td>${temp.name }</td>
	 			<td>
					<a href="userAction!delete?userModel.id=${temp.id }">删除</a>
					<a href="userAction!to_edit?userModel.id=${temp.id }">修改</a>
					<a href="userAction!info?userModel.id=${temp.id }">详情</a>
				</td>
	 		</tr>
 		</c:forEach>
 	</tbody>
 	<tfoot></tfoot>
 </table>
  
 	
 
 
</body>
</html>