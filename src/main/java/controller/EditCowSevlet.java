package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import domain.Cow;
import domain.User;
import domain.Variety;

/**
 * Servlet implementation class EdicCowSevlet
 */
@WebServlet("/user/editCow")
public class EditCowSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			User user = (User) request.getSession().getAttribute("user");
			Integer id = Integer.parseInt(request.getParameter("id"));
			Cow cow = DaoFactory.createCowDao().findById(id, user.getId());
			List<Variety> varietyList = DaoFactory.createVarietyCowDao().findAll();
			request.setAttribute("varietyList", varietyList);
			request.setAttribute("cow", cow);
			request.getRequestDispatcher("/WEB-INF/view/user/editCow.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/user/index");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		Cow cows = new Cow();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		cows.setId(Integer.parseInt(request.getParameter("id")));
		cows.setUserId(Integer.parseInt(request.getParameter("userId")));
		cows.setCowName(request.getParameter("name"));
		cows.setVarietyId(Integer.parseInt(request.getParameter("varietyId")));
		cows.setNote(request.getParameter("note"));
		try {
			cows.setAiDay(sdf.parse(request.getParameter("aiday")));
		} catch (ParseException e) {
			throw new ServletException(e);
		}

		try {
			DaoFactory.createCowDao().update(cows);
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/user/index");

	}
}
