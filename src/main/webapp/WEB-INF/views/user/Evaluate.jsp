<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Đánh giá</title>

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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
				<p class="title-question">Bạn có muốn xác nhận đánh giá không?</p>
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
								<!--<c:if test="${empty sessionScope.username}">
									<li><a href="/bookstorePTIT/account/"><i class="fa fa-user"></i> Tài khoản</a></li>
								</c:if>-->
								<c:if test="${not empty sessionScope.username}">
									<li><a href="/bookstorePTIT/account"><i
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

		<div class="header-bottom" style="padding-bottom: 0px">
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
								<li><a href="/bookstorePTIT/">Trang chủ</a></li>
								<li><a href="/bookstorePTIT/contact/">Liên hệ</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 search-order">
						<div class="search_box pull-right">
							<input type="text" id="searchInput" placeholder="Tìm kiếm..." />
							<button class="search-button" onclick="searchData()">Tìm
								kiếm</button>
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
					<li><a href="/bookstorePTIT/">Home</a></li>
					<li class="active">Đánh giá</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="order_menu">
							<td class="product_id" style="width: 10%">Mã sản phẩm</td>
							<td class="image" style="width: 7%">Ảnh</td>
							<td class="name" style="width: 20%">Tên sản phẩm</td>
							<td class="quantity" style="width: 10%">Số lượng</td>
							<td class="price" style="width: 13%">Giá</td>
							<td class="evaluate" style="width: 23%">Đánh giá</td>
							<td class="confirm" style="width: 17%">Xác nhận</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${orderItems}">
							<tr class="order-row" data-order-status-id="${item.id}">
								<td class="id_order">${item.bookID}</td>
								<td class="id_order"><a href=""> <img
										src="${pageContext.request.contextPath}/assets/user/images/home/${item.image}"
										alt="Logo" style="width: 100px; height: auto;" /></a></td>
								<td class="id_order">${item.name}</td>
								<td class="id_order">${item.quantity}</td>
								<td class="id_order"><fmt:formatNumber
										value="${item.price}" type="number" groupingUsed="true" /> đ
								</td>
								<td class="id_order">
									<div class="star-rating">
										<input type="radio" id="star5-${item.bookID}"
											name="rating-${item.bookID}" value="5" onclick="setRating('${item.bookID}', 5)" ${item.rating == 5 ? 'checked' : ''} ${item.rating >= 1 ? 'disabled' : ''}>
											<label
											for="star5-${item.bookID}">&#9733;</label> 
										<input type="radio" id="star4-${item.bookID}"
											name="rating-${item.bookID}" value="4"onclick="setRating('${item.bookID}', 4)" ${item.rating == 4 ? 'checked' : ''} ${item.rating >= 1 ? 'disabled' : ''}> 
											<label
											for="star4-${item.bookID}">&#9733;</label> 
										<input
											type="radio" id="star3-${item.bookID}"
											name="rating-${item.bookID}" value="3"onclick="setRating('${item.bookID}', 3)" ${item.rating == 3 ? 'checked' : ''} ${item.rating >= 1 ? 'disabled' : ''}> 
											<label
											for="star3-${item.bookID}">&#9733;</label> 
										<input
											type="radio" id="star2-${item.bookID}"
											name="rating-${item.bookID}" value="2"onclick="setRating('${item.bookID}', 2)" ${item.rating == 2 ? 'checked' : ''} ${item.rating >= 1 ? 'disabled' : ''}> 
											<label
											for="star2-${item.bookID}">&#9733;</label> 
										<input
											type="radio" id="star1-${item.bookID}"
											name="rating-${item.bookID}" value="1"onclick="setRating('${item.bookID}', 1)" ${item.rating == 1 ? 'checked' : ''} ${item.rating >= 1 ? 'disabled' : ''}> 
											<label
											for="star1-${item.bookID}">&#9733;</label>
									</div>
								</td>
								<td class="id_order">
									<button onclick="confirmRating('${item.id}', '${item.bookID}')"
										style="background-color: white; color: rgb(50, 146, 228); border: 2px solid rgb(50, 146, 228); padding: 5px 10px; cursor: pointer; margin-top: 1px; min-height: 35px; display: inline-flex; align-items: center; justify-content: center; height: auto;" 
										${item.rating >= 1 ? 'disabled' : ''}>
										${item.rating >= 1 ? 'Đã đánh giá' : 'Xác nhận'}</button>
								</td>
							</tr>
						</c:forEach>
				</table>
			</div>
		</div>
	</section>

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
                window.location.href = '/bookstorePTIT/logout';
            }
        });	        
    }
    
    let ratings = {}; 

 	function setRating(bookID, rating) {
     	ratings[bookID] = rating;
 	}

 	function confirmRating(id, bookID) {
     	const rating = ratings[bookID]; 
     	const url = '/bookstorePTIT/submitRating';

     	if (rating) {
     		const confirmModal = document.getElementById('confirmModal');
            confirmModal.style.display = "block";

            document.getElementById('confirmYes').onclick = function() {
            	confirmModal.style.display = "none";
            	fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        'id': id,      
                        'rating': rating 
                    })
                })
                .then(response => {
                    if (response.ok) {
                    	toast({
        	                title: "Thông báo!",
        	                message: "Đánh giá sản phẩm thành công.",
        	                type: "success",
        	                duration: 1000
        	            });
                    	setTimeout(function() {
                    	    window.location.href = window.location.href;
                    	}, 2000);
                    } else {
                        throw new Error('Có lỗi xảy ra khi đánh giá sản phẩm!');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                });
            }
            document.getElementById('confirmNo').onclick = function() {
                confirmModal.style.display = "none";
            };
     	} else {
     		toast({
                title: "Thông báo!",
                message: "Vui lòng đánh số sao để đánh giá.",
                type: "error",
                duration: 1000
            });
     	}
 	}

	</script>

</body>
</html>