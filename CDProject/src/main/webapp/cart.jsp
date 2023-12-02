<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>TST Shop - Product Listing Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/templatemo.css">
	<link rel="stylesheet" href="assets/css/custom.css">

	<!-- Load fonts style after rendering the layout styles -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
	<link rel="stylesheet" href="assets/css/fontawesome.min.css">
	

	<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
	<!-- Start Top Nav -->
	<nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
		<div class="container text-light">
			<div class="w-100 d-flex justify-content-between">
				<div>
					<i class="fa fa-envelope mx-2"></i>
					<a class="navbar-sm-brand text-light text-decoration-none"
						href="mailto:TSTShop@gmail.com">TSTShop@gmail.com</a>
					<i class="fa fa-phone mx-2"></i>
					<a class="navbar-sm-brand text-light text-decoration-none" href="tel:0949307528">0949307528</a>
				</div>
				<div>
					<a class="text-light" href="https://fb.com/templatemo" target="_blank" rel="sponsored"><i
							class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
					<a class="text-light" href="https://www.instagram.com/" target="_blank"><i
							class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
					<a class="text-light" href="https://twitter.com/" target="_blank"><i
							class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
					<a class="text-light" href="https://www.linkedin.com/" target="_blank"><i
							class="fab fa-linkedin fa-sm fa-fw"></i></a>
				</div>
			</div>
		</div>
	</nav>
	<!-- Close Top Nav -->


	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light shadow">
		<div class="container d-flex justify-content-between align-items-center">

			<a class="navbar-brand text-success logo h1 align-self-center" href="index.jsp">
				TST
			</a>

			<button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse"
				data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
				id="templatemo_main_nav">
				<div class="flex-fill">
					<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
						<li class="nav-item">
							<a class="nav-link" href="home">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="home?action=about">About</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="shop">Shop</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="home?action=contact">Contact</a>
						</li>
					</ul>
				</div>
				<div class="navbar align-self-center d-flex">
					<div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
						<div class="input-group">
							<input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
							<div class="input-group-text">
								<i class="fa fa-fw fa-search"></i>
							</div>
						</div>
					</div>
					<a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal"
						data-bs-target="#templatemo_search">
						<i class="fa fa-fw fa-search text-dark mr-2"></i>
					</a>
					<a class="nav-icon position-relative text-decoration-none" href="cart">
					    <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
					    <c:if test="${not empty sessionScope.totalQuantity}">
					        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">
					            ${sessionScope.totalQuantity}
					        </span>
					    </c:if>
					</a>
					<c:choose>
			            <c:when test="${loggedInUser ne null}">
				            <div class="dropdown">
							  <a style="border: none; background-color: white;" class="btn btn-secondary dropdown-toggle"  data-bs-toggle="dropdown" aria-expanded="false">
							    Xin chào, ${loggedInUser.getFirstName()}!
							  </a>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
							    <li><a class="dropdown-item" href="home?action=profile">Thông tin</a></li>
							    <li><a class="dropdown-item" href="manage-bill?action=my-bill">Đơn hàng</a></li>
							    <li><hr class="dropdown-divider"></li>
							    <li><a class="dropdown-item" href="home?action=dang-xuat">Đăng xuất</a></li>
							  </ul>
							</div>    
			            </c:when>
			            <c:otherwise>
			                <a href="home?action=dang-nhap" class="nav-icon position-relative text-decoration-none">
			                    <i class="fa fa-fw fa-user text-dark mr-3"></i>
			                    <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
			                </a>
			            </c:otherwise>
			        </c:choose>
				</div>
			</div>

		</div>
	</nav>
	<!-- Close Header -->

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form action="shop" method="get" class="modal-content modal-body border-0 p-0">
				<input type="hidden" name="action" value="search-product"/>
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch" name="productName" placeholder="Search ...">
					<button type="submit" class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>



	<!-- Start Content -->
	<div class="container py-5">
		<div class="row">
			
			<section class="h-100 h-custom cart-container" style="background-color: #d2c9ff;">
				  <div class="container py-5 h-100">
				    <div class="row d-flex justify-content-center align-items-center h-100">
				      <div class="col-12">
				        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
				          <div class="card-body p-0">
				            <div class="row g-0">
				              <div class="col-lg-8">
				                <div class="p-5">
				                  <div class="d-flex justify-content-between align-items-center mb-5">
				                    <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
				                    <h6 class="mb-0 text-muted">${sessionScope.totalQuantity} items</h6>
				                  </div>
				                  <hr class="my-4">
				
				                 <c:if test="${not empty sessionScope.cart}">
								    <c:forEach var="entry" items="${sessionScope.cart}">
								        <div class="row mb-4 d-flex justify-content-between align-items-center">
								            <div class="col-md-2 col-lg-2 col-xl-2">
								                <img src="assets/img/${entry.value.product.image}"
								                    class="img-fluid rounded-3">
								            </div>
								            <div class="col-md-3 col-lg-3 col-xl-3">
								                <h6 class="text-muted">${entry.value.product.category.name}</h6>
								                <h6 class="text-black mb-0">${entry.value.product.name}</h6>
								            </div>
								           
								            <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
								            	<form method="POST" style="display: flex; gap: 20px;" action="cart">
								            		<input type="hidden" name="action" value="edit-cart"/>
								            		<input type="hidden" name="productId" value="${entry.value.product.productId}">
									                <button class="btn btn-link px-2" type="submit"
									                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
									                    <i class="fas fa-minus"></i>
									                </button>
									                <input id="form1" min="0" style="width: 80px;" name="quantity" value="${entry.value.quantity}" type="number"
									                    class="form-control form-control-sm" />
									                <button class="btn btn-link px-2" type="submit"
									                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
									                    <i class="fas fa-plus"></i>
									                </button>
								                </form>
								            </div>
								            <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
								                <h6 class="mb-0">${entry.value.totalPrice} VNĐ</h6>
								            </div>
								            <div class="col-md-1 col-lg-1 col-xl-1 text-end">
								                <a href="cart?action=delete-cart&productId=${entry.value.product.productId}" class="text-muted"><i class="fas fa-times"></i></a>
								            </div>
								        </div>
								    </c:forEach>
								    <div class="text-center">
								        <p>Total Quantity: ${sessionScope.totalQuantity}</p>
								        <p>Total Price: ${sessionScope.totalPrice} VNĐ</p>
								    </div>
								</c:if>
								<c:if test="${empty sessionScope.cart}">
								    <div class="text-center">
								        <p>Your cart is empty.</p>
								    </div>
								</c:if>
				
				                  <hr class="my-4">
				
				                  <div class="pt-5">
				                    <h6 class="mb-0"><a href="shop" class="text-body"><i
				                          class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
				                  </div>
				                </div>
				              </div>
				              <div class="col-lg-4 bg-grey">
				                <div class="p-5">
				                  <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
				                  <hr class="my-4">
				                  
				                  <div class="d-flex justify-content-between mb-4">
				                    <h5 class="text-uppercase">Total quantity: </h5>
				                    <h5>${sessionScope.totalQuantity}</</h5>
				                  </div>

				                  <hr class="my-4">
				
				                  <div class="d-flex justify-content-between mb-5">
				                    <h5 class="text-uppercase">Total price</h5>
				                    <h5>${sessionScope.totalPrice} VNĐ</</h5>
				                  </div>
				                  
				                  <c:if test="${not empty thongBao}">
		                                <div class="alert alert-success" role="alert">
		                                    ${thongBao}
		                                </div>
		                            </c:if>
				
				                 <button class="btn btn-dark btn-block btn-lg" id="orderButton" data-mdb-ripple-color="dark">
				                 	Đặt Hàng
								</button>

				                </div>
				              </div>
				            </div>
				          </div>
				        </div>
				      </div>
				    </div>
				  </div>
				</section>
		</div>
	</div>
	<!-- End Content -->

	<!-- Start Footer -->
		<jsp:include page="/include/footer.jsp" />
	<!-- End Footer -->
	
	<script>
	    document.getElementById('orderButton').addEventListener('click', function () {
	        // Check if the cart is empty
	        if (${empty sessionScope.cart}) {
	            alert('Your cart is empty.');
	        } else {
	            // Check if the user is logged in before redirecting
	            if (${empty sessionScope.loggedInUser}) {
	                window.location.href = 'login.jsp';
	            } else {
	                // Redirect to the order page
	                window.location.href = 'cart?action=order';
	            }
	        }
	    });
	</script>

	<!-- Start Script -->
	<script src="assets/js/jquery-1.11.0.min.js"></script>
	<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/templatemo.js"></script>
	<script src="assets/js/custom.js"></script>
	<!-- End Script -->
</body>
</html>