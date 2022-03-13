package servlet;

import entity.IndexUser;
import service.IUserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 处理登录
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		
		// 登录
		IUserService login = new UserServiceImpl();
		IndexUser user = new IndexUser(name, pwd);
		boolean result = login.login(user);
		if (result) {
			// 存放用户数据
			request.getSession().setAttribute("name", name);
//			response.sendRedirect("index.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else {
			request.setAttribute("error", "error");
			request.getRequestDispatcher("login.jsp").forward(request, response);
//			response.sendRedirect("login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
