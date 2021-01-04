<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="web_pro.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
<%
       pub_fun A_pubfun=new pub_fun();
%>
</table>
 <form action="login" method="post"> 
  <input id="login" type="text" name="log" placeholder="用户名" autofocus required value="test"><br/>
 <input type="submit" value="登录"> 
 
</form>
<body>
</html>