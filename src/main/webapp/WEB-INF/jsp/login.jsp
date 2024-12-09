<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录 - 图书管理系统</title>
    <style>
        /* 通用样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            /* 设置背景图片并使其固定在背景 */
            background: url('/images/background.jpg') no-repeat center center fixed;
            /* 背景图片自适应页面大小 */
            background-size: cover;
            height: 100vh;  /* 设置页面高度为视口高度 */
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;  /* 设置字体颜色 */
            position: relative;  /* 为了使用伪元素覆盖背景 */
        }

        /* 添加一个较轻的模糊效果，增强页面内容的可读性 */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: inherit;  /* 继承 body 背景 */
            filter: blur(4px);  /* 设置较轻的模糊效果 */
            z-index: -1;  /* 将背景模糊层放置到内容层下 */
        }

        /* Logo 样式 */
        .logo {
            position: absolute;
            top: 30px;  /* 距离顶部 30px */
            left: 30px;  /* 距离左边 30px */
            width: 220px;  /* 增大 Logo 宽度到 220px */
            height: auto;  /* 保持图片比例 */
            z-index: 1;  /* 确保 Logo 在背景之上 */
            transition: transform 0.3s ease-in-out;  /* 添加变换效果 */
        }

        /* 鼠标悬停 Logo 时的效果 */
        .logo:hover {
            transform: scale(1.15);  /* 放大 Logo 1.15倍 */
        }

        .login-container {
            /* 设置背景为半透明白色，增强可读性 */
            background: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 12px;  /* 设置圆角 */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);  /* 设置阴影 */
            width: 100%;
            max-width: 400px;  /* 最大宽度 */
            text-align: center;  /* 居中对齐 */
            animation: fadeIn 0.8s ease-in-out;  /* 动画效果 */
        }

        /* 动画效果：渐变显示 */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-container h2 {
            font-size: 28px;
            color: #2193b0;  /* 标题颜色 */
            margin-bottom: 25px;
            font-weight: 600;
            position: relative;
        }

        .login-container h2:after {
            content: "";
            width: 50px;
            height: 3px;
            background: #2193b0;  /* 设置底部条形装饰 */
            display: block;
            margin: 8px auto 0;
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;  /* 表单元素左对齐 */
        }

        label {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }

        /* 输入框样式 */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: box-shadow 0.3s, border-color 0.3s;
            background: #f9f9f9;  /* 输入框背景色 */
        }

        /* 输入框获取焦点时的样式 */
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #2193b0;
            box-shadow: 0 0 8px rgba(33, 147, 176, 0.3);
            outline: none;
        }

        /* 登录按钮样式 */
        button[type="submit"] {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #2193b0, #6dd5ed);  /* 按钮渐变背景 */
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }

        /* 按钮悬停时的样式 */
        button[type="submit"]:hover {
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* 按钮点击时的样式 */
        button[type="submit"]:active {
            transform: translateY(0);
            box-shadow: none;
        }

        p {
            margin-top: 15px;
            font-size: 14px;
            color: #555;
        }

        /* 链接样式 */
        a {
            color: #2193b0;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        a:hover {
            color: #6dd5ed;
            text-decoration: underline;
        }

        /* 响应式支持 */
        @media (max-width: 480px) {
            .login-container {
                padding: 30px 20px;
            }

            .login-container h2 {
                font-size: 24px;
            }

            button[type="submit"] {
                font-size: 14px;
            }

            .logo {
                width: 200px;  /* 小屏幕下 Logo 稍微缩小 */
            }
        }
    </style>
</head>
<body>

<!-- Logo 包裹在链接标签中，点击 Logo 跳转到登录页面 -->
<a href="/login">
    <img src="/images/logo.jpg" alt="Logo" class="logo">
</a>

<div class="login-container">
    <h2>登录图书管理系统</h2>
    <form action="/login" method="post">
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" id="username" name="username" placeholder="请输入用户名" required>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" id="password" name="password" placeholder="请输入密码" required>
        </div>
        <button type="submit">登录</button>
    </form>
    <p>还没有账号？<a href="/register">立即注册</a></p>
</div>

</body>
</html>
