<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students GDU - Index</title>
    <link rel="icon" type="image/png" href="https://i.imgur.com/Ck2uZDE.png">
    <!-- Thư viện Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- Google Fonts - Roboto -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
    <style>
        /* Phông chữ và màu nền */
        body {
             font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            background-image: url('https://i.imgur.com/kbkaeKR.jpg'); /* Thêm ảnh nền vào body */
            background-size: cover; /* Hiển thị ảnh nền kín màn hình, không bị kéo dãn */
            background-repeat: no-repeat; /* Ngăn lặp lại ảnh nền */
            /* Đặt ảnh nền ở giữa trang */
        }
        

        /* Căn giữa nội dung */
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Header - đặt cố định phía trên cùng */
        .header {
            display: flex;
            align-items: center;
            position: fixed; /* Đặt cố định header khi cuộn trang */
            top: 0; /* Header ở trên cùng */
            left: 0;
            right: 0;
            z-index: 100; /* Đảm bảo header nằm trên các phần tử khác */
            background-color: #fff; /* Màu nền của header */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 10px 20px;
        }
        .nav.ml-auto {
        margin-left: auto;
    }

        /* Kiểu dáng tiêu đề header */
        .header h1 {
            color: #00467F; /* Màu xanh tương tự như logo */
            margin-left: 5px;
            font-size: 20px; /* Kích thước chữ tiêu đề */
        }

        /* Kiểu dáng logo và header text */
        .logo-container {
            display: flex;
            align-items: center;
            padding-right: 30px; /* Khoảng cách giữa logo và header text */
        }

        /* Kích thước của logo */
        .gdu-logo {
            width: 55px;
            height: 55px;
            margin-right: 10px;
        }

        /* Bảng danh sách sinh viên */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }

        /* Nút màu xanh lá cây */
        .btn-primary {
            background-color: teal;
            border-color: teal;
        }

        /* Kiểu dáng khi hover nút màu xanh lá cây */
        .btn-primary:hover {
            background-color: #009688;
            border-color: #009688;
        }

        /* Nút màu đỏ */
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        /* Kiểu dáng khi hover nút màu đỏ */
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #c82333;
        }

        /* Kiểu dáng hộp thông tin */
        .info-box {
            position: fixed;
            bottom: 160px;
            right: 30px;
            cursor: pointer;
            display: none;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        

        /* Hiển thị hộp thông tin */
        .info-box.active {
            display: block;
        }

        /* Kiểu dáng tiêu đề hộp thông tin */
        .info-box h4 {
            color: #007bff;
            margin: 0;
        }

        /* Kiểu dáng đoạn văn bản hộp thông tin */
        .info-box p {
            color: #555;
            margin: 0;
        }
    </style>
</head>

<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <div class="logo-container">
                <img src="https://cdn.haitrieu.com/wp-content/uploads/2022/06/logo-dai-hoc-gia-dinh.png" alt="Gia Định University Logo" class="gdu-logo">
                <h1>Trường Đại Học Gia Định</h1>
           </div>
   <ul class="nav ml-auto">
    <li class="nav-item">
        <a href="/logout" class="btn btn-danger nav-link">
            <i class="fas fa-sign-out-alt"></i> Đăng xuất
        </a>
    </li>
</ul>
</div>

        <!-- Nội dung trang -->
        <%@include file="form.jsp" %>
        <%@include file="list.jsp" %>

        <!-- Thêm hình ảnh mới ở góc dưới bên phải -->
        <div style="position: fixed; bottom: 10px; right: 10px; cursor: pointer;" onclick="showInfoBox()">
            <img src="https://i.imgur.com/tN4U2mC.png" alt="Phản hồi" style="width: 150px; height: 150px;">
        </div>

        <!-- Hộp thông tin -->
        <div class="info-box" id="infoBox">
            <h4>Thông tin liên hệ</h4>
            <p style="color: red; font-size: 16px; font-weight: bold;">Hoàng Sa, Trường Sa của Việt Nam</p>
            <p>Admin: Trần Đức Tân</p>
            <p>SĐT: 0909824803</p>
            <p>Gmail: afcductan@gmail.com</p>
        </div>
    </div>


    <!-- Thêm các đoạn mã script của Bootstrap và jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Hàm JavaScript để hiển thị hộp thông tin khi nhấn vào hình ảnh
        function showInfoBox() {

            var infoBox = document.getElementById("infoBox");
            infoBox.classList.toggle("active");
        }
    </script>
</body>
</html>
