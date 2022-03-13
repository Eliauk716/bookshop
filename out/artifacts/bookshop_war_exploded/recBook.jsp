<%@page import="service.impl.UserServiceImpl"%>
<%@page import="entity.IndexUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>推荐书单</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="icon" href="image/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="css/hotSell.css" type="text/css">
    <link rel="stylesheet" href="css/hnf.css" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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
        $("#login").html('<%=name%>');
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
                <a href="sc.jsp">收藏</a>
            </li>
            </li>

            <li class="line">
            <li>
                <a href="shopCar.jsp">购物车</a>
            </li>
            </li>

            <li class="line">
            <li>
                <a href="order.jsp">我的订单</a>
            </li>
            </li>

            <li class="line">
            <li>
                <a href="personal.jsp">个人中心</a>
            </li>
            </li>

            <li class="line" id="ad">
            <li id="admin">
                <a href="/book?page=1">图书管理</a>
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
            <li><a href="index.jsp"class="white">首页</a></li>
            <li><a href="hotSell.jsp"class="white">热销</a></li>
            <li><a href="newBook.jsp" class="white">新书专区</a></li>
            <li><a href="discBook.jsp" class="white">特价专区</a></li>
            <li class="nav_active"><a href="recBook.jsp" class="white active">推荐书单</a></li>
        </ul>
    </div>
</div>

    <!-- 图书 -->
    <div id="index_box">
        <div class="index">
            <div class="book_menu">
                <ul class="list_group">
                    <li class="list_item"><a href="novel.jsp">文学</a></li>
                    <li class="list_item"><a href="edu.jsp">教育</a></li>
                    <li class="list_item"><a href="eco_man.jsp">经管</a></li>
                    <li class="list_item"><a href="encour.jsp">励志</a></li>
                    <li class="list_item"><a href="live.jsp">生活</a></li>
                    <li class="list_item"><a href="social.jsp">社科</a></li>
                    <li class="list_item"><a href="sci.jsp">科技</a></li>
            </div>
            <div class="listRight">
                <ul class="list">
                    <script type="text/javascript">
                        var images = ["01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg", "06.jpg", "07.jpg", "08.jpg",
                            "09.jpg", "10.jpg"
                        ];
                        var names = ["红楼梦", "1984", "三体全集", "小王子", "围城", "明朝那些事儿(1-9)", "杀死一只知更鸟", "月亮和六便士", "嫌疑人X的献身",
                            "我与地坛"
                        ];
                        var authors = ["曹雪芹", "[英]乔治·奥威尔", "刘慈欣", "[法]圣埃克苏佩里", "钱钟书", "当年明月", "[美]哈珀·李",
                            "[英]毛姆", "[日]东野圭吾", "史铁生"
                        ];
                        var prices = ["59.70", "28.00", "168.00", "22.00", "19.00", "358.00", "32.00", "15.00", "28.00",
                            "25.00"
                        ];
                        var nums = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10"];
                        for (var i = 0; i < images.length; i++) {
                            var info = "<li><div class='imgList'><a href='details.html?img=rec/" +
                                images[i] + "&tit=" + names[i] + "&aut=" + authors[i] + "&pri=" + prices[i] +
                                "'><img src='image/rec/" + images[i] +
                                "'></a></div><div class='info'><div class='name'><a href='details.html?img=rec/" +
                                images[i] + "&tit=" + names[i] + "&aut=" + authors[i] + "&pri=" + prices[i] +
                                "' title=" + names[i] + ">" + names[i] +
                                "</a></div><div class='author' title=" + authors[i] + ">" + authors[i] +
                                "</a></div><div class='price'>￥" + prices[i] +
                                "</div><div class='opButton'><a href='#' class='buy'>+加入购物车</a><a href='#' class='collect'>收藏</a></div></div></li>";
                            document.write(info);
                        }
                    </script>
                </ul>
                <div class="page">
                    <div class="paging">
                        <nav aria-label="...">
                            <ul class="pagination">
                                <li class="page-item active" aria-current="page">
                                    <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">...</a></li>
                                <li class="page-item"><a class="page-link" href="#">10</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">下一页</a>
                                </li>
                            </ul>
                        </nav>
                        <!-- <ul>
                            <li class="prev"><a href="#"><</a></li>
                            <li class="cur"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><span>...</span></li>
                            <li><a href="#">10</a></li>
                            <li class="next"><a href="#">></a></li> -->
                        <!-- <li class="page_input">
                                <span>到第</span>
                                <input class="number" type="text" value="1">
                                <span>页</span>
                                <span class="btn">确定</span>
                            </li> -->
                        <!-- </ul> -->
                        <!-- <div class="skip">
                            <em>共10页；到第</em>
                            <input class="inputtxt" type="text" value="1"><em>页</em>
                            <a href="#" class="btn">确定</a>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 底部信息等 -->
    <div class="screen_ft">
        <div class="wrap">
            <div class="yl_help">
                <div class="unit">
                    <div class="unit_wrap">
                        <h4>消费者保障</h4>
                        <ul>
                            <li><a href="#" target="_blank">7天无理由退货</a></li>
                            <li><a href="#" target="_blank">24小时之内发货</a></li>
                            <li><a href="#" target="_blank">服务中心</a></li>
                        </ul>
                    </div>
                </div>
                <div class="unit">
                    <div class="unit_wrap">
                        <h4>新手上路</h4>
                        <ul>
                            <li><a href="#" target="_blank">如何买书</a></li>
                            <li><a href="#" target="_blank">如何支付</a></li>
                            <li><a href="#" target="_blank">如何退款</a></li>
                            <li><a href="#" target="_blank">配送说明</a></li>
                        </ul>
                    </div>
                </div>
                <div class="unit">
                    <div class="unit_wrap">
                        <h4>支付方式</h4>
                        <ul>
                            <li><a href="#" target="_blank">货到付款</a></li>
                            <li><a href="#" target="_blank">在线支付</a></li>
                            <li><a href="#" target="_blank">分期付款</a></li>
                            <li><a href="#" target="_blank">积分支付</a></li>
                        </ul>
                    </div>
                </div>
                <div class="unit">
                    <div class="unit_wrap">
                        <h4>个人账户</h4>
                        <ul>
                            <li><a href="#" target="_blank">如何注册</a></li>
                            <li><a href="#" target="_blank">普通会员与VIP</a></li>
                            <li><a href="#" target="_blank">会员升级VIP</a></li>
                            <li><a href="#" target="_blank">第三方登录</a></li>
                            <li><a href="#" target="_blank">更多介绍</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer">
                <span>Copyright (C) 遇见书店 2004-2020, All Rights Reserved</span></br>
                <span>© 遇见书店 ICP备2548154894号</span></br>
                <span>中华人民共和国出版物经营许可证 | 营业执照</span>
            </div>
        </div>
    </div>
</body>

</html>