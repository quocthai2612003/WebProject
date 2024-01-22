<%@ page import="model.Account" %>
<%@ page import="service.AccountService" %>
<%@ page import="service.ProductService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="./css/admin.css">
</head>
<body>
<%
    Account account = session.getAttribute("account") == null ? new Account() : (Account) session.getAttribute("account");
    int totalAccounts = request.getAttribute("totalAccounts") == null ? 0 : (int) request.getAttribute("totalAccounts");
    int totalProducts = request.getAttribute("totalProducts") == null ? 0 : (int) request.getAttribute("totalProducts");
    int totalOrders = request.getAttribute("totalOrders") == null ? 0 : (int) request.getAttribute("totalOrders");
    int totalReviews = request.getAttribute("totalReviews") == null ? 0 : (int) request.getAttribute("totalReviews");
    int quantityCategory = request.getAttribute("quantityCategory") == null ? 0 : (int) request.getAttribute("quantityCategory");
    String date = request.getAttribute("date").toString();
    String[] nameCategorys = request.getAttribute("nameCategorys") == null ? new String[0] : (String[]) request.getAttribute("nameCategorys");
    int[] quantityProductByCategorys = request.getAttribute("quantityProductByCategorys") == null ? new int[0] : (int[]) request.getAttribute("quantityProductByCategorys");
    int[] quantityProductSoldByCategorys = request.getAttribute("quantityProductSoldByCategorys") == null ? new int[0] : (int[]) request.getAttribute("quantityProductSoldByCategorys");
    int[] revenueOfCategorys = request.getAttribute("revenueOfCategorys") == null ? new int[0] : (int[]) request.getAttribute("revenueOfCategorys");
%>
<div id="main">
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
                    <a href="./admin" class="active">
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
                    <a href="./managerOrder?page=1">
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
            <div class="statistical">
                <div class="statistical-item">
                    <p>Tổng người dùng</p>
                    <span><%=totalAccounts%></span>
                </div>
                <div class="statistical-item">
                    <p>Tổng số lượng sản phẩm</p>
                    <span><%=totalProducts%></span>
                </div>
                <div class="statistical-item">
                    <p>Tổng số đơn đặt hàng</p>
                    <span><%=totalOrders%></span>
                </div>
                <div class="statistical-item">
                    <p>Tổng số lượt bình luận</p>
                    <span><%=totalReviews%></span>
                </div>
            </div>
            <div class="contain">
                <div class="title">
                    <h2>Doanh thu từng loại thắt lưng</h2>
                </div>
                <form action="" method="post" style="
                    display: flex;
                    align-items: center;
                    padding: 20px 0px;">
                    <div class="date"><input type="date" name="date" value="<%=date%>" id=""></div>
                    <button style="margin-left: 10px; cursor: pointer;">Xác nhận</button>
                </form>
                <div class="revenue">
                    <div class="revenue-chart">
                        <canvas id="myChart" style="width:100%;max-width:850px; height: 450px"></canvas>
                    </div>
                    <div class="revenue-detail">
                        <div class="revenue-detail-title">
                            <h4>Thống kê số lượng sản phẩm chi tiết</h4>
                        </div>
                        <% for (int i = 0; i < quantityCategory; i++) {%>
                        <div class="detail-quanlity">
                            <p><%=nameCategorys[i]%> bán được / tổng sản phẩm</p>
                            <p><%=quantityProductSoldByCategorys[i]%>/<%=quantityProductByCategorys[i]%>
                            </p>
                            <div class="detail">
                                <div class="quanlity-sold"
                                     style="width: calc((<%=quantityProductSoldByCategorys[i]%>/<%=quantityProductByCategorys[i]%>)*100%);"></div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script>
    var xValues = [
        <%for(String name: nameCategorys) {%>
            "<%=name%>",
        <%}%>
    ];
    var yValues = [
        <% for(int revenue: revenueOfCategorys) {%>
            <%=revenue%>,
        <%}%>
    ];
    var barColors = ['Red', 'Green', 'Blue', 'Yellow', 'Orange',
        'Purple', 'Pink', 'Brown', 'Cyan', 'Magenta',
        'Teal', 'Lime', 'Indigo', 'Maroon', 'Navy',
        'Olive', 'Silver', 'Aqua', 'Fuchsia', 'Gray'];

    new Chart("myChart", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues
            }]
        },
        options: {
            legend: {display: false},
            title: {
                display: true,
                text: "Doanh thu"
            }
        }
    });
</script>
</body>
</html>
