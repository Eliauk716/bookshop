<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/6/25
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台管理—商品列表</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/goodslist.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="image/icon.png" type="image/x-icon">
    <link href="css/layout.css" rel="stylesheet" type="text/css" />
    <link href="css/list.css" rel="stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <style>
        #li{
            margin-right: 15px;
        }
        .head{
            background:#e6f7ff;
        }
        .seachform{
            margin-left: 15px;
            width: 400px;
        }
        .scbtn{
            background: #2F90B9;
    </style>
</head>

<body>
<div class="head">
    <span>位置：</span>
    <ul>
        <li><a href="index.jsp">首页 ></a></li>
        <li><a href="#">后台管理 ></a></li>
        <li><a href="#">商品列表</a></li>
    </ul>
</div>
<div class="info">
    <div class="tool">
        <ul class="toolbar">
            <li id="li"><span><img src="images/t01.png" /></span><a href="addbooks.jsp">添加</a></li>
        </ul>
        <div width="800" height="42">
            <form action="/search" method="get">
                <ul class="seachform">
                    <li>
                        <input type="text" class="scinput" value="请输入图书名称" name="s_name"/>
                    </li>
                    <li>
                        <input name="searchBtn" type="submit" class="scbtn" value="查询"/>
                    </li>
                </ul>
            </form>
        </div>
    </div>
    <table class="tablelist">
        <thead>
        <tr>
            <th>
                <input name="checkAll" type="checkbox" id="checkAll" onchange="selectAll()" />全选/
                <input name="checkOther" type="checkbox" id="checkOther" onchange="selectOther()" />反选
            </th>
            <th>缩略图</th>
            <th>书籍名称</th>
            <th>书籍作者</th>
            <th>书籍类别</th>
            <th>数量(本）</th>
            <th>单价（元）</th>
            <th>是否审核</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="book">
            <script>
                $(function(){
                    $("tr:odd").css("background-color", "#f5f8fa");
                });
            </script>
            <tr>
                <td><input name="checkItem" type="checkbox" value="" /></td>
                <td><img src="image/${book.img}" /></td>
                <td>${book.b_name}</td>
                <td>${book.author}</td>
                <td>${book.type}</td>
                <td>${book.quantity}</td>
                <td>${book.b_price}</td>
                <td>已审核</td>
                <td><a href="/alter?img=${book.img}&bookname=${book.b_name}&author=${book.author}&type=${book.type}&amount=${book.quantity}&Price=${book.b_price}" class="tablelink">修改</a>
                    <a href="/edit?method=delete&bookname=${book.b_name}" class="tablelink" onclick="del(this)"> 删除</a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <div class="pagin">
        <div class="message">共<i class="blue">${count}</i>条记录，当前显示第&nbsp;<i class="blue">${page}&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="#"><span class="pagepre"></span></a></li>
            <li class="paginItem"><a href="/book?page=1">1</a></li>
            <li class="paginItem"><a href="/book?page=2">2</a></li>
            <li class="paginItem"><a href="/book?page=3">3</a></li>
            <li class="paginItem"><a href="/book?page=4">4</a></li>
            <li class="paginItem"><a href="/book?page=5">5</a></li>
            <li class="paginItem"><a href="/book?page=6">6</a></li>
            <li class="paginItem"><a href="/book?page=7">7</a></li>
            <li class="paginItem"><a href="/book?page=8">8</a></li>
            <li class="paginItem"><a href="/book?page=9">9</a></li>
            <li class="paginItem"><a href="#"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
</div>
</body>
<script>
    //全选或全不选
    function selectAll() {
        var items = document.getElementsByName("checkItem");
        var checkAll = document.getElementById("checkAll");
        var checkOther = document.getElementById("checkOther");
        checkOther.checked = false;
        for (var i = 0; i < items.length; i++) {
            items[i].checked = checkAll.checked;
        }
    } //反选
    function selectOther() {
        var items = document.getElementsByName("checkItem");
        var checkAll = document.getElementById("checkAll");
        var checkOther = document.getElementById("checkOther");
        checkAll.checked = false;
        for (var i = 0; i < items.length; i++) {
            items[i].checked = !items[i].checked;
        }
    }

    function del(i) {
        var tr = i.parentNode.parentNode;
        tr.parentNode.removeChild(tr);
    }
</script>
</html>
