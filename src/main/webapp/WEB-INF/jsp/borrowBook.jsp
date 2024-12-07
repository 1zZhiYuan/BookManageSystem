<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书管理系统 - 借书</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f7fb;
            color: #333;
        }

        header {
            background: #00796b;
            color: white;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            margin: 0;
            font-size: 36px;
        }

        .breadcrumb {
            margin-top: 10px;
            font-size: 14px;
            color: #555;
        }

        .breadcrumb a {
            color: #00796b;
            text-decoration: none;
        }

        .breadcrumb a:hover {
            text-decoration: underline;
        }

        main {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h2 {
            color: #00796b;
            font-size: 28px;
            margin-bottom: 20px;
        }

        form {
            width: 90%;
            max-width: 500px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: 18px;
        }

        select, input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        input[type="submit"] {
            background-color: #00796b;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #004d40;
        }

        footer {
            background-color: #00796b;
            color: white;
            text-align: center;
            padding: 20px;
        }

        footer a {
            color: #ffecb3;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
<header>
    <h1>图书管理系统</h1>
    <div class="breadcrumb">
        <a href="/">首页</a> > <a href="/borrow-book">借书</a>
    </div>
</header>

<main>
    <h2>借书</h2>
    <p>请选择您要借阅的书籍，填写相关信息后提交。</p>
    <form action="/borrow-book" method="post">
        <label for="bookId">选择书籍：</label>
        <select id="bookId" name="bookId" required>
            <option value="1">《Java编程入门》</option>
            <option value="2">《Python深度学习》</option>
            <option value="3">《机器学习基础》</option>
            <!-- 可以动态加载书籍列表 -->
        </select>

        <input type="submit" value="借书">
    </form>
</main>

<footer>
    <p>&copy; 2024 图书管理系统. All rights reserved. <a href="/about">关于我们</a></p>
</footer>
</body>

</html>
