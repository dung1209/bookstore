<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- Toast Thông báo -->
	<div class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 1060">
    	<div id="liveToast" class="toast align-items-center bg-danger border-0" role="alert" aria-live="assertive" aria-atomic="true">
        	<div class="d-flex">
            	<div class="toast-body" id="toastMessage"></div>
            	<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        	</div>
    	</div>
	</div>
	
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
			<li><a href="/bookstorePTIT/admin/employee-manage"
				class="active"><i class="fas fa-users"></i> Quản Lý Nhân Viên</a></li>
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
				<h1>
					<b>NHÂN VIÊN</b>
				</h1>
				<div class="d-flex justify-content-between align-items-center">
					<!-- Add new book -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#addNewEmployee">Thêm
						nhân viên</button>
					<!-- End Add new book -->
					<div>
						<form:form class="d-flex" style="gap:20px; height:40px"
							method="GET" action="/bookstorePTIT/admin/employee-manage/find">
							<input name="inputText" class="form-control"
								placeholder="Tìm kiếm nhân viên..." />
							<button type="submit" class="btn btn-primary"
								style="width: 165px">Tìm kiếm</button>
						</form:form>
					</div>
				</div>

				<div class="table-container mt-3">
					<table class="table table-bordered table-hover table-striped">
						<thead class="thead-dark">
							<tr style="background-color: #0d6efd; color: #fff">
								<th>Tên nhân viên</th>
								<th>Số điện thoại</th>
								<th>Số CCCD</th>
								<th>Email</th>
								<th>Địa chỉ</th>
								<th>Tên tài khoản</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${ employees }">
								<tr>
									<td>${ item.name }</td>
									<td>${ item.phone }</td>
									<td>${ item.CCCD }</td>
									<td>${ item.account.email }</td>
									<td>${ item.address }</td>
									<td>${ item.account.username }</td>
									<td class="action"
										style="display: flex; gap: 10px; justify-content: center;">

										<button type="button" class="btn btn-warning btn-update"
											data-bs-toggle="modal" data-bs-target="#updateEmployee"
											data-bs-whatever="${item.employeeID};${item.name};${item.phone};${item.CCCD};${item.address};${item.account}">Sửa</button>

										<button type="button" class="btn btn-danger btn-delete"
											data-bs-toggle="modal" data-bs-target="#confirmDeleteModal"
											data-bs-whatever="${item.employeeID}">Xóa</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>

	<!-- Modal thêm nhân viên-->
	<div class="modal fade" id="addNewEmployee" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header bg-primary-subtle">
					<h5 class="modal-title " id="exampleModalLabel">Thêm nhân viên</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form id="addNewForm"
						action="/bookstorePTIT/admin/employee-manage/add-new-employee"
						class="row g-3" modelAttribute="newEmployee" method="POST">
						<div class="col-md-12">
							<label for="name" class="form-label">Tên nhân viên</label> <input
								name="name" type="text" class="form-control" required /> <label
								for="phone" class="form-label">Số điện thoại</label> <input id="phone1"
								name="phone" type="text" class="form-control" required /> <label
								for="CCCD" class="form-label">Số CCCD</label> <input id="cccd1" name="CCCD" 
								type="text" class="form-control" required /> <label
								for="address" class="form-label">Địa chỉ</label> <input
								name="address" type="text" class="form-control" required /> <label
								for="email" class="form-label">Email</label> <input id="email1" name="email"
								type="text" class="form-control" required /> <label
								for="username" class="form-label">Tài khoản</label> <input id="username1"
								name="username" type="text" class="form-control" required /> <label
								for="password" class="form-label">Mật khẩu</label> <input
								name="password" type="text" class="form-control" required />
						</div>
						<div class="col-12">
							<button type="submit" class="btn btn-primary float-end">Thêm</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<!-- End Modal thêm nhân viên-->

	<!-- Modal sửa nhân viên-->
	<div class="modal fade" id="updateEmployee" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header bg-primary-subtle">
					<h5 class="modal-title" id="exampleModalLabel">Sửa nhân viên</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form id="updateForm" action="" class="row g-3"
						modelAttribute="employeeUpdate" method="POST">

						<div class="col-md-12">
							<label for="name" class="form-label">Tên nhân viên</label> 
							<input
								id="employeeName" name="name" type="text" class="form-control"
								required /> 
							<label for="phone" class="form-label">Số điện thoại</label> 
							<input id="employeePhone" name="phone" type="text"
								class="form-control" required /> 
							<label for="CCCD" class="form-label">Số CCCD</label> 
							<input id="employeeCCCD"
								name="CCCD" type="text" class="form-control" required /> 
							<label for="address" class="form-label">Địa chỉ</label> 
							<input
								id="employeeAddress" name="address" type="text"
								class="form-control" required /> 
							<label for="email" class="form-label">Email</label> 
							<input id="employeeEmail"
								name="email" type="text" class="form-control" required />
						</div>
						<div class="col-12">
							<button type="submit" class="btn btn-primary float-end">Xác
								nhận</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal sửa nhân viên-->

	<!-- Modal xác nhận xóa-->
	<div class="modal fade" id="confirmDeleteModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header bg-primary-subtle">
					<h4 class="modal-title " id="exampleModalLabel">Xác nhận xóa
						nhân viên</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="deleteForm" action="" class="row g-3" method="POST">
						<h5>Bạn chắc chắn muốn xóa nhân viên này?</h5>
						<div class="col-12">
							<button type="submit" class="btn btn-danger float-end">Xác
								nhận</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal xác nhận xóa-->
	

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Sử dụng phiên bản đầy đủ -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<script type="text/javascript">
		function showToast(message, type) {
	    	const toastMessage = document.getElementById('toastMessage');
	    	const toastElement = document.getElementById('liveToast');
	    	
	    	toastElement.className = 'toast align-items-center border-0';
	    	toastElement.classList.add('bg-'+type, 'text-white');
	    	console.log(type)
	    	console.log(toastElement.classList)
	    	toastMessage.textContent = message; // Cập nhật nội dung Toast

	    	const toast = new bootstrap.Toast(toastElement);
	    	toast.show(); // Hiển thị Toast
		}
		
		document.getElementById('addNewForm').addEventListener('submit', async function (event) {
			event.preventDefault(); // Ngăn form gửi ngay lập tức

			console.log("addnewformcheck")
		    const phone = document.getElementById('phone1').value;
		    const cccd = document.getElementById('cccd1').value;
		    const email = document.getElementById('email1').value;
		    const username = document.getElementById('username1').value;

		    const isValid = await validateFormData(phone, cccd, email, username);

		    if (isValid) {
		        // Nếu dữ liệu hợp lệ, tiến hành gửi form
		        this.submit();
		    } else {
		        // Dữ liệu không hợp lệ, hiện thông báo và không gửi form
		        console.log('Dữ liệu không hợp lệ, form không được gửi.');
		    }
		});
		
		// Ngăn form gửi nếu dữ liệu không hợp lệ
		document.getElementById('updateForm').addEventListener('submit', async function (event) {
			event.preventDefault(); // Ngăn form gửi ngay lập tức

		    const phone = document.getElementById('employeePhone').value;
		    const cccd = document.getElementById('employeeCCCD').value;
		    const email = document.getElementById('employeeEmail').value;

		    const isValid = await validateFormData(phone, cccd, email, '');

		    if (isValid) {
		        // Nếu dữ liệu hợp lệ, tiến hành gửi form
		        this.submit();
		        
		    } else {
		        // Dữ liệu không hợp lệ, hiện thông báo và không gửi form
		        console.log('Dữ liệu không hợp lệ, form không được gửi.');
		    }
		});
		
		document.querySelectorAll('.btn-update').forEach(button => {
        	button.addEventListener('click', function () {
            	var modelData = this.getAttribute('data-bs-whatever');
            	
            	var values = modelData.split(";");
            	console.log(values)
            	var employeeID = values[0]
            	var employeeName = values[1]
            	var phone = values[2]
            	var CCCD = values[3]
            	var address = values[4]
            	var accountString = values[5]
            	const accountIDMatch = accountString.match(/accountID=(\d+)/);
				const emailMatch = accountString.match(/email=([^,\s]+)/);
				var accountID = null
				var email = null
				if (accountIDMatch && emailMatch) {
    				accountID = accountIDMatch[1]; // Lấy giá trị accountID
    				email = emailMatch[1]; // Lấy giá trị email

    				console.log("accountID:", accountID);
   	 				console.log("email:", email);
				} else {
    				console.log("Không tìm thấy accountID hoặc email.");
				}
            	
            	document.getElementById('employeeName').value = employeeName;
            	document.getElementById('employeePhone').value = phone;
            	document.getElementById('employeeCCCD').value = CCCD;
            	document.getElementById('employeeAddress').value = address;
            	document.getElementById('employeeEmail').value = email;
            	
            	document.getElementById('updateForm').action = "/bookstorePTIT/admin/employee-manage/update/" + employeeID;
        	});
    	});
		document.querySelectorAll('.btn-delete').forEach(button => {
		    button.addEventListener('click', function () {
		        var employeeID = this.getAttribute('data-bs-whatever');
		        document.getElementById('deleteForm').action = "/bookstorePTIT/admin/employee-manage/delete/" + employeeID;
		    });
		});
		
		// Gọi API để kiểm tra email và số điện thoại
		async function validateFormData(phone, cccd, email, username) {
		    try {
		        const response = await fetch(`/bookstorePTIT/admin/employee-manage/validate`, {
		            method: 'POST',
		            headers: {
		                'Content-Type': 'application/x-www-form-urlencoded', // Định dạng gửi dữ liệu
		            },
		            body: new URLSearchParams({ phone, cccd, email, username}), // Truyền dữ liệu vào body
		        });
		        
		        if (!response.ok) {
		            const errorData = await response.json(); // Nhận dữ liệu lỗi từ phản hồi
		            showToast(errorData.message, 'danger'); // Hiển thị thông báo lỗi
		            return false; // Dữ liệu không hợp lệ
		        }
		        
		        const result = await response.json();
		        console.log(result.message);
		        if (result.message !== "valid") {
		            showToast(result.message, 'danger');
		            return false;
		        }
		        return true;
		    } catch (error) {
		        console.error('Lỗi khi gọi API:', error);
		        showToast('Có lỗi xảy ra, vui lòng thử lại!', 'warning');
		        return false;
		    }
		}
		
		// Kiểm tra tham số trong URL
		window.onload = function () {
		    const params = new URLSearchParams(window.location.search);
		    if (params.has('updateSuccess')) {
		        const updateStatus = params.get('updateSuccess');
		        if (updateStatus === 'success') {
		            showToast('Cập nhật thành công!', 'success'); // Hiển thị thông báo thành công
		        }
		    }
		    if (params.has('addSuccess')) {
		        const updateStatus = params.get('addSuccess');
		        if (updateStatus === 'success') {
		            showToast('Thêm mới thành công!', 'success'); // Hiển thị thông báo thành công
		        }
		    }
		    if (params.has('deleteSuccess')) {
		        const updateStatus = params.get('deleteSuccess');
		        if (updateStatus === 'success') {
		            showToast('Xóa thành công!', 'success'); // Hiển thị thông báo thành công
		        }
		    }
		};
	</script>
</body>
</html>
