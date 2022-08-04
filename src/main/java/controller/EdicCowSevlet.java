package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CowDao;
import dao.DaoFactory;
import domain.Cow;
import domain.User;
import domain.Variety;

/**
 * Servlet implementation class EdicCowSevlet
 */
@WebServlet("/EdicCowSevlet")
public class EdicCowSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
private List<Variety> varietyList;
private CowDao cowDao;

public void init(ServletConfig config) throws ServletException {
	VarietyDao varietyDao = DaoFactory.createVarietyDao();
	try {
		varietyList = varietyDao.findAll();
		cowDao = DaoFactory.createCowDao();
	} catch (Exception e) {
		throw new ServletException(e);
	}
	
}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
	User user = (User) request.getSession().getAttribute("user");
	Integer id = Integer.parseInt(request.getParameter("id"));
	Cow cow = DaoFactory.createCowDao().findById(id, user.getId());
	request.setAttribute("cow", cow);
	request.setAttribute("title", "変更");
	request.getRequestDispatcher("/WEB-INF/view/saveCow.jsp").forward(request, response);
}catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect(request.getContextPath() + "/index");
}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Cow cow = new Cow();
	cow.setId(Integer.parseInt(request.getParameter("Id")));
	cow.setUserId(Integer.parseInt(request.getParameter("user_id")));
	cow.setVarietyId(Integer.parseInt(request.getParameter("variety_id")));
	cow.setCowName(request.getParameter(getInitParameter("name")));
	cow.setAiDay(request.getDate);
	}

}
