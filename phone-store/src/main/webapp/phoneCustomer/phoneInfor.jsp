<%--
  Created by IntelliJ IDEA.
  User: WIN 10
  Date: 07/07/2024
  Time: 12:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding-top: 56px;
        }

        .navbar-red {
            background-color: red;
        }

        .navbar-brand {
            color: white !important;
            font-family: 'Pacifico', cursive;
            font-size: 24px;
        }

        .nav-link {
            color: white !important;
            font-weight: bold;
            margin-right: 15px;
        }

        .nav-link:hover {
            color: lightgray !important;
        }

        .form-inline .form-control {
            width: 250px;
        }

        .form-inline .btn-outline-light {
            color: white;
            border-color: white;
        }

        .form-inline .btn-outline-light:hover {
            color: red;
            background-color: white;
            border-color: white;
        }

        .product-detail {
            margin-top: 80px;
        }

        .product-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .product-info {
            margin-bottom: 5px;
            color: #666;
        }

        .btn-buy {
            background-color: red;
            color: white;
            margin-top: 10px;
        }

        .btn-buy:hover {
            background-color: #ff1a1a;
        }

        .nav-tabs {
            border-bottom: 1px solid #ddd;
        }

        .nav-tabs .nav-link {
            color: #333;
            border: none;
            border-bottom: 3px solid transparent;
            font-weight: bold;
        }

        .nav-tabs .nav-link.active {
            border-color: red;
            color: red;
        }

        .table th {
            width: 30%;
            font-weight: normal;
        }

        .table td {
            vertical-align: middle;
            color: #333;
        }

        .card {
            cursor: pointer;
            border: 1px solid #ddd;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .card-title {
            color: red;
        }

        .card-text {
            color: #333;
        }

        .card-text.text-danger {
            color: red !important;
        }

        footer {
            background-color: #f1f1f1;
            color: #333;
            padding: 20px 0;
        }
        .nav-tabs {
            border-bottom: 1px solid #ddd;
            background-color: red;
        }

        .nav-tabs .nav-link {
            color: #333;
            border: none;
            border-bottom: 3px solid transparent;
            font-weight: bold;
        }

        .nav-tabs .nav-link.active {
            border-color: red;
            color: red;
            background-color: red;

        }



    </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-red">
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
            <form class="form-inline my-2 my-lg-0 mr-3">
                <input class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm sản phẩm" aria-label="Search">
                <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Tìm kiếm</button>
            </form>
            <a class="nav-link text-white" onclick="window.location.href ='phoneCustomer?action=openCart'">
                <img src="/img/cart.png" height="42">
            </a>
        </div>
    </div>
</nav>

<div class="container product-detail">
    <div class="row">
        <div class="col-md-4">
            <img src="${phone.img}" class="img-fluid">
        </div>
        <div class="col-md-8">
            <div class="product-title">${phone.name}</div>
            <div class="product-info"><span>Hãng sản xuất:</span>${phone.manufacture}</div>
            <div class="card-text text-danger">Giá bán: <fmt:formatNumber type="number" pattern="###,###" value="${phone.price}" /> VND</div>
            <div class="product-info"><span>Tình trạng:</span> Còn ${phone.quantity} sản phẩm</div>
            <div><p name="message" style="color: #007bff ; margin-bottom:0px">${message}</p></div>
            <form action="/phoneCustomer?action=addCart&id=${phone.id}" method="post">
                <input type="hidden" name="id" value="${phone.id}">
                <button class="btn btn-buy" type="submit">Thêm vào giỏ hàng</button>
            </form>
            <button class="btn btn-buy" onclick="window.location.href='/phoneCustomer?action=openCart'">Đặt hàng</button>
        </div>
    </div>

    <ul class="nav nav-tabs mt-4" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="details-tab" data-toggle="tab" href="#details" role="tab"
               aria-controls="details" aria-selected="true">Chi tiết sản phẩm</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="comments-tab" data-toggle="tab" href="#comments" role="tab" aria-controls="comments"
               aria-selected="false">Bình luận sản phẩm</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="details" role="tabpanel" aria-labelledby="details-tab">
            <table class="table mt-3">
                <tr>
                    <th>Kích thước</th>
                    <td>${phone.size} inch</td>
                </tr>
                <tr>
                    <th>Màu sắc</th>
                    <td>${phone.color}</td>
                </tr>
                <tr>
                    <th>Ram</th>
                    <td>${phone.ram}GB</td>
                </tr>
                <tr>
                    <th>Pin</th>
                    <td>${phone.battery}mAh</td>
                </tr>
            </table>
        </div>
        <div class="tab-pane fade" id="comments" role="tabpanel" aria-labelledby="comments-tab">

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

