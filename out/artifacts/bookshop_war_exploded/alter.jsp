<%@ page import="entity.BookRecord" %><%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/6/26
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改信息</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/goodslist.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/addbooks.css">
    <link rel="icon" href="image/icon.png" type="image/x-icon">
    <style>
        select.select{
            color: black;
        }
        option{
            color: gray;
        }
    </style>
</head>

<body>
<div class="head">
    <span>位置：</span>
    <ul>
        <li><a href="#">首页 ></a></li>
        <li><a href="#">后台管理 ></a></li>
        <li><a href="#">修改信息</a></li>
    </ul>
</div>
<div class="info">
    <div class="form">
        <div class="form_content">
            <div class="table_content">
                <form action="/alter" method="post">
                    <table>
                        <tr>
                            <td><label>您要修改的书是<b>*</b> </label></td>
                            <td><input name="bookname" type="text" class="dfinput" value="${bookRecord.bookname}" readonly/></td>
                        </tr>
                        <tr>
                            <td><label>书籍作者<b>*</b> </label></td>
                            <td><input name="author" type="text" class="dfinput" value="${bookRecord.author}"/></td>
                        </tr>
                        <tr>
                            <td><label>书籍数量<b>*</b> </label></td>
                            <td><input name="amount" type="text" class="dfinput" value="${bookRecord.quantity}"/>本</td>
                        </tr>
                        <tr>
                            <td><label>书籍价格<b>*</b> </label></td>
                            <td><input name="Price" type="text" class="dfinput" value="${bookRecord.price}"/>元</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><button type="submit" class="btn btn-outline-secondary">立刻修改</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
