<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phone Shop</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styleCustomer.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-red">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="${pageContext.request.contextPath}/phoneCustomer">
            <img src="/img/logo1.png" height="40">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link text-white" href="${pageContext.request.contextPath}/phoneCustomer">Ổ Quỷ Store</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="#">Điện Thoại Mới</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="#">Bán Chạy</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="${pageContext.request.contextPath}/phoneCustomer/intro.jsp">Giới Thiệu</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="${pageContext.request.contextPath}/phoneCustomer/contact.jsp">Liên Hệ</a></li>
            </ul>
            <form class="form-inline my-2 my-lg-0 mr-3" action="${pageContext.request.contextPath}/phoneCustomer?action=search" method="post">
                <input class="form-control mr-sm-2" type="search" name="search" placeholder="Tìm kiếm sản phẩm" aria-label="Search">
                <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Tìm kiếm</button>
            </form>
            <a class="nav-link text-white" onclick="window.location.href ='phoneCustomer?action=openCart'">
                <img src="/img/cart.png" height="42">
            </a>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <span class="navbar-text text-white">Xin chào, ${sessionScope.user.account}</span>
                </c:when>
                <c:otherwise>
                    <a class="btn btn-outline-light my-2 my-sm-0" href="${pageContext.request.contextPath}/logincustomer">
                        Đăng nhập
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<div class="container mt-5 pt-3">
    <div class="row">
        <div class="col-md-3">
            <h5>Hãng Điện Thoại</h5>
            <ul class="list-group">
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/phoneCustomer?action=iphone">iPhone</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/phoneCustomer?action=samsung">Samsung</a></li>
                <li class="list-group-item"><a href="">Sony Ericson</a></li>
                <li class="list-group-item"><a href="">LG</a></li>
                <li class="list-group-item"><a href="">HTC</a></li>
                <li class="list-group-item"><a href="">Nokia</a></li>
                <li class="list-group-item"><a href="">Blackberry</a></li>
                <li class="list-group-item"><a href="">Asus</a></li>
                <li class="list-group-item"><a href="">Lenovo</a></li>
                <li class="list-group-item"><a href="">Motorola</a></li>
            </ul>
        </div>
        <div class="col-md-9">
            <h5>Điện Thoại Mới</h5>
            <div class="row">
                <c:forEach var="phone" items="${phones}">
                    <div class="col-md-4">
                        <div class="card mb-4" onclick="window.location.href='/phoneCustomer?action=infor&id=${phone.id}'">
                            <input type="hidden" name="id" value="${phone.id}">
                            <div class="card-img-top" style="background-image: url('${phone.img}');"></div>
                            <div class="card-body">
                                <h5 class="card-title">${phone.name}</h5>
                                <c:if test="${phone.quantity > 0}">
                                    <p class="card-text">Tình trạng: còn hàng</p>
                                </c:if>
                                <c:if test="${phone.quantity < 1}">
                                    <p class="card-text">Tình trạng: Hết hàng</p>
                                </c:if>
                                <p class="card-text text-danger">Giá bán: <fmt:formatNumber type="number" pattern="###,###" value="${phone.price}" /> VND</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <h5>Điện Thoại Bán Chạy</h5>
            <div class="row">
                <c:forEach var="phone" items="${phones}">
                    <div class="col-md-4">
                        <div class="card mb-4" onclick="window.location.href='/phoneCustomer?action=infor&id=${phone.id}'">
                            <input type="hidden" name="id" value="${phone.id}">
                            <div class="card-img-top" style="background-image: url('${phone.img}');"></div>
                            <div class="card-body">
                                <h5 class="card-title">${phone.name}</h5>
                                <c:if test="${phone.quantity > 0}">
                                    <p class="card-text">Tình trạng: còn hàng</p>
                                </c:if>
                                <c:if test="${phone.quantity < 1}">
                                    <p class="card-text">Tình trạng: Hết hàng</p>
                                </c:if>
                                <p class="card-text text-danger">Giá bán: <fmt:formatNumber type="number" pattern="###,###" value="${phone.price}" /> VND</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<footer class="bg-light p-3 mt-4">
    <div class="container text-center">
        <p>Shop điện thoại di động - Địa chỉ: 210 Quang Trung, Hoang Mai, Ha Noi - Dien Thoai: 0949534953</p>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
