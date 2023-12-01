<%@page contentType="text/html" pageEncoding="utf-8"%>
<jsp:include page="./include/header.jsp" />

    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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



    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./assets/img/banner_img_01.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success"><b>TST</b> eCommerce</h1>
                                <h3 class="h2">Văn hóa giải trí của các nước Trung, Hàn và Nhật Bản</h3>
                                <p>
                                    TSTShop là một trang web chuyên các sản phẩm về văn hóa giải trí của 3 nước Trung Hàn và Nhật.
                                    Các sản phẩm chủ yếu là truyện tranh, light novel, đĩa CD nhạc và các sản phẩm lightstick khác.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./assets/img/banner_img_02.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">Sản phẩm mới nhất</h1>
                                <h3 class="h2">Luôn theo cập nhật thông tin về các sản phẩm mới.</h3>
                                <p>
                                    Chúng tôi luôn theo dõi thị trường và xu hướng người sử dụng để đưa ra những sản phẩm mới và chất lượng nhất đáp ứng đầy đủ nhu cầu của người dùng. 
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./assets/img/banner_img_03.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">Chăm sóc khách hàng</h1>
                                <h3 class="h2">Những dịch vụ chăm sóc khách hàng tốt nhất </h3>
                                <p>
                                    Chúng tôi tự tin cam kết rằng,
                                    chúng tôi có những dịch vụ chăm sóc khách hàng tốt nhất, chất lượng nhất, 
                                    nhằm đem đến trải nghiệm tốt nhất cho người dùng khi mua hàng tại cửa hàng của chúng tôi.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->


    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">Những hạng mục sản phẩm chính</h1>
                <p>
                    Chúng tôi cung cấp các loại sản phẩm giải trí cụ thể: 
                    ManHwa, Nhật Bản và Hàn quốc  
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3">Manhwa</h5>
                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">Nhật Bản</h2>
                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">Hàn Quốc</h2>
                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
            </div>
        </div>
    </section>
    <!-- End Categories of The Month -->


    <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">Sản phẩm nổi bật</h1>
                    <p>
                        Dưới đây là các sản phẩm được người dùng đọc hoặc ưa thích nhiều nhất. Dựa trên xu hướng giới trẻ hiện nay. 
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="./assets/img/hoasontaikhoi.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">10.000VND</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">Hoa Sơn Tái Khởi</a>
                            <p class="card-text">
                                Dây là bộ truyện tranh về Chuyển sinh sau 100 năm với một thân xác nhỏ bé, 
                                Chong Myung nhận ra rằng Hoa Sơn Phái lẫy lừng năm xưa giờ chỉ còn là một môn phái nhỏ bé hoang tàn. 
                                Với kí ức và những môn tuyệt học thất truyền từ kiếp trước, Chong Myung quyết tâm tái khởi Hoa Sơn Phái một lần nữa.
                            </p>
                            <p class="text-muted">Reviews (24)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="./assets/img/chuthuathoichien.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">480.00VND</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">Chú thuật hồi chiến</a>
                            <p class="card-text">
                                Nhân vật chính Yuji Itadori vô tình hấp thụ một vật thể bị nguyền rủa và trở thành vật chủ của một Lời nguyền mạnh mẽ. 
                                Sau đó cậu được giới thiệu với thế giới bí mật của các Chú thuật sư và gia nhập Tokyo Jujutsu High. 
                                Cùng với những người bạn của mình, Yuji săn lùng những đồ vật bị nguyền rủa và chiến đấu với những Linh hồn bị nguyền rủa độc ác, 
                                đồng thời đối mặt với hậu quả của việc chứa chấp một thực thể nguy hiểm trong người.
                            </p>
                            <p class="text-muted">Reviews (48)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="./assets/img/godsnewjeans.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">$360.00</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">Gods-NewJeans</a>
                            <p class="card-text">
                                Bài hát chủ đề và MV chính thức của CKTG 2023 ft. NewJeans (뉴진스).
                            </p>
                            <p class="text-muted">Reviews (74)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->


    <!-- Footer -->
    <jsp:include page="./include/footer.jsp" />

    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
</body>

</html>