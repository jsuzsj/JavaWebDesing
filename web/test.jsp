<%@ page import="cn.jsu.bean.Shop" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.jsu.util.DBUtil" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/28
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="shop" items="${shops}">
    ${shop.name}
</c:forEach>
<html>
<head>
    <title>Title</title>
</head>
<body>
</body>
</html>
