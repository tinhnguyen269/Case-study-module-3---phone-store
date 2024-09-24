<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/7/2024
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Giới thiệu - Ổ Quỷ Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styleCustomer.css">
    <style>
        .full-screen-background {
            background-image: url('https://www.example.com/your-image.jpg');
            background-size: cover;
            background-position: center;
            height: 100%;
            width: 100%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-red" style="background-color: red">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="${pageContext.request.contextPath}/phoneCustomer">
            <img src="/img/logo1.png" height="50"> <b>Ổ Quỷ Store</b>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link text-white" href="${pageContext.request.contextPath}/phoneCustomer">Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="#">Điện Thoại Mới</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="#">Bán Chạy</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="${pageContext.request.contextPath}/phoneCustomer/intro.jsp">Giới Thiệu</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="${pageContext.request.contextPath}/phoneCustomer/contact.jsp">Liên Hệ</a></li>
            </ul>
            <form class="form-inline my-2 my-lg-0 mr-3" action="${pageContext.request.contextPath}/phoneCustomer?action=search" method="post">
                <input class="form-control mr-sm-2" type="search" name="search" placeholder="Tìm kiếm sản phẩm" aria-label="Search">
                <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Tìm kiếm</button>
            </form>
            <a class="nav-link text-white" href="#">
                <img src="/img/cart.png" height="42">
            </a>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <span class="navbar-text text-white">Xin chào, ${sessionScope.user.account}</span>
                </c:when>
                <c:otherwise>
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/logincustomer">
                        <img src="/img/login.png" height="42">
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>
<br/>
<div class="container-fluid mt-5 pt-3 full-screen-background" style="background-image: url('https://www.androidauthority.com/wp-content/uploads/2022/09/Asus-ROG-6D-Ultimate-rear-display-scaled.jpeg');">
   <div style="color: white">
       <h2 style="color: red;">Ổ Quỷ Store</h2>
       <p><i>Địa chỉ: 27 Tam Trinh, Hoàng Mai, Hà Nội - Điện Thoại: 0949534953</i></p>
       <hr>
       <br>
       <div >
           <p>Với hàng trăm loại sản phẩm từ các thương hiệu uy tín, chúng tôi mang đến cho bạn trải nghiệm mua sắm online tốt nhất. Thêm vào đó, <span style="color: red"> Ổ Quỷ</span> luôn có các chương trình khuyến mãi đang chờ đón bạn, không cần mã khuyến mãi, không giới hạn lượt đặt, tiết kiệm thời gian của bạn.</p>
           <p>Đến với <span style="color: red">Ổ Quỷ</span>, bạn sẽ tìm thấy chiếc điện thoại phù hợp nhất cho bản thân mình! </p>
       </div>
   </div>

</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
