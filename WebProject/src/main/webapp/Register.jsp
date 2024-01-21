<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/account.css">
</head>
<body>
<%
    String fullname = request.getAttribute("fullname") == null ? "" : request.getAttribute("fullname").toString();
    String phone = request.getAttribute("phone") == null ? "" : request.getAttribute("phone").toString();
    String username = request.getAttribute("username") == null ? "" : request.getAttribute("username").toString();
    String email = request.getAttribute("email") == null ? "" : request.getAttribute("email").toString();
    String error = request.getAttribute("error") == null ? "" : request.getAttribute("error").toString();
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
                <a class="function-login" style="border-bottom: 1px solid #ccc" href="./login">Đăng nhập</a>
                <a class="function-register" style="border-bottom: 1px solid #000" href="./register">Đăng ký</a>
            </div>
            <form class="infor" action="./register" method="post">
                <div class="form-group">
                    <%if (notify != null){%>
                    <p class="notification-success"><%=notify%></p>
                    <%}%>
                    <% if (!error.isEmpty()) {%>
                        <p class="notification-error"><%=error%></p>
                    <%}%>
                    <input type="text" name = "fullname" value="<%=fullname%>" id = "fullname" placeholder="Họ và tên*" required = "required">
                    <input type="email" name = "email" value="<%=email%>" id="email" placeholder="Nhập địa chỉ email*" required = "required">
                    <p id="checkPhone"></p>
                    <input type="text" name = "phone" value="<%=phone%>" id = "phone" placeholder="Số điện thoại*" required = "required" onkeyup="kiemTraSoDienThoai()">
                    <input type="text" name = "username" value="<%=username%>" id = "username" placeholder="Tên đăng nhập*" required = "required">
                    <input type="password" name = "password" id="password" placeholder="Mật khẩu*" required = "required" onkeyup="kiemTraMatKhau()">
                    <p id="checkPass"></p>
                    <input type="password" name = "repeatPassword" id="password__repeat" placeholder="Xác nhận mật khẩu*" required = "required" onkeyup="kiemTraMatKhau()">
                </div>
                <button id = "submit" type="submit" class="btn_createAccount">Tạo tài khoản</button>
            </form>
            <p class="commit">
                Chúng tôi cam kết bảo mật và không bao giờ đăng hay chia sẻ thông tin mà chưa có được sự đồng ý của bạn
            </p>
        </div>
    </div>
</div>
</body>
<script src="./js/account.js">

</script>
</html>
