<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书管理系统 - 我的借阅记录</title>
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

        table {
            width: 90%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #00796b;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
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

        /* 响应式设计 */
        @media (max-width: 768px) {
            table {
                width: 100%;
            }
        }
    </style>
</head>

<body>
<header>
    <h1>图书管理系统</h1>
    <div class="breadcrumb">
        <a href="/">首页</a> > <a href="/borrowed-books">我的借阅记录</a>
    </div>
</header>

<main>
    <h2>我的借阅记录</h2>
    <p>以下是您当前借阅的书籍信息，包括借阅日期、到期日期及当前状态。</p>
    <table>
        <thead>
        <tr>
            <th>书名</th>
            <th>借阅日期</th>
            <th>到期日期</th>
            <th>状态</th>
        </tr>
        </thead>
        <tbody>
        <!-- 写死的示例数据 -->
        <tr>
            <td>Java编程思想</td>
            <td>2024-10-01</td>
            <td>2024-11-01</td>
            <td>已归还</td>
        </tr>
        <tr>
            <td>数据结构与算法</td>
            <td>2024-09-15</td>
            <td>2025-1-01</td>
            <td>未归还</td>
        </tr>
        <tr>
            <td>计算机网络</td>
            <td>2024-08-20</td>
            <td>2024-09-20</td>
            <td>已逾期</td>
        </tr>
        <tr>
            <td>操作系统概念</td>
            <td>2024-11-10</td>
            <td>2024-12-30</td>
            <td>未归还</td>
        </tr>
        </tbody>
    </table>
</main>

<footer>
    <p>&copy; 2024 图书管理系统. All rights reserved. <a href="/about">关于我们</a></p>
</footer>
</body>

</html>
