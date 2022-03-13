package controller;

import entity.BookRecord;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/edit")
public class EditServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        switch (method){
            case "add":
                String imgstr1 = null;
                String imgstr2 = req.getParameter("img");
                String bookname = req.getParameter("bookname");
                String author = req.getParameter("author");
                String type = req.getParameter("booktype");
                if (type.equals("文学")) imgstr1="novel/";
                else if (type.equals("教育")) imgstr1="edu/";
                else if (type.equals("经管")) imgstr1="eco/";
                else if (type.equals("励志")) imgstr1="encour/";
                else if (type.equals("生活")) imgstr1="live/";
                else if (type.equals("社科")) imgstr1="social/";
                else if(type.equals("科技")) imgstr1="disc/";
                String img = imgstr1 + imgstr2;
                String pricestr = req.getParameter("Price");
                Double price = Double.parseDouble(pricestr);
                String amount = req.getParameter("amount");
                Integer quantity = Integer.parseInt(amount);
                String check = req.getParameter("check");
                BookRecord bookRecord = new BookRecord(img, bookname, author, type, quantity, price, check);
                req.setAttribute("bookRecord", bookRecord);
                req.getRequestDispatcher("/editService?method=add").forward(req, resp);
                break;

            case "delete":
                bookname = req.getParameter("bookname");
                req.setAttribute("bookname", bookname);
                req.getRequestDispatcher("/editService?method=delete").forward(req, resp);
                break;
        }

    }
}
