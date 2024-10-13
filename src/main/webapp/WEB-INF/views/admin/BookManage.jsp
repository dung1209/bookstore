<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
			<li><a href="/bookstorePTIT/admin/home"><i class="fas fa-home"></i> Trang Chủ</a></li>
			<li><a href="/bookstorePTIT/admin/book-manage" class="active"><i
					class="fas fa-book"></i> Quản Lý Sách</a></li>
			<li><a href="/bookstorePTIT/admin/import-manage"><i
					class="fas fa-book"></i> Quản Lý Nhập Kho</a></li>
			<li><a href="/bookstorePTIT/admin/author-manage"><i class="fas fa-user"></i> Quản
					Lý Tác Giả</a></li>
			<li><a href="/bookstorePTIT/admin/category-manage"><i class="fas fa-user"></i> Quản
					Lý Thể Loại</a></li>
			<li><a href="/bookstorePTIT/admin/publisher-manage"><i class="fas fa-user"></i> Quản
					Lý Nhà Xuất Bản</a></li>
			<li><a href="/bookstorePTIT/admin/staff-manage"><i class="fas fa-users"></i> Quản
					Lý Nhân Viên</a></li>
			<li><a href="/bookstorePTIT/admin/statistic-manage"><i class="fas fa-chart-line"></i>
					Thống Kê Doanh Thu</a></li>
		</ul>
	</div>

	<!-- Main Content -->
	<div class="main-content">
		<section class="dashboard">
			<div class="container">
				<h1>Sách</h1>

				<div class="d-flex justify-content-between align-items-center">
					<!-- Add new book -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#addNewBook">Thêm
						sách</button>
					<!-- End Add new book -->
					<div>
						<form:form class="d-flex" style="gap:20px; height:40px"
							method="GET" action="/bookstorePTIT/admin/book-manage/find">
							<input name="inputText" class="form-control"
								placeholder="Tìm kiếm..." />
							<select class="form-select" style="width: 250px"
								name="selectOption">
								<option value="0">Tên sách</option>
								<option value="1">Tác giả</option>
								<option value="2">Thể loại</option>
								<option value="3">Nhà xuất bản</option>
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
								<th>Tên</th>
								<th>Tác giả</th>
								<th>Thể loại</th>

								<th>Giá</th>

								<th>Số lượng</th>
								<th>Đã bán</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${ books }">
								<tr>
									<td class="name-col">${ item.name }</td>
									<td>${ item.author.name }</td>
									<td>${ item.category.name }</td>

									<td>${ item.price }</td>

									<td>${ item.stock }</td>
									<td>${ item.sold }</td>
									<td class="action"
										style="display: flex; gap: 10px; justify-content: center;">
										<button type="button" class="btn btn-success btn-show"
											data-bs-toggle="modal" data-bs-target="#inforFormBook"
											data-bs-whatever="${item.bookID};${item.name};${item.author.name};${item.category.name};${item.publisher.name};${item.publicationDate};${item.title};${item.price};${item.stock};${item.sold};${item.image}">Xem</button>
										<button type="button" class="btn btn-warning btn-update"
											data-bs-toggle="modal" data-bs-target="#updateBook"
											data-bs-whatever="${item.bookID};${item.name};${item.author};${item.category};${item.publisher};${item.publicationDate};${item.title};${item.price};${item.stock};${item.sold};${item.image}">Sửa</button>

										<button type="button" class="btn btn-danger btn-delete"
											data-bs-toggle="modal" data-bs-target="#confirmDeleteModal"
											data-bs-whatever="${item.bookID}">Xóa</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
	</div>
	<!-- End Main Content -->

	<!-- Modal xem thông tin sách-->
	<div class="modal fade" id="inforFormBook" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<!-- Sử dụng modal-lg để làm lớn hơn -->
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">THÔNG TIN SÁCH</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form id="showInforForm" class="row g-3" method="GET"
						action="" modelAttribute="">
						<div class="d-flex">
							<!-- Sử dụng Flexbox để phân bố -->
							<div class="col-md-6">
								<label for="inforName" class="form-label">Tên sách</label> <input
									id="inforName" name="name" type="text" class="form-control" disabled="true"/>
							</div>
							<div class="col-md-6 text-center">
								<label for="inforImage" class="form-label">Hình ảnh</label> <img
									src=""
									id="inforImage" class="img-fluid img-thumbnail"
									style="width: 150px; height: auto;" alt="Hình ảnh sách">
							</div>
						</div>
						<div class="row g-3 mt-3">
							<div class="col-md-6">
								<label for="inforAuthor" class="form-label">Tác giả</label> <input
									id="inforAuthor" name="author" type="text" class="form-control" disabled="true"/>
							</div>
							<div class="col-md-6">
								<label for="inforCategory" class="form-label">Thể loại</label> <input
									id="inforCategory" name="category" type="text"
									class="form-control" disabled="true"/>
							</div>
							<div class="col-md-6">
								<label for="inforPublisher" class="form-label">Nhà xuất
									bản</label> <input id="inforPublisher" name="publisher" type="text"
									class="form-control" disabled="true"/>
							</div>
							<div class="col-md-6">
								<label for="inforPublicDate" class="form-label">Năm xuất
									bản</label> <input id="inforPublicDate" name="publicationDate"
									type="text" class="form-control" disabled="true"/>
							</div>
							<div class="col-md-6">
								<label for="inforTitle" class="form-label">Tiêu đề</label> <input
									id="inforTitle" name="title" type="text" class="form-control" disabled="true"/>
							</div>
							<div class="col-md-6">
								<label for="inforPrice" class="form-label">Giá bán</label> <input
									id="inforPrice" name="price" type="text" class="form-control" disabled="true"/>
							</div>
							<div class="col-md-6">
								<label for="inforStock" class="form-label">Số lượng</label> <input
									id="inforStock" name="stock" type="text" class="form-control" disabled="true"/>
							</div>
							<div class="col-md-6">
								<label for="inforSold" class="form-label">Đã bán</label> <input
									id="inforSold" name="sold" type="text" class="form-control" disabled="true"/>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal xem thông tin sách -->


	<!-- Modal thêm mới sách -->
	<div class="modal fade" id="addNewBook" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Thêm mới sách</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="/bookstorePTIT/admin/book-manage/add-new-book" method="post" enctype="multipart/form-data">
						<div class="col-md-12">
							<label for="name" class="form-label">Tên sách</label> <input
								name="name" type="text" class="form-control" required />
						</div>
						<div class="col-md-12">
							<label for="authorID" class="form-label">Tác giả</label>
							<div class="input-group">
								<select name="authorID" class="form-control" required>
									<c:forEach var="item" items="${uniqueAuthors}" varStatus="loop">
										<option value="${item.id}">${item.name}</option>
									</c:forEach>
								</select> <span class="input-group-text"> <i
									class="fas fa-caret-down"></i>
								</span>
							</div>
						</div>
						<div class="col-12">
							<label for="categoryID" class="form-label">Thể loại</label>
							<div class="input-group">
								<select name="categoryID" class="form-control" required>
									<c:forEach var="item" items="${uniqueCategories}"
										varStatus="loop">
										<option value="${item.id}">${item.name}</option>
									</c:forEach>
								</select> <span class="input-group-text"> <i
									class="fas fa-caret-down"></i>
								</span>
							</div>
						</div>
						<div class="col-12">
							<label for="publisherID" class="form-label">Nhà xuất bản</label>
							<div class="input-group">
								<select name="publisherID" class="form-control" required>
									<c:forEach var="item" items="${uniquePublishers}"
										varStatus="loop">
										<option value="${item.publisherID}">${item.name}</option>
									</c:forEach>
								</select> <span class="input-group-text"> <i
									class="fas fa-caret-down"></i>
								</span>
							</div>
						</div>
						<div class="col-12">
							<label for="title" class="form-label">Năm xuất bản</label> <input
								name="publicationDate" type="number" class="form-control" required />
						</div>
						<div class="col-12">
							<label for="title" class="form-label">Tiêu đề</label> <input
								name="title" type="text" class="form-control" required />
						</div>
						<div class="col-md-12">
							<label for="price" class="form-label">Giá bán</label> <input
								name="price" type="number" class="form-control" required />
						</div>
						<!--  <div class="col-md-12">
							<label for="stock" class="form-label">Số lượng</label> <input
								name="stock" type="number" class="form-control" required />
						</div>-->
						<div class="col-md-12">
							<label for="image" class="form-label">Hình ảnh</label> <input
								name="image" type="file" class="form-control"  />
						</div>

						<div class="col-12">
							<button type="submit" class="btn btn-primary float-end">Thêm</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- End Modal thêm mới sách-->

	<!-- Modal sửa thông tin sách -->
	<div class="modal fade" id="updateBook" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">Sửa thông tin
						sách</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form:form id="updateForm" action="" class="row g-2"
						modelAttribute="loaitb" method="POST">
						<div class="col-md-12">
							<label for="name" class="form-label">Tên sách</label> <input
								id="name1" name="name" type="text" class="form-control" required />
						</div>
						<div class="col-md-12">
							<label for="authorID" class="form-label">Tác giả</label>
							<div class="input-group">
								<select id="author" name="authorID" class="form-control" required>
									<c:forEach var="item" items="${uniqueAuthors}" varStatus="loop">
										<option id="author1" value="${item.id}">${item.name}</option>
									</c:forEach>
								</select> <span class="input-group-text"> <i
									class="fas fa-caret-down"></i>
								</span>
							</div>
						</div>
						<div class="col-12">
							<label for="categoryID" class="form-label">Thể loại</label>
							<div class="input-group">
								<select id="category" name="categoryID" class="form-control" required>
									<c:forEach var="item" items="${uniqueCategories}"
										varStatus="loop">
										<option id="category1" value="${item.id}">${item.name}</option>
									</c:forEach>
								</select> <span class="input-group-text"> <i
									class="fas fa-caret-down"></i>
								</span>
							</div>
						</div>
						<div class="col-12">
							<label for="publisherID" class="form-label">Nhà xuất bản</label>
							<div class="input-group">
								<select id="publisher" name="publisherID" class="form-control" required>
									<c:forEach var="item" items="${uniquePublishers}"
										varStatus="loop">
										<option id="publisher1" value="${item.publisherID}">${item.name}</option>
									</c:forEach>
								</select> <span class="input-group-text"> <i
									class="fas fa-caret-down"></i>
								</span>
							</div>
						</div>
						<div class="col-12">
							<label for="title" class="form-label">Năm xuất bản</label> <input
								id="publicationDate1" name="publicationDate" type="number" class="form-control" required />
						</div>
						<div class="col-12">
							<label for="title" class="form-label">Tiêu đề</label> <input
								id="title1" name="title" type="text" class="form-control" required />
						</div>
						<div class="col-md-12">
							<label for="price" class="form-label">Giá bán</label> <input
								id="price1" name="price" type="number" class="form-control" required />
						</div>
						<div class="col-md-12" style="display: none;">
							<label for="stock" class="form-label">Số lượng</label> <input
								id="stock1" name="stock" type="number" class="form-control" required />
						</div>
						<div class="col-md-12" style="display: none;">
							<label for="sold" class="form-label">Đã bán</label> <input
								id="sold1" name="sold" type="number" class="form-control" required />
						</div>
						<div class="col-md-12" style="display: none;">
							<label for="image" class="form-label">Hình ảnh</label> <input
								id="image1" name="image" type="text" class="form-control"  required/>
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
	<!-- End Modal sửa thông tin sách -->

	<!-- Modal xác nhận xóa-->
	<div class="modal fade" id="confirmDeleteModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">Xác nhận xóa
						sách</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="deleteForm" action="" class="row g-3" method="POST">
						<h5>Bạn chắc chắn muốn xóa sách này?</h5>
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

	<script>
	
    document.querySelectorAll('.btn-update').forEach(button => {
        button.addEventListener('click', function () {
            
            var modelData = this.getAttribute('data-bs-whatever');
        	
            var values = modelData.split(";");
            var id = values[0]
            console.log(id)
            var name = values[1]
            
            //lấy thông tin tác giả
            var author = values[2]
            let authorString = author;
         	let parts = authorString.split(',');
         	let authorID = parts[0].match(/id=(\d+)/)[1];
         	let authorName = parts[1].match(/name='([^']+)'/)[1];
         	console.log("ID author:", authorID);
         	console.log("Name author:", authorName, "\n----------------------------------");

         	//lấy thông tin thể loại
            var category = values[3]
            let categoryString = category;
         	let parts1 = categoryString.split(',');
         	let categoryID = parts1[0].match(/id=(\d+)/)[1];
         	let categoryName = parts1[1].match(/name='([^']+)'/)[1];
         	console.log("ID category:", categoryID);
         	console.log("Name category:", categoryName, "\n----------------------------------");
         	
         	//lấy thông tin nhà xuất bản
            var publisher = values[4]
            const regex = /publisherID=(\d+), name=([^,]+)/;
            const matches = publisher.match(regex);
            let publisherID = null
            let publisherName = null
            if (matches) {
                publisherID = matches[1]; // ID là nhóm thứ nhất
                publisherName = matches[2].replace(/'/g, '').trim(); // Tên là nhóm thứ hai, loại bỏ dấu nháy đơn

                console.log("Publisher ID:", publisherID);
                console.log("Publisher Name:", publisherName, "\n----------------------------------");
            } else {
                console.error("Không tìm thấy thông tin nhà xuất bản.");
            }

            var publicationDate = values[5]
            var title = values[6]
            var price = values[7]
            var stock = values[8]
            var sold = values[9]
            var image = values[10]
            //console.log(JSON.stringify(values, null, 2));
            
            
            
            
            document.getElementById('name1').value = name;
            document.getElementById('publicationDate1').value = publicationDate; // Năm xuất bản
            document.getElementById('title1').value = title; // Tiêu đề
            document.getElementById('price1').value = price; // Giá bán
            document.getElementById('stock1').value = stock; // Số lượng
            document.getElementById('sold1').value = sold; // Đã bán
            document.getElementById('image1').value = image; // Hình ảnh
            
            //set Author
            const authorSelect = document.getElementById('author'); // Lấy select theo id
            if (authorSelect) {
            	//authorSelect.value = '';
                authorSelect.value = authorID; // Đặt giá trị của select thành authorID
                console.log("Set authorID to select:", authorID); // Kiểm tra giá trị đã được set
            } else {
                console.error("Không tìm thấy phần tử select cho tác giả.");
            }
            document.getElementById('author1').value = authorName;
            
            //set Category
            const categorySelect = document.getElementById('category'); 
            if (categorySelect) {
            	//categorySelect.value = '';
            	categorySelect.value = categoryID; 
                console.log("Set categoryID to select:", categoryID); 
            } else {
                console.error("Không tìm thấy phần tử select cho thể loại.");
            }
            document.getElementById('category1').value = categoryName;
            
         	//set Publisher
            const publisherSelect = document.getElementById('publisher'); 
            if (publisherSelect) {
            	//publisherSelect.value = '';
            	publisherSelect.value = publisherID; 
                console.log("Set publisherID to select:", publisherID); 
            } else {
                console.error("Không tìm thấy phần tử select cho NXB.");
            }
            document.getElementById('publisher1').value = publisherName;
            
            
            document.getElementById('updateForm').action = "/bookstorePTIT/admin/book-manage/update/" + id;
            
        });
    });

	document.querySelectorAll('.btn-delete').forEach(button => {
	    button.addEventListener('click', function () {
	        var modelData = this.getAttribute('data-bs-whatever');
	        var values = modelData.split(",");

	        var id = values[0];
	        console.log(id)

	        document.getElementById('deleteForm').action = "/bookstorePTIT/admin/book-manage/delete/" + id;
	        
	    });
	});
	
	document.querySelectorAll('.btn-show').forEach(button => {
        button.addEventListener('click', function () {
            var modelData = this.getAttribute('data-bs-whatever');
            
            var values = modelData.split(";");
            var name = values[1]
            var author = values[2]
            var category = values[3]
            var publisher = values[4]
            var publicationDate = values[5]
            var title = values[6]
            var price = values[7]
            var stock = values[8]
            var sold = values[9]
            var image = values[10]
            console.log(values)
            
            document.getElementById('inforName').value = name;
            document.getElementById('inforAuthor').value = author;
            document.getElementById('inforCategory').value = category;
            document.getElementById('inforPublisher').value = publisher;
            document.getElementById('inforPublicDate').value = publicationDate;
            document.getElementById('inforTitle').value = title;
            document.getElementById('inforPrice').value = price;
            document.getElementById('inforStock').value = stock;
            document.getElementById('inforSold').value = sold;
            document.getElementById('inforImage').src = "${pageContext.request.contextPath}/assets/admin/home/"+image;
        });
    });

	</script>
</body>
</html>
