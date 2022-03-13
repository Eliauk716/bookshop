<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/7/1
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书详情</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="icon" href="image/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="css/details.css">
    <link rel="stylesheet" href="css/hnf.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>

<body>
<div id="top_box">
    <div class="top">
        <div class="topleft">一点时间一本书，遇见知识</div>
        <ul class="topright">
            <li><a href="login.html">登录/注册</a></li>

            <li class="line">
            <li><a href="#">消息</a></li>
            </li>

            <li class="line">
            <li><a href="#">购物车</a></li>
            </li>

            <li class="line">
            <li><a href="#">我的订单</a></li>
            </li>

            <li class="line">
            <li><a href="#">个人中心</a></li>
            </li>

            <li class="line">
            <li><a href="#">客服</a></li>
            </li>
        </ul>
    </div>
</div>

<div id="search_box">
    <div class="search">
        <div class="logo">
            <img src="image/logo2.png">
            <img src="image/logo3.png">
        </div>
        <!-- 搜索框 -->
        <div class="search_key">
            <form action="">
                <input class="search_put" type="text" placeholder="输入搜索内容">
                <input class="btn" type="button" value="搜索">
            </form>
        </div>
    </div>
</div>

<div id="nav_box">
    <div class="nav_content">
        <!-- <div class="bookclass">图书分类</div> -->
        <ul class="nav">
            <li class="nav_active"><a href="Index.html" target="_blank" class="white">首页</a></li>
            <li><a href="hotSell.html" target="_blank" class="white">热销</a></li>
            <li><a href="newBook.html" class="white">新书专区</a></li>
            <li><a href="discBook.html" class="white">特价专区</a></li>
            <li><a href="recBook.html" class="white">推荐书单</a></li>
        </ul>
    </div>
</div>

<div class="middle">
    <%
        String img = request.getParameter("img");
        String name = request.getParameter("name");
        String author = request.getParameter("author");
        String price = request.getParameter("price");

    %>
    <div class="card" style="width: 18rem;">
        <img src="image/<%=img%>" class="card-img-top img">
    </div>
    <div class="right">
        <p class="alert alert-warning tit" role="alert"
           style="font-size:20px;font-weight: bold;background-color: #fff;border: 0">
            <%=name%>---<%=author%>
        </p>
        <ul class="list-group" style="color: lightslategray;font-size: 13px;">
            <li class="list-group-item active price"
                style="background: #fff;color: rgb(252, 34, 34);font-size: 25px;border:1px solid lightgrey;"><%=price%></li>
            <li class="list-group-item">每满100元，可减50元现金</li>
            <li class="list-group-item">满10元另加26.90元，或满12元另加16.90元，或满15元另加9.90元，即可在购物车换购热销商品</li>
            <li class="list-group-item">以上促销可在购物车任选其一</li>
            <li class="list-group-item">隔日达自提49元免基础运费</li>
        </ul>
        <div class="form">
            <form action="/addShopCar?img=<%=img%>&bookname=<%=name%>&price=<%=price%>" method="post" name="form">
                <div class="btns">
                    <label>分期：</label>
                    <button type="button" class="btn btn-outline-secondary">不分期</button>
                    <button type="button" class="btn btn-outline-secondary">3期</button>
                    <button type="button" class="btn btn-outline-secondary">6期</button>
                    <button type="button" class="btn btn-outline-secondary">12期</button>
                    <button type="button" class="btn btn-outline-secondary">24期</button>
                </div>
                <div class="form-group">
                    <label for="number">购买数量</label>
                    <input type="number" value="1" class="form-control" id="number" name="number" placeholder="数量" style="width: 90px;">
                </div>
                <div>
                    <button type="submit" class="btn btn-danger btn-lg btn-block">+加入购物车</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
