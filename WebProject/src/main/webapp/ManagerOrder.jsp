<%@ page import="Model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Account" %>
<%@ page import="Model.Order_detail" %>
<%@ page import="Service.ProductService" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="./css/admin.css">
</head>
<body>
<%
    Order order = request.getAttribute("order") == null ? new Order() : (Order) request.getAttribute("order");
    Account account = session.getAttribute("account") == null ? new Account() : (Account) session.getAttribute("account");
    String id = request.getAttribute("id") == null ? "" : request.getAttribute("id").toString();
    List<Order_detail> orderDetailList = request.getAttribute("orderDetailList") == null ? new ArrayList<>() :(List<Order_detail>) request.getAttribute("orderDetailList");
    int totalPrice = request.getAttribute("totalPrice") == null ? 0 : (int) request.getAttribute("totalPrice");
    int totalPage = request.getAttribute("totalPage") == null ? 0 : (int) request.getAttribute("totalPage");
    int pageCurrent = request.getAttribute("pageCurrent") == null ? 1 : Integer.parseInt(request.getAttribute("pageCurrent").toString());
    String search = request.getAttribute("search") == null ? "" : "&search=" + request.getAttribute("search").toString();
    List<Order> orderList = request.getAttribute("orderList") == null ? new ArrayList<>() : (List<Order>) request.getAttribute("orderList");
    ProductService ps = request.getAttribute("ps") == null ? ProductService.getInstance() : (ProductService) request.getAttribute("ps");
    Map<String, String> listImageThumbnail = ps.selectImageThumbnail();
    NumberFormat nf = NumberFormat.getInstance();
%>
<div id="id">
    <div id="admin">
        <div class="left">
            <div class="menu">
                <div class="menu-title">
                    <h2 class="shop-name">PLQ SHOP</h2>
                </div>
                <div class="shop-user">
                    <p>Xin chào, <%=account.getFullname()%></p>
                </div>
                <div class="menu-item">
                    <a href="./admin">
                        <div class="icon"><i class="fa-solid fa-house-chimney"></i></div>
                        <p class="menu-content">Thống kê</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./managerAccount?page=1">
                        <div class="icon"><i class="fa-solid fa-desktop"></i></div>
                        <p class="menu-content">Quản lý tài khoản</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./managerProduct?page=1">
                        <div class="icon"><i class="fa-regular fa-calendar-days"></i></div>
                        <p class="menu-content">Quản lý sản phẩm</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./managerOrder?page=1" class ="active">
                        <div class="icon"><i class="fa-solid fa-clipboard"></i></div>
                        <p class="menu-content">Quản lý đơn hàng</p>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="./managerReview?page=1">
                        <div class="icon"><i class="fa-solid fa-comment"></i></div>
                        <p class="menu-content">Quản lý bình luận</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="contain">
                <div class="title">
                    <h2>Quản lý đơn hàng</h2>
                </div>
                <div class="manager">
                    <div class="manager-search">
                        <form action="./managerOrder" method="post">
                            <div class="search">
                                <input type="text" name = "search" class="search" autocomplete ="off" placeholder="Tìm kiếm">
                                <button type="submit" class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>
                    </div>
                    <div class="manager-infor">
                        <table>
                            <thead>
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Ngày đặt hàng</th>
                                <th>Ngày giao hàng</th>
                                <th>địa chỉ</th>
                                <th>số điện thoại</th>
                                <th>Trạng thái</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                                <% for (Order o : orderList) {%>
                                <tr>
                                <th><%=o.getId()%></th>
                                <th><%=o.getFullname()%></th>
                                <th><%=o.getDateBuy()%></th>
                                <th><%=o.getDateArrival()%></th>
                                <th><%=o.getAddress()%></th>
                                <th><%=o.getNumberPhone()%></th>
                                <th>
                                    <%if (o.getStatus() == 0) {%>
                                        Chưa giao hàng
                                    <%} else if (o.getStatus() == 1) {%>
                                        Đang giao hàng
                                    <%} else {%>
                                        Đã giao hàng
                                    <%}%>
                                </th>
                                <th>
                                    <form action="./managerOrder" method="post">
                                        <input type="hidden" value= "<%=o.getId()%>" name = "id">
                                        <button type="submit" class="btn-xemChiTiet">Xem chi tiết</button>
                                    </form>
                                </th>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div class="pagination">
                        <% if (pageCurrent > 1) {%>
                        <a href="./managerOrder?page=<%=pageCurrent-1%><%=search%>"
                           class="other-page previou-page"><span>Previou</span></a>
                        <%}%>

                        <% for (int i = 1; i <= totalPage; i++) {%>
                        <% if (i == pageCurrent) {%>
                        <a href="/managerOrder?page=<%=i%><%=search%>" style = "color: red;" class="other-page"><span><%=i%></span></a>
                        <%} else {%>
                        <a href="/managerOrder?page=<%=i%><%=search%>" class="other-page"><span><%=i%></span></a>
                        <%}%>
                        <%}%>
                        <% if (pageCurrent > 1 && pageCurrent < totalPage) {%>
                        <a href="./managerOrder?page=<%=pageCurrent+1%><%=search%>"
                           class="other-page next-page"><span>Next</span></a>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<% if (!id.isEmpty()) {%>
<div id="myModal" style="display: flex" class="modal">
    <div class="modal-content" style="width: 600px;">
        <div class="btn-close" onclick="closeModal()"><span class="close">&times;</span></div>
        <div style="margin-top: 40px">
            <h4>Tên khách hàng: <%=order.getFullname()%></h4>
            <h4>Mã đơn hàng: <%=order.getId()%></h4>
            <table>
                <thead>
                <tr>
                    <th>Mã sản phẩm</th>
                    <th>Hình ảnh</th>
                    <th>Số lượng</th>
                    <th>Giá</th>
                </tr>
                </thead>
                <tbody>
                    <% for (Order_detail od : orderDetailList) {%>
                    <tr>
                        <th><%=od.getIdProduct()%></th>
                        <th>
                            <div class="product-img"><img src="<%=listImageThumbnail.get(od.getIdProduct())%>" alt=""></div>
                        </th>
                        <th><%=od.getQuantity()%></th>
                        <th><%=nf.format(od.getPrice())%></th>
                    </tr>
                <%}%>
                </tbody>
            </table>
            <div><p style="margin-top: 40px; float: right;">Tổng giá đơn hàng: <%=nf.format(totalPrice)%></p></div>
        </div>
    </div>
</div>
<%}%>
</body>
<script>
    function openModal() {
        document.getElementById("myModal").style.display = "flex";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }
</script>
</html>
