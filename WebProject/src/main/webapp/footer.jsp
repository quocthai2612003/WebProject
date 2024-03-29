<!-- <%@ page contentType="text/html;charset=UTF-8" language="java" %> -->
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
<footer id="footer">
    <div class="footer-top pt-5">
        <div class="container row">
            <div class="col-6 col-md-3 mb-3 pe-5">
                <h6>LIÊN HỆ</h6>
                <p class="address"><strong>Địa chỉ</strong>: Khu Phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh</p>
                <p class="address"><strong>Điện thoại liên hệ</strong>: 0935.826.249</p>
                <p class="address"><strong>Email</strong>: 21130426@st.hcmuaf.edu.vn</p>
            </div>

            <div class="col-6 col-md-2 mb-3 ps-4">
                <h6>VỀ PQL</h6>
                <ul class=" footer-menu nav flex-column">
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Giới thiệu</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Diều khoaản</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0">FAQs</a></li>
                    <li class="nav-item mb-2"><a href="contact.jsp" class="nav-link p-0">Liên hệ</a></li>
                </ul>
            </div>

            <div class="col-6 col-md-2 mb-3">
                <h6>HỖ TRỢ KHÁCH HÀNG</h6>
                <ul class="footer-menu nav flex-column">
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Trung tâm trợ giúp</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Chính sách khách hàng</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Chính sách bảo mật</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Chính sách vận chuyển và thanh toán</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0">Hướng dẫn mua hàng</a></li>
                </ul>
            </div>

            <div class="col-md-4 offset-md-1 mb-3">
                <form action="submit" method="post">
                    <h5>Đăng ký nhận ưu đãi từ PQL</h5>
                    <p class="address">Nhận ngay thông tin về sản phẩm mới và các chương trình ưu đãi!</p>
                    <div class="d-flex flex-sm-row w-100 gap-2">
                        <label for="newsletter1" class="visually-hidden">Email address</label>
                        <input id="newsletter1" type="text" class="form-control" placeholder="Nhập email của bạn">
                        <button class="btn btn-warning col-md-3" type="button">Đăng kí</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="footer-bottom bg-white border-top">
        <div class="container d-flex flex-sm-row flex-column justify-content-between pt-2">
            <p>&copy; 2023 PQL, Inc. All rights reserved.</p>
            <ul class="list-unstyled d-flex">
                <li class="ms-0"><a class="link-dark" href="https://github.com/quocthai2612003/WebProject"><i class="fa-brands fa-github fa-2xl"></i></a></li>
                <li class="ms-0"><a class="link-dark" href="#"><i class="fa-brands fa-facebook fa-2xl"></i></a></li>
                <li class="ms-0"><a class="link-dark" href="#"><i class="fa-brands fa-instagram fa-2xl"></i></a></li>
                <li class="ms-0"><a class="link-dark" href="#"><i class="fa-brands fa-twitter fa-2xl"></i></a></li>
            </ul>
        </div>
    </div>
</footer>
</body>
</html>