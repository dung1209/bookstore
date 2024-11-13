<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tài khoản</title>

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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<div id="toast"></div>
	<div id="confirmModal" class="modal">
		<div class="modal-content" style="margin: 5% auto;">
			<div class="modal-header">
				<h2 class="modal-title">Chỉnh sửa thông tin</h2>
				<span class="close" id="modalClose">&times;</span>
			</div>
			<div class="modal-body">
				<div>
					<div class="infor-customer1">Họ và tên:</div>
					<input type="text" name="name" class="form-control"
						required="required" placeholder="Tên" value="${customer.name}">
				</div>
				<div>
					<div class="infor-customer1">Số điện thoại:</div>
					<input type="text" name="phone" class="form-control"
						required="required" placeholder="Số điện thoại"
						value="${customer.phone}">

				</div>
				<div>
					<div class="infor-customer1">Email:</div>
					<input type="email" name="email" class="form-control"
						required="required" placeholder="Email" value="${email}">
				</div>
				<div>
					<div class="infor-customer1">Địa chỉ:</div>
					<input type="email" name="address" class="form-control"
						required="required" placeholder="Địa chỉ"
						value="${customer.address}">
				</div>
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
							<a href="/bookstorePTIT/"><img
								src="${pageContext.request.contextPath}/assets/user/images/home/logo.png"
								alt="Logo" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">		
								<!--<c:if test="${empty sessionScope.username}">
									<li><a href="/bookstorePTIT/account/"><i class="fa fa-user"></i> Tài khoản</a></li>
								</c:if>-->
								<c:if test="${not empty sessionScope.username}">
									<li><a href="/bookstorePTIT/account/" style="color: #FE980F;"><i
											class="fa fa-user"></i>${sessionScope.username}</a></li>
								</c:if>
								<!-- <li><a href=""><i class="fa fa-star"></i> Yêu thích</a></li> -->
								<c:if test="${not empty sessionScope.username}">
									<li><a href="/bookstorePTIT/order/"><i
										class="fa fa-crosshairs"></i> Đơn hàng</a></li>
								</c:if>
								<c:if test="${not empty sessionScope.username}">
									<li><a
									href="/bookstorePTIT/shop-cart/"><i
										class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
								</c:if>
								<c:if test="${empty sessionScope.username}">
									<li><a href="/bookstorePTIT/login"><i
											class="fa fa-lock"></i> Đăng nhập</a></li>
								</c:if>
								<c:if test="${not empty sessionScope.username}">
									<li><a href="#" onclick="confirmLogout()"><i
											class="fa fa-lock"></i>Đăng xuất</a></li>
									<c:if test="${not empty errorLogout}">
										<div style="color: red;">${error}</div>
									</c:if>
								</c:if>
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
								<li><a href="/bookstorePTIT/">Trang
										chủ</a></li>
								<li class="dropdown"><a
									href="/bookstorePTIT/contact/">Liên hệ</a></li>
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

	<div id="contact-page" class="container">
		<div class="bg">
			<div class="row">
				<div class="col-sm-12">
					<h2 class="title text-center">THÔNG TIN TÀI KHOẢN</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div class="contact-form">
						<div class="status alert alert-success" style="display: none"></div>
						<form id="main-contact-form" class="contact-form row"
							name="contact-form" method="post">
							<div class="form-group col-md-6">
								<div class="infor-customer">Họ và tên:</div>
								<input type="text" name="name" class="form-control"
									required="required" placeholder="Tên" value="${customer.name}"
									readonly style="cursor: default;">
							</div>
							<div class="form-group col-md-6">
								<div class="infor-customer">Số điện thoại:</div>
								<input type="text" name="name" class="form-control"
									required="required" placeholder="Số điện thoại"
									value="${customer.phone}" readonly style="cursor: default;">

							</div>
							<div class="form-group col-md-6">
								<div class="infor-customer">Email:</div>
								<input type="email" name="email" class="form-control"
									required="required" placeholder="Email" value="${email}"
									readonly style="cursor: default;">
							</div>
							<div class="form-group col-md-6">
								<div class="infor-customer">Địa chỉ:</div>
								<input type="email" name="email" class="form-control"
									required="required" placeholder="Địa chỉ"
									value="${customer.address}" readonly style="cursor: default;">
							</div>
							<div class="form-group col-md-12">
								<input type="submit" name="submit"
									class="btn btn-primary pull-right" value="Chỉnh sửa"
									onclick="handleEdit()">
							</div>
						</form>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
	<!--/#contact-page-->

	<footer id="footer">
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
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
    
    function handleEdit() {
    	event.preventDefault();
        const confirmModal = document.getElementById('confirmModal');
        confirmModal.style.display = "block";

        document.getElementById('confirmYes').onclick = function() {
        	const name = document.querySelector('input[name="name"]').value;
            const phone = document.querySelector('input[name="phone"]').value;
            const email = document.querySelector('input[name="email"]').value;
            const address = document.querySelector('input[name="address"]').value;

            let valid = true;

            if (!name) {
            	toast({
                    title: "Chú ý!",
                    message: "Vui lòng điền đầy đủ họ tên.",
                    type: "error",
                    duration: 1000
                });
                valid = false;
            }
            if (!phone) {
            	toast({
                    title: "Chú ý!",
                    message: "Vui lòng điền đầy đủ số điện thoại.",
                    type: "error",
                    duration: 1000
                });
                valid = false;
            }
            else if (phone.length < 10 || phone.length > 11) {
                toast({
                    title: "Chú ý!",
                    message: "Số điện thoại phải có độ dài từ 10 đến 11 chữ số.",
                    type: "error",
                    duration: 1000
                });
                valid = false;
            }
            if (!email) {
            	toast({
                    title: "Chú ý!",
                    message: "Vui lòng điền đầy đủ email.",
                    type: "error",
                    duration: 1000
                });
                valid = false;
            }
            if (!email.endsWith("@gmail.com")) {
                toast({
                    title: "Chú ý!",
                    message: "Email phải có đuôi @gmail.com",
                    type: "error",
                    duration: 1000
                });
                valid = false;
            }
            if (!address) {
            	toast({
                    title: "Chú ý!",
                    message: "Vui lòng điền đầy đủ địa chỉ.",
                    type: "error",
                    duration: 1000
                });
                valid = false;
            }
            if (valid) {
            	const newEmail = document.querySelector('input[name="email"]').value; 
                const customerData = {
                    name: document.querySelector('input[name="name"]').value, 
                    phone: document.querySelector('input[name="phone"]').value, 
                    address: document.querySelector('input[name="address"]').value, 
                };

                const requestData = {
                    newEmail: newEmail,
                    customer: customerData 
                };

                fetch('/bookstorePTIT/updateCustomer', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(requestData), 
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        toast({
                            title: "Thành công!",
                            message: "Thông tin của bản đã được cập nhật thành công.",
                            type: "success",
                            duration: 1000
                        });
                        setTimeout(function() {
                    	    window.location.href = window.location.href;
                    	}, 2000);
                    } else {
                    	toast({
                            title: "Thất bại!",
                            message: "Thông tin của bản đã được cập nhật thất bại.",
                            type: "error",
                            duration: 1000
                        });
                    	setTimeout(function() {
                    	    window.location.href = window.location.href;
                    	}, 2000);
                    }
                })
                .catch(error => console.error('Error:', error));
            }
        };

        document.getElementById('confirmNo').onclick = function() {
            confirmModal.style.display = "none";
        };
    }
    
    function confirmLogout() {
    	Swal.fire({
            title: 'Thông báo?',
            text: "Bạn có chắc chắn muốn đăng xuất không?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Có',
            cancelButtonText: 'Không'
        }).then((result) => {
            if (result.isConfirmed) {
                // Nếu người dùng chọn "Có", chuyển hướng về trang đăng nhập
                window.location.href = '/bookstorePTIT/logout';
            }
            // Nếu người dùng chọn "Không", không làm gì cả và tiếp tục quá trình
        });	        
    }

	</script>

</body>
</html>