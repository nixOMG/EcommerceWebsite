<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Delete Bill</title>
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
        <h2 class="mb-4">Delete Bill</h2>
        
        <form action="manage-bill" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return confirmDelete()">
        	<input type="hidden" name="action" value="delete-bill"/>
        	<input type="hidden" name="billId" value="${bill.billId}"/>
            <div class="row mb-3">
                <div class="col-6">
                    <label for="billDate" class="form-label">Bill date:</label>
                    <input type="date" class="form-control" id="billDate" name="billDate" value="${bill.billDate}" disabled required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="lastName" class="form-label">Customer:</label>
                    <input type="text" class="form-control" id="user" name="user" value="${bill.user.firstName} ${bill.user.lastName}" disabled required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="totalPrice" class="form-label">Products total Price:</label>
                    <input type="text" class="form-control" id="totalPrice" name="totalPrice" value="${bill.totalPrice}" disabled required>
                </div>
            </div>
            
             <div class="row mb-3">
                <div class="col-6">
                    <label for="shipFee" class="form-label">Ship Free:</label>
                    <input type="text" class="form-control" id="shipFee" name="shipFee" value="${bill.shipFee}" disabled required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label for="price" class="form-label">Total: </label>
                    <input type="text" class="form-control" id="shipAndProdcut" name="shipAndProdcut" value="${bill.shipFee + bill.totalPrice}" disabled required>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Delete</button>
        </form>
    </div>
	<script>
		function confirmDelete() {
		    var r = confirm("Bạn có chắc là muốn xóa không?");
		    if (r == true) {
		        return true;
		    } else {
		        return false;
		    }
		}
	</script>
    <!-- Thêm thư viện JavaScript Bootstrap (đặt ở cuối body) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
