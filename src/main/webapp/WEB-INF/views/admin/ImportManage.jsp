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
			<li><a href="/bookstorePTIT/admin/import-manage" class="active"><i
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
				<h1><b>NHẬP KHO</b></h1>
				<div class="d-flex justify-content-between align-items-center">
					<!-- Add new book -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#addNewImport">Nhập
						sách</button>
					<!-- End Add new book -->
					<div>
						<form:form class="d-flex" style="gap:20px; height:40px"
							method="GET" action="/bookstorePTIT/admin/import-manage/find">
							<input name="inputText" class="form-control"
								placeholder="Tìm kiếm..." />
							<select class="form-select" style="width: 250px"
								name="selectOption">
								<option value="0">Tên sách</option>
								<option value="1">Ngày nhập</option>
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
								<th>ID</th>
								<th>Sách</th>
								<th>Số lượng</th>
								<th>Ngày nhập</th>
								<th>Giá nhập/quyển</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${ imports }">
								<tr>
									<td>${ item.importID }</td>
									<td>${ item.book.name}</td>
									<td>${ item.quantity }</td>
									<td>${ item.received_at }</td>
									<td>${ item.price_import }</td>
									<td class="action"
										style="display: flex; gap: 10px; justify-content: center;">

										<button type="button" class="btn btn-warning btn-update"
											data-bs-toggle="modal" data-bs-target="#updateImport"
											data-bs-whatever="${item.importID};${item.book};${item.quantity};${item.price_import}">Sửa</button>

										<button type="button" class="btn btn-danger btn-delete"
											data-bs-toggle="modal" data-bs-target="#confirmDeleteModal"
											data-bs-whatever="${item.importID}">Xóa</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>

	<!-- Modal nhập sách-->
	<div class="modal fade" id="addNewImport" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header bg-primary-subtle">
					<h5 class="modal-title" id="exampleModalLabel">Nhập sách</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form
						action="/bookstorePTIT/admin/import-manage/add-new-import"
						class="row g-3" modelAttribute="newimport" method="POST">
						<div class="col-md-12">
							<label for="bookID" class="form-label">Sách</label>
							<div class="input-group">
								<select id="book" name="bookID" class="form-control" required>
									<c:forEach var="item" items="${uniqueBooks}" varStatus="loop">
										<option id="book1" value="${item.bookID}">${item.name}</option>
									</c:forEach>
								</select> <span class="input-group-text"> <i
									class="fas fa-caret-down"></i>
								</span>
							</div>
						</div>
						<div class="col-md-12">
							<label for="quantity" class="form-label">Số lượng</label> <input
								name="quantity" type="number" class="form-control" required />
						</div>
						<div class="col-md-12">
							<label for="price_import" class="form-label">Giá
								nhập/quyển</label> <input name="price_import" type="number"
								class="form-control" required />
						</div>
						<div class="col-12">
							<button type="submit" class="btn btn-primary float-end">Thêm</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<!-- End Modal nhập sách-->

	<!-- Modal sửa nhập sách-->
	<div class="modal fade" id="updateImport" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header bg-primary-subtle">
					<h5 class="modal-title" id="exampleModalLabel">Sửa đơn nhập sách</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form action="" id="updateForm" class="row g-3" modelAttribute="importupdate"
						method="POST">
						<input id="importID1" name="importID" type="number" class="form-control" required readonly hidden/>
						<input id="oldQuantity1" name="oldQuantity" type="number" class="form-control" required readonly hidden/>
						
						<div class="col-md-12">
							<label for="bookID" class="form-label">Sách</label> <input
								id="book2" name="bookName" type="text" class="form-control" required readonly/>
						</div>
						
						<input id="bookID1" name="bookID" type="number" class="form-control" required readonly hidden/>
						
						<div class="col-md-12">
							<label for="quantity" class="form-label">Số lượng</label> <input
								id="quantity1" name="quantity" type="number" class="form-control" required />
						</div>
						<div class="col-md-12">
							<label for="price_import" class="form-label">Giá
								nhập/quyển</label> <input id="import_price1" name="price_import" type="number"
								class="form-control" required />
						</div>
						<div class="col-12">
							<button type="submit" class="btn btn-primary float-end">Thêm</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<!-- End Modal sửa nhập sách-->
	
	<!-- Modal xác nhận xóa-->
	<div class="modal fade" id="confirmDeleteModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header bg-primary-subtle">
					<h4 class="modal-title" id="exampleModalLabel">Xác nhận xóa
						đơn nhập</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="deleteForm" action="" class="row g-3" method="POST">
						<h5>Bạn chắc chắn muốn xóa đơn nhập này?</h5>
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
	
		document.querySelectorAll('.btn-update').forEach(button => {
        	button.addEventListener('click', function () {
            	var modelData = this.getAttribute('data-bs-whatever');
            	
            	var values = modelData.split(";");
            	var importID = values[0]
            	var bookName = values[1].match(/name='([^']+)'/)[1]
            	var bookID = values[1].match(/Books{id=(\d+)/)[1]
            	var quantity = values[2]
            	var import_price = values[3]
            	
            	document.getElementById('importID1').value = importID;
            	document.getElementById('oldQuantity1').value = quantity;
            	document.getElementById('book2').value = bookName;
            	document.getElementById('bookID1').value = bookID;
            	document.getElementById('quantity1').value = quantity;
            	document.getElementById('import_price1').value = import_price;
            
            	document.getElementById('updateForm').action = "/bookstorePTIT/admin/import-manage/update/" + importID;
        	});
    	});
		document.querySelectorAll('.btn-delete').forEach(button => {
		    button.addEventListener('click', function () {
		        var importID = this.getAttribute('data-bs-whatever');
		        

		        document.getElementById('deleteForm').action = "/bookstorePTIT/admin/import-manage/delete/" + importID;
		        
		    });
		});
	</script>

</body>
</html>
