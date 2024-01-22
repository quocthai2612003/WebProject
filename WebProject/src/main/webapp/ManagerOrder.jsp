<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="./css/admin.css">
</head>
<body>
<div id="id">
    <div id="admin">
        <div class="left">
            <div class="menu">
                <div class="menu-title">
                    <div class="logo">
                        <a href="./home.html"><img src="./assets/logo.svg" alt=""></a>
                    </div>
                    <h2 class="shop-name">PLQ SHOP</h2>
                </div>
                <div class="shop-user">
                    <div class="user">
                        <img src="./assets/images/logo/icon.jpg" alt="">
                    </div>
                    <p>Xin chào, admin</p>
                </div>
                <div class="menu-item">
                    <a href="./admin">
                        <div class="icon"><i class="fa-solid fa-house-chimney"></i></div>
                        <p class="menu-content">Thống kê</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./managerAccount?page=1">
                        <div class="icon"><i class="fa-solid fa-desktop"></i></div>
                        <p class="menu-content">Quản lý tài khoản</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./managerProduct?page=1">
                        <div class="icon"><i class="fa-regular fa-calendar-days"></i></div>
                        <p class="menu-content">Quản lý sản phẩm</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./managerOrder?page=1" class ="active">
                        <div class="icon"><i class="fa-solid fa-clipboard"></i></div>
                        <p class="menu-content">Quản lý đơn hàng</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./managerReview?page=1">
                        <div class="icon"><i class="fa-solid fa-comment"></i></div>
                        <p class="menu-content">Quản lý bình luận</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="contain">
                <div class="title">
                    <h2>Quản lý đơn hàng</h2>
                </div>
                <div class="manager">
                    <div class="manager-search">
                        <div class="search">
                            <input type="text" class="search" placeholder="Tìm kiếm">
                            <button class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </div>
                    </div>
                    <div class="manager-infor">
                        <table>
                            <thead>
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Ngày đặt hàng</th>
                                <th>Ngày giao hàng</th>
                                <th>địa chỉ</th>
                                <th>số điện thoại</th>
                                <th>Trạng thái</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>#39201</th>
                                <th>Nguyễn Văn A</th>
                                <th>10/10/2023</th>
                                <th>17/10/2023</th>
                                <th>Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.</th>
                                <th>0987654321</th>
                                <th>Đang giao hàng</th>
                                <th><button class="btn-xemChiTiet">Xem chi tiết</button></th>
                            </tr>
                            <tr>
                                <th>#39201</th>
                                <th>Nguyễn Văn A</th>
                                <th>10/10/2023</th>
                                <th>17/10/2023</th>
                                <th>Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.</th>
                                <th>0987654321</th>
                                <th>Đang giao hàng</th>
                                <th><button class="btn-xemChiTiet">Xem chi tiết</button></th>
                            </tr>
                            <tr>
                                <th>#39201</th>
                                <th>Nguyễn Văn A</th>
                                <th>10/10/2023</th>
                                <th>17/10/2023</th>
                                <th>Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.</th>
                                <th>0987654321</th>
                                <th>Đang giao hàng</th>
                                <th><button class="btn-xemChiTiet">Xem chi tiết</button></th>
                            </tr>
                            <tr>
                                <th>#39201</th>
                                <th>Nguyễn Văn A</th>
                                <th>10/10/2023</th>
                                <th>17/10/2023</th>
                                <th>Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.</th>
                                <th>0987654321</th>
                                <th>Đang giao hàng</th>
                                <th><button class="btn-xemChiTiet">Xem chi tiết</button></th>
                            </tr>
                            <tr>
                                <th>#39201</th>
                                <th>Nguyễn Văn A</th>
                                <th>10/10/2023</th>
                                <th>17/10/2023</th>
                                <th>Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.</th>
                                <th>0987654321</th>
                                <th>Đang giao hàng</th>
                                <th><button class="btn-xemChiTiet">Xem chi tiết</button></th>
                            </tr>
                            <tr>
                                <th>#39201</th>
                                <th>Nguyễn Văn A</th>
                                <th>10/10/2023</th>
                                <th>17/10/2023</th>
                                <th>Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.</th>
                                <th>0987654321</th>
                                <th>Đang giao hàng</th>
                                <th><button class="btn-xemChiTiet">Xem chi tiết</button></th>
                            </tr>
                            <tr>
                                <th>#39201</th>
                                <th>Nguyễn Văn A</th>
                                <th>10/10/2023</th>
                                <th>17/10/2023</th>
                                <th>Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.</th>
                                <th>0987654321</th>
                                <th>Đang giao hàng</th>
                                <th><button class="btn-xemChiTiet">Xem chi tiết</button></th>
                            </tr>
                            <tr>
                                <th>#39201</th>
                                <th>Nguyễn Văn A</th>
                                <th>10/10/2023</th>
                                <th>17/10/2023</th>
                                <th>Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.</th>
                                <th>0987654321</th>
                                <th>Đang giao hàng</th>
                                <th><button class="btn-xemChiTiet">Xem chi tiết</button></th>
                            </tr>
                            <tr>
                                <th>#39201</th>
                                <th>Nguyễn Văn A</th>
                                <th>10/10/2023</th>
                                <th>17/10/2023</th>
                                <th>Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.</th>
                                <th>0987654321</th>
                                <th>Đang giao hàng</th>
                                <th><button class="btn-xemChiTiet">Xem chi tiết</button></th>
                            </tr>
                            <tr>
                                <th>#39201</th>
                                <th>Nguyễn Văn A</th>
                                <th>10/10/2023</th>
                                <th>17/10/2023</th>
                                <th>Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh.</th>
                                <th>0987654321</th>
                                <th>Đang giao hàng</th>
                                <th><button class="btn-xemChiTiet">Xem chi tiết</button></th>
                            </tr>


                            </tbody>
                        </table>
                    </div>
                    <div class="pagination">
                        <a href="#" class="other-page" style="color: red; font-weight: bold;"><span>1</span></a>
                        <a href="#" class="other-page"><span>2</span></a>
                        <a href="#" class="other-page"><span>3</span></a>
                        <a href="#" class="other-page"><span>4</span></a>
                        <a href="#" class="other-page"><span>5</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
