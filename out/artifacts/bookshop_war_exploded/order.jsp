<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/7/1
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单页面</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/hnf.css" rel="stylesheet" type="text/css" />
    <link href="css/dingdan.css" rel="stylesheet" type="text/css" />
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
            <li><a href="shopCar.html">购物车</a></li>
            </li>

            <li class="line">
            <li><a href="dingdanlogin.html">我的订单</a></li>
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
            <img src="image/tp1.jpg" style="height: 70px;padding-top: 10px;">
        </div>
    </div>
</div>


<div style="background:url(image/tiaozi.jpg); line-height:29px;">
    <span>您的位置：</span> <span><a href="Index.html">首页</a></span>》<span><a href="dingdan.html">我的订单</a></span>
</div>


<div>
    <table class="tablelist">
        <thead>
        <tr>

            <th></th>
            <th>订单号</th>
            <th>单价</th>
            <th>数量</th>
            <th>金额</th>

        </tr>
        </thead>

        <tbody class="goods">
        <tr>

            <td class="row_img"><img src="image/01.jpg"></td>
            <td class="row_name">坡道上的家</td>
            <td class="row_price">48.00</td>
            <td class="row_price">1</td>
            <td class="row_price">48.00</td>


        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="2">&nbsp;</td>
            <td>总计</td>
            <td id="total"></td>
            <td ></td>
        </tfoot>
    </table>


</div>


</div>

</div>
</body>
<script>
    function changeAmount(text) {
        var inputs = text.parentNode.getElementsByTagName("input");
        var amount = parseInt(inputs[1].value);
        if (amount <= 1) {
            return;
        }
        var tr = text.parentNode.parentNode;
        tds = tr.getElementsByTagName("td");
        var price = parseFloat(tds[3].innerHTML);
        var m = price * amount;
        tds[5].innerHTML = m;
        total();
    }

    function change(btn, n) {
        var inputs = btn.parentNode.getElementsByTagName("input");
        var amount = parseInt(inputs[1].value);
        if (amount <= 1 && n < 0) {
            return;
        }
        inputs[1].value = amount + n;
        amount = inputs[1].value;
        var tr = btn.parentNode.parentNode;
        tds = tr.getElementsByTagName("td");
        var price = parseFloat(tds[3].innerHTML);
        var m = price * amount;
        tds[5].innerHTML = m;
        total();
    }

    function del(i) {
        var result = confirm("确定删除吗？");
        if (result) {
            var tr = i.parentNode.parentNode;
            tr.parentNode.removeChild(tr);
        }
    }

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

    function total() {
        var tbody = document.getElementsByClassName("goods")[0];
        var trs = tbody.getElementsByTagName("tr");
        var items = document.getElementsByClassName("checkItem");
        var total = document.getElementById('total');
        var sum = 0;
        for (var i = 0; i < items.length; i++) {
            if (items[i].checked) {
                var tds = trs[i].getElementsByTagName("td");
                var m = tds[5].innerHTML;
                sum += parseFloat(m);
            }
            total.innerHTML = sum;
        }
    }
</script>

</html>