<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập</title>
    <link rel="icon" type="image/png" href="https://i.imgur.com/Ck2uZDE.png">
    <style>
        /* CSS cho trang Đăng nhập */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            background-image: url('https://i.imgur.com/kbkaeKR.jpg'); /* Thêm ảnh nền vào body */
            background-size: cover; /* Hiển thị ảnh nền kín màn hình, không bị kéo dãn */
            background-repeat: no-repeat; /* Ngăn lặp lại ảnh nền */
            /* Đặt ảnh nền ở giữa trang */
        }

        /* Định dạng của hộp chứa đăng nhập */
        .container {
            width: 350px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.9); /* Điều chỉnh độ mờ của nền form */
            margin: 0 auto; /* Đặt margin: 0 auto; để căn giữa phần tử */
            position: absolute; /* Sử dụng position: absolute; để căn giữa trang */
            top: 50%; /* Đẩy phần tử lên 50% của chiều cao trang */
            left: 50%; /* Đẩy phần tử sang phải 50% của chiều rộng trang */
            transform: translate(-50%, -50%); /* Dịch chuyển phần tử lùi lại 50% của chính nó, cả chiều rộng và chiều cao */
        }

        /* Màu tiêu đề "Đăng nhập hệ thống" */
        .container h2 {
            color: teal;
        }

        /* Định dạng cho nhãn (label) */
        .container label {
            display: block;
            text-align: left;
            color: #333; /* Màu đen cho nhãn */
            font-weight: bold;
        }

        /* Định dạng cho ô nhập (input) */
        .container input {
            width: 100%;
            padding: 8px 12px;
            margin: 0 auto;
            display: block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Định dạng cho nút "Đăng nhập" */
        .container button {
            width: 100%;
            padding: 10px;
            background-color: teal;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }

        /* Hiển thị màu sắc khác khi đưa chuột vào ô nhập và nút */
        .container input:hover, .container button:hover, .container a:hover {
            background-color: #f2f2f2;
            color: teal;
        }

        /* Hiển thị màu sắc khác khi đưa chuột vào liên kết (Đăng ký) */
        .container a:hover {
            color: red;
        }

        /* Định dạng các thông báo hoặc dòng chữ không chính thức (Như "Chưa có tài khoản?") */
        .container p {
            color: #606060;
        }
    </style>
</head>
<body>
  
    <div class="container">
        <h2>Đăng nhập hệ thống</h2>
        <form action="/login" method="post">
            <!-- Ô nhập Tên người dùng với placeholder là "Tài khoản" -->
            <input type="text" name="username" placeholder="Tài khoản" required><br>
            <!-- Ô nhập Mật khẩu với placeholder là "Mật khẩu" -->
            <input type="password" name="password" placeholder="Mật khẩu" required><br>
            <!-- Hiển thị thông báo lỗi (nếu có) -->
            <c:if test="${not empty loginError}">
                <p style="color: #ff0000;">${loginError}</p>
            </c:if>
            <button type="submit">Đăng nhập</button>
        </form>
        <p>Chưa có tài khoản? <a href="/register">Đăng ký</a></p>
    </div>
</body>
</html>
