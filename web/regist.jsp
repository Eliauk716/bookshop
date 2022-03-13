<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
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

.box span {
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

.box0 {
	position: fixed;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.2);
	display: none;
}

.box1 {
	width: 500px;
	height: 500px;
	position: fixed;
	left: 50%;
	top: 25%;
	margin-left: -250px;
	border: 1px solid #000000;
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
		alert("用户名重复！");
	</script>
	<%
		}
	%>


	<form class="box" action="RegistServlet" method="post">
		<span id="signup">注册</span>
		<input id="email" type="text" placeholder="邮箱" name="email" onchange="check_email()"
			required>
		<input id="username" type="text" placeholder="用户名" name="username" required>
		<input id="psw" type="password" placeholder="密码" name="pwd" onchange="check_pwd()"
			required>
		<a href='login.jsp'>已有账号？去登录</a>
		<input id="sub" type="submit" value="注册">
	</form>
</body>

<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function check_email() {
		var reg = /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/;
		if (!reg.test($("#email").val())) {
			alert("请输入正确的邮箱！");
			$("#email").focus();
		}
	}

	// 	function check_pwd() {
	// 		var reg = /^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)(?!([^(0-9a-zA-Z)])+$).{6,}$/;
	// 		if (!reg.test($("#pwd").val())) {
	// 			alert("密码不少于6位，至少包括字母、数字");
	// 			$("#pwd").focus();
	// 		}
	// 	}
</script>
</html>