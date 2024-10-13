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
			<li><a href="/bookstorePTIT/admin/category-manage"><i
					class="fas fa-user"></i> Quản Lý Thể Loại</a></li>
			<li><a href="/bookstorePTIT/admin/publisher-manage"
				class="active"><i class="fas fa-user"></i> Quản Lý Nhà Xuất Bản</a></li>
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
				<h1>Nhà xuất bản</h1>
				<div class="d-flex justify-content-between align-items-center">
					<!-- Add new book -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#addNewPublisher">Thêm
						nhà xuất bản</button>
					<!-- End Add new book -->
					<div>
						<form:form class="d-flex" style="gap:20px; height:40px"
							method="GET" action="/bookstorePTIT/admin/publisher-manage/find">
							<input name="inputText" class="form-control"
								placeholder="Tìm kiếm nhà xuất bản..." />
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
								<th>Nhà xuất bản</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${ publishers }">
								<tr>
									<td>${ item.publisherID }</td>
									<td>${ item.name }</td>
									<td class="action"
										style="display: flex; gap: 10px; justify-content: center;">

										<button type="button" class="btn btn-warning btn-update"
											data-bs-toggle="modal" data-bs-target="#updatePublisher"
											data-bs-whatever="${item.publisherID};${item.name}">Sửa</button>

										<button type="button" class="btn btn-danger btn-delete"
											data-bs-toggle="modal" data-bs-target="#confirmDeleteModal"
											data-bs-whatever="${item.publisherID}">Xóa</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>

	<!-- Modal thêm nhà sản xuất-->
	<div class="modal fade" id="addNewPublisher" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thêm nhà xuất bản</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form
						action="/bookstorePTIT/admin/publisher-manage/add-new-publisher"
						class="row g-3" modelAttribute="newPublisher" method="POST">
						<div class="col-md-12">
							<label for="name" class="form-label">Tên nhà xuất bản</label> <input
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

	<!-- End Modal thêm nhà sản xuất-->

	<!-- Modal sửa nhà sản xuất-->
	<div class="modal fade" id="updatePublisher" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Sửa nhà xuất bản</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form id="updateForm" action="" class="row g-3"
						modelAttribute="publisherUpdate" method="POST">

						<div class="col-md-12">
							<label for="name" class="form-label">Tên thể loại</label> <input
								id="publisherName" name="name" type="text" class="form-control"
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
	<!-- End Modal sửa nhà sản xuất-->

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
            	var publisherID = values[0]
            	var publisherName = values[1]
            	
            	
            	document.getElementById('publisherName').value = publisherName;
            	
            	document.getElementById('updateForm').action = "/bookstorePTIT/admin/publisher-manage/update/" + publisherID;
        	});
    	});
		document.querySelectorAll('.btn-delete').forEach(button => {
		    button.addEventListener('click', function () {
		        var publisherID = this.getAttribute('data-bs-whatever');
		        document.getElementById('deleteForm').action = "/bookstorePTIT/admin/publisher-manage/delete/" + publisherID;
		        
		    });
		});
	</script>
</body>
</html>
