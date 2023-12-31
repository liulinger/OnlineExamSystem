<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: desha
  Date: 2023/12/18
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>班级管理页面</title>
    <link href="../css/ClassManagement.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- 添加JavaScript代码 -->
    <script>
        function submitClassForm() {
            // 使用jQuery获取表单数据
            var formData = $("#classForm").serialize();

            // 发送AJAX请求
            $.ajax({
                type: "POST",
                url: "class-add", // 替换为你的Servlet URL
                data: formData,
                success: function(response) {
                    // 返回添加结果
                    $("#successMessage1").text(response);
                }
            });
        }
        function submitStudentClassForm() {
            // 使用jQuery获取表单数据
            var formData = $("#studentClassForm").serialize();

            // 发送AJAX请求
            $.ajax({
                type: "POST",
                url: "student-class-add", // 替换为你的Servlet URL
                data: formData,
                success: function(response) {
                    // 返回添加结果
                    $("#successMessage2").text(response);
                }
            });
        }
    </script>
</head>
<body>
    <h2>班级管理页面</h2>
    <h2>班级列表</h2>

    <table>
        <thead>
            <tr>
                <th>班级号</th>
                <th>班级名</th>
            </tr>
        </thead>
        <tbody>
        <%-- 遍历用户列表，显示用户信息 --%>
        <c:forEach var="item" items="${requestScope.itemList}">
            <tr>
                <td>${item.classID}</td>
                <td>${item.className}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="pagination">
        <%-- 分页链接将在此处动态生成 --%>
        <span>第${requestScope.currentPage}页</span>
        <c:forEach begin="1" end="${requestScope.totalPages}" var="page">
            <c:choose>
                <c:when test="${page == requestScope.currentPage}">
                    <span>${page}</span>
                </c:when>
                <c:otherwise>
                    <a href="class-management?page=${page}">${page}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>

    <h2>添加班级</h2>

    <form id="classForm" action="" method="post" onsubmit="submitClassForm(); return false;">
        <label for="name">班级名：</label>
        <input type="text" id="name" name="name" required>
        <br>

        <input type="submit" value="添加">
    </form>
    <!-- 添加一个用于显示成功消息的元素 -->
    <p id="successMessage1"></p>

    <h2>为学生分配班级</h2>

    <form id="studentClassForm" action="" method="post" onsubmit="submitStudentClassForm(); return false;">
        <label for="uidStart">学号起始：</label>
        <input type="text" id="uidStart" name="uidStart" required>
        <br>
        <label for="numberOfStudents">学生数：</label>
        <input type="number" id="numberOfStudents" name="numberOfStudents" required>
        <br>
        <label for="classId">班级ID：</label>
        <input type="number" id="classId" name="classId" required>
        <br>
        <input type="submit" value="添加">
    </form>
    <!-- 添加一个用于显示成功消息的元素 -->
    <p id="successMessage2"></p>

</body>
</html>
