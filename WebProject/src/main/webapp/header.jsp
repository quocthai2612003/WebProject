<%@ page import="Model.Account" %>
<%@ page import="Model.Slider" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.ShoppingCart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="author" content="PQL" />
    <title>MyProject</title>
    <meta name="keywords" content="PQL"/>
    <!--Web icon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!--google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.4.2/js/all.js" crossorigin="anonymous"></script>
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"></script>
    <!--    jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
<%
    Account account = (Account) session.getAttribute("account");
    List<Slider> sliders = (List<Slider>) request.getAttribute("slider");
    ShoppingCart gh = (ShoppingCart) session.getAttribute("cart");
    if (gh == null) gh = new ShoppingCart();
%>
<header id="header" class="border-bottom border-black">
    <div class="container">
        <div class=" global-nav d-flex align-items-center justify-content-between ">
            <a href="home.jsp" class="d-block align-items-center logo-fix">
                <img src="assets/logoweb.svg" alt="PQL">
            </a>
            <ul id="main-menu" class="nav col-md-auto">
                <li><a href="#" class="nav-link">Nam</a></li>
                <li><a href="#" class="nav-link">Nữ</a></li>
                <li><a href="#" class="nav-link">Trẻ em</a></li>
            </ul>

            <div class="text-end d-flex">
                <form action="search" method="post" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 d-flex">
                    <input name="txt" type="search" class="form-control form-control-light" placeholder="Tìm kiếm..." aria-label="Search">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number"><i class="fa fa-search"></i></button>
                    </div>

                </form>
                <button id="accountBtn" type="button" class="btn btn-light rounded-circle"><i class="fa-solid fa-user"></i> </button>
                <div id="accountMenu" style="display: none;">
                    <!-- Các chức năng của tài khoản -->
                    <ul>
                        <li><a href="#">Thông Tin Tài Khoản</a></li>
                        <li><a href="#">Quản Lý Đơn Hàng</a></li>
                        <li><a href="#">Đăng Xuất</a></li>
                    </ul>
                    <!-- <script>
                        // Xác định nút Tài Khoản
                        var accountButton = document.getElementById('accountBtn');
                        accountButton.addEventListener('click', function() {
                            <% Account account = (Account) session.getAttribute("account");
                                if (account == null) { %>
                                // Chuyển hướng người dùng đến trang đăng nhập khi nhấn vào nút Tài Khoản
                                window.location.href = 'login.jsp';
                                <% } else { %>
                                // Chuyển hướng người dùng đến trang người dùng khi nhấn vào nút Tài Khoản
                                window.location.href = 'users-page.jsp';
                                <% } %>
                        });
                    </script> -->
                </div>
                <button id="cartBtn" type="button" class="btn btn-light rounded-circle position-relative"><i class="fa-solid fa-cart-shopping"></i> <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"><%= gh.getSize() %><span class="visually-hidden">unread messages</span></span></button>
                <span id="cartItemCount"></span>
                <!-- <script>
                    // Xác định nút Giỏ Hàng
                    var cartButton = document.getElementById('cartBtn');
                    cartButton.addEventListener('click', function() {
                        <% Account account = (Account) session.getAttribute("account");
                               if (account == null) { %>
                                // Chuyển hướng người dùng đến trang đăng nhập khi nhấn vào nút Giỏ hàng
                                window.location.href = 'login.jsp';
                                <% } else { %>
                                // Chuyển hướng người dùng đến trang giỏ hàng khi nhấn vào nút Giỏ hàng
                                window.location.href = 'cart.jsp';
                                <% } %>
                    });
                </script> -->
            </div>
        </div>
    </div>
</header>
<script>
    $(document).ready(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop()) {
                $('header').addClass('sticky');
            }else{
                $('header').removeClass('sticky');
            }
        });
    });

    $(document).ready(function () {
        $(window).scroll(function () {
            var navLinks = document.querySelectorAll('ul#main-menu a');
            if ($(this).scrollTop() > 0) {
                for (var i = 0; i < navLinks.length; i++) {
                    navLinks[i].style.padding = '20px 16px';
                }
            } else {
                for (var i = 0; i < navLinks.length; i++) {
                    navLinks[i].style.padding = '24.5px 16px';
                }
            }
        });
    });

</script>
</body>
</html>
