<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加书籍</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            font-size: 28px;
            color: #0288d1;
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            margin-bottom: 10px;
            display: block;
            color: #555;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            background-color: #f9f9f9;
        }

        button {
            width: 100%;
            padding: 14px;
            background-color: #0288d1;
            color: #fff;
            font-size: 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0277bd;
        }

        .footer {
            text-align: center;
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
    </style>
</head>
<body>
<div class="container">
    <h2>添加新书籍</h2>
    <form action="/manage-books/add" method="post">
        <label for="title">书名:</label>
        <input type="text" id="title" name="title" required>

        <label for="author">作者:</label>
        <input type="text" id="author" name="author" required>

        <label for="category">类别:</label>
        <input type="text" id="category" name="category" required>

        <label for="stock">库存:</label>
        <input type="number" id="stock" name="stock" required>

        <button type="submit">添加书籍</button>
    </form>

    <div class="footer">
        <p>返回<a href="/manage-books">书籍管理</a></p>
    </div>
</div>
</body>
</html>
