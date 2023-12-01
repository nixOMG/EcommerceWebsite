<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entity.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<title>TST Shop - Product Detail Page</title>
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

	<!-- Slick -->
	<link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">
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
					<a class="navbar-sm-brand text-light text-decoration-none" href="tel:0949307825">0949307825</a>
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
			<form action="" method="get" class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
					<button type="submit" class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>



	<!-- Open Content -->
	<section class="bg-light">
		<c:if test="${not empty product}">
			<div class="container pb-5">
	        <div class="row">
	            <div class="col-lg-5 mt-5">
	                <div class="card mb-3">
	                    <img class="card-img img-fluid" src="assets/img/${product.image}" alt="Product Image" id="product-detail">
	                </div>
	                <!-- ... (phần carousel ảnh sản phẩm) ... -->
	            </div>
	            <!-- col end -->
	            <div class="col-lg-7 mt-5">
	                <div class="card">
	                    <div class="card-body">
	                        <h1 class="h2">${product.name}</h1>
	                        <p class="h3 py-2">${product.price} VNĐ</p>
	                        <p class="py-2">
	                            <i class="fa fa-star text-warning"></i>
	                            <i class="fa fa-star text-warning"></i>
	                            <i class="fa fa-star text-warning"></i>
	                            <i class="fa fa-star text-warning"></i>
	                            <i class="fa fa-star text-secondary"></i>
	                            <span class="list-inline-item text-dark">Rating 4.8 | 36 Comments</span>
	                        </p>
	                        <ul class="list-inline">
	                            <li class="list-inline-item">
	                                <h6>Genre:</h6>
	                            </li>
	                            <li class="list-inline-item">
	                                <p class="text-muted"><strong>${product.genre.name}</strong></p>
	                            </li>
	                        </ul>
	                        <ul class="list-inline">
	                            <li class="list-inline-item">
	                                <h6>Artist:</h6>
	                            </li>
	                            <li class="list-inline-item">
	                                <p class="text-muted"><strong>${product.artist.name}</strong></p>
	                            </li>
	                        </ul>
	                        <h6>Description:</h6>
	                        <p>${product.describle}</p>
	                        <form action="" method="GET">
	                            <input type="hidden" name="product-title" value="${product.name}">
	                            <div class="row">
	                                
	                            </div>
	                            <div class="row pb-3">
	                                <div class="col d-grid">
	                                   
	                                </div>
	                                <div class="col d-grid">
	                                    <a href="cart?action=add-cart&productId=${product.productId}" class="btn btn-success btn-lg">Add To Cart</a>
	                                </div>
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    </c:if>
	    <c:if test="${empty product}">
		    <div class="container">
		        <p class="text-danger">Sản phẩm không tồn tại.</p>
		    </div>
		</c:if>
	</section>
	<!-- Close Content -->

	<!-- Start Article -->
	<section class="py-5">
		<div class="container">
			<div class="row text-left p-2 pb-3">
				<h4>Related Products</h4>
			</div>

			<!--Start Carousel Wrapper-->
			<div id="carousel-related-product">

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_08.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">Red Clothing</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$20.00</p>
						</div>
					</div>
				</div>

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_09.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white" href="shop-single.html"><i
												class="far fa-heart"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">White Shirt</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li>M/L/X/XL</li>
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$25.00</p>
						</div>
					</div>
				</div>

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_10.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white" href="shop-single.html"><i
												class="far fa-heart"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">Oupidatat non</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li>M/L/X/XL</li>
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$45.00</p>
						</div>
					</div>
				</div>

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_11.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white" href="shop-single.html"><i
												class="far fa-heart"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">Black Fashion</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li>M/L/X/XL</li>
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$60.00</p>
						</div>
					</div>
				</div>

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_08.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white" href="shop-single.html"><i
												class="far fa-heart"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">Oupidatat non</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li class="">M/L/X/XL</li>
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$80.00</p>
						</div>
					</div>
				</div>

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_09.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white" href="shop-single.html"><i
												class="far fa-heart"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">Oupidatat non</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li>M/L/X/XL</li>
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$110.00</p>
						</div>
					</div>
				</div>

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_10.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white" href="shop-single.html"><i
												class="far fa-heart"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">Oupidatat non</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li>M/L/X/XL</li>
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$125.00</p>
						</div>
					</div>
				</div>

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_11.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white" href="shop-single.html"><i
												class="far fa-heart"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">Oupidatat non</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li>M/L/X/XL</li>
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$160.00</p>
						</div>
					</div>
				</div>

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_08.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white" href="shop-single.html"><i
												class="far fa-heart"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">Oupidatat non</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li>M/L/X/XL</li>
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$180.00</p>
						</div>
					</div>
				</div>

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_09.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white" href="shop-single.html"><i
												class="far fa-heart"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">Oupidatat non</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li>M/L/X/XL</li>
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$220.00</p>
						</div>
					</div>
				</div>

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_10.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white" href="shop-single.html"><i
												class="far fa-heart"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">Oupidatat non</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li>M/L/X/XL</li>
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$250.00</p>
						</div>
					</div>
				</div>

				<div class="p-2 pb-3">
					<div class="product-wap card rounded-0">
						<div class="card rounded-0">
							<img class="card-img rounded-0 img-fluid" src="assets/img/shop_11.jpg">
							<div
								class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
								<ul class="list-unstyled">
									<li><a class="btn btn-success text-white" href="shop-single.html"><i
												class="far fa-heart"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="far fa-eye"></i></a></li>
									<li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i
												class="fas fa-cart-plus"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="card-body">
							<a href="shop-single.html" class="h3 text-decoration-none">Oupidatat non</a>
							<ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
								<li>M/L/X/XL</li>
								<li class="pt-2">
									<span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
									<span
										class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
								</li>
							</ul>
							<ul class="list-unstyled d-flex justify-content-center mb-1">
								<li>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-warning fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
									<i class="text-muted fa fa-star"></i>
								</li>
							</ul>
							<p class="text-center mb-0">$300.00</p>
						</div>
					</div>
				</div>

			</div>


		</div>
	</section>
	<!-- End Article -->


	<!-- Start Footer -->
	<footer class="bg-dark" id="tempaltemo_footer">
		<div class="container">
			<div class="row">

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-success border-bottom pb-3 border-light logo">TST Shop</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li>
							<i class="fas fa-map-marker-alt fa-fw"></i>
							01 Võ Văn Ngân, Linh Trung, Thủ Đức, TPHCM
						</li>
						<li>
							<i class="fa fa-phone fa-fw"></i>
							<a class="text-decoration-none" href="tel:0949307825">0949307825</a>
						</li>
						<li>
							<i class="fa fa-envelope fa-fw"></i>
							<a class="text-decoration-none" href="mailto:TSTShop@gmail.com">TSTShop@gmail.com</a>
						</li>
					</ul>
				</div>

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><a class="text-decoration-none" href="#">Album/CDs</a></li>
						<li><a class="text-decoration-none" href="#">Vinyl</a></li>
						<li><a class="text-decoration-none" href="#">Books</a></li>
						<li><a class="text-decoration-none" href="#">Lightstick</a></li>
						<li><a class="text-decoration-none" href="#">Magazine</a></li>
						<li><a class="text-decoration-none" href="#">Clothing</a></li>
					</ul>
				</div>

				<div class="col-md-4 pt-5">
					<h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
					<ul class="list-unstyled text-light footer-link-list">
						<li><a class="text-decoration-none" href="#">Home</a></li>
						<li><a class="text-decoration-none" href="#">About Us</a></li>
						<li><a class="text-decoration-none" href="#">Shop Locations</a></li>
						<li><a class="text-decoration-none" href="#">FAQs</a></li>
						<li><a class="text-decoration-none" href="#">Contact</a></li>
					</ul>
				</div>

			</div>

			<div class="row text-light mb-4">
				<div class="col-12 mb-3">
					<div class="w-100 my-3 border-top border-light"></div>
				</div>
				<div class="col-auto me-auto">
					<ul class="list-inline text-left footer-icons">
						<li class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/"><i
									class="fab fa-facebook-f fa-lg fa-fw"></i></a>
						</li>
						<li class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
								href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
						</li>
						<li class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/"><i
									class="fab fa-twitter fa-lg fa-fw"></i></a>
						</li>
						<li class="list-inline-item border border-light rounded-circle text-center">
							<a class="text-light text-decoration-none" target="_blank"
								href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-lg fa-fw"></i></a>
						</li>
					</ul>
				</div>
				<div class="col-auto">
					<label class="sr-only" for="subscribeEmail">Email address</label>
					<div class="input-group mb-2">
						<input type="text" class="form-control bg-dark border-light" id="subscribeEmail"
							placeholder="Email address">
						<div class="input-group-text btn-success text-light">Subscribe</div>
					</div>
				</div>
			</div>
		</div>

		<div class="w-100 bg-black py-3">
			<div class="container">
				<div class="row pt-2">
					<div class="col-12">
						<p class="text-left text-light">
							Copyright &copy; 2021 Company Name
							| Designed by <a rel="sponsored" href="https://templatemo.com"
								target="_blank">TemplateMo</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!-- End Footer -->

	<!-- Start Script -->
	<script src="assets/js/jquery-1.11.0.min.js"></script>
	<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/templatemo.js"></script>
	<script src="assets/js/custom.js"></script>
	<!-- End Script -->

	<!-- Start Slider Script -->
	<script src="assets/js/slick.min.js"></script>
	<script>
		$('#carousel-related-product').slick({
			infinite: true,
			arrows: false,
			slidesToShow: 4,
			slidesToScroll: 3,
			dots: true,
			responsive: [{
				breakpoint: 1024,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 3
				}
			},
			{
				breakpoint: 600,
				settings: {
					slidesToShow: 2,
					slidesToScroll: 3
				}
			},
			{
				breakpoint: 480,
				settings: {
					slidesToShow: 2,
					slidesToScroll: 3
				}
			}
			]
		});
	</script>
	<!-- End Slider Script -->

</body>
</html>