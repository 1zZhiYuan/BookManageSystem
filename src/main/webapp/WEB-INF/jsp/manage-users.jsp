<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理用户</title>
    <style>
        /* 基础样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            color: #333;
        }

        h2 {
            color: #004d40;
            text-align: center;
            padding: 20px 0;
            margin-bottom: 30px;
            font-size: 32px;
            font-weight: 600;
        }

        /* 按钮 */
        .add-btn {
            display: block;
            width: 220px;
            margin: 20px auto;
            text-align: center;
            padding: 12px;
            background-color: #004d40;
            color: white;
            font-weight: bold;
            border-radius: 30px;
            text-decoration: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, transform 0.2s;
        }

        .add-btn:hover {
            background-color: #004d40;
            transform: translateY(-3px);
        }

        /* 表格 */
        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 15px 20px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        table th {
            background-color: #004d40;
            color: #fff;
            text-transform: uppercase;
            font-size: 14px;
        }

        table td {
            font-size: 16px;
            color: #555;
        }

        table tr:hover {
            background-color: #f5f5f5;
        }

        table td a {
            color: #004d40;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }

        table td a:hover {
            color: #004d40;
        }

        table td form button {
            padding: 6px 15px;
            background-color: #d32f2f;
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s, transform 0.2s;
        }

        table td form button:hover {
            background-color: #c62828;
            transform: translateY(-2px);
        }

        /* 表单容器 */
        .form-container {
            display: none;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            width: 80%;
            max-width: 500px;
        }

        .form-container input[type="text"],
        .form-container input[type="password"],
        .form-container select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .form-container button {
            width: 100%;
            padding: 12px;
            background-color: #004d40;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #004d40;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            table {
                width: 95%;
            }

            h2 {
                font-size: 24px;
            }

            table th, table td {
                padding: 10px 12px;
                font-size: 14px;
            }

            .add-btn {
                width: 180px;
                padding: 10px;
            }

            table td form button {
                padding: 5px 12px;
            }
        }
    </style>
</head>
<body>

<h2>用户管理</h2>

<!-- 显示添加用户表单按钮 -->
<a href="javascript:void(0)" id="showAddFormBtn" class="add-btn">添加新用户</a>

<!-- 新增用户表单 -->
<div class="form-container" id="userFormContainer">
    <h3 id="formTitle">添加新用户</h3>
    <form id="userForm" method="post" action="${pageContext.request.contextPath}/manage-users/add">
        <input type="hidden" id="userId" name="userId" value="">
        <label for="username">用户名</label>
        <input type="text" id="username" name="username" required>

        <label for="password">密码</label>
        <input type="password" id="password" name="password" required>

        <label for="role">角色</label>
        <select id="role" name="role">
            <option value="user">普通用户</option>
            <option value="admin">管理员</option>
        </select>

        <button type="submit" id="submitBtn">添加用户</button>
    </form>
</div>

<main>
    <table>
        <thead>
        <tr>
            <th>用户ID</th>
            <th>用户名</th>
            <th>角色</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <!-- 写死的用户数据 -->
        <tr>
            <td>1</td>
            <td>admin</td>
            <td>管理员</td>
            <td>2024-01-01 10:00:00</td>
            <td>
                <form method="post" action="/manage-users/delete">
                    <input type="hidden" name="userId" value="1">
                    <button type="submit">删除</button>
                </form>
            </td>
        </tr>
        <tr>
            <td>2</td>
            <td>john_doe</td>
            <td>普通用户</td>
            <td>2024-02-15 14:30:00</td>
            <td>
                <form method="post" action="/manage-users/delete">
                    <input type="hidden" name="userId" value="2">
                    <button type="submit">删除</button>
                </form>
            </td>
        </tr>
        <tr>
            <td>3</td>
            <td>jane_smith</td>
            <td>普通用户</td>
            <td>2024-03-10 09:15:00</td>
            <td>
                <form method="post" action="/manage-users/delete">
                    <input type="hidden" name="userId" value="3">
                    <button type="submit">删除</button>
                </form>
            </td>
        </tr>
        <tr>
            <td>4</td>
            <td>lucy_white</td>
            <td>普通用户</td>
            <td>2024-04-20 17:45:00</td>
            <td>
                <form method="post" action="/manage-users/delete">
                    <input type="hidden" name="userId" value="4">
                    <button type="submit">删除</button>
                </form>
            </td>
        </tr>
        </tbody>
    </table>
</main>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // 显示/隐藏添加用户表单
        $("#showAddFormBtn").click(function() {
            var formContainer = $("#userFormContainer");
            formContainer.toggle(); // 切换表单显示状态
            $("#formTitle").text("添加新用户");
            $("#submitBtn").text("添加用户");
            $("#userForm")[0].reset(); // 重置表单
        });

        // 提交用户表单 via AJAX
        $("#userForm").submit(function(event) {
            event.preventDefault(); // 阻止默认提交
            var formData = $(this).serialize();

            $.ajax({
                url: '/manage-users/add', // 后端处理添加用户的接口
                type: 'POST',
                data: formData,
                success: function(response) {
                    alert('用户添加成功');
                    location.reload(); // 刷新页面，显示新的用户列表
                },
                error: function(xhr) {
                    alert('操作失败，请重试！');
                }
            });
        });
    });
</script>

</body>
</html>
