<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TST Shop eCommerce</title>
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
  <h2 style="text-align: center; margin: 20px 0;">Quản lý Hóa đơn</h2>

  <table class="w3-table-all w3-hoverable">
    <thead>
      <tr class="w3-light-grey">
        <th>STT</th>
        <th>Mã hóa đơn</th>
        <th>Ngày đặt hàng</th>
        <th>Khách Hàng</th>
        <th>Đơn giá</th>
        <th>Phí vận chuyển</th>
        <th>Tổng chi phí</th>
        <th>Trạng thái</th>
        <th>Action</th>
      </tr>
    </thead>
   <tbody>
       <c:forEach var="bill" items="${billList}" varStatus="loop">
           <tr>
               <td><c:out value="${loop.index + 1}" /></td>
               <td><c:out value="${bill.billId}" /></td>
               <td><c:out value="${bill.billDate}" /></td>
               <td><c:out value="${bill.user.firstName} ${bill.user.lastName}" /></td>
               <td><c:out value="${bill.totalPrice} VNĐ" /></td>
               <td><c:out value="${bill.shipFee} VNĐ" /></td>
               <td><c:out value="${bill.shipFee + bill.totalPrice} VNĐ" /></td>
               <td>
	                <c:choose>
	                    <c:when test="${bill.status eq 1}">Đang xử lý</c:when>
	                    <c:when test="${bill.status eq 2}">Đang giao hàng</c:when>
	                    <c:when test="${bill.status eq 3}">Đã hủy</c:when>
	                    <c:when test="${bill.status eq 4}">Thành công</c:when>
	                    <c:otherwise>Trạng thái không xác định</c:otherwise>
	                </c:choose>
           		</td>
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




