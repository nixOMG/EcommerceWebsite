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
            <c:forEach var="user" items="${users}" varStatus="loop">
                <tr>
                    <td><c:out value="${loop.index + 1}" /></td>
                    <td><c:out value="${user.userId}" /></td>
                    <td><c:out value="${user.firstName}" /></td>
                    <td><c:out value="${user.lastName}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><c:out value="${user.address}" /></td>
                    <td><c:out value="${user.phone}" /></td>
                    <td>
                        <a style="margin-right: 10px" href="manage-customer?action=get-page-edit-user&userId=${user.userId}"><i class="fa-solid fa-pencil"></i></a>
                    	<a href="manage-customer?action=get-page-delete-user&userId=${user.userId}"><i class="fa-solid fa-trash"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>




