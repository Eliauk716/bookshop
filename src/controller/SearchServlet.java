package controller;

import entity.Book;
import service.SearchService;
import service.impl.SearchServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    SearchService searchService = new SearchServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookname = req.getParameter("s_name");
        List<Book> list = new ArrayList<>();
        Book book = searchService.findByBookname(bookname);
        list.add(book);
        req.setAttribute("list", list);
        req.getRequestDispatcher("goodslist.jsp").forward(req, resp);
    }
}
