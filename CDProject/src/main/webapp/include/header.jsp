<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="entity.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <title>TST Shop eCommerce </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="./assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="./assets/img/favicon.ico">

    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/templatemo.css">
    <link rel="stylesheet" href="./assets/css/custom.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="./assets/css/fontawesome.min.css">

</head>

<body>
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:TSTShop@gmail.com">TSTShop@gmail.com</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:0949307528">0949307528</a>
                </div>
                <div>
                    <a class="text-light" href="https://www.facebook.com/tst.shop.2023/" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                </div>
            </div>
        </div>
    </nav>
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="index.jsp">
                TST
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
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
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
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
							    Xin chào, ${loggedInUser.getLastName()}!
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