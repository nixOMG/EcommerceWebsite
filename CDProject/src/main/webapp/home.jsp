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
                                <h3 class="h2">Văn hóa giải trí của các nước Trung, Hàn, Nhật Bản, Châu Mĩ</h3>
                                <p>
                                    Chúng tôi là một cửa hàng chuyên về các sản phẩm văn hóa giải trí của các nước trên thế giới.
									Luôn theo dõi và cập nhật những sản phẩm mới nhất, chất lượng nhất theo xu hướng của giới trẻ.
									Với những dịch vụ phục vụ nhu cầu mua sắm những sản phẩm giải trí như truyện tranh, albums, CD
									và lightstick...
									Chúng tôi tự tin đưa đến các bạn những sản phẩm chất lượng theo những gì chúng tôi đăng bán.
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
                    Novel, CD và Các LightStick khác.  
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="shop?action=product-by-category&categoryId=1"><img src="./assets/img/category_01.png" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">Album&CD</h2>
                <p class="text-center"><a class="btn btn-success" href="shop?action=product-by-category&categoryId=1">Go Shop</a></p>
            </div>        
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="shop?action=product-by-category&categoryId=3"><img src="./assets/img/category_03.png" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3">Books</h5>
                <p class="text-center"><a class="btn btn-success" href="shop?action=product-by-category&categoryId=3">Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="shop?action=product-by-category&categoryId=4"><img src="./assets/img/category_04.png" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">Merchandise</h2>
                <p class="text-center"><a class="btn btn-success" href="shop?action=product-by-category&categoryId=4">Go Shop</a></p>
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
                        <a href="shop?productId=21&action=detail">
                            <img src="./assets/img/SonTraNoMuon.png" class="card-img-top" alt="...">
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
                                <li class="text-muted text-right">230.000 VNĐ</li>
                            </ul>
                            <a href="shop?productId=21&action=detail" class="h2 text-decoration-none text-dark">SƠN TRÀ NỞ MUỘN</a>
                            <p class="card-text">
                                Nếu mỗi cuốn tiểu thuyết được ví như thời gian trong một ngày, 
                                thì Sơn Trà Nở Muộn có lẽ đã được bắt đầu vào thời điểm tăm tối nhất, 
                                đó chính là nửa đêm.Nữ chính Hứa Huệ Chanh không hề xinh đẹp tuyệt trần hay đáng yêu như những nữ chính khác. 
                                Cô có một khuôn mặt thanh tú, nhưng luôn bị che bởi lớp trang điểm lòe loẹt. 
                                Khi hai người đến với nhau, cô luôn tự ti về quá khứ của mình nên không phản đối việc Chung Định kết hôn với người khác.
                            </p>
                            <p class="text-muted">Reviews(1)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop?productId=2&action=detail">
                            <img src="./assets/img/tlinh_ai.png" class="card-img-top" alt="...">
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
                                <li class="text-muted text-right">250.000VNĐ</li>
                            </ul>
                            <a href="shop?productId=2&action=detail" class="h2 text-decoration-none text-dark">TLINH - ÁI ALBUM (STANDARD VER.) - ĐĨA CD</a>
                            <p class="card-text">
								Đúng với tên gọi, Ái như một cuốn nhật ký được hoàn thiện và đúc kết từ những chiêm nghiệm của tlinh khi quan sát và trải nghiệm tình yêu. 
								Rõ ràng, tình yêu luôn là nguồn cảm hứng “muôn thuở” của biết bao nghệ sĩ, và tlinh cũng không ngoại lệ. 
								Dường như, đây cũng là một trong những chất liệu chính xuất hiện trong các sản phẩm âm nhạc trước đây của cô. 
								Thông qua các bài hát như Người điên, Kho báu đánh rơi, Ghệ iu dấu của em ơi… 
								cùng những thước phim đầy màu sắc và thơ mộng trong một khu vườn đầy hoa, 
								khán giả vẫn dễ dàng nhận ra tlinh vẫn luôn yêu hết mình và xem tình yêu là một điều thiêng liêng, tuyệt diệu
                            </p>
                            <p class="text-muted">Reviews(35)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop?productId=10&action=detail">
                            <img src="./assets/img/blackpink_lightstick.png" class="card-img-top" alt="...">
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
                                <li class="text-muted text-right">980.000 VNĐ</li>
                            </ul>
                            <a href="shop?productId=10&action=detail" class="h2 text-decoration-none text-dark">BLACKPINK OFFICIAL LIGHT STICK VER.2</a>
                            <p class="card-text">
                                Lightstick của Blackpink Ver 2 mới, phát hành tháng 11/2020 nhận được rất nhiều sự quan tâm từ các Blink ngay từ thời điểm được ra mắt. 
                                Hiện tại, đây cũng là phiên bản được bán phổ biến hơn trên thị trường Việt Nam, bao gồm cả mua có sẵn hàng hoặc đặt oder từ nước ngoài.
                            </p>
                            <p class="text-muted">Reviews(24)</p>
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