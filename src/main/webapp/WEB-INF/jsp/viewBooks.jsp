<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查看书籍 - 图书管理系统</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #e3f2fd, #ffffff);
            color: #333;
        }

        header {
            background: linear-gradient(to right, #004d40, #00695c);
            color: white;
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        header img {
            height: 40px;
            cursor: pointer;
        }

        h1 {
            margin: 0;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #ffecb3;
        }

        main {
            width: 80%; /* Adjust width to 80% */
            margin: 30px auto; /* Set top and bottom margin */
            padding: 20px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 16px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #004d40;
            color: white;
            font-size: 16px;
            text-transform: uppercase;
        }

        tr {
            transition: background-color 0.3s ease;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td {
            font-size: 14px;
            color: #555;
        }

        footer {
            text-align: center;
            padding: 15px;
            background-color: #004d40;
            color: white;
            font-size: 14px;
            margin-top: 20px;
            box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.1);
        }

        footer a {
            color: #ffecb3;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                text-align: center;
            }

            nav {
                margin-top: 10px;
            }

            main {
                width: 90%; /* Increase width for small screens */
                padding: 10px;
            }

            table {
                font-size: 12px;
            }

            th, td {
                padding: 10px;
            }
        }

        /* Search bar styling */
        .search-container {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .search-container input {
            width: 70%;
            padding: 10px;
            font-size: 16px;
            border: 2px solid #004d40;
            border-radius: 8px;
            outline: none;
        }

        .search-container button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #004d40;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search-container button:hover {
            background-color: #00695c;
        }
    </style>
</head>
<body>

<header>
    <h1>查看书籍</h1>
    <nav>
        <a href="${pageContext.request.contextPath}/manage-books">书籍管理</a>
        <a href="${pageContext.request.contextPath}/logout">退出</a>
    </nav>
</header>

<main>
    <!-- Search bar -->
    <div class="search-container">
        <input type="text" id="search" placeholder="搜索书名..." oninput="searchBooks()">
        <button onclick="searchBooks()">搜索</button>
    </div>

    <!-- Book list -->
    <table>
        <thead>
        <tr>
            <th>书籍编号</th>
            <th>书名</th>
            <th>作者</th>
            <th>类别</th>
            <th>库存</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="book" items="${books}">
            <tr>
                <td>${book.bookId}</td>
                <td>${book.title}</td>
                <td>${book.author}</td>
                <td>${book.category}</td>
                <td>${book.stock}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>

<footer>
    <p>&copy; 2024 图书管理系统. All rights reserved. <a href="/about">关于我们</a></p>
</footer>

<script>
    // Search functionality
    function searchBooks() {
        var input = document.getElementById('search');
        var filter = input.value.toLowerCase();
        var rows = document.querySelectorAll('table tbody tr');

        rows.forEach(function(row) {
            var title = row.cells[1].textContent.toLowerCase();
            if (title.includes(filter)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }
</script>

</body>
</html>
