 <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<%@ include file="include/head.htm" %>
<body>
<div class="container">
    <%@ include file="include/menu.htm" %>
    <p style = "color:#800000">Пользователь: ${user.name} Права:${userRole}</p>
    <p> ${listOrder}</p>
</div>
</body>
</html>
