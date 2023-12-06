<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit User</title>
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
        <h2 class="mb-4">Edit User</h2>
        
        <form action="manage-customer" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
        	<input type="hidden" name="action" value="edit-user"/>
        	<input type="hidden" name="userId" value="${user.userId}"/>
            <div class="row mb-3">
                <div class="col-6">
                    <label for="firstName" class="form-label">First name:</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" value="${user.firstName}" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="lastName" class="form-label">Last name:</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" value="${user.lastName}">
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="email" class="form-label">Email:</label>
                    <input type="text" class="form-control" id="email" name="email" value="${user.email}" required>
                </div>
            </div>
            
             <div class="row mb-3">
                <div class="col-6">
                    <label for="weight" class="form-label">Address:</label>
                    <input type="text" class="form-control" id="address" name="address" value="${user.address}" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="price" class="form-label">Phone:</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" required>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>

    <!-- Thêm thư viện JavaScript Bootstrap (đặt ở cuối body) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
