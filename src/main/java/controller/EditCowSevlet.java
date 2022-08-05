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
@WebServlet("/editCow")
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
			request.getRequestDispatcher("/WEB-INF/view/editCow.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/index");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cow cow = new Cow();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		cow.setCowName(request.getParameter("name"));
		cow.setVarietyId(Integer.parseInt(request.getParameter("variety_id")));
		cow.setNote(request.getParameter("note"));
		try {
			cow.setAiDay(sdf.parse(request.getParameter("aiday")));
		} catch (ParseException e) {
			throw new ServletException(e);
		}

		try {
			DaoFactory.createCowDao().update(cow);
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("request.getContextPath() + /index");

	}
}
