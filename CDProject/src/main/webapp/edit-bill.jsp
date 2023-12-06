<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit bill</title>
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
        <h2 class="mb-4">Edit Bill</h2>
        
        <form action="manage-bill" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
        	<input type="hidden" name="action" value="edit-bill"/>
        	<input type="hidden" name="billId" value="${bill.billId}"/>
        	<input type="hidden" name="userId" value="${bill.user.userId}"/>
            <div class="row mb-3">
                <div class="col-6">
                    <label for="billDate" class="form-label">Bill date:</label>
                    <input type="date" class="form-control" id="billDate" name="billDate" value="${bill.billDate}"required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="lastName" class="form-label">Customer:</label>
                    <input type="text" class="form-control" id="user" name="user" value="${bill.user.firstName} ${bill.user.lastName}" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="totalPrice" class="form-label">Products total Price:</label>
                    <input type="text" class="form-control" id="totalPrice" name="totalPrice" value="${bill.totalPrice}" required>
                </div>
            </div>
            
             <div class="row mb-3">
                <div class="col-6">
                    <label for="shipFee" class="form-label">Ship Free:</label>
                    <input type="text" class="form-control" id="shipFee" name="shipFee" value="${bill.shipFee}" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="price" class="form-label">Total: </label>
                    <input type="text" class="form-control" id="shipAndProdcut" name="shipAndProdcut" value="${bill.shipFee + bill.totalPrice}" required>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-2">
				    <label for="status" class="form-label">Status:</label>
				    <select class="form-select" id="status" name="status">
				        <option value="1" <c:if test="${bill.status == 1}">selected</c:if>>Đang xử lý</option>
				        <option value="2" <c:if test="${bill.status == 2}">selected</c:if>>Đang giao hàng</option>
				        <option value="3" <c:if test="${bill.status == 3}">selected</c:if>>Đã hủy</option>
				        <option value="4" <c:if test="${bill.status == 4}">selected</c:if>>Thành công</option>
				    </select>
				</div>
            </div>
            <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
    </div>

    <!-- Thêm thư viện JavaScript Bootstrap (đặt ở cuối body) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
