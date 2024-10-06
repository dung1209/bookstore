<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thanh toán</title>

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
							<button type="button" class="btn btn-default dropdown-toggle usa"
								data-toggle="dropdown">
								Việt Nam <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="">Tiếng Việt</a></li>
								<li><a href="">Tiếng Anh</a></li>
							</ul>
						</div>

						<div class="btn-group">
							<button type="button" class="btn btn-default dropdown-toggle usa"
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
							<li><a href="checkout.html" id="checkout-link"><i
									class="fa fa-crosshairs"></i> Thanh toán</a></li>
							<li><a href="http://localhost:8080/bookstorePTIT/shop-cart/"><i
									class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
							<li><a href="login.html"><i class="fa fa-lock"></i> Đăng
									nhập</a></li>
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
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="http://localhost:8080/bookstorePTIT/">Trang
									chủ</a></li>
							<li class="dropdown"><a href="#" class="active">Cửa hàng<i
									class="fa fa-angle-down"></i>
							</a>
								<ul role="menu" class="sub-menu">
									<li><a href="shop.html" class="active">Sản phẩm</a></li>
									<li><a href="product-details.html">Mô tả sản phẩm</a></li>
									<li><a href="checkout.html">Thanh toán</a></li>
									<li><a
										href="http://localhost:8080/bookstorePTIT/shop-cart/">Giỏ
											hàng</a></li>
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

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">Thanh toán</li>
				</ol>
			</div>
			<!--/breadcrums-->

			<div class="register-req">
				<p>Vui lòng nhập thông tin của bạn để hoàn tất quá trình mua
					hàng.</p>
			</div>
			<!--/register-req-->

			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-5">
						<div class="logocheckout">
							<img
								src="${pageContext.request.contextPath}/assets/user/images/home/checkout.jpg"
								alt="Logo">
						</div>
					</div>
					<div class="col-sm-3">
						<div class="shopper-info">
							<p>Thông tin người đặt hàng</p>
							<form>
								<input type="text" placeholder="Tên"> <input type="text"
									placeholder="Số điện thoại"> <input type="text"
									placeholder="Email"> <input type="text"
									placeholder="Địa chỉ">
							</form>
							<a id="submitOrder" class="btn btn-primary" href="">Thanh
								toán</a>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="order-message">
							<p>Ghi chú</p>
							<textarea name="message"
								placeholder="Ghi chú về đơn hàng của bạn..." rows="16"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="review-payment">
				<h2>Đánh giá & Thanh toán</h2>
			</div>

			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image custom-image">Ảnh</td>
							<td class="description">Tên sản phẩm</td>
							<td class="price">Giá</td>
							<td class="quantity">Số lượng</td>
							<td class="total">Tổng</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${selectedBooks}">
							<tr>
								<td class="cart_product checkout"><a href=""><img
										src="${pageContext.request.contextPath}/assets/user/images/home/${book.image}"
										alt="" style="width: 100px; height: auto; margin-left: 20px;"></a>
								</td>
								<td class="cart_description">
									<h4>
										<a href="">${book.name}</a>
									</h4>
									<p>Web ID: ${book.productId}</p>
								</td>
								<td class="cart_price">
									<p>
										<fmt:formatNumber value="${book.price}" type="number"
											groupingUsed="true" />
										đ
									</p>
								</td>
								<td class="cart_quantity">
									<div class="cart_quantity_button">
										<input class="cart_quantity_input" type="text" name="quantity"
											value="${book.quantity}" autocomplete="off" size="2">
									</div>
								</td>
								<td class="cart_total">
									<p class="cart_total_price">
										<fmt:formatNumber value="${book.price*book.quantity}"
											type="number" groupingUsed="true" />
										đ
									</p>
								</td>
								<td class="cart_delete"><a class="cart_quantity_delete"
									href=""><i class="fa fa-times"></i></a></td>
							</tr>
							<c:set var="totalSum"
								value="${totalSum + (book.price * book.quantity)}" />
						</c:forEach>
						<tr>
							<td colspan="3">&nbsp;</td>
							<td colspan="3">
								<table class="table table-condensed total-result">
									<tr>
										<td>Tổng tiền giỏ hàng</td>
										<td><fmt:formatNumber value="${totalSum}" type="number"
												groupingUsed="true" /> đ</td>
									</tr>
									<tr class="shipping-cost">
										<td>Phí giao hàng</td>
										<td>Miễn phí</td>
									</tr>
									<tr>
										<td id="totalSumMoney" style="padding-top: 20px">Tổng
											tiền</td>
										<td style="padding-top: 20px"><span
											style="font-size: 20px;"><fmt:formatNumber
													value="${totalSum}" type="number" groupingUsed="true" /> đ</span></td>
									</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</section>
	<!--/#cart_items-->

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
    document.getElementById('submitOrder').addEventListener('click', function(event) {
        event.preventDefault();

        const name = document.querySelector('input[placeholder="Tên"]').value;
        const phone = document.querySelector('input[placeholder="Số điện thoại"]').value;
        const email = document.querySelector('input[placeholder="Email"]').value;
        const address = document.querySelector('input[placeholder="Địa chỉ"]').value;
        const note = document.querySelector('textarea[name="message"]').value;

        const total = Array.from(document.querySelectorAll('.cart_total_price'))
            .reduce((acc, el) => acc + parseFloat(el.textContent.replace(/,/g, '').replace('đ', '').trim()), 0) * 1000;

        const order = {
            name: name,
            phone: phone,
            email: email,
            address: address,
            note: note,
            total: total
        };

        fetch('/bookstorePTIT/create', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(order)
        })
        .then(response => {
            if (response.ok) {
                return response.text(); 
            }
            throw new Error('Có lỗi xảy ra!');
        })
        .then(data => {
            alert(data); 
            window.location.href = "http://localhost:8080/bookstorePTIT/thankyou";
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });

	</script>

</body>
</html>