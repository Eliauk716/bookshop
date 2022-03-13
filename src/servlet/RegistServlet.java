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

@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 处理注册
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");

		// 调用注册
		IUserService regist = new UserServiceImpl();
		IndexUser user = new IndexUser(name, pwd, email);
		boolean result = regist.regist(user);
		if (result) {
			response.sendRedirect("login.jsp");
		} else {
			request.setAttribute("error", "error");
			request.getRequestDispatcher("regist.jsp").forward(request, response);
//			response.sendRedirect("regist.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
