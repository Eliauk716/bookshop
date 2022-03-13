package controller;

import utils.JDBCTools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/addShopCar")
public class AddShopCarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String img = req.getParameter("img");
        String name = req.getParameter("name");
        Double price = Double.parseDouble(req.getParameter("price"));
        System.out.println(price);
        Connection connection = JDBCTools.getConnection();
        PreparedStatement statement = null;
        String sql = null;
        int a;

                sql = "insert into shopcar(img, bookname, price, amount) values(?, ?, ?, 1)";
                try {
                    statement = connection.prepareStatement(sql);
                    statement.setString(1, img);
                    statement.setString(2, name);
                    statement.setDouble(3, price);
                    a = statement.executeUpdate();
                    req.getRequestDispatcher("novel.jsp").forward(req, resp);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                String amountstr = req.getParameter("number");
                Integer amount = Integer.parseInt(amountstr);
                System.out.println(amount);
                sql = "insert into shopcar(img, bookname, price, amount) values(?, ?, ?, ?)";
                try {
                    statement = connection.prepareStatement(sql);
                    statement.setString(1, img);
                    statement.setString(2, name);
                    statement.setDouble(3, price);
                    statement.setInt(4, amount);
                    a = statement.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
    }
}
