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

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int sex = Integer.parseInt(request.getParameter("sex"));
		IndexUser user = new IndexUser(name,email,sex);
		IUserService update = new UserServiceImpl();
		boolean result = update.update(user);
		if(result) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			request.setAttribute("error", "error");
			request.getRequestDispatcher("personal.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
