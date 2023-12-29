<%@ page import="Beans.Product" %>
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

<div id="headerContainer"></div>
<div class="container">
    <%
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
        if(shoppingCart==null){
            response.sendRedirect("ProductController");
        }
        List<CartItems> cartItems = shoppingCart.getCartItemList();
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance();
        String e = request.getAttribute("error")==null?"":(String) request.getAttribute("error");
    %>
    <div class="small-container cart-page">
        <table class="cart-table">
            <tr>
                <th scope="col">Stt</th>
                <th scope="col">Sản phẩm</th>
                <th scope="col"></th>
                <th scope="col">Giá</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Thành tiền</th>
                <th scope="col"></th>
            </tr>
            <%
                int count = 0;
                for (CartItems cartItem : cartItems) {
            %>
            <tr>
                <td><%=count++%></td>
                <td>
                    <div>
                        <p><%=cartItem.getProduct().getName() %></p>
                    </div>
                </td>
                <td>
                    <div class="cart-info">
                        <img src="assets/images/thatlungtreem.jpg" alt="">
                    </div>
                </td>
                <td>
                    <div>
                        <p><%= cartItem.getProduct().getPrice() %></p>
                    </div>
                </td>
                <td>
                    <div class="quantity-control">
                        <button class="decrement">-</button>
                        <div class="quantity-display">1</div>
                        <button class="increment">+</button>
                    </div>
                </td>
                <td><%=numberFormat.format(cartItem.getTotalPrice())%></td>

                <!-- Add more table columns based on your Product properties -->
            </tr>
            <% } // End of while loop %>
        </table>
        <!-- Other HTML content... -->
    </div>
    <%
    } else {
        // Handle the case where the shopping cart is empty
    %>
    <div class="small-container cart-page">
        <p>Your shopping cart is empty.</p>
    </div>
    <%
        }
    %>
        <div class="total-price">
            <table>
                <tr>
                    <td>
                        Tổng số tiền
                    </td>
                    <td id="grandTotal"></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="buy-button-wraper">
        <a href="another-page.html" class="button-link">Mua</a>
    </div>
    </div>
    <div id="footerContainer"></div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const quantityDisplays = document.querySelectorAll(".quantity-display");
        const totalPricePerItemElements = document.querySelectorAll(".totalPricePerItem");
        let grandTotal = 0;

        const grandTotalElement = document.getElementById("grandTotal");

        function updateTotalPricePerItem() {
            grandTotal = 0;
            quantityDisplays.forEach((display, index) => {
                const quantity = parseInt(display.textContent);
                const priceElement = display.closest("tr").querySelector("td:nth-child(4) p"); // Adjust the selector based on your HTML structure
                const price = parseFloat(priceElement.textContent);
                const totalItemPrice = quantity * price;
                totalPricePerItemElements[index].textContent = totalItemPrice.toFixed(0);
                grandTotal += totalItemPrice;
            });

            grandTotalElement.textContent = grandTotal.toFixed(0);
        }

        function updateGrandTotalChange(changeAmount) {
            grandTotal += changeAmount;
            grandTotalElement.textContent = grandTotal.toFixed(0);
        }

        function removeItem(row) {
            const quantityDisplay = row.querySelector(".quantity-display");
            const quantity = parseInt(quantityDisplay.textContent);
            const priceElement = row.querySelector("td:nth-child(4) p"); // Adjust the selector based on your HTML structure
            const itemPrice = parseFloat(priceElement.textContent);
            const itemTotal = quantity * itemPrice;
            updateGrandTotalChange(-itemTotal);
            row.remove();
        }

        quantityDisplays.forEach((display, index) => {
            const incrementButton = display.closest("tr").querySelector(".increment");
            const decrementButton = display.closest("tr").querySelector(".decrement");
            const priceElement = display.closest("tr").querySelector("td:nth-child(4) p"); // Adjust the selector based on your HTML structure

            incrementButton.addEventListener("click", () => {
                const currentQuantity = parseInt(display.textContent);
                display.textContent = (currentQuantity + 1).toString();

                // Subtract the current total for this item and then add the updated total
                const currentTotal = parseFloat(totalPricePerItemElements[index].textContent);
                const updatedTotal = currentTotal + parseFloat(priceElement.textContent);
                totalPricePerItemElements[index].textContent = updatedTotal.toFixed(0);

                updateGrandTotalChange(parseFloat(priceElement.textContent));
            });

            decrementButton.addEventListener("click", () => {
                const currentQuantity = parseInt(display.textContent);
                if (currentQuantity > 1) {
                    display.textContent = (currentQuantity - 1).toString();
                    updateTotalPricePerItem();
                    updateGrandTotalChange(-parseFloat(priceElement.textContent));
                }
            });
        });

        updateTotalPricePerItem();
    });
</script>

</body>
</html>
