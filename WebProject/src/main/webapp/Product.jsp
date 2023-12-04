<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.ProductDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="./css/base.css">
</head>
<body>
<div id="content">
    <div class="container">
        <div class="gird">
            <div class="menu__category">
                <h3 class="menu__category--title">Dây nịt</h3>
                <ul class="list__category">
                    <li class="list__category--item"><a href="#">Dây nịt vải</a></li>
                    <li class="list__category--item"><a href="#">Dây nịt da</a></li>
                    <li class="list__category--item"><a href="#">Dây nịt nam</a></li>
                    <li class="list__category--item"><a href="#">Dây nịt nữ</a></li>
                    <li class="list__category--item"><a href="#">Dây nịt trẻ em</a></li>
                </ul>
            </div>

            <div class="menu__product">
                <div class="filter-horizon">
                    <div class="filter-price">
                        <span>Bộ lọc <i class="fa-solid fa-filter"></i></span>
                        <ul class="filter-price-menu">
                            <li class="filter-price-title">Chọn theo giá</li>
                            <li class ="price"><a href="#">Nhỏ hơn 50.000</a></li>
                            <li class ="price"><a href="#">Từ 50.000 đến 100.000</a></li>
                            <li class ="price"><a href="#">Từ 100.000 đến 300.000</a></li>
                            <li class ="price"><a href="#">Từ 300.000 đến 500.000</a></li>
                            <li class ="price"><a href="#">Lớn hơn 500.000</a></li>
                        </ul>
                    </div>
                    <div class="box-filter">
                        <span>Sắp xếp theo</span>
                        <div class="sort-follow">
                            <span>Giá</span>
                            <i class="fa-solid fa-chevron-down"></i>
                            <ul class="sort-menu">
                                <li><a href="#">Mặc định</a></li>
                                <li><a href="#">Giá từ thấp đến cao</a></li>
                                <li><a href="#">Giá từ cao đến thấp</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="list__product">
                    <div class="product-item">
                        <div class="product">
                            <a href="./productDetail.html"><img class="product-img" src="./assets/product_img/day-nit-vai.jpg" alt=""></a>
                            <p class="product-title">Dây nịt da cá sấu</p>
                            <p class="product-price">Giá: 180.000</p>
                            <a href="./productDetail.html" class="product-order">Xem chi tiết</a>
                        </div>
                    </div>
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
</body>
</html>