<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Customer</title>
<link rel="stylesheet" type="text/css" href="./assets/css/admin.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
  <h2 style="text-align: center; margin: 20px 0;">Quản lý Khách hàng</h2>

  <table class="w3-table-all w3-hoverable">
        <thead>
            <tr class="w3-light-grey">
                <th>STT</th>
                <th>ID</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Email</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customers}" varStatus="loop">
                <tr>
                    <td><c:out value="${loop.index + 1}" /></td>
                    <td><c:out value="${customer.userId}" /></td>
                    <td><c:out value="${customer.firstName}" /></td>
                    <td><c:out value="${customer.lastName}" /></td>
                    <td><c:out value="${customer.email}" /></td>
                    <td><c:out value="${customer.address}" /></td>
                    <td><c:out value="${customer.phone}" /></td>
                    <td>
                        <button><i class="fa-solid fa-pencil"></i></button>
                        <button><i class="fa-solid fa-trash"></i></button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>




