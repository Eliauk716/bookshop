<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="entity.IndexUser"%>
<%@page import="service.impl.UserServiceImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>个人中心</title>
<link rel="stylesheet" href="css/reset.css">
<%--<link rel="stylesheet" href="css/personal.css">--%>
<link rel="icon" href="image/icon.png" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<style>
		form {
			width: 800px;
			position: absolute;
			top: 40%;
			left: 50%;
			transform: translate(-50%, -50%);
			text-align: center;
		}

		fieldset {
			text-align: center;
		}

		form span {
			font-weight: 500;
			font-size: 25px;
			display: block;
			padding-bottom: 25px;
			border-bottom: 2px solid black;
		}

		form label {
			display: inline-block;
			width: 60px;
			text-align: left;
			text-align-last: justify;
			margin-right: 10px;
			vertical-align: middle;
		}

		form input[type=text] {
			margin: 20px auto;
			padding: 10px;
			width: 200px;
		}

		form input[type=radio] {
			margin: 20px auto;
			width: 28px;
			vertical-align: middle;
		}

		.sex{
			margin-left: -60px;
		}

		form input[type=submit] {
			padding: 10px;
			background-color: white;
			border: 1px solid;
			margin-left: 50px;
		}
	</style>
</head>
<body>
	<%
		HttpSession sess = request.getSession();
	String name = (String) sess.getAttribute("name");
	IndexUser user = new UserServiceImpl().UserByName(name);
	int sex = user.getSex();
	%>
	<script type="text/javascript">
		$(function() {
			$("input[name='sex'][value='<%=sex%>']").attr("checked","true");
		});
	</script>
	
	<%
		String error = (String) request.getAttribute("error");
	if (error != null && error.equals("error")) {
	%>
	<script type="text/javascript" language="javascript">
		alert("修改失败！");
		</script>
	<%
		}
	%>
	
	<form action="UpdateServlet" method="POST">
		<fieldset>
			<span>个人信息</span>
			<label>昵称:</label>
			<input type="text" name="name" value="<%=user.getName()%>" readonly="readonly">
			<br />
			<label class="sex">性别: </label>
			<input type="radio" name="sex" value="0">
			保密
			<input type="radio" name="sex" value="1">
			男
			<input type="radio" name="sex" value="2">
			女<br />
			<label>邮箱: </label>
			<input type="text" name="email" value="<%=user.getEmail()%>">
			<br />
			<label>地区: </label>
<!-- 			<select class="form-control" id="cmbProvince" name="cmbProvince"></select> -->
<!--             <select class="form-control" id="cmbCity" name="cmbCity"></select> -->
<!--             <select class="form-control" id="cmbArea" name="cmbArea"></select> -->
<!--             <script type="text/javascript"> -->
<!-- //                 $(document).ready(function () { -->
<!-- //                     addressInit('cmbProvince', 'cmbCity', 'cmbArea'); -->
<!-- //                 }); -->
<!--             </script> -->
<!--             <script src="js/addr.js"></script> -->
			<input type="text" name="city" value="">
			<br />
<!-- 			<label>地址: </label> -->
<!-- 			<input type="text" name="addr" value=""> -->
<!-- 			<br /> -->
			<input type="submit" value="保存">
		</fieldset>
	</form>
</body>

</html>