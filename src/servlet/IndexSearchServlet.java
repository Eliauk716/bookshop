package servlet;

import entity.IndexBook;
import service.IBookService;
import service.impl.BookServiceImpl;
import service.impl.IndexBookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/SearchServlet")
public class IndexSearchServlet extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String put = request.getParameter("search");
		String choose = request.getParameter("select");
		List<IndexBook> books = null;
		
		IBookService book = new IndexBookServiceImpl();
		if(choose.equals("书名")) {
			books = book.SearchByName(put);
		}else {
			books = book.SearchByAuthor(put);
		}
		
		if (books.size()>0) {
			request.setAttribute("booklist", books);
			request.getRequestDispatcher("result.jsp").forward(request, response);
		} else {
			request.setAttribute("error", "error");
			request.getRequestDispatcher("result.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
