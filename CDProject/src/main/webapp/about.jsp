<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>TST shop - About Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
	<link rel="shortcut icon" type="image/x-icon" href="./assets/img/favicon.ico">

	<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="./assets/css/templatemo.css">
	<link rel="stylesheet" href="./assets/css/custom.css">

	<!-- Load fonts style after rendering the layout styles -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
	<link rel="stylesheet" href="./assets/css/fontawesome.min.css">

</head>

<body>
	<!-- Start Top Nav -->
	<nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
		<div class="container text-light">
			<div class="w-100 d-flex justify-content-between">
				<div>
					<i class="fa fa-envelope mx-2"></i>
					<a class="navbar-sm-brand text-light text-decoration-none"
						href="mailto:info@company.com">TSTShop@gmail.com</a>
					<i class="fa fa-phone mx-2"></i>
					<a class="navbar-sm-brand text-light text-decoration-none" href="tel:0949307528">0949307538</a>
				</div>
				<div>
					<a class="text-light" href="https://www.facebook.com/tst.shop.2023/" target="_blank"
						rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
					<a class="text-light" href="https://www.instagram.com/" target="_blank"><i
							class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
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



	<section class="bg-success py-5">
		<div class="container">
			<div class="row align-items-center py-5">
				<div class="col-md-8 text-white">
					<h1>About Us</h1>
					<p>
						Chúng tôi là một cửa hàng chuyên về các sản phẩm văn hóa giải trí của các nước trên thế giới.
						Luôn theo dõi và cập nhật những sản phẩm mới nhất, chất lượng nhất theo xu hướng của giới trẻ.
						Với những dịch vụ phục vụ nhu cầu mua sắm những sản phẩm giải trí như truyện tranh, albums, CD
						và lightstick...
						Chúng tôi tự tin đưa đến các bạn những sản phẩm chất lượng theo những gì chúng tôi đăng bán.
					</p>
				</div>
				<div class="col-md-4">
					<img src="./assets/img/about-hero.svg" alt="About Hero">
				</div>
			</div>
		</div>
	</section>
	<!-- Close Banner -->

	<!-- Start Section -->
	<section class="container py-5">
		<div class="row text-center pt-5 pb-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1">Our Services</h1>
				<p>
					Nhằm mục đích làm hài lòng khách hàng,
					chúng tôi có các dịch vụ giúp đỡ bạn khi gặp vấn đề về các sản phẩm.
				</p>
			</div>
		</div>
		<div class="row">

			<div class="col-md-6 col-lg-3 pb-5">
				<div class="h-100 py-5 services-icon-wap shadow">
					<div class="h1 text-success text-center"><i class="fa fa-truck fa-lg"></i></div>
					<h2 class="h5 mt-4 text-center">Delivery Services</h2>
					<p class="text-center">
						Chúng tôi có các dịch vụ vận chuyển tiết kiệm hoặc hỏa tốc nhằm đáp ứng nhu cầu của khách hàng.
					</p>
				</div>
			</div>

			<div class="col-md-6 col-lg-3 pb-5">
				<div class="h-100 py-5 services-icon-wap shadow">
					<div class="h1 text-success text-center"><i class="fas fa-exchange-alt"></i></div>
					<h2 class="h5 mt-4 text-center">Shipping & Return</h2>
					<p class="text-center">
						Nếu khách hàng gặp bất cứ vấn đề lỗi về hàng hóa,
						đừng vội đánh giá không tốt về sản phẩm,
						Hãy liên hệ với chúng tôi về tình trạng sản phẩm,
						Chúng tôi sẽ có những phương án đổi trả hợp lý để phù hợp với nhu cầu của khách hàng.
					</p>
				</div>
			</div>

			<div class="col-md-6 col-lg-3 pb-5">
				<div class="h-100 py-5 services-icon-wap shadow">
					<div class="h1 text-success text-center"><i class="fa fa-percent"></i></div>
					<h2 class="h5 mt-4 text-center">Promotion</h2>
					<p class="text-center">
						Chúng tôi thường xuyên có những chương trình khuyến mãi sản phẩm diễn ra,
						Hãy theo dõi website thường xuyên để săn đón những sản phẩm mới nhất nhé.
					</p>
				</div>
			</div>

			<div class="col-md-6 col-lg-3 pb-5">
				<div class="h-100 py-5 services-icon-wap shadow">
					<div class="h1 text-success text-center"><i class="fa fa-user"></i></div>
					<h2 class="h5 mt-4 text-center">24 Hours Service</h2>
					<p class="text-center">
						Nếu bạn có các thắc mắc về sản phẩm hoặc dịch vụ của chúng tôi.
						Hãy liên hệ qua email, instagram hoặc facebook để được tư vẫn kỹ kỹ lưỡng hơn,
						Đội ngũ tư vẫn viên luôn có mặt 24/7 để hài lòng khách hàng
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End Section -->

	<!-- Start Brands -->
	<section class="bg-light py-5">
		<div class="container my-4">
			<div class="row text-center py-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">Our Favorite Artist</h1>
					<p>
						Các Brands được ưa chuộng.
					</p>
				</div>
				<div class="col-lg-9 m-auto tempaltemo-carousel">
					<div class="row d-flex flex-row">
						<!--Controls-->
						<div class="col-1 align-self-center">
							<a class="h1" href="#templatemo-slide-brand" role="button" data-bs-slide="prev">
								<i class="text-light fas fa-chevron-left"></i>
							</a>
						</div>
						<!--End Controls-->

						<!--Carousel Wrapper-->
						<div class="col">
							<div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="templatemo-slide-brand"
								data-bs-ride="carousel">
								<!--Slides-->
								<div class="carousel-inner product-links-wap" role="listbox">

									<!--First slide-->
									<div class="carousel-item active">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#" onclick="preventDefaultAndRedirect_Artist(1)"><img class="img-fluid brand-img"
														src="assets/img/brand_01.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#" onclick="preventDefaultAndRedirect_Artist(7)"><img class="img-fluid brand-img"
														src="assets/img/brand_02.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#" onclick="preventDefaultAndRedirect_Artist(3)"><img class="img-fluid brand-img"
														src="assets/img/brand_03.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#" onclick="preventDefaultAndRedirect_Artist(4)"><img class="img-fluid brand-img"
														src="assets/img/brand_04.png" alt="Brand Logo"></a>
											</div>
																						
										</div>
									</div>
									<!--End First slide-->

									<!--Second slide-->
									<div class="carousel-item">
										<div class="row">
											<div class="col-3 p-md-5">
												<a href="#" onclick="preventDefaultAndRedirect_Artist(5)"><img class="img-fluid brand-img"
														src="assets/img/brand_05.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#" onclick="preventDefaultAndRedirect_Artist(1)"><img class="img-fluid brand-img"
														src="assets/img/brand_01.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#" onclick="preventDefaultAndRedirect_Artist(7)"><img class="img-fluid brand-img"
														src="assets/img/brand_02.png" alt="Brand Logo"></a>
											</div>
											<div class="col-3 p-md-5">
												<a href="#" onclick="preventDefaultAndRedirect_Artist(3)"><img class="img-fluid brand-img"
														src="assets/img/brand_03.png" alt="Brand Logo"></a>
										</div>
									</div>
									<!--End Second slide-->

								</div>
								<!--End Slides-->
							</div>
						</div>
						<!--End Carousel Wrapper-->

						<!--Controls-->
						<div class="col-1 align-self-center">
							<a class="h1" href="#templatemo-slide-brand" role="button" data-bs-slide="next">
								<i class="text-light fas fa-chevron-right"></i>
							</a>
						</div>
						<!--End Controls-->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--End Brands-->


	<!-- Start Footer -->
		<jsp:include page="/include/footer.jsp" />
		<div class="w-100 bg-black py-3">
			<div class="container">
				<div class="row pt-2">
					<div class="col-12">
						<p class="text-left text-light">
							Copyright &copy; 2023 TST Shop
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
	<script>
	    function preventDefaultAndRedirect_Artist(artistId) {
	        var url = 'shop?action=product-by-artist&artistId=' + artistId;
	        window.location.href = url;
	        return false;
	    }
	</script>
	<!-- End Script -->
</body>

</html>