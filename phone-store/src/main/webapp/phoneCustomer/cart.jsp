<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap&subset=vietnamese"
          rel="stylesheet">
    <style>

        .order-summary {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #dee2e6;
        }

        .order-total {
            font-size: 1.2em;
            font-weight: bold;
        }

        .warranty-options {
            padding: 10px 0;
        }

        .quantity-input {
            width: 70px;
        }

        .nav-link:hover {
            color: #007bff;
            text-decoration: none;
        }

        .nav-link img {
            transition: transform 0.2s;
        }

        .nav-link:hover img {
            transform: scale(1.1);
        }

        .quantity-selector {
            display: inline-flex;
            align-items: center;
        }

        .quantity-selector button {
            background-color: #fff;
            border: 1px solid #ccc;
            color: #333;
            font-size: 16px;
            padding: 5px 10px;
            cursor: pointer;
        }

        .quantity-selector input {
            width: 40px;
            text-align: center;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .price {
            color: red;
            font-size: 16px;
            margin-left: 20px;
        }

        .remove {
            background: red;
            color: white;
            font-size: 16px;
            margin-right: 30px;
            cursor: pointer;
        }

        .find-similar {
            color: red;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-red" style="background: red">
    <div class="container-fluid">
        <a class="navbar-brand" href="/phoneCustomer"><img src="/img/logo1.png" height="40"> Trang Chủ</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="#">Điện Thoại Mới</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Bán Chạy</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Giới Thiệu</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Liên Hệ</a></li>
            </ul>
            <form class="form-inline my-2 my-lg-0 mr-3" action="/phoneCustomer?action=search" method="post">
                <input class="form-control mr-sm-2" type="search" name="search" placeholder="Tìm kiếm sản phẩm"
                       aria-label="Search">
                <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Tìm kiếm</button>
            </form>
            <a class="nav-link text-white" onclick="window.location.href ='phoneCustomer?action=openCart'">
                <img src="/img/cart.png" height="42">
            </a>
        </div>
    </div>
</nav>

<div class="container mt-5 pt-3">
    <div class="order-summary">
        <div class="order-items">
            <c:set var="total" value="0"/>
            <c:forEach var="phone" items="${phones}">
                <input type="hidden" name="id" value="${phone.id}">
                <div class="order-item">
                    <div class="d-flex align-items-center">
                        <img src="${phone.img}" style="width: 50px; height: 50px;" alt="${phone.name}"
                             onclick="window.location.href='/phoneCustomer?action=infor&id=${phone.id}'">
                        <div class="ml-3">
                            <h6>${phone.name}</h6>
                            <p>Màu sắc: ${phone.color}</p>
                            <div class="quantity-selector" onclick="">
                                <span>Số lượng:</span>
                                <input type="number" min="1" value="${phone.quantity}">
                            </div>
                            <span class="price">Giá bán: <fmt:formatNumber type="number" pattern="###,###" value="${phone.price}" /> VND</span>
                        </div>
                    </div>
                    <div>
                        <button type="submit" class="remove"
                                onclick="window.location.href='/phoneCustomer?action=deleteCart&id=${phone.id}'">Xóa sản phẩm
                        </button>

                    </div>
                </div>
                <c:set var="total" value="${total + phone.price}"/>
            </c:forEach>
        </div>


        <div class="order-summary mt-3">
            <p class="order-total" style="color: red">Cần thanh toán: <fmt:formatNumber type="number" pattern="###,###" value="${total}" /> đ</p>
            <button type="button" class="btn btn-danger btn-block"
                    onclick="window.location.href='/phoneCustomer?action=pay'">Thanh toán</button>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.getElementById('decrease-iphone').addEventListener('click', function () {
        let quantity = document.getElementById('quantity-iphone');
        if (quantity.value > 1) {
            quantity.value--;
        }
    });

    document.getElementById('increase-iphone').addEventListener('click', function () {
        let quantity = document.getElementById('quantity-iphone');
        quantity.value++;
    });

    document.getElementById('decrease-acer').addEventListener('click', function () {
        let quantity = document.getElementById('quantity-acer');
        if (quantity.value > 1) {
            quantity.value--;
        }
    });

    document.getElementById('increase-acer').addEventListener('click', function () {
        let quantity = document.getElementById('quantity-acer');
        quantity.value++;
    });

    function increment() {
        var input = document.getElementById('quantity');
        input.value = parseInt(input.value) + 1;
    }

    function decrement() {
        var input = document.getElementById('quantity');
        if (parseInt(input.value) > 0) {
            input.value = parseInt(input.value) - 1;
        }
    }
</script>
</body>
</html>