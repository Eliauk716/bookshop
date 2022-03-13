package controller;

import entity.Book;
import service.BookService;
import service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/book")
public class BookServlet extends HttpServlet {
    private BookService bookService = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pagestr = req.getParameter("page");
        Integer page = Integer.parseInt(pagestr);
        List<Book> list = bookService.findAll(page);
        int count = bookService.getnum();
        req.setAttribute("list",list);
        req.setAttribute("count", count);
        req.setAttribute("page", page);
        req.getRequestDispatcher("goodslist.jsp").forward(req, resp);
    }
}
