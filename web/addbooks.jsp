<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/6/26
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加商品</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/goodslist.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/addbooks.css">
    <link rel="icon" href="image/icon.png" type="image/x-icon">
</head>

<body>
<div class="head">
    <span>位置：</span>
    <ul>
        <li><a href="Index.html">首页 ></a></li>
        <li><a href="backStage.html">后台管理 ></a></li>
        <li><a href="addbooks.html">添加商品</a></li>
    </ul>
</div>
<div class="info">
    <div class="form">
        <div class="form_content">
            <div class="table_content">
                <form action="/edit?method=add" method="post">
                <table>
                    <tr>
                        <td><label>书籍封面<b>*</b> </label></td>
                        <td><input name="img" type="file" multiple class="cover" /></td>
                    </tr>
                    <tr>
                        <td><label>书籍名称<b>*</b> </label></td>
                        <td><input name="bookname" type="text" class="dfinput" /></td>
                    </tr>
                    <tr>
                        <td><label>书籍作者<b>*</b> </label></td>
                        <td><input name="author" type="text" class="dfinput" /></td>
                    </tr>
                    <tr>
                        <td><label>书籍类别<b>*</b> </label></td>
                        <td><select name="booktype">
                            <option>文学</option>
                            <option>教育</option>
                            <option>经管</option>
                            <option>励志</option>
                            <option>生活</option>
                            <option>社科</option>
                            <option>科技</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td><label>书籍价格<b>*</b> </label></td>
                        <td><input name="Price" type="text" class="dfinput" />元</td>
                    </tr>
                    <tr>
                        <td><label>书籍数量<b>*</b> </label></td>
                        <td><input name="amount" type="text" class="dfinput" />本</td>
                    </tr>
                    <tr>
                        <td><label>是否审核<b>*</b> </label></td>
                        <td><select name="check">
                            <option>已审核</option>
                            <option>未审核</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td><label>书籍简介<b>*</b> </label></td>
                        <td><textarea name="content" rows="3" disabled></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button type="submit" class="btn btn-outline-secondary">马上发布</button></td>
                    </tr>
                </table>
                </form>
            </div>
            <div class="card" style="display: inline-block;">
                <img style="width: 260px;height: 340px;" src="image/11.png" class="card-img-top" alt="请选择书籍封面">
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var cover = document.getElementsByClassName('cover')[0];
    cover.onchange = function () {
        var img = document.getElementsByClassName('card-img-top')[0];
        var url = null;
        var fileObj = this.files[0];
        if (window.createObjcectURL != undefined) {
            url = window.createOjcectURL(fileObj);
        } else if (window.URL != undefined) {
            url = window.URL.createObjectURL(fileObj);
        } else if (window.webkitURL != undefined) {
            url = window.webkitURL.createObjectURL(fileObj);
        }
        img.src = url;
    }
</script>
</html>
