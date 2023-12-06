
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
                <a class="function-login" href="./Login.jsp">Đăng nhập</a>
                <a class="function-register" href="./Register.jsp">Đăng ký</a>
            </div>
            <form class="infor" action="">
                <div class="form-group">
                    <input type="text" id="email" placeholder="Tên đăng nhập" required = "required">
                    <input type="password" id="password" placeholder="Mật khẩu" required = "required">
                </div>
                <div class="forgot-password"><a href="#">Quên mật khẩu?</a></div>
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
