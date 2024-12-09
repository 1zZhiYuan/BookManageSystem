<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册 - 图书管理系统</title>
    <style>
        /* 通用样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('/images/background.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
            position: relative;
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

        .register-container {
            background-color: rgba(255, 255, 255, 0.9);  /* 半透明背景 */
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

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

        .register-container h2 {
            font-size: 28px;
            color: #4CAF50;
            margin-bottom: 25px;
            font-weight: bold;
            position: relative;
        }

        .register-container h2:after {
            content: "";
            width: 50px;
            height: 3px;
            background: #4CAF50;
            display: block;
            margin: 8px auto 0;
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: box-shadow 0.3s, border-color 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #4CAF50;
            box-shadow: 0 0 8px rgba(76, 175, 80, 0.3);
            outline: none;
        }

        button[type="submit"] {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }

        button[type="submit"]:hover {
            background: linear-gradient(135deg, #185a9d, #43cea2);
            transform: scale(1.02);
        }

        button[type="submit"]:active {
            transform: scale(0.98);
        }

        p {
            margin-top: 15px;
            font-size: 14px;
            color: #555;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        a:hover {
            color: #74ebd5;
            text-decoration: underline;
        }

        /* 响应式支持 */
        @media (max-width: 480px) {
            .register-container {
                padding: 30px 20px;
            }

            .register-container h2 {
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

<div class="register-container">
    <h2>注册账户</h2>

    <!-- 显示错误消息 -->
    <c:if test="${not empty error}">
        <div style="color: red; margin-bottom: 10px;">${error}</div>
    </c:if>

    <!-- 显示用户名回显 -->
    <form action="/register" method="post">
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" id="username" name="username" placeholder="请输入用户名"
                   value="${username}" required>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" id="password" name="password" placeholder="请输入密码" required>
        </div>
        <div class="form-group">
            <label for="confirmPassword">确认密码</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="请再次输入密码" required>
        </div>

        <!-- 隐藏的角色字段，默认为 user -->
        <input type="hidden" name="role" value="user">

        <button type="submit">注册</button>
    </form>

    <p>已有账号？<a href="/login">立即登录</a></p>
</div>

</body>
</html>
