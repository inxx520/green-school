<%@ page import="web_pro.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
        <meta charset="utf-8" />
        <meta name="format-detection" content="telephone=no" />
        <meta name="msapplication-tap-highlight" content="no" />
        <meta name="viewport"
            content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width" />
<title>Insert title here</title>
</head>
<body style="background-color: #548080;">
<center style="
    margin-top: 5%;
    padding: 5%;
    background-color: #ffffff;
    border-radius: 1%;">

<h3 style="border-style:outset;border-radius: 5%;">access_token</h3>
<text style="width:auto;word-wrap: break-word;word-break: break-all;"> <%=request.getAttribute("access_token")%> </text>
<h3 style="border-style:outset;border-radius: 5%;">expires_in</h3>
<%=request.getAttribute("expires_in")%>
<h3 style="border-style:outset;border-radius: 5%;">用户列表</h3>
<c:forEach items="${users}" var="user">
    <img src="${user.headimgurl}">
    <h5>${user.nickname}</h5>
    <h5>Openid：${user.openid}</h5>
    <h5>国家：${user.country}</h5>
    <hr>
</c:forEach>
</center>
</body>
</html>