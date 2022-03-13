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

@WebServlet("/editService")
public class EditServiceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        Connection connection = JDBCTools.getConnection();
        String sql = null;
        PreparedStatement statement = null;

        switch (method) {
            case "add":
                sql = "insert into book(b_name, author, b_price, type, quantity, img) values(?,?, ?, ?, ?, ?)";
                BookRecord bookRecord = null;
                bookRecord = (BookRecord) req.getAttribute("bookRecord");
                int a;
                try {
                    statement = connection.prepareStatement(sql);
                    statement.setString(1, bookRecord.getBookname());
                    statement.setString(2, bookRecord.getAuthor());
                    statement.setDouble(3, bookRecord.getPrice());
                    statement.setString(4, bookRecord.getBooktype());
                    statement.setInt(5, bookRecord.getQuantity());
                    statement.setString(6, bookRecord.getImg());
                    a = statement.executeUpdate();
                    resp.sendRedirect("/book?page=1");
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    JDBCTools.release(connection, statement, null);
                }
                break;

            case "delete":
                sql = "delete from book where b_name = ?";
                String bookname = (String) req.getAttribute("bookname");
                try {
                    statement = connection.prepareStatement(sql);
                    statement.setString(1, bookname);
                    a = statement.executeUpdate();
                    resp.sendRedirect("/book?page=1");
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    JDBCTools.release(connection, statement, null);
                }
                break;
        }
    }
}




