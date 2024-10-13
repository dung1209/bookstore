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
			<li><a href="/bookstorePTIT/admin/author-manage" class="active"><i
					class="fas fa-user"></i> Quản Lý Tác Giả</a></li>
			<li><a href="/bookstorePTIT/admin/category-manage"><i
					class="fas fa-user"></i> Quản Lý Thể Loại</a></li>
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
				<h1>Tác giả</h1>
				<div class="d-flex justify-content-between align-items-center">
					<!-- Add new book -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#addNewAuthor">Thêm
						tác giả</button>
					<!-- End Add new book -->
					<div>
						<form:form class="d-flex" style="gap:20px; height:40px"
							method="GET" action="/bookstorePTIT/admin/author-manage/find">
							<input name="inputText" class="form-control"
								placeholder="Tìm kiếm tác giả..." />
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
								<th>Tên tác giả</th>
								<th>Giới thiệu</th>
								<th>Ngày sinh</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${ authors }">
								<tr>
									<td>${ item.id }</td>
									<td>${ item.name }</td>
									<td>${ item.bio}</td>
									<td>${ item.birthdate }</td>
									<td class="action"
										style="display: flex; gap: 10px; justify-content: center;">

										<button type="button" class="btn btn-warning btn-update"
											data-bs-toggle="modal" data-bs-target="#updateAuthor"
											data-bs-whatever="${item.id};${item.name};${item.bio};${item.birthdate}">Sửa</button>

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

	<!-- Modal thêm tác giả-->
	<div class="modal fade" id="addNewAuthor" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thêm tác giả</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form
						action="/bookstorePTIT/admin/author-manage/add-new-author"
						class="row g-3" modelAttribute="newAuthor" method="POST">

						<div class="col-md-12">
							<label for="name" class="form-label">Tên tác giả</label> <input
								name="name" type="text" class="form-control" required />
						</div>
						<div class="col-md-12">
							<label for="bio" class="form-label">Giới thiệu về tác giả</label>
							<input name="bio" type="text" class="form-control" required />
						</div>
						<div class="col-md-12">
							<label for="birthdate" class="form-label">Ngày sinh</label> <input
								name="birthdate" type="date" class="form-control" required />
						</div>
						<div class="col-12">
							<button type="submit" class="btn btn-primary float-end">Thêm</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<!-- End Modal thêm tác giả-->

	<!-- Modal sửa tác giả-->
	<div class="modal fade" id="updateAuthor" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thêm tác giả</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form id="updateForm" action="" class="row g-3"
						modelAttribute="updateAuthor" method="POST">

						<div class="col-md-12">
							<label for="name" class="form-label">Tên tác giả</label> <input
								id="authorName" name="name" type="text" class="form-control"
								required />
						</div>
						<div class="col-md-12">
							<label for="bio" class="form-label">Giới thiệu về tác giả</label>
							<input id="authorBio" name="bio" type="text" class="form-control"
								required />
						</div>
						<div class="col-md-12">
							<label for="birthdate" class="form-label">Ngày sinh</label> <input
								id="authorBirthdate" name="birthdate" type="date"
								class="form-control" required />
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
	<!-- End Modal sửa tác giả-->

	<!-- Modal xác nhận xóa-->
	<div class="modal fade" id="confirmDeleteModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">Xác nhận xóa
						tác giả</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="deleteForm" action="" class="row g-3" method="POST">
						<h5>Bạn chắc chắn muốn xóa tác giả này?</h5>
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
            	var authorID = values[0]
            	var authorName = values[1]
            	var authorBio = values[2]
            	var authorBirthdate = values[3].split(' ')[0]
            	
            	document.getElementById('authorName').value = authorName;
            	document.getElementById('authorBio').value = authorBio;
            	document.getElementById('authorBirthdate').value = authorBirthdate;
            	
            	document.getElementById('updateForm').action = "/bookstorePTIT/admin/author-manage/update/" + authorID;
        	});
    	});
		document.querySelectorAll('.btn-delete').forEach(button => {
		    button.addEventListener('click', function () {
		        var authorID = this.getAttribute('data-bs-whatever');
		        

		        document.getElementById('deleteForm').action = "/bookstorePTIT/admin/author-manage/delete/" + authorID;
		        
		    });
		});
	</script>
</body>
</html>
