<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 400px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #007bff;
        }
        label {
            font-weight: bold;
        }
        .btn-primary {
            width: 100%;
            margin-top: 20px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .form-control {
            height: 45px;
            margin-bottom: 15px;
        }
        .alert-danger {
            border-radius: 5px;
            margin-top: 20px;
            padding: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Login</h2>
    <form action="${pageContext.request.contextPath}/logincustomer" method="post">
        <div class="form-group">
            <label for="account">Tên đăng nhập</label>
            <input type="text" class="form-control ${not empty error ? 'is-invalid' : ''}" id="account" name="account" required>
        </div>
        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" class="form-control ${not empty error ? 'is-invalid' : ''}" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
        <%--        <c:if test="${not empty error}">--%>
        <%--            <div class="alert alert-danger mt-3">${error}</div>--%>
        <%--        </c:if>--%>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
