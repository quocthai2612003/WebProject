<%@ page import="bean.User" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<%
    User us = (User)session.getAttribute("qq");

%>
<%
    if(us!=null){
%>
<p>Xin chao <%= us.getName()%></p>

<%
    }else {
%>
<p>ban chua dang nhap</p>
<% }%>


</body>
</html>