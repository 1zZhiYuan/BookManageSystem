<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>编辑书籍 - 图书管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input, button {
            margin: 10px 0;
            padding: 10px;
            font-size: 16px;
        }
        button {
            background-color: #0288d1;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #026aa7;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>编辑书籍</h1>
    <form method="post" action="${pageContext.request.contextPath}/manage-books/updateBook">
        <input type="hidden" name="bookId" value="${book.bookId}">
        <input type="text" name="title" value="${book.title}" placeholder="书名" required>
        <input type="text" name="author" value="${book.author}" placeholder="作者" required>
        <input type="text" name="category" value="${book.category}" placeholder="类别" required>
        <input type="number" name="stock" value="${book.stock}" placeholder="库存" required>
        <button type="submit">保存修改</button>
    </form>
</div>
</body>
</html>
