<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="service.impl.*"%>
<%@page import="entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索结果</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="icon" href="image/icon.png" type="image/x-icon">
<link rel="stylesheet" href="css/hnf.css" type="text/css">
<link rel="stylesheet" href="css/result.css" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<%
		HttpSession sess = request.getSession();
	String name = (String) sess.getAttribute("name");
	IndexUser user = new UserServiceImpl().UserByName(name);
	String type = user.getType();
	if (name != null) {
		if (type != null && type.equals("admin")) {
	%>
	<script type="text/javascript">
	$(function(){
		$("#login").html('<%=name%>');
		});
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
	$(function(){ 
	   $("#login").html('<%=name%>
		');
			$("#admin").hide();
			$("#ad").hide();
		});
	</script>
	<%
		}
	}
	%>
	<!-- 顶部栏  -->
	<div id="top_box">
		<div class="top">
			<div class="topleft">一点时间一本书，遇见知识</div>
			<ul class="topright">
				<li id="login">
					<a href="login.jsp">登录/注册</a>
				</li>

				<li class="line">
				<li>
					<a href="#">消息</a>
				</li>
				</li>

				<li class="line">
				<li>
					<a href="shopCar.html">购物车</a>
				</li>
				</li>

				<li class="line">
				<li>
					<a href="#">我的订单</a>
				</li>
				</li>

				<li class="line">
				<li>
					<a href="personal.jsp">个人中心</a>
				</li>
				</li>

				<li class="line" id="ad">
				<li id="admin">
					<a href="#">图书管理</a>
				</li>
				</li>

				<li class="line">
				<li>
					<a href="#">客服</a>
				</li>
				</li>
			</ul>
		</div>
	</div>

	<!-- 搜索框及logo -->
	<div id="search_box">
		<div class="search">
			<div class="logo">
				<img src="image/logo2.png"> <img src="image/logo3.png">
			</div>
			<!-- 搜索框 -->
			<div class="search_key">
				<form action="SearchServlet" method="post">
					<input class="search_put" type="text" name="search" placeholder="输入搜索内容">
					<select class="select" name="select">
						<option id="b_name">书名
						<option id="author">作者
					</select>
					<input class="btn" type="submit" value="搜索">
				</form>
			</div>
		</div>
	</div>

	<!-- 导航栏部分 -->
	<div id="nav_box">
		<div class="nav_content">
			<div class="bookclass">图书分类</div>
			<ul class="nav">
				<li class="nav_active">
					<a href="index.jsp" class="white">首页</a>
				</li>
				<li>
					<a href="hotSell.html" class="white">热销</a>
				</li>
				<li>
					<a href="newBook.html" class="white">新书专区</a>
				</li>
				<li>
					<a href="discBook.html" class="white">特价专区</a>
				</li>
				<li>
					<a href="recBook.html" class="white">推荐书单</a>
				</li>
			</ul>
		</div>
	</div>

	<!-- 图书 -->
	<div id="index_box">
		<div class="index">
			<!-- 图书分类 -->
			<div class="book_menu">
				<ul class="list_group">
					<li class="list_item">
						<a href="novel.html">文学</a>
					</li>
					<li class="list_item">
						<a href="edu.html">教育</a>
					</li>
					<li class="list_item">
						<a href="eco_man.html">经管</a>
					</li>
					<li class="list_item">
						<a href="encour.html">励志</a>
					</li>
					<li class="list_item">
						<a href="live.html">生活</a>
					</li>
					<li class="list_item">
						<a href="social.html">社科</a>
					</li>
					<li class="list_item">
						<a href="sci.html">科技</a>
					</li>
				</ul>
			</div>
			<!-- 搜索结果显示 -->
			<%
				String error = (String) request.getAttribute("error");
			if (error != null && error.equals("error")) {
			%>
			<div class="noExit">
				<span>书籍不存在！</span>
			</div>

			<%
				} else {
			List<IndexBook> book = (List<IndexBook>) request.getAttribute("booklist");
			%>
			<div class="book">
				<ul class="book_product">
					<%
						for (int i = 0; i < book.size(); i++) {
						IndexBook b = book.get(i);
					%>
					<li class="book_slide">
						<div class="book_list_img">
							<a href="#">
								<img src="image/<%=b.getPath()%>">
							</a>
						</div>
						<div class="book_name">
							<a href="#"><%=b.getBname()%></a>
						</div>
						<div class="book_author"><%=b.getAuthor()%></div>
						<div class="book_price">
							￥<%=b.getPrice()%></div>
					</li>
					<%
						}
					%>
				</ul>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>