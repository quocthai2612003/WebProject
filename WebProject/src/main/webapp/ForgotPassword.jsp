<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./css/account.css">
    <link rel="stylesheet" href="./css/base.css">
</head>
<body>
<%
    String email = request.getAttribute("email") == null ? "" : request.getAttribute("email").toString();
    String username = request.getAttribute("username") == null ? "" : request.getAttribute("username").toString();
    boolean check = request.getAttribute("check") == null ? false : (boolean) request.getAttribute("check");
    String notify = request.getAttribute("notify") == null ? "" : request.getAttribute("notify").toString();
    String success = request.getAttribute("success") == null ? "" : request.getAttribute("success").toString();
%>
<div id="content">
    <div class="form-forgotpassword">
        <div class="title-forgotpassword"><h4>Quên mật khẩu</h4></div>
        <form action="./forgot" method="post">
            <div class="email-forgotpassword">
                <% if (!notify.isEmpty()) {%>
                    <p class="notification-error"><%=notify%></p>
                <%}%>
                <% if (!success.isEmpty()) {%>
                 <p class="notification-success"><%=success%></p>
                <%}%>
                <% if (!check) {%>
                <div class="">
                    <span>Tên đăng nhập: </span>
                    <input type="text" name="username" required>
                </div>
                <div class="">
                    <span>Email: </span>
                    <input type="email" name="email" required>
                </div>
                <%} else {%>
                <div class="">
                    <span>Password: </span>
                    <input type="password" name="password" required>
                </div>
                <div class="">
                    <span>Nhập lại password: </span>
                    <input type="password" name="repeatPassword" required>
                </div>
                <div class="">
                    <span>Mã code: </span>
                    <input type="text" name="code" required>
                </div>
                <%}%>
            </div>
            <button type="submit">Đồng ý</button>
        </form>
    </div>
</div>
</body>
</html>
