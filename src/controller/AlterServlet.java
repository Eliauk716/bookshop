package controller;

import entity.BookRecord;
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

@WebServlet("/alter")
public class AlterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String img = req.getParameter("img");
        String bookname = req.getParameter("bookname");
        String author = req.getParameter("author");
        String type = req.getParameter("booktype");
        String pricestr = req.getParameter("Price");
        Double price = Double.parseDouble(pricestr);
        String amount = req.getParameter("amount");
        Integer quantity = Integer.parseInt(amount);
        String check = req.getParameter("check");
        BookRecord bookRecord = new BookRecord(img, bookname, author, type, quantity, price, check);
        req.setAttribute("bookRecord", bookRecord);
        req.getRequestDispatcher("alter.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection = JDBCTools.getConnection();
        String sql = "update book set b_name = ?, author = ?, quantity = ?, b_price = ? where b_name = ?";
        PreparedStatement statement = null;
        int a;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, req.getParameter("bookname"));
            statement.setString(2, req.getParameter("author"));
            statement.setInt(3, Integer.parseInt(req.getParameter("amount")));
            statement.setDouble(4, Double.parseDouble(req.getParameter("Price")));
            statement.setString(5, req.getParameter("bookname"));
            a = statement.executeUpdate();
            resp.sendRedirect("/book?page=1");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTools.release(connection, statement, null);
        }
    }
}
