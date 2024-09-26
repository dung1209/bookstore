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
							<a href="index.html"><img
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
								<li><a href=""><i class="fa fa-user"></i> Tài khoản</a></li>
								<li><a href=""><i class="fa fa-star"></i> Yêu thích</a></li>
								<li><a href="checkout.html"><i class="fa fa-crosshairs"></i>
										Thanh toán</a></li>
								<li><a href="cart.html"><i class="fa fa-shopping-cart"></i>
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
								<li><a href="index.html">Trang chủ</a></li>
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
										<a href=""><img src="images/product-details/similar1.jpg"
											alt=""></a> <a href=""><img
											src="images/product-details/similar2.jpg" alt=""></a> <a
											href=""><img src="images/product-details/similar3.jpg"
											alt=""></a>
									</div>
									<div class="item">
										<a href=""><img src="images/product-details/similar1.jpg"
											alt=""></a> <a href=""><img
											src="images/product-details/similar2.jpg" alt=""></a> <a
											href=""><img src="images/product-details/similar3.jpg"
											alt=""></a>
									</div>
									<div class="item">
										<a href=""><img src="images/product-details/similar1.jpg"
											alt=""></a> <a href=""><img
											src="images/product-details/similar2.jpg" alt=""></a> <a
											href=""><img src="images/product-details/similar3.jpg"
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
								<p>Web ID: ${book.id}</p>
								<img src="images/product-details/rating.png" alt="" /> 
								<span>
									<span><fmt:formatNumber value="${book.price}" type="number" groupingUsed="true" /> đ</span> 
									<label>Số lượng:</label> <input type="text" value="1" />
									<button type="button" class="btn btn-fefault cart">
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
										<li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
										<li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
										<li><a href=""><i class="fa fa-calendar-o"></i>31 DEC
												2014</a></li>
									</ul>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua.Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat.Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur.</p>
									<p>
										<b>Write Your Review</b>
									</p>

									<form action="#">
										<span> <input type="text" placeholder="Your Name" /> <input
											type="email" placeholder="Email Address" />
										</span>
										<textarea name=""></textarea>
										<b>Rating: </b> <img src="images/product-details/rating.png"
											alt="" />
										<button type="button" class="btn btn-default pull-right">
											Submit</button>
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

</body>
</html>