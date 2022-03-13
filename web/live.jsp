<%@ page import="entity.IndexBook" %>
<%@ page import="service.IBookService" %>
<%@ page import="java.util.List" %>
<%@ page import="service.impl.IndexBookServiceImpl" %>
<%@ page import="entity.IndexUser" %>
<%@ page import="service.impl.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/1
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>生活</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/novel.css">
    <link rel="stylesheet" href="css/hnf.css">
    <link rel="icon" href="image/icon.png" type="image/x-icon">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body>
<!-- 顶部栏  -->
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
            <img src="image/logo2.png">
            <img src="image/logo3.png">
        </div>
        <!-- 搜索框 -->
        <div class="search_key">
            <form action="">
                <input class="search_put" type="text" placeholder="输入搜索内容">
                <select class="select" name="select">
                    <option id="b_name">书名
                    <option id="author">作者
                </select>
                <input class="btn" type="button" value="搜索">
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
            <li><a href="recBook.jsp" class="white">推荐书单</a></li>
        </ul>
    </div>
</div>

<!-- 图书 -->
<div id="index_box">
    <div class="index">
        <!-- 图书分类 -->
        <div class="book_menu">
            <ul class="list_group">
                <li class="list_item"><a href="novel.jsp">文学</a></li>
                <li class="list_item"><a href="edu.jsp">教育</a></li>
                <li class="list_item"><a href="eco_man.jsp">经管</a></li>
                <li class="list_item"><a href="encour.jsp">励志</a></li>
                <li class="list_item active"><a href="live.jsp">生活</a></li>
                <li class="list_item"><a href="social.jsp">社科</a></li>
                <li class="list_item"><a href="sci.jsp">科技</a></li>
            </ul>
        </div>
        <!-- 小说模块 -->
        <%
            IBookService book = new IndexBookServiceImpl();
            List<IndexBook> books = book.SearchByType("生活");
        %>
        <div class="novelList">
            <ul class="list">
                <%
                    for (int i = 0; i < books.size(); i++) {
                        IndexBook b = books.get(i);
                %>
                <li>
                    <div class="imgList">
                        <a href="details.jsp?img=<%=b.getPath()%>&name=<%=b.getBname()%>&author=<%=b.getAuthor()%>&price=<%=b.getPrice()%>">
                            <img src="image/<%=b.getPath()%>">
                        </a>
                    </div>
                    <div class="info">
                        <div class="name">
                            <a href="details.jsp"><%=b.getBname()%></a>
                        </div>
                        <div class="author"><%=b.getAuthor()%></div>
                        <div class="price">￥<%=b.getPrice()%></div>
                        <div class="opButton">
                            <a href="#" class="buy">加入购物车</a>
                            <a href="add.jsp?name=<%=b.getB_id()%>" class="collect">收藏</a>
                        </div>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
            <div class="page">
                <div class="paging">
                    <nav aria-label="...">
                        <ul class="pagination">
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
                            <li />
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">...</a></li>
                            <li class="page-item"><a class="page-link" href="#">10</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">下一页</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 底部信息等 -->
<div class="screen_ft">
    <div class="wrap">
        <!-- 帮助 -->
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
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>励志</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/novel.css">
    <link rel="stylesheet" href="css/hnf.css">
    <link rel="icon" href="image/icon.png" type="image/x-icon">
</head>

<body>
<!-- 顶部栏  -->
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

<!-- 搜索框及logo -->
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

<!-- 导航栏部分 -->
<div id="nav_box">
    <div class="nav_content">
        <div class="bookclass">图书分类</div>
        <ul class="nav">
            <li><a href="Index.html" target="_blank" class="white">首页</a></li>
            <li><a href="hotSell.jsp" target="_blank" class="white">热销</a></li>
            <li><a href="#" class="white">新书专区</a></li>
            <li><a href="#" class="white">特价专区</a></li>
            <li><a href="#" class="white">推荐书单</a></li>
            <!-- <li><a href="#" class="white">豆瓣高分</a></li> -->
        </ul>
    </div>
</div>

<!-- 图书 -->
<div id="index_box">
    <div class="index">
        <!-- 图书分类 -->
        <div class="book_menu">
            <ul class="list_group">
                <li class="list_item"><a href="novel.html">文学</a></li>
                <li class="list_item"><a href="edu.html">教育</a></li>
                <li class="list_item"><a href="eco_man.html">经管</a></li>
                <li class="list_item active"><a href="encour.html">励志</a></li>
                <li class="list_item"><a href="#">生活</a></li>
                <li class="list_item"><a href="#">社科</a></li>
                <li class="list_item"><a href="#">科技</a></li>
            </ul>
        </div>
        <!-- 书籍模块 -->
        <div class="novelList">
            <ul class="list">
                <script type="text/javascript">
                    var images = ["01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg", "06.jpg", "07.jpg", "08.jpg",
                        "09.jpg", "10.jpg"
                    ];
                    var names = ["贫穷的本质", "小狗钱钱", "国富论", "半小时漫画经济学", "牛奶可乐经济学", "卓有成效的管理者", "奈飞文化手册", "从0到1", "自控力",
                        "原则"
                    ];
                    var authors = ["阿比吉特•班纳吉、埃斯特•迪弗洛", "[德]博多·舍费尔", "[英]亚当·斯密", "陈磊", "[美] 罗伯特·弗兰克", "[美] 彼得·德鲁克",
                        "[美] 帕蒂·麦考德", "彼得·蒂尔、布莱克·马斯特斯", "[美] 凯利·麦格尼格尔", "[美] 瑞·达利欧"
                    ];
                    var prices = ["58.00", "20.30", "69.00", "49.80", "39.80", "48.00", "69.00", "45.00", "39.80",
                        "98.00"
                    ];
                    for (var i = 0; i < images.length; i++) {
                        var info = "<li><div class='imgList'><a href='details.html?img=encour/" +
                            images[i] + "&tit=" + names[i] + "&aut=" + authors[i] + "&pri=" + prices[i] +
                            "'><img src='image/encour/" + images[i] +
                            "'></a></div><div class='info'><div class='name'><a href='details.html?img=encour/" +
                            images[i] + "&tit=" + names[i] + "&aut=" + authors[i] + "&pri=" + prices[i] +
                            "'>" + names[i] +
                            "</a></div><div class='author'>" + authors[i] +
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
                            <li />
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">...</a></li>
                            <li class="page-item"><a class="page-link" href="#">10</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">下一页</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 底部信息等 -->
<div class="screen_ft">
    <div class="wrap">
        <!-- 帮助 -->
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