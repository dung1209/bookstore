<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
</head>
<body>
	<!-- Sidebar -->
	<div class="sidebar">
		<h2 class="sidebar-title">BOOK STORE PTIT</h2>
		<ul class="sidebar-menu">
			<li><a href="/bookstorePTIT/admin/home"><i
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
			<li><a href="/bookstorePTIT/admin/statistic-manage"
				class="active"><i class="fas fa-chart-line"></i> Thống Kê Doanh
					Thu</a></li>
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
				<h1>
					<b>THỐNG KÊ</b>
				</h1>
				<p class="me-3">Khoảng Thời Gian:</p>
				<div class="d-flex align-items-center mb-4 w-100">
					<form id="dateRangeForm" method="get"
						action="/bookstorePTIT/admin/statistic-manage"
						class="d-flex w-100">
						<div class="input-group me-3" style="flex: 1;">
							<input type="date" id="startDate" name="timeStart"
								class="form-control" placeholder="Nhập thời gian..." > 
							<p class="ms-2"> đến</p>
						</div>
						
						<div class="input-group me-3" style="flex: 1;">
							<input type="date" id="startDate" name="timeEnd"
								class="form-control" placeholder="Nhập thời gian..." > 
						</div>
						<select name="type" class="form-select me-3" style="flex: 1;"
							required>
							<option value="daily"
								${selectedType == 'daily' ? 'selected' : ''}>Theo Ngày</option>
							<option value="monthly"
								${selectedType == 'monthly' ? 'selected' : ''}>Theo
								Tháng</option>
							<option value="yearly"
								${selectedType == 'yearly' ? 'selected' : ''}>Theo Năm</option>
						</select>
						<button type="submit" class="btn btn-primary">Lọc Doanh
							Thu</button>
					</form>
				</div>




				<!-- Canvas để vẽ biểu đồ -->
				<canvas id="revenueChart" width="350" height="150"></canvas>
			</div>
		</section>
	</div>



	<script>
		// Lấy dữ liệu thống kê từ Controller
		const statistics = JSON.parse('${statistics}');

		// Tách dữ liệu thành labels và data cho biểu đồ
		const labels = Object.keys(statistics); // Ngày / Tháng / Năm
		const data = Object.values(statistics); // Doanh thu tương ứng

		console.log(">>>check labels: ", labels)
		console.log(">>>check data: ", data)

		// Cấu hình biểu đồ sử dụng Chart.js
		const ctx = document.getElementById('revenueChart').getContext('2d');
		const chart = new Chart(ctx, {
			type : 'bar', // Bạn có thể đổi thành 'bar', 'pie', ...
			data : {
				labels : labels,
				datasets : [ {
					label : 'Doanh Thu (VNĐ)',
					data : data,
					borderColor : 'rgba(75, 192, 192, 1)',
					backgroundColor : 'rgba(75, 192, 192, 0.2)',
					borderWidth : 2
				} ]
			},
			options : {
				responsive : true,
				plugins : {
					legend : {
						display : true
					},
					tooltip : {
						enabled : true
					}
				},
				scales : {
					x : {
						title : {
							display : true,
							text : 'Thời Gian'
						}
					},
					y : {
						title : {
							display : true,
							text : 'Doanh Thu (VNĐ)'
						},
						beginAtZero : true
					}
				}
			}
		});
	</script>
</body>
</html>
