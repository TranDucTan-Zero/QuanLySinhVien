<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students GDU - List</title>
    <link rel="icon" type="image/png" href="https://i.imgur.com/Ck2uZDE.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: "Roboto", sans-serif;
            background-color: #f0f0f0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Bố cục mới cho bảng */
    table {
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0; /* Thêm thuộc tính này để loại bỏ khoảng cách giữa các ô */
    }

    /* Kiểu mới cho phần đầu bảng (thead) */
    thead {
        background-color: #888; /* Sử dụng màu xám đậm hơn (điều chỉnh nếu cần) */
        color: #fff; /* Đặt màu chữ thành trắng */
    }

    /* Kiểu mới cho các hàng trong bảng (tbody) */
    tbody {
        background-color: #E0E0E0; /* Sử dụng màu xám đậm hơn (điều chỉnh nếu cần) */
    }

    /* Kiểu mới cho ô tiêu đề (th) trong bảng */
    th {
        padding: 8px;
        text-align: left;
        border-bottom: 2px solid #dee2e6;
    }

    /* Kiểu mới cho các ô dữ liệu (td) trong bảng */
    td {
        padding: 8px;
        text-align: left;
        border-bottom: 2px solid #dee2e6;
        border: 2px solid #444; /* Thêm khung viền màu xám đậm xung quanh mỗi ô */
    }

        .btn-primary {
            background-color: teal;
            border-color: teal;
        }

        .btn-primary:hover {
            background-color: #009688;
            border-color: #009688;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #c82333;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2 style="color: #00467F; font-size: 36px;">Danh sách sinh viên</h2>
        <table class="table table-light table-hover">
            <thead>
                <tr>
                    <th scope="col">Mã SV</th>
                    <th scope="col">Họ và tên</th>
                    <th scope="col">Điểm</th>
                    <th scope="col">Chuyên ngành</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${items}" varStatus="loop">
                    <tr>
                        <td>${item.masv}</td>
                        <td>${item.name}</td>
                        <td>${item.mark}</td>
                        <td>${item.major}</td>
                        <td class="text-right">
                            <a class="btn btn-primary mr-2" href="/Students/edit/${item.masv}" role="button">Sửa</a>
                            <a class="btn btn-danger mr-2" href="/Students/delete/${item.masv}" role="button">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <h2 style="color: #00467F; font-size: 36px;">Kết quả học tập</h2>
        
        <!-- Thêm phần tử canvas để hiển thị biểu đồ cột -->
        <canvas id="columnChart"></canvas>
    </div>

      <!-- Thêm thư viện Chart.js và mã JavaScript tạo biểu đồ cột -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Chuẩn bị dữ liệu cho biểu đồ
        const studentNames = [];
        const studentMarks = [];
        const studentMajors = [];

        <c:forEach var="item" items="${items}">
            if (${item.mark} >= 0 && ${item.mark} <= 10) {
                studentNames.push("${item.name}");
                studentMarks.push(${item.mark});
                studentMajors.push("${item.major}");
            }
        </c:forEach>

        // Lấy các ngành duy nhất
        const uniqueMajors = [...new Set(studentMajors)];

        // Định nghĩa mảng màu sắc cho các ngành
        const colors = [
            '#ffa500',
            '#4169e1',
            '#3cb371',
            '#ba55d3',
            '#ff0000',
            '#808080',
            // Thêm các màu sắc khác tùy ý nếu cần
        ];

        // Tạo và hiển thị biểu đồ cột nhóm
        const columnChartCanvas = document.getElementById("columnChart").getContext("2d");

        const columnChartData = {
            labels: studentNames,
            datasets: uniqueMajors.map((major, index) => {
                const dataPoints = studentMarks.map((mark, i) => (studentMajors[i] === major ? mark : null));
                return {
                    label: major,
                    data: dataPoints,
                    backgroundColor: colors[index % colors.length], // Gán màu theo thứ tự trong mảng colors
                    borderWidth: 1,
                };
            }),
        };

        const columnChart = new Chart(columnChartCanvas, {
            type: "bar",
            data: columnChartData,
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 10,
                    },
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'bottom',
                        labels: {
                            font: {
                                size: 16
                            }
                        },
                        onClick: null, // Disable click on legend items
                    },
                },
                onClick: null, // Disable click events on the chart area
            },
        });
    </script>
</body>

</html>