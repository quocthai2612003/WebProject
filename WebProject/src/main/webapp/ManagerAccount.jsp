<%@ page import="java.util.List" %>
<%@ page import="model.Account" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="./css/base.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <link rel="stylesheet" href="./css/admin.css">
</head>
<%
  Account a = session.getAttribute("account") == null ? new Account() : (Account) session.getAttribute("account");
  int totalPage = request.getAttribute("totalPage") == null ? 0 : (int) request.getAttribute("totalPage");
  int pageCurrent = request.getAttribute("pageCurrent") == null ? 1 : Integer.parseInt(request.getAttribute("pageCurrent").toString());
  String search = request.getAttribute("search") == null ? "" : "&search=" + request.getAttribute("search").toString();
  List<Account> accountList = request.getAttribute("accountList") == null ? new ArrayList<>() : (List<Account>) request.getAttribute("accountList");
%>
<body>
<div id="id">
  <div id="admin">
    <div class="left">
      <div class="menu">
        <div class="menu-title">
          <h2 class="shop-name">PLQ SHOP</h2>
        </div>
        <div class="shop-user">
          <p>Xin chào, <%=a.getFullname()%></p>
        </div>
        <div class="menu-item">
          <a href="./admin">
            <div class="icon"><i class="fa-solid fa-house-chimney"></i></div>
            <p class="menu-content">Thống kê</p>
          </a>
        </div>
        <div class="menu-item">
          <a href="./managerAccount?page=1"class="active">
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
      <div class="contain">
        <div class="title">
          <h2>Quản lý tài khoản</h2>
        </div>
        <div class="manager">
          <div class="manager-search">
            <form action="./managerAccount" method="post">
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
                  <th>ID</th>
                  <th>Tên đăng nhập</th>
                  <th>Email</th>
                  <th>Họ và tên</th>
                  <th>Số điện thoại</th>
                  <th>Quyền</th>
                  <th>Trạng thái</th>
                  <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <% for (Account account : accountList) {%>
                <tr>
                  <th><%=account.getID()%></th>
                  <th><%=account.getUsername()%></th>
                  <th><%=account.getEmail()%></th>
                  <th><%=account.getFullname()%></th>
                  <th><%=account.getNumberPhone()%></th>
                  <form action="./managerAccount" method="post">
                    <input type="hidden" name ="idAccount" value="<%=account.getID()%>">
                    <th>
                      <select class="role" name = "role">
                        <% if (account.getRole() == 1) {%>
                        <option value="1" selected>Người dùng</option>
                        <option value="2">Admin</option>
                        <%} else {%>
                        <option value="1">Người dùng</option>
                        <option value="2" selected>Admin</option>
                        <%}%>
                      </select>
                    </th>
                    <th>
                      <select class="status" name = "status">
                        <% if (account.getStatus() == 1) {%>
                        <option value="1" selected>Bình thường</option>
                        <option value="2">Đã bị khóa</option>
                        <%} else {%>
                        <option value="1">Bình thường</option>
                        <option value="2" selected>Đã bị khóa</option>
                        <%}%>
                      </select>
                    </th>
                    <th>
                      <button type="submit" class="btn-repair">Lưu</button>
                    </th>
                  </form>
                </tr>
                <%}%>
                </tbody>
              </table>
            </div>
          <div class="pagination">
            <% if (pageCurrent > 1) {%>
            <a href="./managerAccount?page=<%=pageCurrent-1%><%=search%>"
               class="other-page previou-page"><span>Previou</span></a>
            <%}%>

            <% for (int i = 1; i <= totalPage; i++) {%>
            <% if (i == pageCurrent) {%>
            <a href="/managerAccount?page=<%=i%><%=search%>" style = "color: red;" class="other-page"><span><%=i%></span></a>
            <%} else {%>
            <a href="/managerAccount?page=<%=i%><%=search%>" class="other-page"><span><%=i%></span></a>
            <%}%>
            <%}%>
            <% if (pageCurrent > 1 && pageCurrent < totalPage) {%>
            <a href="./managerAccount?page=<%=pageCurrent+1%><%=search%>"
               class="other-page next-page"><span>Next</span></a>
            <%}%>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
<script src="./js/account.js"></script>
</html>
