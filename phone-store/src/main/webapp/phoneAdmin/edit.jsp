<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa điện thoại</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container mt-5">
    <h2>Chỉnh sửa điện thoại</h2>
    <p>
        <c:if test="${requestScope['message'] != null}">
            <span class="text-danger">${requestScope['message']}</span>
        </c:if>
    </p>
    <p>
        <a href="${pageContext.request.contextPath}/phone" class="btn btn-secondary">Quay lại danh sách điện thoại</a>
    </p>
    <form method="post" action="${pageContext.request.contextPath}/phone">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="${phone.id}">
        <div class="mb-3">
            <label for="name" class="form-label">Tên:</label>
            <input type="text" class="form-control" id="name" name="name" value="${phone.name}" required>
        </div>
        <div class="mb-3">
            <label for="image" class="form-label">Ảnh:</label>
            <input type="text" class="form-control" id="image" name="image" value="${phone.img}" required>
        </div>
        <div class="mb-3">
            <label for="manufacture" class="form-label">Nhà sản xuất:</label>
            <input type="text" class="form-control" id="manufacture" name="manufacture" value="${phone.manufacture}" required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Giá:</label>
            <input type="number" class="form-control" id="price" name="price" value="${phone.price}" required>
        </div>
        <div class="mb-3">
            <label for="quantity" class="form-label">Số lượng:</label>
            <input type="number" class="form-control" id="quantity" name="quantity" value="${phone.quantity}" required>
        </div>
        <div class="mb-3">
            <label for="size" class="form-label">Kích thước:</label>
            <input type="text" class="form-control" id="size" name="size" value="${phone.size}" required>
        </div>
        <div class="mb-3">
            <label for="color" class="form-label">Màu:</label>
            <input type="text" class="form-control" id="color" name="color" value="${phone.color}" required>
        </div>
        <div class="mb-3">
            <label for="ram" class="form-label">RAM:</label>
            <input type="number" class="form-control" id="ram" name="ram" value="${phone.ram}" required>
        </div>
        <div class="mb-3">
            <label for="battery" class="form-label">Pin:</label>
            <input type="number" class="form-control" id="battery" name="battery" value="${phone.battery}" required>
        </div>
        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
