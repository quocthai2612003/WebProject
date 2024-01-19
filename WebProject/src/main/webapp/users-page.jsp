    <%@ page import="Beans.Account" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.Iterator" %>
    <%@ page import="java.util.Objects" %>
    <!DOCTYPE html>
    <html lang="en">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>UsersPage</title>
        <link href="css/base.css" rel="stylesheet">
        <link rel="stylesheet" href="css/history.css">
        <link rel="stylesheet" href="css/user-page.css">
        <!--google fonts-->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
        <script src="https://use.fontawesome.com/releases/v6.4.2/js/all.js" crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
                integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
                crossorigin="anonymous"></script>


        <script src="js/productDetail.js"></script>
        <link rel="stylesheet" href="./css/base.css">
        <link rel="stylesheet" href="css/templatemo.css">
        <script src="js/templatemo.js"></script>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="index.html">
                Zay
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.html">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.html">Shop</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.html">Contact</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="container-fluid">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit"> <i class="fa fa-fw fa-search text-dark mr-2"></i></button>
                        </form>
                    </div>
                </div>
                <a class="nav-icon position-relative text-decoration-none" href="#">
                    <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                    <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                </a>
                <a class="nav-icon position-relative text-decoration-none" href="#">
                    <i class="fa fa-fw fa-user text-dark mr-3"></i>
                    <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
                </a>
            </div>
        </div>

        </div>
    </nav>
    <div class="wraperContent">
        <div class="container light-style flex-grow-1 container-p-y">
            <div class="card overflow-hidden">
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action active" data-toggle="list"
                               href="#account-general">Tài khoản</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#account-change-password">Thay đổi mật khẩu</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#shopping-order">Thông tin đơn hàng</a>
                        </div>
                    </div>
                    <%Account account = (Account) session.getAttribute("account");%>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane fade active show" id="account-general">
                                <div class="card-body media align-items-center">
                                    <img src="assets/images/facebook-user-icon-19.jpg" alt
                                         class="d-block ui-w-80">
                                </div>
                                <hr class="border-light m-0">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label class="form-label">Họ và tên: <%= account.getFullname() %></label>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Email: <%= account.getEmail() %></label>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Số điện thoại: <%= account.getNumberPhone() %></label>
                                    </div>
                                    <button id="showFormButton" class="btn btn-primary">Chỉnh sửa thông tin</button>

                                    <!-- Form for updating user information (initially hidden) -->
                                    <form id="updateInfoForm" action="ServletUpdateInfo" method="post" style="display: none;">
                                        <!-- Input fields for the update -->
                                        <div class="form-group">
                                            <label for="newFullname">Họ và tên mới:</label>
                                            <input type="text" id="newFullname" name="newFullname" class="form-control" required>
                                        </div>
                                        <!-- Submit button -->
                                        <button type="submit" class="btn btn-primary">Cập nhật thông tin</button>
                                    </form>
                                    </div>
                            </div>
                                <div class="tab-pane fade" id="account-change-password">
                                    <form action="ServletPassChanging" method="post">
                                    <div class="card-body pb-2">
                                        <div class="form-group">
                                            <label class="form-label">Mật khẩu hiện tại</label>
                                            <input type="password" name="currentPassword" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Mật khẩu mới</label>
                                            <input type="password" name="newPassword" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Xác nhận lại mật khẩu mới</label>
                                            <input type="password" name="confirmNewPassword" class="form-control">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
                                    </div>
                            </form>
                                </div>

                            <div class="tab-pane fade" id="shopping-order">
                                <div class="card-body pb-2">
                                    <div class="card mb-4">
                                        <div class="card-header">Đơn hàng của bạn</div>
                                        <div class="card-body p-0">

                                            <div class="table-responsive table-billing-history">
                                                <table class="table mb-0">
                                                    <thead>
                                                    <tr>
                                                        <th class="border-gray-200" scope="col">Mã đơn hàng</th>
                                                        <th class="border-gray-200" scope="col">Ngày đặt hàng</th>
                                                        <th class="border-gray-200" scope="col">Ngày giao hàng</th>
                                                        <th class="border-gray-200" scope="col">Thanh toán</th>
                                                        <th class="border-gray-200" scope="col">Tình trạng</th>
                                                        <th class="border-gray-200" scope="col">Thao tác</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>#39201</td>
                                                        <td>10/10/2023</td>
                                                        <td>17/10/2023</td>
                                                        <td>360.000</td>
                                                        <td><span class="badge bg-light text-dark">Đang giao hàng</span></td>
                                                        <td>
                                                            <!-- Button trigger modal -->
                                                            <button type="button" class="btn btn-primary" style="font-size: 14px;" data-toggle="modal"
                                                                    data-target="#exampleModal">
                                                                Xem Chi tiết
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>#39201</td>
                                                        <td>10/10/2023</td>
                                                        <td>17/10/2023</td>
                                                        <td>360.000</td>
                                                        <td><span class="badge bg-light text-dark">Đang giao hàng</span></td>
                                                        <td>
                                                            <!-- Button trigger modal -->
                                                            <button type="button" class="btn btn-primary" style="font-size: 14px;" data-toggle="modal"
                                                                    data-target="#exampleModal">
                                                                Xem Chi tiết
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>#39201</td>
                                                        <td>10/10/2023</td>
                                                        <td>17/10/2023</td>
                                                        <td>360.000</td>
                                                        <td><span class="badge bg-light text-dark">Đang giao hàng</span></td>
                                                        <td>
                                                            <!-- Button trigger modal -->
                                                            <button type="button" class="btn btn-primary" style="font-size: 14px;" data-toggle="modal"
                                                                    data-target="#exampleModal">
                                                                Xem Chi tiết
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>#39201</td>
                                                        <td>10/10/2023</td>
                                                        <td>17/10/2023</td>
                                                        <td>360.000</td>
                                                        <td><span class="badge bg-light text-dark">Đang giao hàng</span></td>
                                                        <td>
                                                            <!-- Button trigger modal -->
                                                            <button type="button" class="btn btn-primary" style="font-size: 14px;" data-toggle="modal"
                                                                    data-target="#exampleModal">
                                                                Xem Chi tiết
                                                            </button>
                                                        </td>
                                                    </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- The Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Chi tiết đơn hàng</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="small-container cart-page">
                        <table>
                            <thead>
                            <tr>
                                <th>Mã sản phẩm</th>
                                <th>Sản phẩm</th>
                                <th>Hình ảnh</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>

                            </tr>
                            </thead>
                            <tr>
                                <td>#N123</td>
                                <td>
                                    <div>
                                        <p>That lung da</p>
                                    </div>
                                </td>
                                <td>
                                    <div class="cart-info">
                                        <img src="assets/images/that-lung-nam-zuciani-IT02-nau-1.jpg" alt="">
                                    </div>
                                </td>
                                <td><span class="price">180.000</span></td>
                                <td>
                                    <div class="quantity-control">
                                        <div class="quantity-display">1</div>
                                    </div>
                                </td>
                                <td class="totalPricePerItem">180.000</td>

                            </tr>
                            <tr>
                                <td>#N123</td>
                                <td>
                                    <div>
                                        <p>That lung da</p>
                                    </div>
                                </td>
                                <td>
                                    <div class="cart-info">
                                        <img src="assets/images/that-lung-nam-zuciani-IT02-nau-1.jpg" alt="">
                                    </div>
                                </td>
                                <td><span class="price">180.000</span></td>
                                <td>
                                    <div class="quantity-control">
                                        <div class="quantity-display">1</div>
                                    </div>
                                </td>
                                <td class="totalPricePerItem">180.000</td>

                            </tr>

                        </table>
                    </div>
                    <div class="address">
                        <span>Địa chỉ giao hàng : </span>
                        <p id="deliveryAddress">Số 1 Đại học Nông Lâm TPHCM</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myChangingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thay đổi thông tin</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Add your form elements for changing information -->
                    <form>
                        <div class="form-group">
                            <label class="form-label">Họ và tên:</label>
                            <input type="text" class="form-control" placeholder="Nhập họ và tên mới">
                        </div>
                        <div class="form-group">
                            <label class="form-label">Email:</label>
                            <input type="email" class="form-control" placeholder="Nhập email mới">
                        </div>
                        <div class="form-group">
                            <label class="form-label">Số điện thoại:</label>
                            <input type="tel" class="form-control" placeholder="Nhập số điện thoại mới">
                        </div>
                        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        // JavaScript to toggle the visibility of the form
        document.getElementById('showFormButton').addEventListener('click', function () {
            document.getElementById('updateInfoForm').style.display = 'block';
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>