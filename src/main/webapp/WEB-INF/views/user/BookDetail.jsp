<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chi tiết sản phẩm</title>

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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />

</head>
<body>
	<div id="toast"></div>
	<div id="confirmModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h2 class="modal-title">Xác nhận đơn hàng</h2>
				<span class="close" id="modalClose">&times;</span>
			</div>
			<div class="modal-body">
				<p class="title-question">Bạn có muốn xác nhận đơn hàng không?</p>
			</div>
			<div class="modal-footer">
				<button id="confirmYes" class="btn btn-yes">Có</button>
				<button id="confirmNo" class="btn btn-no">Không</button>
			</div>
		</div>
	</div>
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
								src="${pageContext.request.contextPath}/assets/user/images/home/logo.png"
								alt="Logo"></a>
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
								<li><a href="http://localhost:8080/bookstorePTIT/account/"><i class="fa fa-user"></i> Tài khoản</a></li>
								<li><a href=""><i class="fa fa-star"></i> Yêu thích</a></li>
								<li><a href="http://localhost:8080/bookstorePTIT/order/"><i class="fa fa-crosshairs"></i>
										Đơn hàng</a></li>
								<li><a
									href="http://localhost:8080/bookstorePTIT/shop-cart/"><i
										class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
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
								<li><a href="http://localhost:8080/bookstorePTIT/">Trang
										chủ</a></li>
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
								<li><a href="http://localhost:8080/bookstorePTIT/contact/">Liên hệ</a></li>
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
	<!--/header-->

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
						<!--/category-products-->

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
							<img
								src="${pageContext.request.contextPath}/assets/user/images/home/shipping.jpg"
								alt="Logo" />
						</div>
						<!--/shipping-->
					</div>
				</div>

				<div class="col-sm-9 padding-right">
					<div class="product-details">
						<!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img
									src="${pageContext.request.contextPath}/assets/user/images/home/${book.image}"
									alt="Logo" />
								<h3>ZOOM</h3>
							</div>
							<div id="similar-product" class="carousel slide"
								data-ride="carousel">

								<!-- Wrapper for slides -->
								<div class="carousel-inner">
									<div class="item active">
										<a href=""><img
											src="${pageContext.request.contextPath}/assets/user/images/product-details/similar1.jpg"
											alt=""></a> <a href=""><img
											src="${pageContext.request.contextPath}/assets/user/images/product-details/similar2.jpg"
											alt=""></a> <a href=""><img
											src="${pageContext.request.contextPath}/assets/user/images/product-details/similar3.jpg"
											alt=""></a>
									</div>
									<div class="item">
										<a href=""><img
											src="${pageContext.request.contextPath}/assets/user/images/product-details/similar1.jpg"
											alt=""></a> <a href=""><img
											src="${pageContext.request.contextPath}/assets/user/images/product-details/similar2.jpg"
											alt=""></a> <a href=""><img
											src="${pageContext.request.contextPath}/assets/user/images/product-details/similar3.jpg"
											alt=""></a>
									</div>
									<div class="item">
										<a href=""><img
											src="${pageContext.request.contextPath}/assets/user/images/product-details/similar1.jpg"
											alt=""></a> <a href=""><img
											src="${pageContext.request.contextPath}/assets/user/images/product-details/similar2.jpg"
											alt=""></a> <a href=""><img
											src="${pageContext.request.contextPath}/assets/user/images/product-details/similar3.jpg"
											alt=""></a>
									</div>

								</div>

								<!-- Controls -->
								<a class="left item-control" href="#similar-product"
									data-slide="prev"> <i class="fa fa-angle-left"></i>
								</a> <a class="right item-control" href="#similar-product"
									data-slide="next"> <i class="fa fa-angle-right"></i>
								</a>
							</div>

						</div>
						<div class="col-sm-7">
							<div class="product-information">
								<!--/product-information-->
								<img src="images/product-details/new.jpg" class="newarrival"
									alt="" />
								<h2>${book.name}</h2>
								<p>Web ID: ${book.bookID}</p>
								<img src="images/product-details/rating.png" alt="" /> <span>
									<span><fmt:formatNumber value="${book.price}"
											type="number" groupingUsed="true" /> đ</span> <label>Số
										lượng:</label>
									<div class="quantity-controls">
										<button type="button" class="btn-decrease"
											onclick="decreaseQuantity()">-</button>
										<input type="text" id="quantity" value="1" min="1" readonly />
										<button type="button" class="btn-increase"
											onclick="increaseQuantity()">+</button>
									</div>
									<button type="button" class="btn btn-fefault cart"
										onclick="addToCart(2)">
										<i class="fa fa-shopping-cart"></i> Thêm vào giỏ
									</button>
								</span>
								<p>
									<b>Thể loại:</b> ${categoryName}
								</p>
								<p>
									<b>Tác giả:</b> ${authorName}
								</p>
								<p>
									<b>Tình trạng:</b>
									<c:choose>
										<c:when test="${book.stock - book.sold > 0}">
            								Còn hàng
        								</c:when>
										<c:otherwise>
            								Hết hàng
        								</c:otherwise>
									</c:choose>
								</p>
								<p>
									<b>Brand:</b> E-SHOPPER
								</p>
								<a href=""><img src="images/product-details/share.png"
									class="share img-responsive" alt="" /></a>
							</div>
							<!--/product-information-->
						</div>
					</div>
					<!--/product-details-->

					<div class="category-tab shop-details-tab">
						<!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li><a href="#details" data-toggle="tab">Nội dung</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="reviews">
								<div class="col-sm-12">
									<ul>
										<li><a href=""><i class="fa fa-user"></i>TÁC GIẢ</a></li>
										<li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
										<li><a href=""><i class="fa fa-calendar-o"></i>31/12/2014</a></li>
									</ul>
									<p>${book.title}</p>
									<form action="#">
										<textarea name=""></textarea>
									</form>
								</div>
							</div>

						</div>
					</div>
					<!--/category-tab-->

					<div class="recommended_items">
						<!--recommended_items-->
						<h2 class="title text-center">GỢI Ý SẢN PHẨM</h2>

						<div id="recommended-item-carousel" class="carousel slide"
							data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
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
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart">
														<i class="fa fa-shopping-cart"></i>Add to cart
													</button>
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
										<img
											src="${pageContext.request.contextPath}/assets/user/images/home/iframe1.png"
											alt="" />
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
										<img
											src="${pageContext.request.contextPath}/assets/user/images/home/iframe2.png"
											alt="" />
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
										<img
											src="${pageContext.request.contextPath}/assets/user/images/home/iframe3.png"
											alt="" />
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
										<img
											src="${pageContext.request.contextPath}/assets/user/images/home/iframe4.png"
											alt="" />
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
							<img
								src="${pageContext.request.contextPath}/assets/user/images/home/map.png"
								alt="" />
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

	<script src="<%=request.getContextPath()%>/assets/user/js/jquery.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/user/js/price-range.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/user/js/jquery.scrollUp.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/user/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/user/js/jquery.prettyPhoto.js"></script>
	<script src="<%=request.getContextPath()%>/assets/user/js/main.js"></script>
	<script>
		function decreaseQuantity() {
			var quantityInput = document.getElementById('quantity');
			var currentValue = parseInt(quantityInput.value);
			if (currentValue > 1) {
				quantityInput.value = currentValue - 1;
			}
		}

		function increaseQuantity() {
			var quantityInput = document.getElementById('quantity');
			var currentValue = parseInt(quantityInput.value);
			quantityInput.value = currentValue + 1;
		}
		
		function addToCart(customerId) {
			const confirmModal = document.getElementById('confirmModal');
	        confirmModal.style.display = "block";

	        document.getElementById('confirmYes').onclick = function() {
	        	confirmModal.style.display = "none";

			    const pathSegments = window.location.pathname.split('/');
			    const bookId = pathSegments[pathSegments.length - 1];

			    const quantityInput = document.getElementById('quantity');
			    const quantity = parseInt(quantityInput.value);

			    if (isNaN(bookId) || bookId === "") {
			        alert("ID sách không hợp lệ!");
			        return;
			    }
			    if (isNaN(quantity) || quantity <= 0) {
			        alert("Số lượng không hợp lệ!");
			        return;
			    }

			    const cartData = {
			        customerID: customerId,
			        bookID: bookId, 
			        quantity: quantity 
			    };

			    fetch('/bookstorePTIT/cart/add', {
			        method: 'POST',
			        headers: {
			            'Content-Type': 'application/json'
			        },
			        body: JSON.stringify(cartData)
			    })
			    .then(response => response.json())
			    .then(data => {
			    	if (data.status === 0) {
			            toast({
			                title: "Chú ý!",
			                message: "Sách đã có trong giỏ hàng.",
			                type: "error",
			                duration: 1000
			            });
			        } else if (data.status === 1) {
			            toast({
			                title: "Thành công!",
			                message: "Sản phẩm đã được thêm vào giỏ hàng!",
			                type: "success",
			                duration: 1000
			            });
			        }
			    })
			    .catch(error => {
			        console.error('Error:', error);
			        alert('Có lỗi xảy ra!');
			    });
	        }
	        document.getElementById('confirmNo').onclick = function() {
	            confirmModal.style.display = "none";
	        };
		    
		}
		document.getElementById('modalClose').onclick = function() {
	        document.getElementById('confirmModal').style.display = "none";
	    };

	    window.onclick = function(event) {
	        const confirmModal = document.getElementById('confirmModal');
	        if (event.target === confirmModal) {
	            confirmModal.style.display = "none";
	        }
	    };
	    
	    function toast({ title = "", message = "", type = "info", duration = 3000 }) {
			const main = document.getElementById("toast");
			if (main) {
				const toast = document.createElement("div");
				
	    	    const autoRemoveId = setTimeout(function () {
	    	      main.removeChild(toast);
	    	    }, duration + 1000);

	    	    toast.onclick = function (e) {
	    	      if (e.target.closest(".toast__close")) {
	    	        main.removeChild(toast);
	    	        clearTimeout(autoRemoveId);
	    	      }
	    	    };

	    	    const icons = {
	    	      success: "fas fa-check-circle",
	    	      info: "fas fa-info-circle",
	    	      warning: "fas fa-exclamation-circle",
	    	      error: "fas fa-exclamation-circle"
	    	    };
	    	    const icon = icons[type];
	    	    console.log("icon:",icon);
	    	    const delay = (duration / 1000).toFixed(2);

	    	    toast.classList.add("toast", `toast--${type}`);
	    	    toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s ${delay}s forwards`;

	    	    toast.innerHTML = `
	    	                    <div class="toast__icon">
	    	                        <i class="${icon}"></i>
	    	                    </div>
	    	                    <div class="toast__body">
	    	                        <h3 class="toast__title">${title}</h3>
	    	                        <p class="toast__msg">${message}</p>
	    	                    </div>
	    	                    <div class="toast__close">
	    	                        <i class="fas fa-times"></i>
	    	                    </div>
	    	                `;
	    	    const toastIcon = toast.querySelector('.toast__icon');
				if (toastIcon) {
	    			const iconElement = document.createElement('i');
	    			iconElement.className = icon;
	    			toastIcon.appendChild(iconElement);
				}
	    	    const toastMessage = toast.querySelector('.toast__msg');
	    	    toastMessage.textContent = message; 
	    	    const toastTitle = toast.querySelector('.toast__title');
	    	    toastTitle.textContent = title; 
	    	    main.appendChild(toast);
			}
	    }
	</script>
</body>
</html>