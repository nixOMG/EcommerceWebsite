<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Delete Product</title>
    <!-- Thêm thư viện CSS Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Thêm CSS tùy chỉnh -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
        }

        textarea {
            resize: vertical;
        }

        button {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4">Delete Product</h2>
        
        <form action="manage-product" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
        	<input type="hidden" name="action" value="delete-product"/>
        	<input type="hidden" name="productId" value="${product.productId}"/>
            <div class="row mb-3">
                <div class="col-6">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" value="${product.name}" disabled required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="releaseDate" class="form-label">Release Date:</label>
                    <input type="date" class="form-control" id="releaseDate" name="releaseDate" value="${product.releaseDate}" disabled>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="describe" class="form-label">Describe:</label>
                    <input type="text" class="form-control" id="describe" name="describe" value="${product.describe}" disabled required>
                </div>
            </div>
            
             <div class="row mb-3">
                <div class="col-6">
                    <label for="weight" class="form-label">Weight:</label>
                    <input type="number" class="form-control" id="weight" name="weight" value="${product.weight}" disabled required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="price" class="form-label">Price:</label>
                    <input type="number" class="form-control" id="price" name="price" value="${product.price}" disabled required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-6">
                    <label for="star" class="form-label">Star:</label>
                    <input type="number" class="form-control" id="star" name="star" value="${product.star}" disabled required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-6">
                    <label for="comment" class="form-label">Total Comments:</label>
                    <input type="number" class="form-control" id="comment" name="comment" value="${product.comment}" disabled required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-6">
                    <label for="comment" class="form-label">Category:</label>
                    <input type="text" class="form-control" id="category" name="category" value="${product.category.name}" disabled required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-6">
                    <label for="comment" class="form-label">Genre:</label>
                    <input type="text" class="form-control" id="genre" name="genre" value="${product.genre.name}" disabled required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-6">
                    <label for="comment" class="form-label">Artist:</label>
                    <input type="text" class="form-control" id="genre" name="genre" value="${product.artist.name}" disabled required>
                </div>
            </div>
			<button type="submit" class="btn btn-primary">Delete</button>
        </form>
    </div>

    <!-- Thêm thư viện JavaScript Bootstrap (đặt ở cuối body) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
