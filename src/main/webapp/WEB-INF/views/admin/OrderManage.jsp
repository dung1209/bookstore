<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
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
			<li><a href="/bookstorePTIT/admin/order" class="active"><i
					class="fas fa-shopping-bag" ></i> Quản Lý Đơn Hàng</a></li>
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
				<h1>
					<b>ĐƠN HÀNG</b>
				</h1>
				<div
					class="d-flex justify-content-between align-items-center float-end mb-3">
					<div>
						<form:form class="d-flex" style="gap:20px; height:40px"
							method="GET" action="/bookstorePTIT/admin/order/find">
							<input name="inputText" class="form-control"
								placeholder="Tìm kiếm đơn hàng..." />
							<select class="form-select" style="width: 250px"
								name="selectOption">
								<option value="0">Tên khách hàng</option>
								<option value="1">Số điện thoại</option>
								<option value="2">Trạng thái</option>
								<option value="3">Ngày đặt hàng</option>
							</select>
							<button type="submit" class="btn btn-primary"
								style="width: 165px">Tìm kiếm</button>
						</form:form>
					</div>
				</div>

				<div class="table-container mt-3">
					<table class="table table-bordered table-hover table-striped">
						<thead class="thead-dark">
							<tr style="background-color: #0d6efd; color: #fff">
								<th>Tên khách hàng</th>
								<th>Số điện thoại</th>
								<th>Email</th>
								<th>Địa chỉ</th>
								<th>Ghi chú</th>
								<th>Ngày đặt hàng</th>
								<th>Tổng tiền</th>
								<th>Trạng thái</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${ orders }">
								<tr class="order-row" data-order-id="${item.id}">
									<td>${ item.name }</td>
									<td>${ item.phone }</td>
									<td>${ item.email }</td>
									<td>${ item.address }</td>
									<td>${ item.note }</td>
									<td>${ item.orderDate }</td>
									<td>${ item.total }</td>
									<td
										style="background-color: 
    										${item.status == 0 ? '#f5c6cb' : 
      										item.status == 1 ? '#ffeeba' : 
      										item.status == 2 ? '#c3e6cb' : 
      										item.status == 3 ? '#b8e0f5' : '#ffffff'};">
										<c:choose>
											<c:when test="${item.status == 0}">Đã hủy</c:when>
											<c:when test="${item.status == 1}">Chờ xác nhận</c:when>
											<c:when test="${item.status == 2}">Đã xác nhận</c:when>
											<c:when test="${item.status == 3}">Đã giao</c:when>
											<c:otherwise>Không xác định</c:otherwise>
										</c:choose>
									</td>

									<td class="action"
										style="display: flex; gap: 10px; justify-content: center;">
										<button type="button" class="btn btn-success btn-update"
											data-bs-toggle="modal" data-bs-target="#updateOrder"
											data-bs-whatever="${item.id};${item.name};${item.phone};${item.email};${item.address};${item.note};${item.status}">Sửa</button>
										<button type="button" class="btn btn-warning btn-accept"
											data-bs-toggle="modal" data-bs-target="#confirmAcceptModal"
											data-bs-whatever="${item.id}"
											${item.status == 0 || item.status == 2 || item.status == 3 ? 'disabled' : ''}>
											Nhận</button>
										<button type="button" class="btn btn-danger btn-cancel"
											data-bs-toggle="modal" data-bs-target="#confirmCancelModal"
											data-bs-whatever="${item.id}"
											${item.status == 0 || item.status == 3 ? 'disabled' : ''}>
											Hủy</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>

	<!-- Modal xem thông tin đơn hàng-->
	<div class="modal fade" id="inforFormOrder" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary-subtle">
					<h5 class="modal-title" id="exampleModalLabel">CHI TIẾT ĐƠN
						HÀNG</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form id="showInforForm" class="row g-3" method="GET"
						action="" modelAttribute="">
						<div class="col-md-12">
							<table class="table table-bordered table-hover table-striped">
								<thead class="thead-dark">
									<tr style="background-color: #0d6efd; color: #fff">
										<th>Sách</th>
										<th>Số lượng</th>
										<th>Tiền</th>

									</tr>
								</thead>
								<tbody id="orderDetailsBody">
									<!-- Chi tiết đơn hàng sẽ được thêm vào đây -->
								</tbody>
							</table>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal xem thông tin đơn hàng -->

	<!-- Modal sửa thông tin đơn hàng -->
	<div class="modal fade" id="updateOrder" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header bg-primary-subtle">
					<h4 class="modal-title" id="exampleModalLabel">Sửa thông tin
						đơn hàng</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form id="updateForm" action="" class="row g-2"
						modelAttribute="updateOrder" method="POST">
						<div class="col-md-12">
							<label for="name" class="form-label">Tên khách hàng</label> <input
								id="name1" name="name" type="text" class="form-control" required />
						</div>
						<div class="col-md-12">
							<label for="name" class="form-label">Số điện thoại</label> <input
								id="phone1" name="phone" type="text" class="form-control"
								required />
						</div>
						<div class="col-md-12">
							<label for="name" class="form-label">Email</label> <input
								id="email1" name="email" type="text" class="form-control"
								required />
						</div>
						<div class="col-md-12">
							<label for="name" class="form-label">Địa chỉ</label> <input
								id="address1" name="address" type="text" class="form-control"
								required />
						</div>
						<div class="col-md-12">
							<label for="name" class="form-label">Ghi chú</label> <input
								id="note1" name="note" type="text" class="form-control" required />
						</div>
						<div class="col-12">
							<label for="statusSelect" class="form-label">Trạng thái</label>
							<div class="input-group">
								<select id="statusSelect" name="status" class="form-control"
									required>
									<c:forEach var="item" items="${status}" varStatus="loop">
										<option id="status1" value="${item}">
											<c:choose>
												<c:when test="${item == 0}">Đã hủy</c:when>
												<c:when test="${item == 1}">Chờ xác nhận</c:when>
												<c:when test="${item == 2}">Đã xác nhận</c:when>
												<c:when test="${item == 3}">Đã giao</c:when>
											</c:choose>
										</option>
									</c:forEach>
								</select> <span class="input-group-text"> <i
									class="fas fa-caret-down"></i>
								</span>
							</div>
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
	<!-- End Modal sửa thông tin đơn hàng -->

	<!-- Modal xác nhận đơn hàng-->
	<div class="modal fade" id="confirmAcceptModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header bg-primary-subtle">
					<h4 class="modal-title" id="exampleModalLabel">Xác nhận đơn
						hàng</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="acceptForm" action="" class="row g-3" method="POST">
						<h5>Bạn chắc chắn muốn xác nhận đơn hàng này?</h5>
						<div class="col-12">
							<button type="submit" class="btn btn-danger float-end">Xác
								nhận</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal xác nhận đơn hàng-->

	<!-- Modal xác nhận hủy đơn hàng-->
	<div class="modal fade" id="confirmCancelModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header bg-primary-subtle">
					<h4 class="modal-title" id="exampleModalLabel">Xác nhận hủy
						đơn hàng</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="cancelForm" action="" class="row g-3" method="POST">
						<h5>Bạn chắc chắn muốn hủy đơn hàng này?</h5>
						<div class="col-12">
							<button type="submit" class="btn btn-danger float-end">Xác
								nhận</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal xác nhận hủy đơn hàng-->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Sử dụng phiên bản đầy đủ -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		var orderDetailsJson = '${orderDetailsMap}';
    	var orderDetailsMap = JSON.parse(orderDetailsJson);
    	
    	var booksNameJson = '${booksNameJson}';
    	var booksName = JSON.parse(booksNameJson);
    	console.log("check book",booksName)
    	
    	document.querySelectorAll('.order-row').forEach(row => {
    	    row.addEventListener('click', function () {
    	        var orderId = this.getAttribute('data-order-id');
    	        var orderDetails = orderDetailsMap[orderId];
    	        var orderData = booksName[orderId];
    	        console.log('check order data: ', orderData)
    	        
    	        var orderDetailsBody = document.getElementById('orderDetailsBody');
    	        orderDetailsBody.innerHTML = ''; // Xóa nội dung cũ trong modal

    	        if (orderData && orderData.length > 0) {
    	            var totalPrice = 0;
					
    	            // Duyệt qua orderDetails và thêm từng dòng vào modal
    	            orderData.forEach(detail => {
    	                var row = document.createElement('tr');
    	                row.innerHTML = '<td>' + detail.name + '</td>' +
        								'<td>' + detail.quantity + '</td>' +
        								'<td>' + detail.price + '</td>'
    	                orderDetailsBody.appendChild(row);
    	                totalPrice += detail.price;
    	            });

    	            // Thêm dòng tổng tiền vào modal
    	            var totalRow = document.createElement('tr');
    	            totalRow.innerHTML = '<td colspan="2" style="background-color: #1E90FF; color: white;"><b>Tổng tiền</b></td>' +
    									'<td>' + totalPrice + '</td>'
    	            orderDetailsBody.appendChild(totalRow);
    	        } else {
    	            // Nếu không có chi tiết đơn hàng
    	            orderDetailsBody.innerHTML = '<tr><td colspan="3">Không có chi tiết cho đơn hàng này.</td></tr>';
    	            console.error("Không tìm thấy chi tiết cho Order ID: " + orderId);
    	        }

    	        // Mở modal hiển thị chi tiết đơn hàng
    	        var orderDetailModal = new bootstrap.Modal(document.getElementById('inforFormOrder'));
    	        orderDetailModal.show();
    	    });
    	});
		
		document.querySelectorAll('.btn-accept').forEach(button => {
		    button.addEventListener('click', function () {
		        var orderID = this.getAttribute('data-bs-whatever');

		        document.getElementById('acceptForm').action = "/bookstorePTIT/admin/order/accept/" + orderID;
		        
		    });
		});
		
		document.querySelectorAll('.btn-cancel').forEach(button => {
		    button.addEventListener('click', function () {
		        var orderID = this.getAttribute('data-bs-whatever');
		        

		        document.getElementById('cancelForm').action = "/bookstorePTIT/admin/order/cancel/" + orderID;
		        
		    });
		});
		
		document.querySelectorAll('.action button').forEach(button => {
		    button.addEventListener('click', function (event) {
		        event.stopPropagation(); // Ngăn chặn sự kiện click lan lên <tr>
		    });
		});
		
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
		
		// Ngăn form gửi nếu dữ liệu không hợp lệ
		document.getElementById('updateForm').addEventListener('submit', async function (event) {
			event.preventDefault(); // Ngăn form gửi ngay lập tức

		    const phone = document.getElementById('phone1').value;
		    const email = document.getElementById('email1').value;

		    const isValid = await validateFormData(phone, email);

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
	            var orderID = values[0]
	            var name = values[1]
	            var phone = values[2]
	            var email = values[3]
	            var address = values[4]
	            var note = values[5]
	            var status = values[6]
	         	
	            document.getElementById('name1').value = name;
	            document.getElementById('phone1').value = phone;
	            document.getElementById('email1').value = email;
	            document.getElementById('address1').value = address;
	            document.getElementById('note1').value = note;
	            document.getElementById('statusSelect').value = status;
	            
	            document.getElementById('updateForm').action = "/bookstorePTIT/admin/order/update/" + orderID;
	            
	        });
	    });
		
		
		
		// Gọi API để kiểm tra email và số điện thoại
		async function validateFormData(phone, email) {
		    try {
		        const response = await fetch(`/bookstorePTIT/admin/order/validate`, {
		            method: 'POST',
		            headers: {
		                'Content-Type': 'application/x-www-form-urlencoded', // Định dạng gửi dữ liệu
		            },
		            body: new URLSearchParams({ phone, email }), // Truyền dữ liệu vào body
		        });
		        
		        if (!response.ok) {
		            const errorData = await response.json(); // Nhận dữ liệu lỗi từ phản hồi
		            console.log(errorData.message)
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
		        showToast('Có lỗi xảy ra, vui lòng thử lại!');
		        return false;
		    }
		}

		// Kiểm tra tham số trong URL
		window.onload = function () {
		    const params = new URLSearchParams(window.location.search);
		    if (params.has('acceptSuccess')) {
		        const updateStatus = params.get('acceptSuccess');
		        if (updateStatus === 'success') {
		            showToast('Nhận thành công!', 'success'); // Hiển thị thông báo thành công
		        }
		    }
		    if (params.has('cancelSuccess')) {
		        const updateStatus = params.get('cancelSuccess');
		        if (updateStatus === 'success') {
		            showToast('Hủy thành công!', 'success'); // Hiển thị thông báo thành công
		        }
		    }
		    if (params.has('updateSuccess')) {
		        const updateStatus = params.get('updateSuccess');
		        if (updateStatus === 'success') {
		            showToast('Cập nhật thành công!', 'success'); // Hiển thị thông báo thành công
		        }
		    }
		};
	</script>
</body>
</html>
