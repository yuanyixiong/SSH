<%--
  Created by IntelliJ IDEA.
  User: yyx
  Date: 2017/12/29
  Time: 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    Student

    <table>
        <tr>
            <td>编号</td>
            <td>姓名</td>
            <td>年龄</td>
            <td>性别</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${objects}" var="temp">
            <tr>
                <td>${temp.id}</td>
                <td>${temp.name}</td>
                <td>${temp.age}</td>
                <td>${temp.sex}</td>
                <td>
                    <a href="http://localhost:80/studentAction!do_delete?object.id=${temp.id}">删除</a>
                    <a href="http://localhost:80/studentAction!to_edit?object.id=${temp.id}">修改</a>
                    <a href="#">查看</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
