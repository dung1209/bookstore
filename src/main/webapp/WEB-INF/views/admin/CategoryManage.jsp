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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<!-- Sidebar -->
	<div class="sidebar">
		<h2 class="sidebar-title">BOOK STORE PTIT</h2>
		<ul class="sidebar-menu">
			<li><a href="/bookstorePTIT/admin/home"><i
					class="fas fa-home"></i> Trang Chủ</a></li>
			<li><a href="/bookstorePTIT/admin/book-manage"><i
					class="fas fa-book"></i> Quản Lý Sách</a></li>
			<li><a href="/bookstorePTIT/admin/import-manage"><i
					class="fas fa-book"></i> Quản Lý Nhập Kho</a></li>
			<li><a href="/bookstorePTIT/admin/author-manage"><i
					class="fas fa-user"></i> Quản Lý Tác Giả</a></li>
			<li><a href="/bookstorePTIT/admin/category-manage"
				class="active"><i class="fas fa-user"></i> Quản Lý Thể Loại</a></li>
			<li><a href="/bookstorePTIT/admin/publisher-manage"><i
					class="fas fa-user"></i> Quản Lý Nhà Xuất Bản</a></li>
			<li><a href="/bookstorePTIT/admin/staff-manage"><i
					class="fas fa-users"></i> Quản Lý Nhân Viên</a></li>
			<li><a href="/bookstorePTIT/admin/statistic-manage"><i
					class="fas fa-chart-line"></i> Thống Kê Doanh Thu</a></li>
		</ul>
	</div>

	<!-- Main Content -->
	<div class="main-content">
		<section class="dashboard">
			<div class="container">
				<h1>Thể loại</h1>
				<div class="d-flex justify-content-between align-items-center">
					<!-- Add new book -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#addNewCategory">Thêm
						thể loại</button>
					<!-- End Add new book -->
					<div>
						<form:form class="d-flex" style="gap:20px; height:40px"
							method="GET" action="/bookstorePTIT/admin/category-manage/find">
							<input name="inputText" class="form-control"
								placeholder="Tìm kiếm thể loại..." />
							<button type="submit" class="btn btn-primary"
								style="width: 165px">Tìm kiếm</button>
						</form:form>
					</div>
				</div>

				<div class="table-container mt-3">
					<table class="table table-bordered table-hover table-striped">
						<thead class="thead-dark">
							<tr>
								<th>ID</th>
								<th>Thể loại</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${ categories }">
								<tr>
									<td>${ item.id }</td>
									<td>${ item.name }</td>
									<td class="action"
										style="display: flex; gap: 10px; justify-content: center;">

										<button type="button" class="btn btn-warning btn-update"
											data-bs-toggle="modal" data-bs-target="#updateCategory"
											data-bs-whatever="${item.id};${item.name}">Sửa</button>

										<button type="button" class="btn btn-danger btn-delete"
											data-bs-toggle="modal" data-bs-target="#confirmDeleteModal"
											data-bs-whatever="${item.id}">Xóa</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>

	<!-- Modal thêm thể loại-->
	<div class="modal fade" id="addNewCategory" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thêm thể loại</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form
						action="/bookstorePTIT/admin/category-manage/add-new-category"
						class="row g-3" modelAttribute="newCategory" method="POST">
						<div class="col-md-12">
							<label for="name" class="form-label">Tên thể loại</label> <input
								name="name" type="text" class="form-control" required />
						</div>
						<div class="col-12">
							<button type="submit" class="btn btn-primary float-end">Thêm</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<!-- End Modal thêm thể loại-->

	<!-- Modal sửa thể loại-->
	<div class="modal fade" id="updateCategory" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Sửa thể loại</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form id="updateForm" action="" class="row g-3"
						modelAttribute="categoryUpdate" method="POST">

						<div class="col-md-12">
							<label for="name" class="form-label">Tên thể loại</label> <input
								id="categoryName" name="name" type="text" class="form-control"
								required />
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
	<!-- End Modal sửa thể loại-->

	<!-- Modal xác nhận xóa-->
	<div class="modal fade" id="confirmDeleteModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">Xác nhận xóa
						thể loại</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="deleteForm" action="" class="row g-3" method="POST">
						<h5>Bạn chắc chắn muốn xóa thể loại này?</h5>
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


	<footer class="footer">
		<div class="container">
			<p>&copy; 2024 Cửa Hàng Sách Online</p>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<script type="text/javascript">
		document.querySelectorAll('.btn-update').forEach(button => {
        	button.addEventListener('click', function () {
            	var modelData = this.getAttribute('data-bs-whatever');
            	
            	var values = modelData.split(";");
            	console.log(values)
            	var categoryID = values[0]
            	var categoryName = values[1]
            	
            	
            	document.getElementById('categoryName').value = categoryName;
            	
            	document.getElementById('updateForm').action = "/bookstorePTIT/admin/category-manage/update/" + categoryID;
        	});
    	});
		document.querySelectorAll('.btn-delete').forEach(button => {
		    button.addEventListener('click', function () {
		        var categoryID = this.getAttribute('data-bs-whatever');
		        document.getElementById('deleteForm').action = "/bookstorePTIT/admin/category-manage/delete/" + categoryID;
		        
		    });
		});
	</script>
</body>
</html>
