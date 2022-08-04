package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import domain.User;

/**
 * Servlet implementation class DeleteCowServlet
 */
@WebServlet("/deleteCow")
public class DeleteCowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
	int id = Integer.parseInt(request.getParameter("id"));
	User user = (User) request.getSession().getAttribute("user");
	DaoFactory.createCowDao().delete(id, user.getId());
} catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect(request.getContextPath() + "/user/showRecord");
	}

}
