<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đơn hàng</title>

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
				<p class="title-question">Bạn có muốn huỷ đơn hàng không?</p>
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
								<li><a href="http://localhost:8080/bookstorePTIT/order/"
									id="cart-link"><i class="fa fa-crosshairs"></i> Đơn hàng</a></li>
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

		<div class="header-bottom" style="padding-bottom: 0px">
			<!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-7">
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
								<li><a href=http://localhost:8080/bookstorePTIT/contact/">Liên hệ</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-5 search-order">
						<div class="filter-search">
							<label class="filter loc" for="orderStatus">Lọc:</label> <select
								id="orderStatus" name="orderStatus"
								class="form-control filter-order" onchange="filterOrders()">
								<option value="all">Tất cả</option>
								<option value="1">Đang chờ</option>
								<option value="2">Thành công</option>
								<option value="0">Đã huỷ</option>
							</select>
						</div>
						<div class="search_box pull-right">
							<input type="text" id="searchInput" placeholder="Tìm kiếm..." />
							<button class="search-button" onclick="searchData()">Tìm kiếm</button>
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
					<li class="active">Đơn hàng</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="order_menu">
							<td class="order_id">Mã đơn</td>
							<td class="product">Sản phẩm</td>
							<td class="price">Giá</td>
							<td class="total">Tổng tiền</td>
							<td class="information">Thông tin người đặt</td>
							<td class="time_order">Thời gian đặt</td>
							<td class="status">Trạng thái</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="order" items="${orders}">
							<tr class="order-row" data-order-status-id="${order.status}">
								<td class="id_order">${order.id}</td>
								<td class="product_info">
									<div class="product_list">
										<c:forEach var="item" items="${order.orderItems}">
											<div class="product_item">
												<img
													src="<%=request.getContextPath()%>/assets/user/images/home/b1.jpg"
													alt="${item.bookID}" />
												<div class="product_name" id="bookName-${item.bookID}">Loading...</div>
												<div class="quantity" style="margin-left: 7px;">(x${item.quantity})</div>
											</div>
										</c:forEach>
									</div>
								</td>
								<td class="price_order">
									<div class="price_list">
										<c:forEach var="item" items="${order.orderItems}">
											<div class="price_item"><fmt:formatNumber value="${item.price}" type="number" groupingUsed="true" /> đ</div>
										</c:forEach>
									</div>
								</td>
								<td class="total_order"><fmt:formatNumber
										value="${order.total}" type="number" groupingUsed="true" /> đ
								</td>
								<td class="customer_info">
									<div>Tên: ${order.name}</div>
									<div>SĐT: ${order.phone}</div>
									<div>Email: ${order.email}</div>
									<div>Địa chỉ: ${order.address}</div>
								</td>
								<td class="time_order">${order.formattedOrderDate}</td>
								<td class="status_order"><c:choose>
										<c:when test="${order.status == 0}">
											<button
												style="background-color: #e12e2bf2; color: white; border: none; width: 65px; height: 55px; padding: 5px 10px; cursor: pointer;">
												Đã huỷ</button>
										</c:when>
										<c:when test="${order.status == 1}">
											<button
												style="background-color: green; color: white; border: none; width: 65px; height: 55px; padding: 5px 10px; cursor: pointer;"
												onclick="deleteProductFromCart(${order.id})">Đang
												chờ</button>
										</c:when>
										<c:when test="${order.status == 2}">
											<button
												style="background-color: #3292e4; color: white; border: none; width: 65px; height: 55px; padding: 5px 10px; cursor: pointer;">
												Thành công</button>
										</c:when>
										<c:otherwise>
											<button
												style="background-color: gray; color: white; border: none; padding: 5px 10px; cursor: pointer;">
												Trạng thái không xác định</button>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
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
	$(document).ready(function() {
	    $(".product_item").each(function() {
	        var bookID = $(this).find("img").attr("alt"); 
	        if (!bookID) {
	            console.error("bookID is not found for this item");
	            return; 
	        }
	        var bookNameElement = $(this).find(".product_name");
	        var imageElement = $(this).find("img"); 

	        $.ajax({
	            url: '<%=request.getContextPath()%>/getBookName',
	            type: 'GET',
	            data: {
	                bookID: bookID
	            },
	            success: function(response) {
	                bookNameElement.text(response.name); 
	            },
	            error: function() {
	                bookNameElement.text("Error loading book name");
	            }
	        });

	        $.ajax({
	            url: '<%=request.getContextPath()%>/getBookImage', 
	            type: 'GET',
	            data: {
	                bookID: bookID
	            },
	            success: function(imageResponse) {
	                imageElement.attr("src", "<%=request.getContextPath()%>/assets/user/images/home/" + imageResponse);
	            },
	            error: function() {
	                imageElement.attr("src", "<%=request.getContextPath()%>/assets/user/images/home/default.jpg");
	            }
	        });
	    });
	});
	
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
    
    function deleteProductFromCart(orderID) {
        const url = '/bookstorePTIT/order/delete?orderID=' + orderID;
        console.log("orderID: ", orderID);
        
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
    	                title: "Đơn hàng đã được huỷ thành công.",
    	                type: "success",
    	                duration: 1000
    	            });
                	window.location.href = window.location.href;
                } else {
                    throw new Error('Có lỗi xảy ra khi xóa đơn hàng!');
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
    
    function filterOrders() {
        var selectedStatusId = document.getElementById("orderStatus").value;
        var orders = document.getElementsByClassName("order-row");

        for (var i = 0; i < orders.length; i++) {
            var orderStatusId = orders[i].getAttribute("data-order-status-id");

            if (selectedStatusId === 'all' || selectedStatusId === orderStatusId) {
                orders[i].style.display = "table-row";
            } else {
                orders[i].style.display = "none";
            }
        }
    }
    
    function searchData() {
        var searchInput = document.getElementById("searchInput").value.toLowerCase(); 
        var rows = document.querySelectorAll("tbody tr.order-row");

        rows.forEach(function(row) {
            var rowText = "";

            var cells = row.querySelectorAll("td");
            cells.forEach(function(cell) {
                rowText += cell.innerText.toLowerCase() + " ";
            });

            if (rowText.includes(searchInput)) {
                row.style.display = "table-row";
            } else {
                row.style.display = "none";
            }
        });
    }

	</script>

</body>
</html>