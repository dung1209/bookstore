<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Quản Trị Cửa Hàng Sách</title>
    <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/admin/home.css">
	 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2 class="sidebar-title">BOOK STORE PTIT</h2>
        <ul class="sidebar-menu">
            <li><a href="/bookstorePTIT/admin/home"><i class="fas fa-home"></i> Trang Chủ</a></li>
            <li><a href="/bookstorePTIT/admin/book-manage"><i class="fas fa-book"></i> Quản Lý Sách</a></li>
            <li><a href="/bookstorePTIT/admin/import-manage"><i
					class="fas fa-book"></i> Quản Lý Nhập Kho</a></li>
			<li><a href="/bookstorePTIT/admin/author-manage"><i class="fas fa-user"></i> Quản
					Lý Tác Giả</a></li>
			<li><a href="/bookstorePTIT/admin/category-manage"><i class="fas fa-user"></i> Quản
					Lý Thể Loại</a></li>
			<li><a href="/bookstorePTIT/admin/publisher-manage"><i class="fas fa-user"></i> Quản
					Lý Nhà Xuất Bản</a></li>
            <li><a href="/bookstorePTIT/admin/staff-manage"><i class="fas fa-users"></i> Quản Lý Nhân Viên</a></li>
            <li><a href="/bookstorePTIT/admin/statistic-manage" class="active"><i class="fas fa-chart-line"></i> Thống Kê Doanh Thu</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <section class="dashboard">
            <div class="container">
                <h1>Thống kê</h1>
                
            </div>
        </section>
    </div>

    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Cửa Hàng Sách Online</p>
        </div>
    </footer>
</body>
</html>
