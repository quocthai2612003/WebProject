<%--
  Created by IntelliJ IDEA.
  User: Hieu
  Date: 04/12/2023
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/account.css">
</head>
<body>
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
                <a class="function-login" style="border-bottom: 1px solid #ccc" href="./Login.html">Đăng nhập</a>
                <a class="function-register" style="border-bottom: 1px solid #000" href="./Register.html">Đăng ký</a>
            </div>
            <form class="infor" action="/register" method="post">
                <div class="form-group">
                    <input type="text" id = "fullname" placeholder="Họ và tên" required = "required">
                    <input type="email" id="email" placeholder="Nhập địa chỉ email" required = "required">
                    <p id="checkPhone"></p>
                    <input type="text" id = "phone" placeholder="Số điện thoại" required = "required" onkeyup="kiemTraSoDienThoai()">
                    <input type="text" id = "username" placeholder="Tên đăng nhập" required = "required">
                    <input type="password" id="password" placeholder="Mật khẩu" required = "required">
                    <p id="checkPass"></p>
                    <input type="password" id="password__repeat" placeholder="Xác nhận mật khẩu" required = "required" onkeyup="kiemTraMatKhau()">
                </div>
                <button type="submit" class="btn_createAccount">Tạo tài khoản</button>
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
