<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="icon" href="image/icon.png" type="image/x-icon">
    <style>
        body {
            background-color: whitesmoke;
        }

        .box {
            width: 300px;
            padding: 40px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            background: rgba(255, 255, 255, 0.5);
            box-shadow: 0px 0px 10px 5px #aaa;
        }

        .box span {
            color: #999;
            text-transform: uppercase;
            font-weight: 500;
            font-size: large;
        }

        .box span.active {
            color: #000;
        }

        .box #email, .box #username, .box #psw {
            background: none;
            display: block;
            margin: 20px auto;
            text-align: center;
            border: 2px solid #3498db;
            padding: 14px 10px;
            width: 200px;
            outline: none;
            border-radius: 24px;
            transition: 0.25s;
        }

        .box #email:focus, .box #username:focus, .box #psw:focus {
            width: 280px;
            border-color: #f3de16;
        }

        .box #log, .box #sub {
            background: none;
            display: block;
            margin: 20px auto;
            text-align: center;
            border: 2px solid #f3de16;
            padding: 14px 40px;
            outline: none;
            border-radius: 24px;
            transition: 0.25s;
        }

        .box #log:hover, .box #sub:hover {
            background: #f3de16;
        }

        a {
            font-size: 13px;
            text-decoration: none;
            color: black;
            padding-left: 100px;
        }

        a:hover {
            font-size: 13px;
            color: red;
        }
    </style>
</head>
<body>
<script src="js/background.js"></script>
<%
    String error = (String) request.getAttribute("error");
    if (error != null && error.equals("error")) {
%>
<script type="text/javascript" language="javascript">
    alert("用户名或密码错误！");
</script>
<%
    }
%>
<form class="box" action="LoginServlet" method="post">
    <span id="login" class="active">登录</span>
    <input id="username" type="text" placeholder="用户名" name="username" required>
    <input id="psw" type="password" placeholder="密码" name="pwd" required>
    <a href="regist.jsp">没有账号？去注册</a>
    <input id="log" type="submit" value="登录">
</form>
</body>
</html>
