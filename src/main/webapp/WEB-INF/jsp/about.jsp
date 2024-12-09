<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>关于我们 - 图书管理系统</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
        }

        header h1 {
            margin: 0;
            font-size: 36px;
            font-weight: bold;
            letter-spacing: 2px;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        main {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        h2 {
            font-size: 28px;
            color: #004d40;
            margin-bottom: 20px;
            border-bottom: 2px solid #004d40;
            padding-bottom: 10px;
        }

        .content {
            font-size: 18px;
            line-height: 1.8;
            color: #555;
            margin-bottom: 20px;
        }

        .team {
            margin-top: 30px;
        }

        .team-member {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .team-member img {
            border-radius: 50%;
            width: 80px;
            height: 80px;
            margin-right: 20px;
        }

        .team-member h3 {
            font-size: 20px;
            color: #004d40;
            margin: 0;
        }

        .team-member p {
            font-size: 16px;
            color: #555;
            margin: 5px 0;
        }

        .team-member a {
            text-decoration: none;
            color: #0288d1;
        }

        .team-member a:hover {
            text-decoration: underline;
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

        /* 响应式样式 */
        @media (max-width: 768px) {
            main {
                width: 90%;
            }

            .team-member {
                flex-direction: column;
                align-items: flex-start;
            }

            .team-member img {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

<!-- 页眉 -->
<header>
    <h1>图书管理系统 - 关于我们</h1>
</header>

<!-- 主内容 -->
<main>
    <section class="content">
        <h2>关于图书管理系统</h2>
        <p>图书管理系统是一个专为学校、图书馆和各种书籍管理场所设计的系统，旨在通过提供一个便捷、易用的方式来管理图书的借阅与归还。我们的系统提供了多种功能，如书籍搜索、借书、还书、查看借阅记录等，以满足不同用户的需求。</p>
        <p>我们的目标是通过持续的优化和技术创新，使图书管理系统更加智能化和高效，减少人工管理的压力，同时为读者提供更加便捷的借阅体验。</p>

        <h3>我们的使命</h3>
        <p>为各类图书管理机构提供高效的管理平台，让每一本书籍都能找到适合的读者，让每位读者都能轻松找到所需的书籍。</p>

        <h3>我们的愿景</h3>
        <p>成为全球领先的图书管理解决方案提供商，致力于推动数字化图书管理的发展，为更多用户提供服务。</p>
    </section>

    <!-- 团队成员 -->
    <section class="team">
        <h2>我们的团队</h2>
        <div class="team-member">
            <img src="https://via.placeholder.com/80" alt="团队成员1">
            <div>
                <h3>张博</h3>
                <p>项目经理 | 系统设计师</p>
                <p>张博负责系统的整体架构设计和项目管理，致力于提供最佳的技术解决方案。</p>
                <a href="mailto:2363497064@qq.com">联系张博</a>
            </div>
        </div>
        <div class="team-member">
            <img src="https://via.placeholder.com/80" alt="团队成员2">
            <div>
                <h3>李雷</h3>
                <p>前端开发工程师</p>
                <p>李雷负责前端界面的开发与优化，致力于提高用户体验。</p>
                <a href="mailto:lilei@example.com">联系李雷</a>
            </div>
        </div>
        <div class="team-member">
            <img src="https://via.placeholder.com/80" alt="团队成员3">
            <div>
                <h3>王刚</h3>
                <p>后端开发工程师</p>
                <p>王刚负责后端开发与数据库设计，确保系统的高效运行。</p>
                <a href="mailto:wanggang@example.com">联系王刚</a>
            </div>
        </div>
    </section>
</main>

<!-- 页脚 -->
<footer>
    <p>&copy; 2024 图书管理系统. All rights reserved. <a href="/about">关于我们</a></p>
</footer>

</body>
</html>
