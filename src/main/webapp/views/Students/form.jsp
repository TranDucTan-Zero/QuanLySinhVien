<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students GDU - Form</title>
    <link rel="icon" type="image/png" href="https://i.imgur.com/Ck2uZDE.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
    <style>
      
     
        /* CSS cho trang web */

        /* Chọn font chữ */
        body {
            font-family: "Roboto", sans-serif;
            background-color: #f0f0f0;
        }
        

        /* Khung bọc form */
        .container {
            max-width: 300px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
        }

        /* Nhãn cho các input */
        .form-group label {
            color: teal;
            font-weight: bold;
        }

        /* Input */
        .form-control {
            margin-bottom: 15px;
            border: 1px solid #ced4da;
        }

        /* Hiệu ứng khi focus vào input */
        .form-control:focus {
            box-shadow: none;
            border-color: teal;
        }

        /* Hiệu ứng đưa chuột vào input */
        .form-control:hover {
            border-color: lightblue;
        }

        /* Chọn input kiểu select */
        .form-group select.form-control {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            padding-right: 24px;
            /* Thêm biểu tượng mũi tên xuống */
            background: url('data:image/svg+xml;utf8,<svg fill="teal" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>') no-repeat right 10px center;
            background-size: 16px;
        }

        /* Nút Submit và Update */
        .btn {
        	
            margin-right: 10px;
        }

        /* Nút thêm sinh viên */
        .btn-primary {
            background-color: teal;
            border-color: teal;
        }

        /* Hiệu ứng hover khi di chuột vào nút thêm */
        .btn-primary:hover {
            background-color: #009688;
            border-color: #009688;
        }

        /* Nút cập nhật sinh viên */
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            
        }

        /* Hiệu ứng hover khi di chuột vào nút cập nhật */
        .btn-success:hover {
            background-color: #218838;
            border-color: #218838;
        }

        /* Thêm CSS cho thông báo lỗi */
        .error-message {
            color: red;
            font-size: 14px;
            display: none;
        }
        
    </style>
</head>

<body>
    <div class="container">
        <!-- Phần tiêu đề và tiêu đề trang -->
        <div class="my-5"> <!-- Khoảng trắng giữa tiêu đề và form -->
            <h1 style="color: #fff; font-size: 36px; text-align: center; background-color: teal; padding: 20px;border-radius: 10px; /* Bo góc 10px */">Nhóm 7</h1>
        </div>
		<h2 style="color: #00467F; font-size: 36px;">Sinh viên GDU</h2>
        <!-- Form -->
        <!-- Dùng Spring Form để tạo form -->
        <form:form action="/Students/index" modelAttribute="item" method="post" id="studentForm">
            <!-- Mã SV -->
            <div class="form-group">
                <!-- Nhãn cho trường mã sinh viên -->
                <form:label path="masv" style="color: teal;"><span style="color: red;">* </span>Mã sinh viên (Số)</form:label>
                <!-- Input cho trường mã sinh viên -->
                <form:input path="masv" class="form-control" id="masv" />
                <!-- Thông báo lỗi cho trường mã sinh viên -->
                <span class="error-message" id="masv-error">Mã sinh viên phải là số. Vui lòng nhập chính xác yêu cầu!</span>
            </div>

            <!-- Họ và tên -->
            <div class="form-group">
                <!-- Nhãn cho trường họ và tên -->
                <form:label path="name" style="color: teal;"><span style="color: red;">* </span>Họ và tên</form:label>
                <!-- Input cho trường họ và tên -->
                <form:input path="name" class="form-control" />
            </div>

            <!-- Điểm -->
            <div class="form-group">
                <!-- Nhãn cho trường điểm -->
                <form:label path="mark" style="color: teal;"><span style="color: red;">* </span>Điểm (0đ đến 10đ)</form:label>
                <!-- Input cho trường điểm -->
                <form:input path="mark" class="form-control" id="mark" />
                <!-- Thông báo lỗi cho trường điểm -->
                <span class="error-message" id="mark-error">Điểm phải là số từ 0 đến 10. Vui lòng nhập chính xác yêu cầu!</span>
            </div>

            <!-- Chuyên ngành -->
            <div class="form-group">
                <!-- Nhãn cho trường chuyên ngành -->
                <form:label path="major" style="color: teal;"><span style="color: red;">* </span>Chuyên ngành CNTT </form:label><br>
                <!-- Input kiểu select cho trường chuyên ngành -->
                <form:select path="major" class="form-control">
                    <!-- Tùy chọn cho select -->
                    <form:option value="${item.major}" style="color: teal;"></form:option>
                    <form:option value="Kĩ thuật phần mềm" style="color: teal;">Kĩ thuật phần mềm</form:option>
                    <form:option value="Độ họa kĩ thuật số" style="color: teal;">Độ họa kĩ thuật số</form:option>
                    <form:option value="An toàn thông tin" style="color: teal;">An toàn thông tin</form:option>
                    <form:option value="IoT " style="color: teal;">IoT</form:option>
			</form:select>
		</div>
        <!-- Nút thêm và nút cập nhật -->
        <div class="form-group">
            <!-- Nút thêm sinh viên -->
            <button class="btn btn-success" formaction="/Students/create" formmethod="post"><i class="fas fa-plus"></i>Thêm</button>
            <!-- Nút cập nhật sinh viên -->
            <button class="btn btn-primary" formaction="/Students/update" formmethod="post"><i class="fas fa-edit"></i>Cập nhật</button>
        </div>
    </form:form>
</div>

<!-- Đoạn mã JavaScript để kiểm tra dữ liệu nhập vào trường "Mã sinh viên" và "Điểm" -->
<script>
    // Hàm để kiểm tra trường mã số sinh viên (Mã sinh viên)
    function validateStudentId() {
        const masvInput = document.getElementById("masv");
        const masvError = document.getElementById("masv-error");

        if (masvInput.value.trim() !== "" && isNaN(masvInput.value)) {
            masvError.style.display = "block";
            return false;
        } else {
            masvError.style.display = "none";
            return true;
        }
    }

    // Hàm để kiểm tra trường điểm (Điểm)
    function validateMark() {
        const markInput = document.getElementById("mark");
        const markError = document.getElementById("mark-error");
        const markValue = parseFloat(markInput.value);

        if (isNaN(markValue) || markValue < 0 || markValue > 10) {
            markError.style.display = "block";
            return false;
        } else {
            markError.style.display = "none";
            return true;
        }
    }

    // Hàm để kiểm tra toàn bộ form trước khi gửi
    function validateForm() {
        const isMasvValid = validateStudentId();
        const isMarkValid = validateMark();

        return isMasvValid && isMarkValid;
    }

    // Thêm event listener để kích hoạt kiểm tra khi người dùng nhập liệu
    document.getElementById("masv").addEventListener("input", validateStudentId);
    document.getElementById("mark").addEventListener("input", validateMark);

    // Thêm event listener vào nút Submit/Update để kiểm tra toàn bộ form
    const form = document.getElementById("studentForm");
    const submitButton = document.querySelector("button[type='submit']");

    if (form) {
        form.addEventListener("submit", (event) => {
            if (!validateForm()) {
                event.preventDefault(); // Ngăn việc gửi form nếu có lỗi kiểm tra
            }
        });
    }
</script>
</body>
</html>
