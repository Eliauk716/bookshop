<%@page import="service.impl.UserServiceImpl"%>
<%@page import="entity.IndexUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新书专区</title>
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
            <li class="nav_active"><a href="newBook.jsp" class="white active">新书专区</a></li>
            <li><a href="discBook.jsp" class="white">特价专区</a></li>
            <li><a href="recBook.jsp" class="white">推荐书单</a></li>
        </ul>
    </div>
</div>

    <!-- 书籍 -->
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
                </ul>
            </div>
            <div class="listRight">
                <ul class="list">
                    <script type="text/javascript">
                        var images = ["01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg", "06.jpg", "07.jpg", "08.jpg",
                            "09.jpg", "10.jpg"
                        ];
                        var names = ["春山", "刚多林的陷落", "人生事务删除所", "想成为神的巴士司机", "推理要在本格前", "我会在六月六十日回来", "她们",
                            "人写的历史必须是人的历史吗？", "酒神的玫瑰", "意大利的冬天"
                        ];
                        var authors = ["何大草", "[英]J.R.R.托尔金/[英]克里斯托弗·托尔金", "[日]本多孝好", "[以]埃特加·凯雷特", "果麦",
                            "[法]马塞尔·埃梅", "阎连科", "王晴佳", "方悄悄", "[法]儒勒·米什莱"
                        ];
                        var prices = ["39.80", "79.00", "45.00", "45.00", "48.00", "198.00", "39.80", "69.00", "42.00",
                            "39.00"
                        ];
                        for (var i = 0; i < images.length; i++) {
                            var info = "<li><div class='imgList'><a href='details.html?img=new/" +
                                images[i] + "&tit=" + names[i] + "&aut=" + authors[i] + "&pri=" + prices[i] +
                                "'><img src='image/new/" + images[i] +
                                "'></a></div><div class='info'><div class='name'><a href='details.html?img=new/" +
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