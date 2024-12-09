<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书管理系统 - 首页</title>
    <style>
        /* 通用样式 */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom right, #e3f2fd, #ffffff);
            color: #333;
        }

        header {
            background: linear-gradient(to right, #004d40, #00695c);
            color: #fff;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        /* Logo 样式 */
        .logo {
            position: absolute;
            top: 20px;
            left: 20px;
            width: 280px; /* 设置 Logo 宽度 */
            height: auto; /* 保持比例 */
            z-index: 1; /* 确保 Logo 在标题上方 */
        }

        header h1 {
            margin: 0;
            font-size: 36px;
            font-weight: bold;
            letter-spacing: 2px;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        /* 主体内容区 */
        main {
            display: flex;
            max-width: 1200px;
            margin: 40px auto;
            gap: 20px;
        }

        /* 左侧功能导航栏 */
        .sidebar {
            flex: 1;
            background: #80deea;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            position: sticky;
            top: 20px;
            height: fit-content;
        }

        .sidebar h2 {
            font-size: 24px;
            color: #004d40;
            margin-bottom: 15px;
            text-align: center;
            border-bottom: 2px solid #004d40;
            padding-bottom: 10px;
        }

        nav a {
            display: block;
            margin: 10px 0;
            padding: 15px;
            text-align: center;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            color: #004d40;
            background-color: #ffffff;
            border: 2px solid #004d40;
            border-radius: 12px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        nav a:hover {
            background-color: #004d40;
            color: #fff;
            transform: translateY(-5px);
        }

        /* 右侧公告和内容区 */
        .content {
            flex: 3;
            background: #ffffff;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        .content h2 {
            font-size: 28px;
            color: #004d40;
            margin-bottom: 20px;
            border-bottom: 2px solid #004d40;
            padding-bottom: 10px;
        }

        .content .welcome {
            margin-bottom: 20px;
            font-size: 18px;
            color: #333;
        }

        /* 公告栏 */
        .announcement {
            margin-top: 20px;
            padding: 15px;
            background: linear-gradient(to right, #fce4ec, #f8bbd0);
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .announcement h3 {
            margin: 0 0 10px;
            font-size: 22px;
            color: #c62828;
        }

        .announcement p {
            font-size: 16px;
            color: #555;
            margin: 5px 0;
        }

        /* 新增的小组件 */
        .profile-card, .upcoming-books, .quick-links {
            margin-top: 20px;
            padding: 15px;
            background: #e1f5fe;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .profile-card h3, .upcoming-books h3, .quick-links h3 {
            margin: 0;
            font-size: 20px;
            color: #004d40;
            padding-bottom: 10px;
            border-bottom: 2px solid #004d40;
        }

        .quick-links a {
            display: block;
            margin: 10px 0;
            color: #004d40;
            text-decoration: none;
            font-size: 16px;
        }

        .quick-links a:hover {
            color: #0288d1;
        }

        footer {
            margin-top: 40px;
            padding: 20px 0;
            background-color: #004d40;
            color: #fff;
            text-align: center;
            font-size: 16px;
            box-shadow: 0 -2px 6px rgba(0, 0, 0, 0.1);
        }

        footer a {
            color: #ffecb3;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* 响应式支持 */
        @media (max-width: 768px) {
            main {
                flex-direction: column;
            }

            .sidebar,
            .content {
                width: 100%;
            }

            nav a {
                font-size: 16px;
                padding: 10px;
            }
        }
    </style>
</head>

<body>
<!-- 页眉 -->
<header>
    <!-- Logo -->
    <a href="${pageContext.request.contextPath}"><img src="/images/logo.jpg" alt="Logo" class="logo"></a>
    <h1>图书管理系统</h1>
</header>

<!-- 主内容 -->
<main>
    <!-- 左侧导航栏 -->
    <aside class="sidebar">
        <h2>功能导航</h2>
        <nav>
            <a href="/viewBooks">查看书籍列表</a>
            <a href="/borrowed-books">我的借阅记录</a>
            <a href="/borrow-book">借书</a>
            <a href="/return-book">还书</a>
            <% if ("admin".equals(session.getAttribute("role"))) { %>
            <a href="/manage-books">管理书籍</a>
            <a href="/manage-users">管理用户</a>
            <% } %>
            <!-- 添加退出按钮 -->
            <a href="/login">退出登录</a>
        </nav>
    </aside>

    <!-- 右侧内容 -->
    <section class="content">
        <h2>欢迎回来，<%= session.getAttribute("username") %>！</h2>
        <p class="welcome">
            <% if ("admin".equals(session.getAttribute("role"))) { %>
            您的角色是：<strong>管理员</strong>
            <% } else { %>
            您的角色是：<strong>普通用户</strong>
            <% } %>
        </p>

        <!-- 公告栏 -->
        <div class="announcement">
            <h3>系统公告</h3>
            <p>1. 系统将在每周六晚12:00进行例行维护。</p>
            <p>2. 请及时归还到期图书，避免产生罚款。</p>
            <p>3. 新增书籍类别：科技与编程。</p>
        </div>

        <!-- 即将发布的书籍 -->
        <div class="upcoming-books">
            <h3>即将发布的书籍</h3>
            <ul>
                <li>《Java高级编程》 - 预计2024年12月发布</li>
                <li>《机器学习入门》 - 预计2025年1月发布</li>
                <li>《人工智能与大数据》 - 预计2025年3月发布</li>
            </ul>
        </div>
    </section>
</main>

<!-- 页脚 -->
<footer>
    <p>&copy; 2024 图书管理系统. All rights reserved. <a href="/about">关于我们</a></p>
</footer>

</body>

</html>
