<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cửa hàng điện thoại</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
    <style>
        .navbar-red {
            background-color: red;
        }

        .navbar-brand {
            color: white;
            font-family: 'Pacifico', cursive;
            font-size: 24px;
        }

        .nav-link {
            color: white;
            font-weight: bold;
            margin-right: 15px;
        }

        .nav-link:hover {
            color: lightgray;
        }

        .btn-outline-light {
            color: white;
            border-color: white;
        }

        .btn-outline-light:hover {
            color: red;
            background-color: white;
        }

        .modal-body {
            color: black;
        }

        .modal-footer {
            justify-content: space-between;
        }

        .search-input {
            width: 200px;
        }

        .add-phone-btn {
            margin-bottom: 20px;
        }

        table.table-bordered tbody tr td, table.table-bordered thead tr th {
            border: 1px solid #dee2e6;
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-red">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="/img/logo1.png" alt="logo" width="50" height="50">
            Ổ Quỷ Store
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/phone?action=list">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Giới thiệu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Danh mục</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Khuyến mãi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Liên hệ</a>
                </li>
            </ul>
            <form class="d-flex" action="phone" method="post">
                <input class="form-control me-2 search-input" type="search" placeholder="Tìm kiếm" aria-label="Search" name="search">
                <input type="hidden" name="action" value="search">
                <button class="btn btn-outline-light" type="submit">Tìm kiếm</button>
            </form>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <button class="btn btn-primary mt-4 add-phone-btn" onclick="window.location.href='/phone?action=create'">Thêm điện thoại</button>
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <th>Số thứ tự</th>
            <th>Tên</th>
            <th>Nhà sản xuất</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Kích thước</th>
            <th>Màu sắc</th>
            <th>RAM</th>
            <th>Pin</th>
            <th>Hình ảnh</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="phone" items="${phones}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${phone.name}</td>
                <td>${phone.manufacture}</td>
                <td>${phone.price} VND</td>
                <td>${phone.quantity}</td>
                <td>${phone.size} inches</td>
                <td>${phone.color}</td>
                <td>${phone.ram} GB</td>
                <td>${phone.battery} mAH</td>
                <td><img src="${phone.img}" alt="${phone.name}" style="width: 50px; height: 50px;"></td>
                <td>
                    <a href="/phone?action=edit&id=${phone.id}" class="btn btn-warning">Sửa</a>
                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${phone.id}">
                        Xóa
                    </button>
                    <div class="modal fade" id="deleteModal${phone.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Xóa điện thoại</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Bạn có muốn xóa điện thoại có tên là ${phone.name}?
                                    <p style="color: red">Hành động này không thể hoàn tác!!!!!</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <form action="/phone?action=delete" method="post">
                                        <input type="hidden" name="id" value="${phone.id}">
                                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
