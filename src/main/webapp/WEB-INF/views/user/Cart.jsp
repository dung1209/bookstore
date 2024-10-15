<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Giỏ hàng</title>

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
				<h2 class="modal-title">Xác nhận</h2>
				<span class="close" id="modalClose">&times;</span>
			</div>
			<div class="modal-body">
				<p class="title-question">Bạn có muốn xoá sản phẩm khỏi giỏ hàng không?</p>
			</div>
			<div class="modal-footer">
				<button id="confirmYes" class="btn btn-yes">Có</button>
				<button id="confirmNo" class="btn btn-no">Không</button>
			</div>
		</div>
	</div>
	<header id="header">
		<!--header-->
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
								alt="Logo" /></a>
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
								<li><a
									href="http://localhost:8080/bookstorePTIT/shop-cart/"
									id="cart-link"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
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
					<li><a href="http://localhost:8080/bookstorePTIT/">Home</a></li>
					<li class="active">Giỏ hàng</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="select">Chọn</td>
							<td class="image">Ảnh</td>
							<td class="description">Tên sản phẩm</td>
							<td class="price">Giá</td>
							<td class="quantity">Số lượng</td>
							<td class="total">Tổng</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cart" items="${carts}" varStatus="loop">
							<tr data-bookid="${booksInCart[loop.index].bookID}">
								<td class="cart_select"><input type="checkbox"
									name="selectCartItem" value="${booksInCart[loop.index].bookID}"
									data-quantity="${cart.quantity}"
									data-price="${booksInCart[loop.index].price}"
									data-productID="${booksInCart[loop.index].bookID}"
									data-index="${loop.index}"
									onclick="toggleCheckbox()"></td>
								<td class="cart_product"><a href=""> <img
										src="${pageContext.request.contextPath}/assets/user/images/home/${booksInCart[loop.index].image}"
										alt="Logo" style="width: 100px; height: auto;" /></a></td>
								<td class="cart_description">
									<h4>
										<a href="">${booksInCart[loop.index].name}</a>
									</h4>
									<p>Web ID: ${booksInCart[loop.index].bookID}</p>
								</td>
								<td class="cart_price">
									<p id="price_${loop.index}">
										<fmt:formatNumber value="${booksInCart[loop.index].price}"
											type="number" groupingUsed="true" />
										đ
									</p>
								</td>
								<td class="cart_quantity">
									<div class="cart_quantity_button">
										<a class="cart_quantity_down"
											onclick="decreaseQuantity(${loop.index});"> - </a> <input
											id="quantity_${loop.index}" class="cart_quantity_input"
											type="text" name="quantity" value="${cart.quantity}"
											autocomplete="off" size="2"> <a
											class="cart_quantity_up"
											onclick="increaseQuantity(${loop.index});"> + </a>
									</div>
								</td>
								<td class="cart_total">
									<p class="cart_total_price" id="total_${loop.index}">
										<fmt:formatNumber
											value="${booksInCart[loop.index].price * cart.quantity}"
											type="number" groupingUsed="true" />
										đ
									</p>
								</td>
								<td class="cart_delete">
									<a class="cart_quantity_delete" href="javascript:void(0)" onclick="deleteProductFromCart(${booksInCart[loop.index].bookID})"><i class="fa fa-times"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>

	<!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="chose_area">
						<ul class="user_option">
							<li><input type="checkbox"> <label>Phiếu giảm giá</label></li>
							<li><input type="checkbox"> <label>Phiếu quà tặng</label></li>
							<li><input type="checkbox"> <label>Vận chuyển & Thuế</label></li>
						</ul>
						<ul class="user_info">
							<li class="single_field"><label>Đất nước:</label> <select>
									<option>Việt Nam</option>
									<option>Bangladesh</option>
									<option>UK</option>
									<option>India</option>
									<option>United States</option>
									<option>Ucrane</option>
									<option>Canada</option>
									<option>Dubai</option>
							</select></li>
							<li class="single_field"><label>Khu vực:</label> <select>
									<option>Select</option>
									<option>Dhaka</option>
									<option>London</option>
									<option>Dillih</option>
									<option>Lahore</option>
									<option>Alaska</option>
									<option>Canada</option>
									<option>Dubai</option>
							</select></li>
							<li class="single_field zip-field"><label>Mã Code:</label>
								<input type="text"></li>
						</ul>
						<a class="btn btn-default update" href="">Quay lại</a> <a
							class="btn btn-default update" href="">Tiếp tục</a>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="total_area">
						<div
							style="display: flex; align-items: center; margin-top: 10px; margin-left: 15%;">
							<strong id="totalSumMoney">Tổng tiền:</strong>
							<p id="totalSum" class="cart_total_price">0 đ</p>
						</div>
						<a class="btn btn-default check_out" href="javascript:void(0);" onclick="redirectToCheckout()">Thanh toán</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#do_action-->

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
											src="<%=request.getContextPath()%>/assets/user/images/home/iframe1.png"
											alt="Logo" />
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
											src="<%=request.getContextPath()%>/assets/user/images/home/iframe2.png"
											alt="Logo" />
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
											src="<%=request.getContextPath()%>/assets/user/images/home/iframe3.png"
											alt="Logo" />
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
											src="<%=request.getContextPath()%>/assets/user/images/home/iframe4.png"
											alt="Logo" />
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
								src="<%=request.getContextPath()%>/assets/user/images/home/map.png"
								alt="Logo" />
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
	function decreaseQuantity(index) {
	    var quantityInput = document.getElementById('quantity_' + index);
	    var currentValue = parseInt(quantityInput.value);
	    if (currentValue > 1) {
	        quantityInput.value = currentValue - 1; 
	        updateTotal(index); 
	    }
	    updateGrandTotal();
	}

	function increaseQuantity(index) {
	    var quantityInput = document.getElementById('quantity_' + index);
	    var currentValue = parseInt(quantityInput.value);
	    quantityInput.value = currentValue + 1; 
	    updateTotal(index);
	    updateGrandTotal(); 
	}

	function updateTotal(index) {
	    var quantityInput = document.getElementById('quantity_' + index);
	    var price = parseFloat(document.getElementById('price_' + index).innerText.replace(/[^0-9.-]+/g, ''));
	    var quantity = parseInt(quantityInput.value);
	    var total = quantity * price * 1000;

	    document.getElementById('total_' + index).innerText = total.toLocaleString() + ' đ';
	    updateGrandTotal(); 
	}

	function updateGrandTotal() {
	    var totalPrice = 0; 

	    var rows = document.querySelectorAll('.cart_select');
	    rows.forEach(function(checkbox) {
	        var input = checkbox.querySelector('input[name="selectCartItem"]');
	        if (input.checked) {
	            var row = checkbox.closest('tr'); // Lấy hàng tương ứng
	            var quantityInput = row.querySelector('.cart_quantity_input');
	            var quantity = parseInt(quantityInput.value); 
	            var priceCell = row.querySelector('.cart_price p');
	            var price = parseFloat(priceCell.innerText.replace(/[^0-9.-]+/g, ''));
	            totalPrice += quantity * price * 1000; 
	        }
	    });
	    document.getElementById('totalSum').innerText = totalPrice.toLocaleString() + ' đ';
	}

	function toggleCheckbox() {
	    updateGrandTotal(); 
	}
	
	function redirectToCheckout() {
	    console.log("Checkout function called.");

	    const checkedProducts = document.querySelectorAll('input[name="selectCartItem"]:checked');

	    if (checkedProducts.length === 0) {
	    	toast({
                title: "Thông báo!",
                message: "Vui lòng chọn ít nhất 1 sản phẩm để thanh toán.",
                type: "error",
                duration: 1000
            });
	    } else{
	    	let queryParams = Array.from(checkedProducts).map(checkbox => {
		        const row = checkbox.closest('tr');
		        const quantityInput = row.querySelector('.cart_quantity_input'); 
		        const quantity = parseInt(quantityInput.value) || 0; 
		        const productId = checkbox.dataset.productid;
		        console.log("Product ID: ", productId, " Quantity: ", quantity);

		        if (!productId || !quantity) {
		            console.warn("Missing productId or quantity.");
		        }
		        return 'productId=' + productId + '&quantity=' + quantity;
		    });
		    const queryString = queryParams.join('&');
		    console.log("Query String: ", queryString);
		    window.location.href = 'checkout?' + queryString;
	    }
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

    function deleteProductFromCart(bookID) {
        const url = '/bookstorePTIT/cart/delete?bookID=' + bookID;
        
        const confirmModal = document.getElementById('confirmModal');
        confirmModal.style.display = "block";

        document.getElementById('confirmYes').onclick = function() {
        	confirmModal.style.display = "none";
        	fetch(url, {
                method: 'POST',
            })
            .then(response => {
                if (response.ok) {
                	toast({
    	                title: "Thành công!",
    	                message: "Sách đã được xoá khỏi giỏ hàng thành công.",
    	                type: "success",
    	                duration: 1000
    	            });
                	
                	const rowToDelete = document.querySelector(`tbody tr[data-bookid='${bookID}']`);
                    if (rowToDelete) {
                        rowToDelete.remove();
                    }
                } else {
                    throw new Error('Có lỗi xảy ra khi xóa sản phẩm!');
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
        document.getElementById('confirmNo').onclick = function() {
            confirmModal.style.display = "none";
        };
    }

	</script>
</body>
</html>