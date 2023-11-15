<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 11/10/2023
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="css/cart.css">
  <link rel="stylesheet" href="css/base.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>

</head>
<body>
<jsp:include page="header.html"></jsp:include>
<div class="container">
  <div class="small-container cart-page">
    <table>
      <tr>
        <th>Product</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total</th>
      </tr>
      <tr>
        <td>
          <div class="cart-info">
            <img src="assets/images/1.png" alt="">
            <div>
              <p>That lung nam</p>
              <i class="fa-solid fa-trash-can remove-button"></i>
            </div>
          </div>
        </td>
        <td><span class="price">300000</span></td>
        <td>
          <div class="quantity-control">
            <button class="decrement">-</button>
            <div class="quantity-display">1</div>
            <button class="increment">+</button>
          </div>
        </td>
        <td class="totalPricePerItem">300.000</td>
      </tr>
      <tr>
        <td>
          <div class="cart-info">
            <img src="assets/images/thatlungnu.jpg" alt="">
            <div>
              <p>That lung nam</p>
              <i class="fa-solid fa-trash-can remove-button"></i>
            </div>
          </div>
        </td>
        <td><span class="price">300000</span></td>
        <td>
          <div class="quantity-control">
            <button class="decrement">-</button>
            <div class="quantity-display">1</div>
            <button class="increment">+</button>
          </div>
        </td>
        <td class="totalPricePerItem">300.000</td>
      </tr>
      <tr>
        <td>
          <div class="cart-info">
            <img src="assets/images/thatlungtreem.jpg" alt="">
            <div>
              <p>That lung nam</p>
              <i class="fa-solid fa-trash-can remove-button"></i>
            </div>
          </div>
        </td>
        <td><span class="price">300000</span></td>
        <td>
          <div class="quantity-control">
            <button class="decrement">-</button>
            <div class="quantity-display">1</div>
            <button class="increment">+</button>
          </div>
        </td>
        <td class="totalPricePerItem">300.000</td>
      </tr>
      <!-- Add more rows as needed -->
    </table>
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
</div>
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
        const priceElement = display.closest("tr").querySelector("span.price");
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
      const priceElement = row.querySelector("span.price");
      const itemPrice = parseFloat(priceElement.textContent);
      const itemTotal = quantity * itemPrice;
      updateGrandTotalChange(-itemTotal);
      row.remove();

    }

    quantityDisplays.forEach((display, index) => {
      const incrementButton = display.closest("tr").querySelector(".increment");
      const decrementButton = display.closest("tr").querySelector(".decrement");
      const removeButton = display.closest("tr").querySelector(".remove-button");
      const priceElement = display.closest("tr").querySelector("span.price");

      incrementButton.addEventListener("click", () => {
        const currentQuantity = parseInt(display.textContent);
        display.textContent = (currentQuantity + 1).toString();

        // Subtract the current total for this item and then add the updated total
        const currentTotal = parseFloat(totalPricePerItemElements[index].textContent);
        const updatedTotal = currentTotal + parseFloat(priceElement.textContent);
        totalPricePerItemElements[index].textContent = updatedTotal.toFixed(3);

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

      removeButton.addEventListener("click", () => {
        const row = display.closest("tr");
        removeItem(row);
      });
    });

    updateTotalPricePerItem();
  });

</script>

</body>
</html>
