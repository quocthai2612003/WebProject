<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
<%--Header--%>
<<<<<<< HEAD
=======
<jsp:include page="header.html"></jsp:include>
>>>>>>> main
<div id="content">
    <div class="container">
        <div class="gird">
            <div class="menu__category">
                <h3 class="menu__category--title">Dây nịt</h3>
                <%
                    String category = request.getParameter("category") != null ? request.getParameter("category")
                            : "day-nit-da";
                    String img;
                    if (category.equals("day-nit-da")) {
                        img = "./img/product_img/day-nit-da.jpg";
                    } else if (category.equals("day-nit-vai")) {
                        img = "./img/product_img/day-nit-vai.jpg";
                    } else if (category.equals("day-nit-nam")) {
                        img = "./img/product_img/day-nit-nam.jpg";
                    } else if (category.equals("day-nit-nu")){
                        img = "./img/product_img/day-nit-nu.jpg";
                    } else {
                        img = "./img/product_img/day-nit-tre-em.jpg";
                    }
                %>
                <ul class="list__category">
                    <li class="list__category--item"><a href="./product.jsp?category=day-nit-da&page=1">Dây nịt da</a></li>
                    <li class="list__category--item"><a href="./product.jsp?category=day-nit-vai&page=1">Dây nịt vải</a></li>
                    <li class="list__category--item"><a href="./product.jsp?category=day-nit-nam&page=1">Dây nịt dành cho nam</a></li>
                    <li class="list__category--item"><a href="./product.jsp?category=day-nit-nu&page=1">Dây nịt dành cho nữ</a></li>
                    <li class="list__category--item"><a href="./product.jsp?category=day-nit-tre-em&page=1">Dây nịt dành cho trẻ em</a></li>
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
                            <a href="#"><img class="product-img" src="<%=img%>" alt=""></a>
                            <p class="product-title"><%=listProduct.get(i).getTitle()%> <%=i+1%>
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
<<<<<<< HEAD
                    <a href="./product.jsp?category=<%=category%>&page=<%=pageNumber-1%>" class="other-page previou-page"><span>Previou</span></a>
                    <%}%>
                    <%for (int i = 1; i <= pageEnd; i++) {%>
                    <% if (i == pageNumber) {%>
                    <a href="./product.jsp?category=<%=category%>&page=<%=i%>" class="other-page"><span
                            style="color: #ee4d2d;font-weight: 600;"><%=i%></span></a>
                    <%} else {%>
                    <a href="./product.jsp?category=<%=category%>&page=<%=i%>" class="other-page"><span><%=i%></span></a>
                    <%}%>
                    <%}%>
                    <% if (pageNumber > 1 && pageNumber < pageEnd) {%>
                    <a href="./product.jsp?category=<%=category%>&page=<%=pageNumber+1%>" class="other-page next-page"><span>Next</span></a>
=======
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
>>>>>>> main
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

