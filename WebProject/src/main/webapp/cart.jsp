<%@ page import="Beans.Products" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="Beans.ShoppingCart" %>
<%@ page import="Beans.CartItems" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

<div class="container">
    <div class="small-container cart-page">
        <table class="cart-table">
            <tr>
                <th scope="col">Stt</th>
                <th scope="col">Sản phẩm</th>
                <th scope="col"></th>
                <th scope="col">Mã sản phẩm</th>
                <th scope="col">Giá</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Thành tiền</th>
                <th scope="col"></th>
            </tr>
            <%
                NumberFormat nf = NumberFormat.getInstance();
                List<CartItems> sanPhams = (List<CartItems>) request.getAttribute("list-sp");
                double tongGiaTri = 0;

                for (int i = 0; i < sanPhams.size(); i++) {
                    CartItems sp = sanPhams.get(i);
                    tongGiaTri += sp.getTotalPrice();
            %>
            <td><%= i + 1 %></td>
                <td>
                    <div>
                        <p><%= sp.getProduct().getName() %></p>
                    </div>
                </td>
                <td>
                    <div class="cart-info">
                        <img src="assets/images/thatlungtreem.jpg" alt="">
                    </div>
                </td>
                <td>
                    <div>
                        <p><%= sp.getProduct().getId() %></p>
                    </div>
                </td>
                <td>
                    <div>
                        <p><%= sp.getProduct().getPrice() %></p>
                    </div>
                </td>
                <td>
                    <div class="change-quantity">
                        <a href="QuantityServlet?thuchien=tang&masanpham=<%= sp.getProduct().getId()%>" class="cart-btn-plus" style="font-size: 2.4rem; padding: 8px; border: 4px; cursor: pointer;">+</a>
                        <input type="number" value="<%= sp.getQuantity()%>" name="quantity" disabled>
                        <a href="QuantityServlet?thuchien=giam&masanpham=<%= sp.getProduct().getId()%>" class="cart-btn-minus" style="font-size: 2.4rem; padding: 8px;border: 4px; cursor: pointer; font-weight: 800;">-</a>
                    </div>
                </td>
                <td class="totalPricePerItem"><%= nf.format(sp.getTotalPrice()) %>đ</td>
            <td>
                <a href="DeleteServlet?masanpham=<%=sp.getProduct().getId()%>">Xóa</a>
<%--                <i class="fas fa-trash-alt"></i> <!-- Font Awesome trash icon -->--%>
            </a>
            </td>
            </tr>
            <% } // End of for loop %>
        </table>
        <!-- Other HTML content... -->
    </div>
    <div class="total-price">
        <table>
            <tr>
                <td>
                    Tổng số tiền
                </td>
                <td id="grandTotal"> <%= nf.format(tongGiaTri)%>đ</td>
            </tr>
        </table>
    </div>
</div>

<div class="buy-button-wraper">
    <a href="another-page.html" class="button-link">Mua</a>
</div>
    <div id="footerContainer"></div>
</body>
</html>
