<%--
  Created by IntelliJ IDEA.
  User: x
  Date: 2023/12/16
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="head">
        <p>用户名</p>
    </div>
    <div class="head_tips">
        <p>退出或离开答题页面，答题计时不暂停，进入考试后请不要中途离开，以防超时系统自动收卷。</p>
    </div>
    ${param.stu_id}
    <div class="body_list">
        <table>
            <c:forEach var="exam" items="${examList}">
                <tr>
                    <td>${exam.exam_name}</td>
                    <td>${exam.exam_date}</td>
                    <td>${exam.time_limits}</td>
                    <td>${exam.score}</td>
                    <td>
                        <a>查看</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!-- 分页控件 -->
    <div class="pagination-container">
        <c:if test="${not empty noOfPages and not empty currentPage}">
            <a href="?page=1">首页</a>
            <c:if test="${currentPage > 1}">
                <a href="?page=${currentPage-1}">上一页</a>
            </c:if>
            <c:forEach var="i" begin="1" end="${noOfPages}">
                <c:choose>
                    <c:when test="${i eq currentPage}">
                        <b>${i}</b>
                    </c:when>
                    <c:otherwise>
                        <a href="?page=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentPage < noOfPages}">
                <a href="?page=${currentPage + 1}">下一页</a>
            </c:if>
            <a href="?page=${noOfPages}">末页</a>
        </c:if>
    </div>
</body>
</html>