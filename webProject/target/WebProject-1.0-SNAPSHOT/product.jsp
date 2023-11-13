<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="./css/base.css">
    <link rel="shortcut icon" href="#">
</head>
<body>
<%--Header--%>
<jsp:include page="header.html"></jsp:include>
<div id="content">
    <div class="container">
        <div class="gird">
            <div class="menu__category">
                <h3 class="menu__category--title">Dây nịt</h3>
                <ul class="list__category">
                    <li class="list__category--item"><a href="#">Dây nịt da cá sấu</a></li>
                    <li class="list__category--item"><a href="#">Dây nịt da cá sấu</a></li>
                    <li class="list__category--item"><a href="#">Dây nịt da cá sấu</a></li>
                    <li class="list__category--item"><a href="#">Dây nịt da cá sấu</a></li>
                    <li class="list__category--item"><a href="#">Dây nịt da cá sấu</a></li>
                </ul>
            </div>

            <div class="menu__product">
                <div class="filter-horizon">
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
                    <%
                        List<Product> listProduct = Product.getList();
                        int limitProductInPage = 12;
                        int pageEnd = (int) Math.ceil(listProduct.size() / limitProductInPage);
                        if (listProduct.size() % limitProductInPage != 0) pageEnd++;
                        int pageNumber = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
                        int displayProduct = limitProductInPage * pageNumber > listProduct.size() ? listProduct.size() : limitProductInPage * pageNumber;
                    %>
                    <% for (int i = (pageNumber - 1) * limitProductInPage; i < displayProduct; i++) {%>
                    <div class="product-item">
                        <div class="product">
                            <a href="#"><img class="product-img" src="./img/1.png" alt=""></a>
                            <p class="product-title"><%=listProduct.get(i).getTitle()%> <%=i%>
                            </p>
                            <p class="product-price"><%=listProduct.get(i).getPrice()%>
                            </p>
                            <a href="#" class="product-order">Xem chi tiết</a>
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="pagination">
                    <% if (pageNumber > 1) {%>
                    <a href="/WebProject/product.jsp?page=<%=pageNumber-1%>" class="other-page"><span>Previou</span></a>
                    <%}%>
                    <%for (int i = 1; i <= pageEnd; i++) {%>
                    <% if (i == pageNumber) {%>
                    <a href="/WebProject/product.jsp?page=<%=i%>" class="other-page"><span
                            style="color: #ee4d2d;font-weight: 600;"><%=i%></span></a>
                    <%} else {%>
                    <a href="/WebProject/product.jsp?page=<%=i%>" class="other-page"><span><%=i%></span></a>
                    <%}%>
                    <%}%>
                    <% if (pageNumber > 1 && pageNumber < pageEnd) {%>
                    <a href="/WebProject/product.jsp?page=<%=pageNumber+1%>" class="other-page"><span>Next</span></a>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
