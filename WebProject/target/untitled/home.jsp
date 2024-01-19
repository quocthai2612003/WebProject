<%@ page import="Beans.Slider" %>
<%@ page import="java.util.List" %>
<%@ page import="Beans.Products" %>
<%@ page import="Service.ProductService" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="Beans.ShoppingCart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.Account" %>

<%
    Account account = (Account) session.getAttribute("account");
    List<Slider> sliders = (List<Slider>) request.getAttribute("products");
    ShoppingCart gh = (ShoppingCart) session.getAttribute("cart");
    if (gh == null) gh = new ShoppingCart();
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" xmlns:D="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/base.css">
    <!--    Font-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.4.2/js/all.js" crossorigin="anonymous"></script>
    <!--   slick-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"
            integrity="sha512-HGOnQO9+SP1V92SrtZfjqxxtLmVzqZpjFFekvzZVWoiASSQgSr4cw9Kqd2+l8Llp4Gm0G8GIFJ4ddwZilcdb8A=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css"
          integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"
          integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <!--    Slider-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
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
            <a class="nav-icon position-relative text-decoration-none" href="CartServlet">
                <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">
            <%= gh.getSize() %>
        </span>
            </a>
            <%-- Check if the user is authenticated --%>
            <% if (account == null) { %>
            <a class="nav-icon position-relative text-decoration-none" href="Login.jsp">
                <i class="fa fa-fw fa-user text-dark mr-3"></i>
                <!-- Add the label or badge if needed -->
            </a>
            <% } else { %>
            <a class="nav-icon position-relative text-decoration-none" href="users-page.jsp">
                <i class="fa fa-fw fa-user text-dark mr-3"></i>
                <!-- Add the label or badge if needed -->
            </a>
            <% } %>
        </div>
    </div>

    </div>
</nav>
<%--<jsp:include page="header.jsp" />--%>
<%-- Check if products is not null and not empty --%>
<% if (sliders != null && !sliders.isEmpty()) { %>
<div id="carouselExampleIndicators" class="carousel slide" style="padding-bottom: 15px" data-bs-ride="carousel">
    <div class="carousel-inner">
        <% for (int i = 0; i < sliders.size(); i++) {
            Slider slider = sliders.get(i);%>
        <div class="carousel-item <%= i == 0 ? " active" : "" %>">
            <img src="<%= slider.getImg_link() %>" class="d-block w-100" alt="...">
        </div>
        <% } %>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
    </button>
</div>
<% } else { %>
<p>No slider available.</p>
<% } %>
</section>
<%
    List<Products> productsList = request.getAttribute("listProduct") == null ? new ArrayList<>() : (List<Products>) request.getAttribute("listProduct");
    NumberFormat nf = NumberFormat.getInstance();
%>

<div class="container" id="Nam-Container">
    <div class="container" id="Nam-Container">
        <div class="top-prodcut">
            <div class="title">Nam</div>
            <div class="menu-item">
                <div class="menu-item"><a href="">Xem tất cả</a></div>
            </div>
        </div>
        <div class="bottom-product">
            <div class="left-menu-item">
                <img src="assets/images/nam1.jpg" alt="">
            </div>
            <div class="right-menu-list">
                <div class="slider-product">
                    <% for (Products products : productsList) { %>
                    <div class="product-item">
                        <div class="product">
                            <a href="#"><img class="product-img" src="assets/images/product_img/TL001(1).png" alt=""></a>
                            <p class="product-title">
                                <%= products.getName().length() > 20 ? products.getName().substring(0, 20) + "..." : products.getName() %>
                            </p>
                            <div class="product-detail">
                                <p class="product-price"><%= nf.format(products.getPrice()) %>đ</p>
                                <div class="order">
                                    <a href="AddToCartServlet?masanpham=<%=products.getId()%>" class="btn-add-to-cart" style="text-decoration: none">Thêm vào giỏ hàng</a>
                                </div>
                                <span class="rating">
                                    <span class="rating-value"><%= products.getRating() %></span>
                                    <i class="fa-solid fa-star"></i>
                                </span>
                            </div>
                            <a href="productDetail.html" class="product-order">Xem chi tiết</a>

                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
<%
    List<Products> productsNu = new ProductService().findByCategory(2);
%>

<div class="container" id="Nam-Container">
    <div class="top-prodcut">
        <div class="title">Nữ</div>
        <div class="menu-item">
            <div class="menu-item"><a href="">Xem tất cả</a></div>
        </div>
    </div>
    <div class="bottom-product">
        <div class="left-menu-item">
            <img src="assets/images/thatlungnu.jpg" alt="">
        </div>
        <div class="right-menu-list">
            <div class="slider-product">
                <% for (Products products : productsNu) { %>
                <div class="product-item">
                    <div class="product">
                        <a href="#"><img class="product-img" src="assets/images/product_img/TL302(1).png" alt=""></a>
                        <p class="product-title"><%= products.getName() %></p>
                        <div class="product-detail">
                            <p class="product-price"><%= products.getPrice() %></p>
                            <button type="button" class="btn btn-light rounded-circle">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </button>
                            <span class="rating">
<%--                                    <span class="rating-value"><%= products.getRating() %></span>--%>
                                    <i class="fa-solid fa-star"></i>
                                </span>
                        </div>
                        <a href="productDetail.html" class="product-order">Xem chi tiết</a>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>
<script>
    $('.slider-product').slick({
        dots: true,
        infinite: false,
        speed: 300,
        slidesToShow: 3,
        slidesToScroll: 3,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    infinite: true,
                    dots: true
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });

</script>
</body>
</html>