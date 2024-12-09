<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>编辑书籍 - 图书管理系统</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
            max-width: 90%;
        }
        h1 {
            font-size: 28px;
            margin-bottom: 30px;
            color: #0288d1;
            font-weight: bold;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input, button {
            margin: 10px 0;
            padding: 12px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ddd;
            transition: all 0.3s ease;
        }
        input {
            background-color: #f9f9f9;
        }
        input:focus {
            border-color: #0288d1;
            outline: none;
            background-color: #fff;
        }
        button {
            background-color: #0288d1;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #026aa7;
        }
        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #888;
        }
        .footer a {
            color: #0288d1;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        /* Mobile Responsive */
        @media (max-width: 768px) {
            .container {
                padding: 25px;
                width: 100%;
            }
            h1 {
                font-size: 24px;
            }
            input, button {
                padding: 10px;
                font-size: 14px;
            }
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
    <div class="footer">
        <p>返回 <a href="${pageContext.request.contextPath}/manage-books">书籍管理</a></p>
    </div>
</div>
</body>
</html>
