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
			<li><a href="/bookstorePTIT/admin/import-manage" class="active"><i
					class="fas fa-book"></i> Quản Lý Nhập Kho</a></li>
			<li><a href="/bookstorePTIT/admin/author-manage"><i
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
				<h1>Nhập kho</h1>
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
							<tr>
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
				<div class="modal-header">
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
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Sửa đơn nhập sách</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form action="" id="updateForm" class="row g-3" modelAttribute="importupdate"
						method="POST">
						<div class="col-md-12">
							<label for="importID" class="form-label">ID</label> <input
								id="importID1" name="importID" type="number" class="form-control" required readonly/>
						</div><div class="col-md-12">
							<label for="oldQuantity" class="form-label">Old quantity</label> <input
								id="oldQuantity1" name="oldQuantity" type="number" class="form-control" required readonly/>
						</div>
						<div class="col-md-12">
							<label for="bookID" class="form-label">Sách</label> <input
								id="book2" name="bookName" type="text" class="form-control" required readonly/>
						</div>
						<div class="col-md-12">
							<label for="bookID" class="form-label">bookID</label> <input
								id="bookID1" name="bookID" type="number" class="form-control" required readonly/>
						</div>
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
				<div class="modal-header">
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
