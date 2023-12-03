<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./include/header.jsp" />

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

			<div class="col-lg-3">
			    <h1 class="h2 pb-4">Categories</h1>
			    <ul class="list-unstyled templatemo-accordion">
			        <c:forEach var="category" items="${categories}">
			            <li class="pb-3">
			                <a class="text-decoration-none" href="#" onclick="return preventDefaultAndRedirect(${category.categoryId})">
							    ${category.name}
							</a>
			            </li>
			        </c:forEach>
			    </ul>
    			<h1 class="h2 pb-4">Artists</h1>
			    <ul class="list-unstyled templatemo-accordion">
			        <c:forEach var="artist" items="${artists}">
			            <li class="pb-3">
			                <a class="text-decoration-none" href="#" onclick="return preventDefaultAndRedirect_Artist(${artist.artistId})">
							    ${artist.name}
							</a>
			            </li>
			        </c:forEach>
			    </ul>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
						    <c:choose>
						        <c:when test="${not empty selectedCategory}">
						            <li class="list-inline-item">
						                <a class="h3 text-dark text-decoration-none mr-3" href="#">
						                    ${selectedCategory.name}
						                </a>
						            </li>
						        </c:when>
						        <c:otherwise>
						            <li class="list-inline-item">
						                <a class="h3 text-dark text-decoration-none mr-3" href="#">
						                    All
						                </a>
						            </li>
						        </c:otherwise>
						    </c:choose>
						</ul>
					</div>
					<div class="col-md-6 pb-4">
						<div class="d-flex">
						    <select id="sortDropdown" class="form-control" onchange="handleChange()">
						    	<option>Sort</option>
						        <option value="priceasc">Price</option>
						        <option value="atoz">A to Z</option>
						    </select>
						</div>
					</div>
				</div>
				<div class="row">
		<c:forEach var="product" items="${products}">
            <div class="col-md-4">
                <div class="card mb-4 product-wap rounded-0">
                    <div class="card rounded-0">
                        <img class="card-img rounded-0 img-fluid" src="assets/img/${product.image}">
                        <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                            <ul class="list-unstyled">
                                <li><a class="btn btn-success text-white mt-2" href="shop?productId=${product.productId}&action=detail"><i class="far fa-eye"></i></a></li>
                                <li><a class="btn btn-success text-white mt-2" href="cart?action=add-cart&productId=${product.productId}"><i class="fas fa-cart-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <a href="shop?productId=${product.productId}&action=detail" class="h3 text-decoration-none">${product.name}</a>
                        <!-- Add other product details as needed -->
                        
                        <ul class="list-unstyled d-flex justify-content-center mb-1">
                            <li>
                                <c:forEach begin="1" end="${product.star}" var="star">
						            <i class="fa fa-star text-warning"></i>
						        </c:forEach>
						
						        <c:forEach begin="${product.star + 1}" end="5" var="emptyStar">
						            <i class="fa fa-star text-secondary"></i>
						        </c:forEach>
                            </li>
                        </ul>
                        <p class="text-center mb-0">${product.price} VNĐ</p>
                    </div>
                </div>
            </div>
        </c:forEach>
				</div>
				<div class="pagination-container">
				    <c:if test="${totalPages > 1}">
				        <ul class="pagination">
				            <c:forEach begin="1" end="${totalPages}" var="page">
				                <li class="<c:if test="${page == pageNumber}">active</c:if>">
				                    <a href="shop?page=${page}">${page}</a>
				                </li>
				            </c:forEach>
				        </ul>
				    </c:if>
				</div>
			</div>

		</div>
	</div>
	<!-- End Content -->

	<!-- Start Brands -->
	<section class="bg-light py-5">
		<div class="container my-4">
			<div class="row text-center py-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">Our Favorite Artist</h1>
					<p>
						Các Artist được ưa chuộng
					</p>
				</div>
				<div class="col-lg-9 m-auto tempaltemo-carousel">
					<div class="row d-flex flex-row">
						<!--Controls-->
						<div class="col-1 align-self-center">
							<a class="h1" href="#multi-item-example" role="button" data-bs-slide="prev">
								<i class="text-light fas fa-chevron-left"></i>
							</a>
						</div>
						<!--End Controls-->

						<!--Carousel Wrapper-->
						<div class="col">
							<div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="multi-item-example"
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
							<a class="h1" href="#multi-item-example" role="button" data-bs-slide="next">
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
	<!-- End Footer -->
	
	<script>
		window.onload = function() {
		    var sortDropdown = document.getElementById('sortDropdown');
		    
		    // Check if there is a selected sort option in the local storage
		    if(localStorage.getItem('selectedSortOption')) {
		        sortDropdown.value = localStorage.getItem('selectedSortOption');
		    }
		}
	
		function handleChange() {
		    var dropdown = document.getElementById("sortDropdown");
		    var selectedValue = dropdown.options[dropdown.selectedIndex].value;
	
		    // Store the selected sort option in the local storage
		    localStorage.setItem('selectedSortOption', selectedValue);
	
		    // Xử lý logic tương ứng với giá trị đã chọn
		    if (selectedValue === "priceasc") {
		        window.location.href = "shop?sort=priceasc&action=sort";
		    } else if (selectedValue === "atoz") {
		        window.location.href = "shop?sort=atoz&action=sort";
		    }
		}
	
		function preventDefaultAndRedirect(categoryId) {
		    var url = 'shop?action=product-by-category&categoryId=' + categoryId;
		    window.location.href = url;
		    return false;
		}
	
		function preventDefaultAndRedirect_Artist(artistId) {
		    var url = 'shop?action=product-by-artist&artistId=' + artistId;
		    window.location.href = url;
		    return false;
		}
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