
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/account.css">
    <link rel="stylesheet" href="./css/base.css">
</head>
<body>
<%
    String error = (String)request.getAttribute("error") ;
    String username = request.getParameter("username") != null ? (String)request.getParameter("username"): "";
    String notify = (String) request.getAttribute("notify");
%>
<div id="content">
    <div class="form-login">
        <div class="left">
            <img src="./assets/images/account_img/login.png" alt="">
            <p class="title-login">Quyền lợi thành viên</p>
            <ul class="list">
                <li class="list-item"><p>Mua hàng cực dễ dàng, nhanh chóng</p></li>
                <li class="list-item"><p>Theo dõi chi tiết đơn hàng, địa chỉ thanh toán dễ dàng</p></li>
                <li class="list-item"><p>Nhận nhiều chương trình ưu đãi từ chúng tôi</p></li>
            </ul>
        </div>
        <div class="right">
            <div class="function">
                <a class="function-login" href="./login">Đăng nhập</a>
                <a class="function-register" href="./register">Đăng ký</a>
            </div>
            <form class="infor" action="/login" method="post">
                <div class="form-group">
                    <%if (notify != null){%>
                    <p class="notification-success"><%=notify%></p>
                    <%}%>
                    <%if (error != null) {%>
                    <p class="notification-error"><%=error%></p>
                    <%}%>
                    <input type="text" name ="username" value="<%=username%>" id="username" placeholder="Tên đăng nhập" required = "required">
                    <input type="password" name = "password"  id="password" placeholder="Mật khẩu" required = "required">
                </div>
                <div class="forgot-password"><a href="./forgot">Quên mật khẩu?</a></div>
                <button type="submit" class="btn_login">Đăng nhập</button>
            </form>
            <p class="commit">
                Chúng tôi cam kết bảo mật và không bao giờ đăng hay chia sẻ thông tin mà chưa có được sự đồng ý của bạn
            </p>
        </div>
    </div>
</div>
</body>
</html>