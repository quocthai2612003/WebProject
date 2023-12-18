<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>
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
<%
    List<Product> productList = (List<Product>) request.getAttribute("productList");
    if (productList == null) {
        productList = new ArrayList<Product>();
    }
    int pageCurrent = (int) request.getAttribute("page");
    int totalPage = (int) request.getAttribute("totalPage");
    int productOnPages = pageCurrent * 12 > productList.size() ? productList.size() : pageCurrent * 12;
    String category = (String) request.getAttribute("category");
    String img = (String) request.getAttribute("img");
%>
<div id="content">
    <div class="container">
        <div class="gird">
            <div class="menu__category">
                <h3 class="menu__category--title">Dây nịt</h3>
                <ul class="list__category">
                    <li class="list__category--item"><a href="./product?category=day-nit-da&page=1">Dây nịt da</a></li>
                    <li class="list__category--item"><a href="./product?category=day-nit-vai&page=1">Dây nịt vải</a>
                    </li>
                    <li class="list__category--item"><a href="./product?category=day-nit-nam&page=1">Dây nịt dành cho
                        nam</a></li>
                    <li class="list__category--item"><a href="./product?category=day-nit-nu&page=1">Dây nịt dành cho
                        nữ</a></li>
                    <li class="list__category--item"><a href="./product?category=day-nit-tre-em&page=1">Dây nịt dành cho
                        trẻ em</a></li>
                </ul>
            </div>

            <div class="menu__product">
                <div class="filter-horizon">
                    <div class="filter-price">
                        <span>Bộ lọc <i class="fa-solid fa-filter"></i></span>
                        <ul class="filter-price-menu">
                            <li class="filter-price-title">Chọn theo giá</li>
                            <li class="price"><a href="#">Nhỏ hơn 50.000</a></li>
                            <li class="price"><a href="#">Từ 50.000 đến 100.000</a></li>
                            <li class="price"><a href="#">Từ 100.000 đến 300.000</a></li>
                            <li class="price"><a href="#">Từ 300.000 đến 500.000</a></li>
                            <li class="price"><a href="#">Lớn hơn 500.000</a></li>
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
                    <% for (int i = (pageCurrent - 1) * 12; i < productOnPages; i++) { %>
                    <div class="product-item">
                        <div class="product">
                            <a href="./productDetail.html"><img class="product-img"
                                                                src="<%=img%>" alt=""></a>
                            <p class="product-title"><%=productList.get(i).getName()%>
                            </p>
                            <p class="product-price">Giá: <%=productList.get(i).getPrice()%>
                            </p>
                            <a href="./productDetail.html" class="product-order">Xem chi tiết</a>
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="pagination">
                    <% if (pageCurrent > 1) {%>
                    <a href="./product?category=<%=category%>&page=<%=pageCurrent-1%>"
                       class="other-page previou-page"><span>Previou</span></a>
                    <%}%>

                    <% for (int i = 1; i <= totalPage; i++) {%>
                        <% if (i == pageCurrent) {%>
                            <a href="/product?category=<%=category%>&page=<%=i%>" style = "color: red;" class="other-page"><span><%=i%></span></a>
                        <%} else {%>
                            <a href="/product?category=<%=category%>&page=<%=i%>" class="other-page"><span><%=i%></span></a>
                        <%}%>
                    <%}%>
                    <% if (pageCurrent > 1 && pageCurrent < totalPage) {%>
                    <a href="./product?category=<%=category%>&page=<%=pageCurrent+1%>"
                       class="other-page next-page"><span>Next</span></a>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
