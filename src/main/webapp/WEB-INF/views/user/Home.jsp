<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Mua Sách Online</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/prettyPhoto.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/price-range.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/animate.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/main.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/responsive.css">

<link rel="shortcut icon" href="assets/user/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="assets/user/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="assets/user/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="assets/user/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="assets/user/images/ico/apple-touch-icon-57-precomposed.png">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

</head>
<body>
	<header id="header">
		<!--header-->
		<div class="header_top">
			<!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6 ">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href=""><i class="fa fa-phone"></i> +2 95 01 88
										821</a></li>
								<li><a href=""><i class="fa fa-envelope"></i>
										bansach@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href=""><i class="fa fa-facebook"></i></a></li>
								<li><a href=""><i class="fa fa-twitter"></i></a></li>
								<li><a href=""><i class="fa fa-linkedin"></i></a></li>
								<li><a href=""><i class="fa fa-dribbble"></i></a></li>
								<li><a href=""><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header_top-->

		<div class="header-middle">
			<!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="http://localhost:8080/bookstorePTIT/"><img
								src="assets/user/images/home/logo.png" alt="" /></a>
						</div>
						<div class="btn-group pull-right">
							<div class="btn-group">
								<button type="button"
									class="btn btn-default dropdown-toggle usa"
									data-toggle="dropdown">
									Việt Nam <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="">Tiếng Việt</a></li>
									<li><a href="">Tiếng Anh</a></li>
								</ul>
							</div>

							<div class="btn-group">
								<button type="button"
									class="btn btn-default dropdown-toggle usa"
									data-toggle="dropdown">
									VNĐ <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="">VNĐ</a></li>
									<li><a href="">Dollar</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<li><a href=""><i class="fa fa-user"></i> Tài khoản</a></li>
								<li><a href=""><i class="fa fa-star"></i> Yêu thích</a></li>
								<li><a href="checkout.html"><i class="fa fa-crosshairs"></i>
										Thanh toán</a></li>
								<li><a href="http://localhost:8080/bookstorePTIT/shop-cart/"><i class="fa fa-shopping-cart"></i>
										Giỏ hàng</a></li>
								<li><a href="login.html"><i class="fa fa-lock"></i>
										Đăng nhập</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-middle-->

		<div class="header-bottom">
			<!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="http://localhost:8080/bookstorePTIT/">Trang chủ</a></li>
								<li class="dropdown"><a href="#" class="active">Cửa
										hàng<i class="fa fa-angle-down"></i>
								</a>
									<ul role="menu" class="sub-menu">
										<li><a href="shop.html" class="active">Sản phẩm</a></li>
										<li><a href="product-details.html">Mô tả sản phẩm</a></li>
										<li><a href="checkout.html">Thanh toán</a></li>
										<li><a href="cart.html">Giỏ hàng</a></li>
										<li><a href="login.html">Đăng nhập</a></li>
									</ul></li>
								<li class="dropdown"><a href="#">Blog<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="blog.html">Danh sách Blog</a></li>
										<li><a href="blog-single.html">Blog đơn</a></li>
									</ul></li>
								<li><a href="404.html">404</a></li>
								<li><a href="contact-us.html">Liên hệ</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Tìm kiếm..." />
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<section id="slider">
		<!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0"
								class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>

						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1>
										<span>E</span>-SHOPPER - BOOKSTORE
									</h1>
									<h2>Cánh cửa tri thức của bạn</h2>
									<p>Khám phá hàng ngàn đầu sách từ văn học, khoa học đến kỹ
										năng sống. Mỗi quyển sách là một thế giới chờ bạn khám phá.</p>
									<button type="button" class="btn btn-default get">Mua
										ngay</button>
								</div>
								<div class="col-sm-6">
									<img src="assets/user/images/home/book1.jpg"
										class="girl img-responsive" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1>
										<span>E</span>-SHOPPER - BOOKSTORE
									</h1>
									<h2>Thiết kế thân thiện và dễ sử dụng</h2>
									<p>Chúng tôi mang đến trải nghiệm mua sắm sách trực tuyến
										đơn giản, thân thiện với mọi thiết bị, giúp bạn dễ dàng tìm
										kiếm và đặt mua sách yêu thích.</p>
									<button type="button" class="btn btn-default get">Khám
										phá ngay</button>
								</div>
								<div class="col-sm-6">
									<img src="assets/user/images/home/book2.jpg"
										class="girl img-responsive" alt="" />
								</div>
							</div>

							<div class="item">
								<div class="col-sm-6">
									<h1>
										<span>E</span>-SHOPPER - BOOKSTORE
									</h1>
									<h2>Miễn phí vận chuyển toàn quốc</h2>
									<p>Mua sách tại B-Bookstore, bạn sẽ được hỗ trợ giao hàng
										miễn phí với các đơn hàng trên 200.000 VNĐ. Đặt mua sách dễ
										dàng, nhận hàng nhanh chóng.</p>
									<button type="button" class="btn btn-default get">Đặt
										sách ngay</button>
								</div>
								<div class="col-sm-6">
									<img src="assets/user/images/home/book3.jpg"
										class="girl img-responsive" alt="" />
								</div>
							</div>

						</div>

						<a href="#slider-carousel" class="left control-carousel hidden-xs"
							data-slide="prev"> <i class="fa fa-angle-left"></i>
						</a> <a href="#slider-carousel"
							class="right control-carousel hidden-xs" data-slide="next"> <i
							class="fa fa-angle-right"></i>
						</a>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>DANH MỤC</h2>
						<div class="panel-group category-products" id="accordian">
							<!--category-productsr-->
							<c:forEach var="category" items="${categories}">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a href="#">${category.name}</a>
										</h4>
									</div>
								</div>
							</c:forEach>
						</div>
						<!--/category-productsr-->

						<div class="brands_products">
							<!--brands_products-->
							<h2>Tác giả</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<c:forEach var="author" items="${authors}">
										<li><a href=""> <span class="pull-right">(50)</span>${author.name}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<!--/brands_products-->

						<div class="price-range">
							<!--price-range-->
							<h2>MỨC GIÁ</h2>
							<div class="well">
								<input type="text" class="span2" value="" data-slider-min="0"
									data-slider-max="600" data-slider-step="5"
									data-slider-value="[250,450]" id="sl2"><br /> <b>$
									0</b> <b class="pull-right">$ 600</b>
							</div>
						</div>
						<!--/price-range-->

						<div class="shipping text-center">
							<!--shipping-->
							<img src="assets/user/images/home/shipping.jpg" alt="" />
						</div>
						<!--/shipping-->
					</div>
				</div>

				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">SẢN PHẨM</h2>
						<c:forEach var="book" items="${books}">
							<div class="col-sm-4">
							<a href="${pageContext.request.contextPath}/book-detail/${book.id}">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<img src="assets/user/images/home/${book.image}" alt="" />
											<h2><fmt:formatNumber value="${book.price}" type="number" groupingUsed="true" />  đ</h2>
											<p>${book.name}</p>
											<a href="#" class="btn btn-default add-to-cart"> <i
												class="fa fa-shopping-cart"></i>Thêm vào giỏ
											</a>
										</div>
									</div>
									<div class="choose">
										<ul class="nav nav-pills nav-justified">
											<li><a href=""><i class="fa fa-plus-square"></i>Yêu thích</a></li>
											<li><a href=""><i class="fa fa-plus-square"></i>So sánh</a></li>
										</ul>
									</div>
								</div>
							</a>
							</div>
						</c:forEach>
						<ul class="pagination">
							<li class="active"><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">&raquo;</a></li>
						</ul>
					</div>
					<!--features_items-->
					<div class="category-tab">
						<!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tshirt" data-toggle="tab">T-Shirt</a></li>
								<li><a href="#blazers" data-toggle="tab">Blazers</a></li>
								<li><a href="#sunglass" data-toggle="tab">Sunglass</a></li>
								<li><a href="#kids" data-toggle="tab">Kids</a></li>
								<li><a href="#poloshirt" data-toggle="tab">Polo shirt</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="tshirt">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="blazers">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="sunglass">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="kids">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="poloshirt">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery2.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery4.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery3.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="assets/user/images/home/gallery1.jpg" alt="" />
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i
													class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--/category-tab-->

					<div class="recommended_items">
						<!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>

						<div id="recommended-item-carousel" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="assets/user/images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="assets/user/images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="assets/user/images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="assets/user/images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="assets/user/images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="assets/user/images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i
														class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
							<a class="left recommended-item-control"
								href="#recommended-item-carousel" data-slide="prev"> <i
								class="fa fa-angle-left"></i>
							</a> <a class="right recommended-item-control"
								href="#recommended-item-carousel" data-slide="next"> <i
								class="fa fa-angle-right"></i>
							</a>
						</div>
					</div>
					<!--/recommended_items-->
				</div>
			</div>
		</div>
	</section>

	<footer id="footer">
		<!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2>
								<span>e</span>-shopper
							</h2>
							<p>Khám phá thế giới tri thức với hàng ngàn đầu sách đa dạng
								từ nhiều lĩnh vực khác nhau, phù hợp với mọi lứa tuổi và sở
								thích.</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="assets/user/images/home/iframe1.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Hỗ trợ khách hàng</p>
								<h2>24 DEC 2024</h2>
							</div>
						</div>

						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="assets/user/images/home/iframe2.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Hỗ trợ khách hàng</p>
								<h2>24 DEC 2024</h2>
							</div>
						</div>

						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="assets/user/images/home/iframe3.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Hỗ trợ khách hàng</p>
								<h2>24 DEC 2024</h2>
							</div>
						</div>

						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="assets/user/images/home/iframe4.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Hỗ trợ khách hàng</p>
								<h2>24 DEC 2024</h2>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="assets/user/images/home/map.png" alt="" />
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>DỊCH VỤ</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Trợ giúp trực tuyến</a></li>
								<li><a href="">Liên hệ</a></li>
								<li><a href="">Trạng thái đơn hàng</a></li>
								<li><a href="">Thay đổi địa chỉ</a></li>
								<li><a href="">Câu hỏi thường gặp</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>WORKSHOP</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Sách văn học</a></li>
								<li><a href="">Sách khoa học</a></li>
								<li><a href="">Sách thiếu nhi</a></li>
								<li><a href="">Sách kỹ năng sống</a></li>
								<li><a href="">Sách giáo dục</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>CHÍNH SÁCH</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Điều khoản sử dụng</a></li>
								<li><a href="">Chính sách</a></li>
								<li><a href="">Chính sách hoàn tiền</a></li>
								<li><a href="">Hệ thống thanh toán</a></li>
								<li><a href="">Hệ thống vé</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>VỀ CHÚNG TÔI</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Thông tin công ty</a></li>
								<li><a href="">Nhân viên</a></li>
								<li><a href="">Vị trí cửa hàng</a></li>
								<li><a href="">Chương trình liên kết</a></li>
								<li><a href="">Bản quyền</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>VỀ NGƯỜI MUA</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Địa chỉ email của bạn..." />
								<button type="submit" class="btn btn-default">
									<i class="fa fa-arrow-circle-o-right"></i>
								</button>
								<p>
									Nhận thông tin cập nhật mới nhất từ <br />trang web của chúng
									tôi và tự cập nhật...
								</p>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Học viện Công nghệ Bưu chính Viễn thông -
						Cở sở tại TP.Hồ Chí Minh</p>
					<p class="pull-right">
						Thiết kế bởi <span>Nguyễn Văn Dũng - Trần Kim An - Nguyễn
							Hữu Vinh</span>
					</p>
				</div>
			</div>
		</div>

	</footer>
	<!--/Footer-->

	<script src="assets/user/js/jquery.js"></script>
	<script src="assets/user/js/price-range.js"></script>
	<script src="assets/user/js/jquery.scrollUp.min.js"></script>
	<script src="assets/user/js/bootstrap.min.js"></script>
	<script src="assets/user/js/jquery.prettyPhoto.js"></script>
	<script src="assets/user/js/main.js"></script>

</body>
</html>