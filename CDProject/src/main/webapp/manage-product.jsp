<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Product</title>
<link rel="stylesheet" type="text/css" href="./assets/css/admin.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style type="text/css">
.pagination-container {
    margin: 40px auto;
}
.pagination {
    display: flex;
    list-style: none;
    padding: 0;
    justify-content: center;
}

.pagination li {
    margin: 0 5px;
}

.pagination a {
    display: block;
    padding: 8px 12px;
    color: #007bff;
    text-decoration: none;
    border: 1px solid #007bff;
    border-radius: 4px;
}

.pagination a:hover,
.pagination li.active a {
    background-color: #6c757d;
    color: #fff;
}

/* css giới hạn độ rộng của cột trong bảng */
.w3-table-all td:nth-child(3),
    .w3-table-all td:nth-child(4) {
        max-width: 120px; /* Giới hạn chiều rộng của cột "Name" và "Description" */
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
}
.w3-table-all th,
    .w3-table-all td {
        font-size: 13px; /* Đặt kích thước chữ cho cả th và td */
    }
    
.image-product {
	width: 40px;
	height: 50px;
}
.btn-add-product {
    display: inline-block;
    width: 110px;
    height: 40px;
    text-decoration: none;
    background-color: #6c757d;
    color: white;
    box-sizing: border-box;
    padding: 10px;
    border: none;
    border-radius: 5px; /* Đặt giá trị bán kính bo tròn góc */
}

.btn-add-product:hover {
    background-color: rgba(108, 117, 125, 0.5); /* Màu nền trong suốt khi di chuột vào */
    opacity: 1; /* Không trong suốt */
    cursor: pointer;
}

</style>
</head>
<body>
	<!-- Navbar -->
	<ul>
  <li><a class="active" href="home">Trang chủ</a></li>
  <li><a href="manage-product">Sản phẩm</a></li>
  <li><a href="manage-bill">Hóa đơn</a></li>
  <li><a href="manage-customer">Khách hàng</a></li>
</ul>
	<!-- End Navbar -->
	
	
	
	<div class="w3-container">
  <h2 style="text-align: center; margin: 20px 0;">Quản lý Sản phẩm</h2>
  
  <a class="btn-add-product" href="manage-product?action=get-page-add-product">Thêm mới</a>

  <table class="w3-table-all w3-hoverable" style="margin: 20px auto;">
    <thead>
        <tr class="w3-light-grey">
            <th>STT</th>
            <th>ID</th>
            <th>Image</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Star</th>
            <th>Total Comments</th>
            <th>Release Date</th>
            <th>Category</th>
            <th>Artist</th>
            <th>Genre</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="product" items="${products}" varStatus="loop">
            <tr>
                <td><c:out value="${(pageNumber - 1) * pageSize + loop.index + 1}" /></td>
                <td><c:out value="${product.productId}" /></td>
                <td><img class="card-img rounded-0 img-fluid image-product" src="assets/img/${product.image}"></td>
                <td><c:out value="${product.name}" /></td>
                <td><c:out value="${product.describe}" /></td>
                <td><c:out value="${product.price} VNĐ" /></td>
                <td><c:out value="${product.star}" /></td>
                <td><c:out value="${product.comment}" /></td>
                <td><c:out value="${product.releaseDate}" /></td>
                <td><c:out value="${product.category.name}" /></td>
                <td><c:out value="${product.artist.name}" /></td>
                <td><c:out value="${product.genre.name}" /></td>
                <td>
                    <!-- Thêm các button Action tương ứng với sản phẩm -->
                    <a style="margin-right: 10px" href="manage-product?action=get-page-edit-product&productId=${product.productId}"><i class="fa-solid fa-pencil"></i></a>
                    <a href="manage-product?action=get-page-delete-product&productId=${product.productId}"><i class="fa-solid fa-trash"></i></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<!-- Hiển thị phân trang -->
<div class="pagination-container">
    <c:if test="${totalPages > 1}">
        <ul class="pagination">
            <c:forEach begin="1" end="${totalPages}" var="page">
                <li class="<c:if test="${page == pageNumber}">active</c:if>">
                    <a href="manage-product?page=${page}">${page}</a>
                </li>
            </c:forEach>
        </ul>
    </c:if>
</div>
</div>
</body>
</html>




