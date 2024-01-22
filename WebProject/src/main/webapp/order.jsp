<%@ page import="java.text.NumberFormat" %>
<%@ page import="model.CartItems" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="model.Account" %>
<%@ page import="DAO.OrderDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">


<title>shopping cart with selected product order summary and checkout button - Bootdey.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
    	body{
    margin-top:20px;
    background-color: #f1f3f7;
}

.avatar-lg {
    height: 5rem;
    width: 5rem;
}

.font-size-18 {
    font-size: 18px!important;
}

.text-truncate {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

a {
    text-decoration: none!important;
}

.w-xl {
    min-width: 160px;
}

.card {
    margin-bottom: 24px;
    -webkit-box-shadow: 0 2px 3px #e4e8f0;
    box-shadow: 0 2px 3px #e4e8f0;
}

.card {
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid #eff0f2;
    border-radius: 1rem;
}
    </style>
</head>
<body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
<div class="container">
    <div class="row">
        <div class="col-xl-8">
            <%
                Account account = (Account) session.getAttribute("account");
                NumberFormat nf = NumberFormat.getInstance();
                List<CartItems> sanPhams = (List<CartItems>) session.getAttribute("list-sp");
                double tongGiaTri = 0;
                Map<String, String> listImagesThumbnail = session.getAttribute("listImagesThumbnail") == null ? new HashMap<>() : (Map<String, String>) session.getAttribute("listImagesThumbnail");
                for (CartItems sp : sanPhams) {
                    tongGiaTri += sp.getTotalPrice();
            %>
            <div class="card border shadow-none">
                <div class="card-body">
                    <div class="d-flex align-items-start border-bottom pb-3">
                        <div class="me-4">
                            <span></span>
                            <%
                                String productId = sp.getProduct().getId();
                                String imageSource = listImagesThumbnail.get(productId);
                            %>
                            <img src="<%= imageSource %>" alt class="avatar-lg rounded">
                        </div>
                        <div class="flex-grow-1 align-self-center overflow-hidden">
                            <div>
                                <h5 class="text-truncate font-size-18">
                                    <a href="#" class="text-dark"><%= sp.getProduct().getName() %></a>

                                </h5>
                                <p class="mb-0 mt-1">ID : <span class="fw-medium"><%=sp.getProduct().getId()%></span></p>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mt-3">
                                    <p class="text-muted mb-2">Giá</p>
                                    <h5 class="mb-0 mt-2">
                            <span class="text-muted me-2">
                               <p class="font-size-16 "> <%= nf.format(sp.getProduct().getPrice()) %>đ </p>
                            </span>
                                    </h5>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="mt-3">
                                    <p class="text-muted mb-2">Số lượng</p>
                                    <h5><%=sp.getQuantity()%></h5>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="mt-3">
                                    <p class="text-muted mb-2">Total</p>
                                    <h5><%= nf.format(sp.getProduct().getPrice() * sp.getQuantity()) %></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <% } // End of for loop %>
            <form action="ServletOrder" method="post">
            <div class="text-warning mb-3">
                <span class="input-group-text" id="basic-addon2">Xin lưu ý nhập đúng những thông tin bên dưới để chúng tôi có thể giao hàng chính xác</span>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">Số Điện Thoại</span>
                <input type="text" name="phoneNumber" required class="form-control" id="phoneNumber" placeholder="Nhập số điện thoại" aria-label="Số điện thoại" aria-describedby="basic-addon1" pattern="[0-9]{1,10}">
            </div>
            <div class="input-group">
                <span class="input-group-text">Địa chỉ giao hàng</span>
                <textarea name="addressInput" required id="addressInput" class="form-control" aria-label="With textarea"></textarea>
            </div>
                <div class="row my-4">
                    <div class="col-sm-6">
                        <a href="home.jsp" class="btn btn-link text-muted">
                            <i class="mdi mdi-arrow-left me-1"></i>  Tiếp tục mua hàng
                        </a>
                    </div>
                    <div class="col-sm-6">
                        <button type="submit" class="btn btn-success" id="checkoutButton">
                            <i class="mdi mdi-cart-outline me-1"></i> Thanh toán
                        </button>
                    </div>
                </div>
            </form>
</div>
<div class="col-xl-4">
<div class="mt-5 mt-lg-0 total-price">
<div class="card border shadow-none">
<div class="card-header bg-transparent border-bottom py-3 px-4">
<h5 class="font-size-16 mb-0">Mã đơn hàng <span class="float-end"><%=OrderDao.orderId()%></span></h5>
</div>
<div class="card-body p-4 pt-2">
<div class="table-responsive">

<table class="table mb-0">
<tbody>
<tr>
<td>Tổng giá trị đơn hàng :</td>
<td class="text-end">
    <span class="fw-bold"><%= nf.format(tongGiaTri) %>đ</span></td>
</tr>
<tr>
<td>Chi phí vẫn chuyển :</td>
<td class="text-end">
    <span class="fw-bold">
        <%=nf.format(30000)%>đ
    </span></td>
</tr>

<tr class="bg-light">
<th>Thanh toán :</th>
<td class="text-end">
<span class="fw-bold">
<%=nf.format(tongGiaTri+30000)%>đ
</span>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
    <div class="card border shadow-none mt-4">
        <div class="card-header bg-transparent border-bottom py-3 px-4">
            <h5 class="font-size-16 mb-0">Phương thức thanh toán</h5>
        </div>
        <div class="card-body p-4 pt-2">
            <div class="mb-3">
                <label for="paymentMethod" class="form-label">Chọn phương thức thanh toán:</label>
                <select class="form-select" id="paymentMethod" onchange="toggleCardFields()" required>
                    <option value="visa">Thẻ Visa</option>
                    <option value="mastercard">Thẻ Mastercard</option>
                    <option value="paypal">PayPal</option>
                    <option value="cashondelivery">Thanh toán sau khi nhận hàng</option>
                    <!-- Add more payment options as needed -->
                </select>
            </div>

            <div id="cardFields">
                <!-- Your card input fields -->
                <div class="mb-3">
                    <label for="cardHolderName" class="form-label">Tên trên thẻ:</label>
                    <input type="text" required class="form-control" id="cardHolderName" placeholder="Nhập tên trên thẻ">
                </div>
                <div class="mb-3">
                    <label for="cardNumber" class="form-label">Số thẻ:</label>
                    <input type="text" required class="form-control" id="cardNumber" placeholder="Nhập số thẻ">
                </div>
                <div class="mb-3">
                    <label for="expiryDate" class="form-label">Ngày hết hạn:</label>
                    <input type="text" required class="form-control" id="expiryDate" placeholder="MM/YY">
                </div>
                <div class="mb-3">
                    <label for="csv" class="form-label">CSV:</label>
                    <input type="text" required class="form-control" id="csv" placeholder="Nhập mã CSV">
                </div>
            </div>
        </div>
    </div>

</div>
</div>

</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
</script>
<script>
    function toggleCardFields() {
        var paymentMethod = document.getElementById("paymentMethod");
        var cardFields = document.getElementById("cardFields");

        if (paymentMethod.value === "cashondelivery") {
            cardFields.style.display = "none";
        } else {
            cardFields.style.display = "block";
        }

        updateCheckoutButtonState(); // Update checkout button state based on form validity
    }

    // function simulatePayment() {
    //     var phoneNumber = document.getElementById("phoneNumber").value;
    //     var addressInput = document.getElementById("addressInput").value;
    //     var paymentMethod = document.getElementById("paymentMethod").value;
    //
    //     // Validate phone number and address
    //     if (phoneNumber.trim() === "" || addressInput.trim() === "") {
    //         alert("Vui lòng nhập số điện thoại và địa chỉ giao hàng.");
    //         return;
    //     }
    //     else {
    //         // Validate card information
    //         var cardHolderName = document.getElementById("cardHolderName").value;
    //         var cardNumber = document.getElementById("cardNumber").value;
    //         var expiryDate = document.getElementById("expiryDate").value;
    //         var csv = document.getElementById("csv").value;
    //
    //         if (cardHolderName.trim() === "" || cardNumber.trim() === "" || expiryDate.trim() === "" || csv.trim() === "") {
    //             alert("Vui lòng nhập đầy đủ thông tin thẻ để thanh toán.");
    //             return;
    //         }
    //
    //         // Simulate processing credit card or PayPal payment
    //         alert("Thanh toán thành công! Đơn hàng của bạn đã được xác nhận.");
    //         // Add any additional logic for credit card or PayPal payment
    //     }
    // }
</script>
</body>
</html>
