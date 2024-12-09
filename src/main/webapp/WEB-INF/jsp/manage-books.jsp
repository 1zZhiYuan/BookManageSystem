<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>书籍管理 - 图书管理系统</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc; /* Light background color */
            color: #333;
        }

        header {
            background-color: #004d40; /* Matching homepage color */
            color: white;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin: 0;
            font-size: 28px;
            font-weight: bold;
        }

        .logo {
            position: absolute;
            top: 20px;
            left: 20px;
            width: 280px; /* Adjust width of the logo */
            height: auto;
            z-index: 1;
        }

        main {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eaeaea;
        }

        th {
            background-color: #004d40; /* Matching homepage color */
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .actions {
            margin: 20px auto;
            text-align: center;
        }

        .actions h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .actions form {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
        }

        .actions input, .actions button {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .actions button {
            background-color: #004d40; /* Matching homepage color */
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .actions button:hover {
            background-color: #004d40; /* Slightly darker blue for hover */
        }

        footer {
            text-align: center;
            padding: 15px;
            background-color: #004d40; /* Matching homepage color */
            color: white;
            margin-top: 20px;
            box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }

            th, td {
                padding: 10px;
            }
        }
    </style>
</head>
<body>

<header>
    <!-- Logo with Link to Homepage -->
    <a href="${pageContext.request.contextPath}">
        <img src="/images/logo.jpg" alt="Logo" class="logo">
    </a>
    <h1>书籍管理</h1>
</header>

<main>
    <table>
        <thead>
        <tr>
            <th>书籍编号</th>
            <th>书名</th>
            <th>作者</th>
            <th>类别</th>
            <th>库存</th>
            <th>操作</th>
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
                <td>
                    <form method="post" action="${pageContext.request.contextPath}/manage-books/deleteBook" style="display: inline-block;">
                        <input type="hidden" name="bookId" value="${book.bookId}">
                        <button type="submit">删除</button>
                    </form>
                    <form method="get" action="${pageContext.request.contextPath}/manage-books/editBook" style="display: inline-block;">
                        <input type="hidden" name="bookId" value="${book.bookId}">
                        <button type="submit">编辑</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="actions">
        <h2>增加新书</h2>
        <form method="post" action="${pageContext.request.contextPath}/manage-books/addBook">
            <input type="text" name="title" placeholder="书名" required>
            <input type="text" name="author" placeholder="作者" required>
            <input type="text" name="category" placeholder="类别" required>
            <input type="number" name="stock" placeholder="库存" required>
            <button type="submit">增加</button>
        </form>
    </div>
</main>

<footer>
    <p>&copy; 2024 图书管理系统. All rights reserved.</p>
</footer>

</body>
</html>
