<%@ page import="entity.Book" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="utils.JDBCTools" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="entity.Shopcar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/7/1
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物车</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/hnf.css" rel="stylesheet" type="text/css" />
    <link href="css/shopCar.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="image/icon.png" type="image/x-icon">
    <style>
        #count{
            width: 30px;
        }
    </style>
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
            <li><a href="shopCar.html">购物车</a></li>
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
            <a href="Index.html"><img src="image/logo2.png" style="padding-left:120px;"></a>
            <img src="image/shop.png" style="height: 70px;padding-top: 10px;">
        </div>
    </div>
</div>

<div class="shop">
    <div class="addr">
        <span>配送至：</span>
        <table>
            <tr>
                <td><select id="province">
                    <option>-请选择省份-</option>
                </select>
                    <select id="city">
                        <option>-请选择城市-</option>
                    </select>
                    <select id="area">
                        <option>-请选择区-</option>
                    </select></td>
                <td><a href="novel.jsp">&nbsp;&nbsp;&nbsp;返回</a></td>
            </tr>
        </table>
        <script src="js/addr.js"></script>
    </div>
    <table class="tablelist">
        <thead>
        <tr>
            <th>
                <input name="checkAll" type="checkbox" id="checkAll" onchange="selectAll()" />全选/
                <input name="checkOther" type="checkbox" id="checkOther" onchange="selectOther()" />反选
            </th>
            <th></th>
            <th>名称</th>
            <th>单价</th>
            <th>数量</th>
            <th>金额</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody class="goods">
        <%
            Double total = 0.0;
            Connection connection = JDBCTools.getConnection();
            String sql = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
            sql = "select * from shopcar";
            List<Shopcar> list = new ArrayList<>();
            try {
                preparedStatement = connection.prepareStatement(sql);
                resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    Shopcar shopcar = new Shopcar(resultSet.getString(1), resultSet.getString(2), resultSet.getDouble(3), resultSet.getInt(4));
                    list.add(shopcar);
                }
                request.setAttribute("list", list);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
        <c:forEach items="${list}" var="book">
            <c:set var="book" scope="request" value="${book}"></c:set>
        <tr>
            <td><input class="checkItem" type="checkbox" value="" onchange="total()" /></td>
            <td class="row_img"><img src="image/${book.img}"></td>
            <td class="row_name">${book.bookname}</td>
            <td class="row_price">${book.price}</td>
            <td class="amount">
                <input type="text" value="1" name="count" id="count">
            </td>
            <td class="row_pay">${book.price}</td>
            <td><a href="/addShopCar?mth=delete&name=${book.bookname}">删除</a></td>
        </tr>
            <%
                Shopcar shopcar = (Shopcar) request.getAttribute("book");
                Double pay = shopcar.getPrice();
                total = total + pay;
            %>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="4">&nbsp</td>
            <td>总计</td>
            <td id="total"><%=total%></td>
            <td id="settle">结算</td>
        </tfoot>
    </table>
</div>
</body>
<script>
    function selectAll() {
        var items = document.getElementsByClassName("checkItem");
        var checkAll = document.getElementById("checkAll");
        var checkOther = document.getElementById("checkOther");
        checkOther.checked = false;
        for (var i = 0; i < items.length; i++) {
            items[i].checked = checkAll.checked;
        }
        total();
    }

    function selectOther() {
        var items = document.getElementsByClassName("checkItem");
        var checkAll = document.getElementById("checkAll");
        var checkOther = document.getElementById("checkOther");
        checkAll.checked = false;
        for (var i = 0; i < items.length; i++) {
            items[i].checked = !items[i].checked;
        }
        total();
    }
</script>
</html>
