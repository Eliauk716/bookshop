<%@page import="service.impl.UserServiceImpl"%>
<%@page import="entity.IndexUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>遇见书店—首页</title>

  <link rel="stylesheet" href="css/reset.css">
  <link rel="icon" href="image/icon.png" type="image/x-icon">
  <link rel="stylesheet" href="css/Index.css" type="text/css">
  <link rel="stylesheet" href="css/hnf.css" type="text/css">
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
        <li class="nav_active"><a href="index.jsp"class="white">首页</a></li>
        <li><a href="hotSell.jsp"class="white">热销</a></li>
        <li><a href="newBook.jsp" class="white">新书专区</a></li>
        <li><a href="discBook.jsp" class="white">特价专区</a></li>
        <li><a href="recBook.jsp" class="white">推荐书单</a></li>
    </ul>
  </div>
</div>

<!-- 分类 轮播图 右侧栏 -->
<div id="index_box">
  <div class="index">
    <!-- 图书分类目录 -->
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
    <!-- 轮播图,侧边栏 -->
    <div class="index_center">
      <!-- 轮播图 -->
      <div class="banner">
        <ul class="imgList">
          <li class="item active">
            <a href="#">
              <img src="image/banner1.jpg">
            </a>
          </li>
          <li class="item">
            <a href="#">
              <img src="image/banner2.jpg">
            </a>
          </li>
          <li class="item">
            <a href="#">
              <img src="image/banner3.jpg">
            </a>
          </li>
          <li class="item">
            <a href="#">
              <img src="image/banner4.jpg">
            </a>
          </li>
          <li class="item">
            <a href="#">
              <img src="image/banner5.jpg">
            </a>
          </li>
        </ul>
        <ul class="pointList">
          <li class="point active" index="0"></li>
          <li class="point" index="1"></li>
          <li class="point" index="2"></li>
          <li class="point" index="3"></li>
          <li class="point" index="4"></li>
        </ul>
        <button type="button" class="btn" id="goPre">
          <img src="image/l_arr.png">
        </button>
        <button type="button" class="btn" id="goNext">
          <img src="image/r_arr.png">
        </button>
      </div>
      <script src="js/banner.js">

      </script>
      <!-- 右侧导航栏 -->
      <div class="news">
        <h2 class="new_title">黑板报</h2>
        <ul class="new_list">
          <li>
            <a href="#">通知</a>
          </li>
          <li>
            <a href="#">邀请有礼</a>
          </li>
          <li>
            <a href="#">购买指南</a>
          </li>
          <li>
            <a href="#">支付宝担保交易</a>
          </li>
          <li>
            <a href="#">文学小说满100减50</a>
          </li>
          <li>
            <a href="#">中小学教辅满79减30</a>
          </li>
        </ul>
      </div>
      <!-- 好书推荐 -->
      <div class="book_rec">
        <p class="book_rec_title">
          <span>好书推荐</span>
        </p>
        <ul class="book_product">
          <script type="text/javascript">
            var images = [ "bookrec01.jpg", "bookrec02.jpg",
              "bookrec03.jpg", "bookrec04.jpg",
              "bookrec05.jpg", "bookrec06.jpg",
              "bookrec07.jpg", "bookrec08.jpg",
              "bookrec09.jpg", "bookrec10.jpg" ];
            var names = [ "偷影子的人", "新名字的故事", "摆渡人全系列", "老去的勇气",
              "霍乱时期的爱情", "告白", "我不喜欢人类我想住进森林",
              "巨人的陨落（全三册）", "我不喜欢这世界，我只喜欢你", "82年生的金智英" ];
            var authors = [ "[法]马克·李维", "[意]埃莱娜·费兰特",
              "[英]克莱儿·麦克福尔", "[日]岸见一郎", "[哥伦比亚]加西亚·马尔克斯",
              "[日]凑佳苗", "[挪威]阿澜·卢", "[英]肯·福莱特", "乔一",
              "[韩]赵南柱" ];
            var prices = [ "88.50", "42.00", "196.80", "25.99",
              "35.70", "28.40", "36.89", "129.80",
              "29.80", "45.00" ];
            for (var i = 0; i < images.length; i++) {
              var info = "<li class='book_slide'><div class='book_list_img'><a href='details.html?img="
                      + images[i]
                      + "&tit="
                      + names[i]
                      + "&aut="
                      + authors[i]
                      + "&pri="
                      + prices[i]
                      + "'><img src='image/" +
                      images[i] +
                      "'/></a></div><div class='book_name'><a href='#'>"
                      + names[i]
                      + "</a></div><div class='book_author'><a href='#'>"
                      + authors[i]
                      + "</a></div><div class='book_price'>￥"
                      + prices[i] + "</div></li>";
              document.write(info);
            }
          </script>
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
            <li>
              <a href="#" target="_blank">7天无理由退货</a>
            </li>
            <li>
              <a href="#" target="_blank">24小时之内发货</a>
            </li>
            <li>
              <a href="#" target="_blank">服务中心</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="unit">
        <div class="unit_wrap">
          <h4>新手上路</h4>
          <ul>
            <li>
              <a href="#" target="_blank">如何买书</a>
            </li>
            <li>
              <a href="#" target="_blank">如何支付</a>
            </li>
            <li>
              <a href="#" target="_blank">如何退款</a>
            </li>
            <li>
              <a href="#" target="_blank">配送说明</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="unit">
        <div class="unit_wrap">
          <h4>支付方式</h4>
          <ul>
            <li>
              <a href="#" target="_blank">货到付款</a>
            </li>
            <li>
              <a href="#" target="_blank">在线支付</a>
            </li>
            <li>
              <a href="#" target="_blank">分期付款</a>
            </li>
            <li>
              <a href="#" target="_blank">积分支付</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="unit">
        <div class="unit_wrap">
          <h4>个人账户</h4>
          <ul>
            <li>
              <a href="#" target="_blank">如何注册</a>
            </li>
            <li>
              <a href="#" target="_blank">普通会员与VIP</a>
            </li>
            <li>
              <a href="#" target="_blank">会员升级VIP</a>
            </li>
            <li>
              <a href="#" target="_blank">第三方登录</a>
            </li>
            <li>
              <a href="#" target="_blank">更多介绍</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="footer">
      <span>Copyright (C) 遇见书店 2004-2020, All Rights Reserved</span></br> <span>© 遇见书店
					ICP备2548154894号</span></br> <span>中华人民共和国出版物经营许可证 | 营业执照</span>
    </div>
  </div>
</div>
</body>
</html>