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
    <link rel="stylesheet" href="css/productDetail.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/productDetail.js"></script>

</head>
<body>
<div id="header_contain"></div>
<div class="container">
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
            <div class="wrapper row">
                    <div class="image w-50">
                        <div class="preview-pic tab-content">
                            <div class="tab-pane active" id="pic-1"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox.jpg" /></div>
                            <div class="tab-pane" id="pic-2"><img src="" /></div>
                            <div class="tab-pane" id="pic-3"><img src="" /></div>
                            <div class="tab-pane" id="pic-4"><img src="" /></div>
                            <div class="tab-pane" id="pic-5"><img src="" /></div>

                        </div>
                        <ul class="preview-thumbnail nav nav-tabs">
                            <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox.jpg" /></a></li>
                            <li><a data-target="#pic-2" data-toggle="tab"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-1.jpg" /></a></li>
                            <li><a data-target="#pic-3" data-toggle="tab"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-2.jpg" /></a></li>
                            <li><a data-target="#pic-4" data-toggle="tab"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-3.jpg" /></a></li>
                            <li><a data-target="#pic-5" data-toggle="tab"><img src="assets/images/that-lung-nam-cao-cap-FaiaoePOLO-fullbox-4.jpg" /></a></li>

                        </ul>
                    </div>

                    <div class="details col-md-6">
                        <h3 class="product-title">Thắt lưng nam cao cấp FaiaoePOLO</h3>

                        <h4 class="price"><span>120.000₫</span></h4>
                        <div class="rating">
                            <div class="stars">
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                            </div>
                            <span class="review-no">.<strong>100</strong> Đánh giá</span>
                            <span class="vote"><strong>200</strong> Đã bán</span>
                        </div>
                        <div class="section" style="padding-bottom:20px;">
                            <h5 class="title-attr"><small>Số lượng</small></h5>
                            <div>
                                <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                                <input value="1" />
                                <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                            </div>
                        </div>
                        <div class="action d-flex">
                            <button id="addToCartBtn" class="add-to-cart btn btn-default" type="button">Thêm vào giỏ hàng</button>
                            <button  class="buy-now btn btn-default" type="button">Mua ngay</button>

                    </div>
            </div>
            <div class="col-xs-9">
                <ul class="menu-items">
                    <li><h5>Chi tiết sản phẩm</h5></li>
                </ul>
                <div style="width:100%;border-top:1px solid silver">
                    <p style="padding:15px;">
                        <small>
                            Sản phẩm thắt lưng là một phụ kiện thời trang được sử dụng để giữ cho quần áo vững chắc ở vị trí mong muốn và cũng có thể được sử dụng như một phần của trang phục thể hiện phong cách cá nhân.
                        </small>
                    </p>
                    <small>
                        <ul>
                            <li>Chất liệu: Thắt lưng có thể được làm từ nhiều loại chất liệu khác nhau như da, vải, nhựa, kim loại, và các vật liệu tổng hợp. Chất liệu sẽ ảnh hưởng đến vẻ ngoài, độ bền và cảm giác khi sử dụng.</li>
                            <li>Kích thước và chiều dài: Thắt lưng thường có một dây dài có thể điều chỉnh để phù hợp với nhiều kích cỡ vòng eo khác nhau. Kích thước thông thường được ghi trên thẻ sản phẩm hoặc trên đính kèm.</li>
                            <li>Màu sắc và hoa văn: Thắt lưng có thể có nhiều màu sắc và hoa văn khác nhau, từ các màu sắc cơ bản như đen, nâu, xanh đến các màu sắc sặc sỡ hoặc có họa tiết độc đáo.</li>
                        </ul>
                    </small>
                </div>
            </div>
                <div class="col-xs-9">
                    <ul class="menu-items">
                        <li><h5>Đánh giá sản phẩm</h5></li>
                    </ul>
                    <div style="width:100%;border-top:1px solid silver">
                        <p style="padding:15px;">
                            <small>

                            </small>
                        </p>
                        <small>

                        </small>
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
