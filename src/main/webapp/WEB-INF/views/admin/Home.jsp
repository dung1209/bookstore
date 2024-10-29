<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.text.DecimalFormat"%>
<%
DecimalFormat df = new DecimalFormat("#,###");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang Quản Trị Cửa Hàng Sách</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/admin/home.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<style>
    .card {
        border: none;
        border-radius: 12px; /* Bo tròn góc */
        overflow: hidden;
        transition: transform 0.2s ease, box-shadow 0.2s ease; /* Hiệu ứng hover */
    }

    .card:hover {
        transform: translateY(-10px); /* Khi hover, di chuyển lên trên một chút */
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15); /* Hiệu ứng bóng đổ */
    }

    .card-img-top {
        height: 250px; 
        object-fit: cover; /* Đảm bảo ảnh không bị méo */
    }

    .card-body {
        text-align: center; /* Căn giữa văn bản trong thẻ */
    }

    .card-title {
        font-weight: bold;
        color: #333;
    }

    .card-text {
        color: #777;
        margin-bottom: 8px;
    }

    /* Căn giữa hàng trên các màn hình khác nhau */
    .row {
        justify-content: center;
        gap: 20px;
    }
</style>
<body>
	<!-- Sidebar -->
	<div class="sidebar">
		<h2 class="sidebar-title">BOOK STORE PTIT</h2>
		<ul class="sidebar-menu">
			<li><a href="/bookstorePTIT/admin/home" class="active"><i
					class="fas fa-home"></i> Trang Chủ</a></li>
			<li><a href="/bookstorePTIT/admin/order"><i
					class="fas fa-shopping-bag"></i> Quản Lý Đơn Hàng</a></li>
			<li><a href="/bookstorePTIT/admin/book-manage"><i
					class="fas fa-book-open"></i> Quản Lý Sách</a></li>
			<li><a href="/bookstorePTIT/admin/import-manage"><i
					class="fas fa-dolly"></i> Quản Lý Nhập Kho</a></li>
			<li><a href="/bookstorePTIT/admin/author-manage"><i
					class="fas fa-user"></i> Quản Lý Tác Giả</a></li>
			<li><a href="/bookstorePTIT/admin/category-manage"><i
					class="fas fa-layer-group"></i> Quản Lý Thể Loại</a></li>
			<li><a href="/bookstorePTIT/admin/publisher-manage"><i
					class="fas fa-building"></i> Quản Lý Nhà Xuất Bản</a></li>
			<li><a href="/bookstorePTIT/admin/employee-manage"><i
					class="fas fa-users"></i> Quản Lý Nhân Viên</a></li>
			<li><a href="/bookstorePTIT/admin/statistic-manage"><i
					class="fas fa-chart-line"></i> Thống Kê Doanh Thu</a></li>
    		
		</ul>
		<div class="logout-btn mt-auto w-100">
				<p class="text-white fs-6 fw-bold mb-2">Xin chào, Admin!</p>
        		<a href="/bookstorePTIT/logout" class="btn btn-danger w-100 d-flex align-items-center justify-content-center">
            		<i class="fas fa-sign-out-alt me-2"></i> Đăng Xuất
        		</a>
    	</div>
	</div>

	<!-- Main Content -->
	<div class="main-content">
		<section class="dashboard">
			<div class="container">
				<h1><b>TỔNG QUAN</b></h1>
				<div class="cards">
					<div class="card1" style="background-color: #e6f0ff;">
						<div class="card-icon">
							<i class="fas fa-book"></i>
						</div>
						<div class="card-info">
							<h5>Số Lượng Sách</h5>
							<p>
								<c:out value="${countBook}" />
							</p>
						</div>
					</div>
					<div class="card1" style="background-color: #e6f0ff;">
						<div class="card-icon">
							<i class="fas fa-shopping-cart"></i>
						</div>
						<div class="card-info">
							<h5>Số Đơn Hàng Hôm Nay</h5>
							<p>
								<c:out value="${ordersToday}" />
							</p>
						</div>
					</div>
					<div class="card1" style="background-color: #e6f0ff;">
						<div class="card-icon">
							<i class="fas fa-dollar-sign"></i>
						</div>
						<div class="card-info">
							<h5>Doanh Thu Hôm Nay</h5>
							<p>
								<c:out value="${revenueToday}" />
								VNĐ
							</p>
						</div>
					</div>
					<div class="card1" style="background-color: #e6f0ff;">
						<div class="card-icon">
							<i class="fas fa-calendar-alt"></i>
						</div>
						<div class="card-info">
							<h5>Doanh Thu Tháng Này</h5>
							<p>
								<c:out value="${revenueThisMonth}" />
								VNĐ
							</p>
						</div>
					</div>
					<div class="card1" style="background-color: #e6f0ff;">
						<div class="card-icon">
							<i class="fas fa-wallet"></i>
						</div>
						<div class="card-info">
							<h5>Doanh Thu Năm Này</h5>
							<p>
								<c:out value="${revenueThisYear}" />
								VNĐ
							</p>
						</div>
					</div>
				</div>


			</div>

			<div class="container mt-5">
				<h2 class="text-center">TOP 3 SÁCH BÁN CHẠY NHẤT</h2>
				<div class="row justify-content-center">
					<c:forEach var="book" items="${topSellingBooks}">
						<div class="col-sm-6 col-md-4 col-lg-3">
							<!-- Giảm kích thước cột -->
							<div class="card mb-3 shadow-sm" style="max-width: 16rem; background-color: #03FFFA;">
								<!-- Giới hạn chiều rộng -->
								<img
									src="${pageContext.request.contextPath}/assets/admin/home/${book.image}"
									class="card-img-top img-fluid rounded"
									style="height: 300px; object-fit: cover;" alt="${book.title}">
								<div class="card-body">
									<h5 class="card-title">${book.name}</h5>
									<p class="card-text">Tác giả: ${book.author.name}</p>
									<p class="card-text">Giá: ${book.price} VNĐ</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
	</div>



	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.2/js/bootstrap.min.js"></script>
</body>
</html>
