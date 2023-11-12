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
</head>
<body>
<div class="container">
  <div class="small-container cart-page">
    <table>
      <tr>
        <th>Product</th>
        <th>Quantity</th>
        <th>Total</th>
      </tr>
      <tr>
        <td>
          <div class="cart-info">
            <img src="1.png" alt="">
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
    const grandTotalElement = document.getElementById("grandTotal");

    function updateTotalPricePerItem() {
      let grandTotal = 0;
      quantityDisplays.forEach((display, index) => {
        const quantity = parseInt(display.textContent);
        const priceElement = display.closest("tr").querySelector("small");
        const priceMatch = priceElement.textContent.match(/Gia : (\d+\.\d+)/);
        const price = priceMatch ? parseFloat(priceMatch[1]) : 0;
        const totalItemPrice = quantity * price;
        totalPricePerItemElements[index].textContent = totalItemPrice.toFixed(3);
        grandTotal += totalItemPrice;
      });

      grandTotalElement.textContent = grandTotal.toFixed(3);
    }

    function updateGrandTotalChange(changeAmount) {
      let grandTotal = parseFloat(grandTotalElement.textContent);
      grandTotal += changeAmount;
      grandTotalElement.textContent = grandTotal.toFixed(3);
    }

    quantityDisplays.forEach((display, index) => {
      const incrementButton = display.closest("tr").querySelector(".increment");
      const decrementButton = display.closest("tr").querySelector(".decrement");
      const removeButton = display.closest("tr").querySelector(".remove-button");

      incrementButton.addEventListener("click", () => {
        display.textContent = (parseInt(display.textContent) + 1).toString();
        updateTotalPricePerItem();
        updateGrandTotalChange(parseFloat(priceMatch[1])); // Increment the grand total by the item's price
      });

      decrementButton.addEventListener("click", () => {
        const currentQuantity = parseInt(display.textContent);
        if (currentQuantity > 1) {
          display.textContent = (currentQuantity - 1).toString();
          updateTotalPricePerItem();
          updateGrandTotalChange(-parseFloat(priceMatch[1])); // Decrement the grand total by the item's price
        }
      });

      removeButton.addEventListener("click", () => {
        const row = display.closest("tr");
        removeItem(row);
      });
      function removeItem(row) {
        const priceElement = row.querySelector("small");
        const priceMatch = priceElement.textContent.match(/Gia : (\d+\.\d+)/);
        if (priceMatch) {
          const itemPrice = parseFloat(priceMatch[1]);
          const quantityDisplay = row.querySelector(".quantity-display");
          const quantity = parseInt(quantityDisplay.textContent);
          const itemTotal = itemPrice * quantity;
          updateGrandTotalChange(-itemTotal); // Decrement the grand total by the removed item's price
        }
        row.remove();
        updateTotalPricePerItem();
      }
    });

    updateTotalPricePerItem();
  });
</script>
</body>
</html>
