<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Phone</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: white;
        }
        .container {
            color: red;
        }
        .btn-primary, .btn-success {
            background-color: red;
            border-color: red;
        }
        .btn-primary:hover, .btn-success:hover {
            background-color: darkred;
            border-color: darkred;
        }
        .form-control {
            border-color: red;
        }
        .form-control:focus {
            border-color: darkred;
            box-shadow: none;
        }
        label {
            color: red;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="my-4">Create New Phone</h1>
    <c:if test="${requestScope['message'] != null}">
        <div class="alert alert-success" role="alert">${requestScope['message']}</div>
    </c:if>
    <a href="/phone" class="btn btn-primary mb-4">Back to phone list</a>
    <form action="/phone?action=create" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="img">Image URL:</label>
            <input type="text" class="form-control" id="img" name="img" required>
        </div>
        <div class="form-group">
            <label for="manufacture">Manufacture:</label>
            <input type="text" class="form-control" id="manufacture" name="manufacture" required>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" step="0.01" class="form-control" id="price" name="price" required>
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" id="quantity" name="quantity" required>
        </div>
        <div class="form-group">
            <label for="size">Size (in inches):</label>
            <input type="number" step="0.1" class="form-control" id="size" name="size" required>
        </div>
        <div class="form-group">
            <label for="color">Color:</label>
            <input type="text" class="form-control" id="color" name="color" required>
        </div>
        <div class="form-group">
            <label for="ram">RAM (in GB):</label>
            <input type="number" class="form-control" id="ram" name="ram" required>
        </div>
        <div class="form-group">
            <label for="batery">Battery (in mAh):</label>
            <input type="number" class="form-control" id="batery" name="batery" required>
        </div>
        <button type="submit" class="btn btn-success">Create Phone</button>
    </form>
</div>
</body>
</html>
