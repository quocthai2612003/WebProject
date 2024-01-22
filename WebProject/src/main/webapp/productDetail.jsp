<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="author" content="PQL" />
    <title>Chi tiết sản phẩm | PQL</title>
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
    <link rel="stylesheet" href="css/productDetail.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/productDetail.js"></script>

</head>
<body>
<div id="header_contain"></div>
<div class="container main-content">
    <div class='breadcrumbs row-item'>
        <ol class="breadcrumb row-item">
            <li class='breadcrumb-item breadcrumbs-first'>
                <a title='PQL' href="home.jsp" rel='nofollow'>Trang chủ</a>
            </li>
            <li class="breadcrumb-item ">
                <a href="#" title="Thắt lưng">Thắt lưng</a>
            </li>
            <li class="breadcrumb-item">Tên sản phẩm</li>
        </ol><!-- END: .breadcrumb-content -->
    </div><!-- END: .breadcrumb -->
    <div class="clear"></div>
    <div class="container-fliud">
        <div class="wrapper row py-3">
            <div class="image w-50">
                <div class="preview-pic tab-content">
                    <div class="tab-pane active" id="pic-1"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox.jpg" /></div>
                    <div class="tab-pane" id="pic-2"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-1.jpg" /></div>
                    <div class="tab-pane" id="pic-3"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-2.jpg" /></div>
                    <div class="tab-pane" id="pic-4"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-3.jpg" /></div>
                    <div class="tab-pane" id="pic-5"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-4.jpg" /></div>

                </div>
                <ul class="preview-thumbnail nav nav-tabs">
                    <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox.jpg" /></a></li>
                    <li><a data-target="#pic-2" data-toggle="tab"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-1.jpg" /></a></li>
                    <li><a data-target="#pic-3" data-toggle="tab"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-2.jpg" /></a></li>
                    <li><a data-target="#pic-4" data-toggle="tab"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-3.jpg" /></a></li>
                    <li><a data-target="#pic-5" data-toggle="tab"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-4.jpg" /></a></li>

                </ul>
            </div>

            <div class="details col-md-6 ps-4">
                <h3 class="product-title pb-3">Thắt lưng nam cao cấp FaiaoePOLO</h3>
                <p class="product-id pb-2" style="color: #757575">Mã sản phẩm: <span><strong>TL1205</strong></span></p>
                <div class="rating d-flex pb-4">
                    <div class="stars">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star "></span>
                    </div>
                    <span class="review-no ps-2">.<strong>100</strong> Đánh giá</span>
                    <span class="bought px-2">| <strong> 200</strong> Đã bán</span>
                </div>
                <h3 class="price pd-5 pb-4"><span>120.000₫</span></h3>
                <div class="quantity d-flex pb-5">
                    <p class="title-attr">Số lượng</p>
                    <div class="count-number">
                        <button class="decrease">-</button>
                        <input type="text" class="quantity-input" value="1">
                        <button class="increase">+</button>
                    </div>
                </div>
                <div class="buy-action d-flex">
                    <button id="addToCartBtn" class="add-to-cart btn btn-default" type="button">Thêm vào giỏ hàng</button>
                    <button id="buyNowBtn" class="buy-now btn btn-default" type="button">Mua ngay</button>
                </div>
            </div>
            <div class="col-xs-9">
                <ul class="menu-items">
                    <h2 class="product-detail">Chi tiết sản phẩm</h2>
                </ul>
                <div style="width:100%;border-top:1px solid silver">
                    <p style="padding:15px;">
                        <small>
                            Sản phẩm thắt lưng là một phụ kiện thời trang được sử dụng để giữ cho quần áo vững chắc ở vị trí mong muốn và cũng có thể được sử dụng như một phần của trang phục thể hiện phong cách cá nhân.
                        </small>
                    </p>
                    <small>
                        <ul>
                            <li>Mã sản phẩm: </li>
                            <li>Màu sắc: đen</li>
                            <li>Chất liệu: Da cao cấp</li>
                            <li>Kích thước(cm):Dài 110 | Rộng 3.5</li>
                        </ul>
                    </small>
                </div>
            </div>
            <div class="col-xs-9">
                <ul class="menu-items">
                    <h2 class="product-cmt">Đánh giá sản phẩm</h2>
                </ul>
                <div style="width:100%;border-top:1px solid silver">
                    <div class="reviews-members pt-4 pb-4">
                        <div class="media">
                            <a href="#"><img alt="User" src="http://bootdey.com/img/Content/avatar/avatar1.png" class="mr-3 rounded-pill"></a>
                            <div class="media-body">
                                <div class="reviews-members-header">
                                    <h6 class="mb-1"><a class="text-black" href="#">linhtrn1205</a></h6>
                                    <div class="review-stars">
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                    </div>
                                    <p class="text-gray">2024-01-07</p>
                                </div>
                                <div class="reviews-members-body">
                                    <p>sản phẩm tuyệt vời!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <a class="text-center w-100 d-block mt-2 pb-5 font-weight-bold" href="#">Xem tất cả đánh giá</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer_contain"></div>
<script>
    $(function () {
        $('#header_contain').load("header.jsp")
        $('#footer_contain').load("footer.jsp")
    })
</script>
</body>
</html>
