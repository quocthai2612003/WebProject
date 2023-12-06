<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 11/10/2023
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CodingDung | Profile Template</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/user-page.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container light-style flex-grow-1 container-p-y">
    <h4 class="font-weight-bold py-3 mb-4">
        Xin chào Qúy khách
    </h4>
    <div class="card overflow-hidden">
        <div class="row no-gutters row-bordered row-border-light">
            <div class="col-md-3 pt-0">
                <div class="list-group list-group-flush account-settings-links">
                    <a class="list-group-item list-group-item-action active" data-toggle="list"
                       href="#account-general">Tài khoản</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list"
                       href="#account-change-password">Mật khẩu</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list"
                       href="#account-info">Thông tin liên lạc khách hàng</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list"
                       href="#shopping-order">Thông tin đơn hàng</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list"
                       href="#account-connections">Lịch sử mua hàng</a>
                </div>
            </div>
            <div class="cointainer"></div>
            <div class="col-md-9">
                <div class="tab-content">
                    <div class="tab-pane fade active show" id="account-general">
                        <div class="card-body media align-items-center">
                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt
                                 class="d-block ui-w-80">
                            <div class="media-body ml-4">
                                <label class="btn btn-outline-primary">
                                    Thay ảnh đại diện
                                    <input type="file" class="account-settings-fileinput">
                                </label> &nbsp;
                                <div class="text-light small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                            </div>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body">
                            <div class="form-group">
                                <label class="form-label">Họ và tên </label>
                                <input type="text" class="form-control mb-1" value="nmaxwell">
                            </div>
                            <div class="form-group">
                                <label class="form-label">E-mail</label>
                                <input type="text" class="form-control mb-1" value="nmaxwell@mail.com">
                                <div class="alert alert-warning mt-3">
                                    Your email is not confirmed. Please check your inbox.<br>
                                    <a href="javascript:void(0)">Resend confirmation</a>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Gender</label>
                                <div class="radio-group">
                                    <input type="radio" id="nam" name="gender" value="nam">
                                    <label for="nam">Nam</label>

                                    <input type="radio" id="nu" name="gender" value="nu">
                                    <label for="nu">Nữ</label>

                                    <input type="radio" id="khac" name="gender" value="khac">
                                    <label for="khac">Khác</label>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="account-change-password">
                        <div class="card-body pb-2">
                            <div class="form-group">
                                <label class="form-label">Mật khẩu hiên tại</label>
                                <input type="password" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Mật khẩu mới</label>
                                <input type="password" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Xác nhân lại mật khẩu mới</label>
                                <input type="password" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="account-info">
                        <div class="card-body pb-2">
                            <div class="form-group">
                                <label class="form-label">Địa chỉ nha</label>
                                <textarea class="form-control"
                                          rows="5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc arcu, dignissim sit amet sollicitudin iaculis, vehicula id urna. Sed luctus urna nunc. Donec fermentum, magna sit amet rutrum pretium, turpis dolor molestie diam, ut lacinia diam risus eleifend sapien. Curabitur ac nibh nulla. Maecenas nec augue placerat, viverra tellus non, pulvinar risus.</textarea>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Thành phố</label>
                                <select class="custom-select">
                                    <option>USA</option>
                                    <option selected>Canada</option>
                                    <option>UK</option>
                                    <option>Germany</option>
                                    <option>France</option>
                                </select>
                            </div>
                        </div>
                        <hr class="border-light m-0">
                        <div class="card-body pb-2">
                            <h6 class="mb-4">Phương thức liên hệ</h6>
                            <div class="form-group">
                                <label class="form-label">Số điện thoại</label>
                                <input type="text" class="form-control" value="+0 (123) 456 7891">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Website</label>
                                <input type="text" class="form-control" value>
                            </div>
                        </div>
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
                                                <th class="border-gray-200" scope="col">Ngày mua</th>
                                                <th class="border-gray-200" scope="col">Ngày giao (dự kiến)</th>
                                                <th class="border-gray-200" scope="col">Thanh toán</th>
                                                <th class="border-gray-200" scope="col">Tình trạng</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>#39201</td>
                                                <td>06/09/2023</td>
                                                <td>13/09/2023</td>
                                                <td>$29.99</td>
                                                <td><span class="badge bg-light text-dark">Pending</span></td>
                                                <td>
                                                    <!-- Button trigger modal -->
                                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                                            data-target="#exampleModal">
                                                        Chi tiết
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

                    <div class="tab-pane fade" id="account-connections">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Image</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Date</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><img src="/html/1.png" alt="Product 1 Image" class="img-fluid" style="max-width: 100px;"></td>
                                <td>Product 1</td>
                                <td>$19.99</td>
                                <td>2023-01-01</td>
                            </tr>
                            <tr>
                                <td><img src="image_url_2" alt="Product 2 Image" class="img-fluid" style="max-width: 100px;"></td>
                                <td>Product 2</td>
                                <td>$29.99</td>
                                <td>2023-01-05</td>
                            </tr>
                            <tr>
                                <td><img src="image_url_3" alt="Product 3 Image" class="img-fluid" style="max-width: 100px;"></td>
                                <td>Product 3</td>
                                <td>$39.99</td>
                                <td>2023-01-10</td>
                            </tr>
                            <tr>
                                <td><img src="image_url_4" alt="Product 4 Image" class="img-fluid" style="max-width: 100px;"></td>
                                <td>Product 4</td>
                                <td>$49.99</td>
                                <td>2023-01-15</td>
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
<div class="container">
    <div class="text-right mt-3">
        <button type="button" class="btn btn-primary">Save changes</button>&nbsp;
        <button type="button" class="btn btn-default">Cancel</button>
    </div>
</div>
<!-- The Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="small-container cart-page">
                    <table>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                        <tr>
                            <td>
                                <div class="cart-info">
                                    <img src="1.png" alt="">
                                    <div>
                                        <p>That lung nam</p>
                                        <small>Gia : 300.000</small>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="quantity-control">
                                    <div class="quantity-display">1</div>
                                </div>
                            </td>
                            <td class="totalPricePerItem">300.000</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="cart-info">
                                    <img src="thatlungnu.jpg" alt="">
                                    <div>
                                        <p>That lung nam</p>
                                        <small>Gia : 300.000</small>
                                        <br>

                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="quantity-control">

                                    <div class="quantity-display">1</div>

                                </div>
                            </td>
                            <td class="totalPricePerItem">300.000</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="cart-info">
                                    <img src="thatlungtreem.jpg" alt="">
                                    <div>
                                        <p>That lung nam</p>
                                        <small>Gia : 300.000</small>

                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="quantity-control">
                                    <div class="quantity-display">1</div>
                                </div>
                            </td>
                            <td class="totalPricePerItem">300.000</td>
                        </tr>

                    </table>

                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
    </div>
</div>
</div>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>
