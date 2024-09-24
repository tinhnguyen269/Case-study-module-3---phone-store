<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/7/2024
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Liên hệ - Shop Ổ Quỷ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin-top: 70px; /* Giúp không bị che khuất bởi navbar cố định */
        }

        /* Navbar */
        .navbar-red {
            background-color: red;
        }

        .navbar-red .navbar-brand {
            color: white;
            font-weight: bold;
        }

        .navbar-red .nav-link {
            color: white;
        }

        .navbar-red .nav-link:hover {
            color: #ffd700; /* Màu vàng kim khi hover */
        }

        .navbar-red .navbar-toggler-icon {
            color: white;
        }

        .navbar-red .navbar-toggler {
            border-color: white;
        }

        /* Form Liên hệ */
        .contact {
            padding: 20px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            max-width: 600px;
            margin: 0 auto; /* Căn giữa */
        }

        .contact h1 {
            color: red;
            margin-bottom: 20px;
        }

        .contact table {
            width: 100%;
        }

        .contact input[type="text"],
        .contact input[type="email"],
        .contact textarea {
            width: calc(100% - 40px);
            padding: 10px;
            margin: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .contact input[type="submit"] {
            width: 100%;
            background-color: red;
            color: white;
            padding: 10px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .contact input[type="submit"]:hover {
            background-color: #cc0000;
        }

        /* Footer */
        footer {
            background-color: #f8f9fa;
            border-top: 1px solid #ddd;
        }

        footer p {
            margin: 0;
            color: #555;
        }

    </style>
</head>
<body>
<%----%>
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-red" style="color: white; background-color: red">
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
                <li class="nav-item"><a class="nav-link text-white" href="#">Liên Hệ</a></li>
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
<div class="container" style=" width: 600px">
    <section class="contact">
        <h1 style="color: red; margin-bottom: 20px">Liên hệ với chúng tôi</h1>

        <form action="contact" method="post">
            <table border="1" cellpadding="5" style="border: red">
                <tr>
                    <td>
                        <input type="text" name="name" placeholder="Tên của bạn" required style="padding: 10px; margin: 10px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="email" name="email" placeholder="Email" required style="padding: 10px; margin: 10px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="phone" placeholder="Số điện thoại" required style="padding: 10px; margin: 10px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea name="message" placeholder="Nội dung" required style="width: 500px; padding: 10px; margin: 10px"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" style="width: 100px; background-color: red; color: white; padding: 10px; margin: 10px">
                    </td>
                </tr>
            </table>
        </form>
    </section>
</div>



<footer class="bg-light p-3 mt-4">
    <div class="container text-center">
        <p>Địa chỉ: 27 Tam Trinh, Hoàng Mai, Hà Nội</p>
        <p>Điện Thoại: 0949534953</p>
    </div>
</footer>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
