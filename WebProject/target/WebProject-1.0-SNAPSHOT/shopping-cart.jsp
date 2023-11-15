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
  <link rel="stylesheet" href="">
</head>
<body>
<div class="container">
  <div class="small-container cart-page">
    <c:set var="grandTotal" value="0" scope="session" /> <!-- Initialize grandTotal in session scope -->
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
            <img src="1.png" alt="">
            <div>
              <p>That lung nam</p>

              <br>
              <i class="fa-solid fa-trash-can remove-button"></i></a>
            </div>
          </div>
        </td>
        <td><small>Gia : 300.000</small></td>
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
            <img src="thatlungnu.jpg" alt="">
            <div>
              <p>That lung nam</p>
              <small>Gia : 300.000</small>
              <br>
              <i class="fa-solid fa-trash-can remove-button"></i></a>
            </div>
          </div>
        </td>
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
            <img src="thatlungtreem.jpg" alt="">
            <div>
              <p>That lung nam</p>
              <small>Gia : 300.000</small>
              <br>
              <i class="fa-solid fa-trash-can remove-button"></i></a>
            </div>
          </div>
        </td>
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
          <td id="grandTotal">900.000</td>
        </tr>
      </table>
    </div>
  </div>
</div>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const quantityDisplays = document.querySelectorAll(".quantity-display");
    const totalPricePerItemElements = document.querySelectorAll(".totalPricePerItem");
    let grandTotal = 0; // Declare grandTotal as a global variable

    const grandTotalElement = document.getElementById("grandTotal");

    function updateTotalPricePerItem() {
      grandTotal = 0; // Reset grandTotal before recalculating
      quantityDisplays.forEach((display, index) => {
        const quantity = parseInt(display.textContent);
        const priceElement = display.closest("tr").querySelector("span.price");
        const price = parseFloat(priceElement.textContent);
        const totalItemPrice = quantity * price;
        totalPricePerItemElements[index].textContent = totalItemPrice.toFixed(3);
        grandTotal += totalItemPrice;
      });

      grandTotalElement.textContent = grandTotal.toFixed(3);
    }

    function updateGrandTotalChange(changeAmount) {
      grandTotal += changeAmount;
      grandTotalElement.textContent = grandTotal.toFixed(3);
    }

    quantityDisplays.forEach((display, index) => {
      const incrementButton = display.closest("tr").querySelector(".increment");
      const decrementButton = display.closest("tr").querySelector(".decrement");
      const removeButton = display.closest("tr").querySelector(".remove-button");
      const priceElement = display.closest("tr").querySelector("span.price");

      incrementButton.addEventListener("click", () => {
        display.textContent = (parseInt(display.textContent) + 1).toString();
        updateTotalPricePerItem();
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

      function removeItem(row) {
        const itemPrice = parseFloat(priceElement.textContent);
        const quantityDisplay = row.querySelector(".quantity-display");
        const quantity = parseInt(quantityDisplay.textContent);
        const itemTotal = itemPrice * quantity;
        updateGrandTotalChange(-itemTotal);
        row.remove();
        updateTotalPricePerItem();
      }
    });

    updateTotalPricePerItem();
  });

</script>
</body>
</html>
