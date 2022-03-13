<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="service.impl.UserServiceImpl"%>
<%@page import="entity.IndexUser"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
     <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的收藏</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/mysc.css">
    <link rel="icon" href="image/icon.png" type="image/x-icon">
    <link rel="stylesheet" href="css/Index.css" type="text/css">
    <link rel="stylesheet" href="css/hnf.css" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<style type="text/css">
			/*表格样式*/			
			table {
				width: 90%;
				background: #ccc;
				margin: 10px auto;
				border-collapse: collapse;/*border-collapse:collapse合并内外边距(去除表格单元格默认的2个像素内外边距*/	
			}				
			th,td {
				height: 25px;
				line-height: 25px;
				text-align: center;
				border: 1px solid #ccc;
			}		
			th {
				background: #eee;
				font-weight: normal;
			}		
			tr {
				background: #fff;
			}		
			tr:hover {
				background: #cc0;
			}		
			td a {
				color: #06f;
				text-decoration: none;
			}		
			td a:hover {
				color: #06f;
				text-decoration: underline;
			}
		</style>
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

	<%!
	public static final String DBDRIVER = "com.mysql.cj.jdbc.Driver" ;
	public static final String DBURL = "jdbc:mysql://localhost:3306/bookshop?serverTimezone = UTC" ;
	public static final String DBUSER = "root" ;
	public static final String DBPASS = "123456" ;
	%>
<%
    Connection conn = null ;
    PreparedStatement pstmt = null ;
    ResultSet rs = null ;
    int rst = 0;
    String id = new String(request.getParameter("id").getBytes("ISO-8859-1"),"GBK");
%>

<%
    try{
        Class.forName(DBDRIVER);
        conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
        String sql_delete="delete from sc where user = '777' and b_id=" + id;
        //获取要删除的此id的数据库信息
        pstmt=conn.prepareStatement(sql_delete);
        rst=pstmt.executeUpdate();
%>

<%
    }
    catch(Exception e){
        out.println(e);
    }

%>

<%
    try{
        Class.forName(DBDRIVER) ;
        conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS) ;
        String sql = "SELECT b_id,b_name,author,b_price,type FROM sc where user = '777'";
        pstmt = conn.prepareStatement(sql) ;
        rs = pstmt.executeQuery() ;
%>

<!-- 顶部栏  -->
<div id="top_box">
    <div class="top">
        <div class="topleft">一点时间一本书，遇见知识</div>
        <ul class="topright">
            <li><a href="login.jsp">登录/注册</a></li>

            <li class="line">
            <li><a href="#">消息</a></li>
            </li>

            <li class="line">
            <li><a href="shopCar.jsp">购物车</a></li>
            </li>

            <li class="line">
            <li><a href="#">我的订单</a></li>
            </li>

            <li class="line">
            <li><a href="personal.jsp">个人中心</a></li>
            </li>

            <li class="line">
            <li><a href="goodslist.jsp">图书管理</a></li>
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

<div id="nav_box" >
    <div class="nav_content">
        <div class="bookclass" >我的收藏</div>
    </div>
</div>

<!-- 订单信息 -->
<div id="index_box">
    <table>
        <tr>
            <th>编号</th>
            <th>书名</th>
            <th>作者</th>
            <th>价格</th>
            <th>类型</th>
            <th>删除</th>
            <th>购买</th>
        </tr>
        <%
            while(rs.next()){
                int b_id = rs.getInt(1) ;
                String b_name = rs.getString(2) ;
                String author = rs.getString(3) ;
                float b_price = rs.getFloat(4) ;
                String btype = rs.getString(5) ;
        %>
        <tr>
            <td><%=b_id%></td>
            <td><%=b_name%></td>
            <td><%=author%></td>
            <td><%=b_price%></td>
            <td><%=btype%></td>
            <td><a  href="delete.jsp?id=<%=b_id%>" onClick="return confirm('确定删除?');">删除</a></td>
            <td><a href="#">加入购物车</a></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<%
    }catch(Exception e)	{
        System.out.println(e) ;
    }finally{
        //rs.close() ;
        //pstmt.close() ;
        conn.close() ;	// 如果直接关闭连接也可以
    }
%>


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