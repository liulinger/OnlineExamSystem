<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <title>This is studentPage</title>
    <link href="../css/ManagementMainStyle.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="title">在线考试系统
    <span class="userinfo">用户名:${sessionScope.username}
        <a href="<c:url value="/ModifyPassword.jsp"/>">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="../login.jsp">退出</a> </span>
</div>

<h4>${sessionScope.finishmessage}</h4>
<div class="centerContainer">
    <div class="leftBar">
        <ul>
            <li><a style="background-color: #c8c8dc" href="<c:url value="/student/exam-list-servlet"/>">我的考试</a></li>
            <li class="negative"><a href="<c:url value="/student/GetStudentInformationServlet"/>">我的信息</a></li>
            <li ><a href=<c:url value="/student/GetStudentGradeServlet"/>>我的成绩</a></li>
        </ul>
    </div>
    <div class="main">
        <div style="text-align: center;">
            <h1>欢迎来到在线考试页面！</h1>
        </div>
    </div>
</div>
<div class="footer">Copyright&nbsp;&copy;&nbsp;602</div>
</body>
</html>
