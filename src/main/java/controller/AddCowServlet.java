package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.VarietyCowDao;
import domain.Cow;
import domain.User;
import domain.Variety;

/**
 * Servlet implementation class AddCowServlet
 */
@WebServlet("/AddCowServlet")
public class AddCowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private List<Variety> varietyList;
	
	public void init(ServletConfig config) throws ServletException {
		VarietyCowDao varietyCowDao = DaoFactory.createVarietyCowDao();
		try {
			varietyList = varietyCowDao.findAll();
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
User user = (User) request.getSession().getAttribute("user");
Cow cows = new Cow();


try {
	request.setAttribute("varietyList", varietyList);
	cows.setUserId(user.getId());
	request.getRequestDispatcher("/WEB-INF/view/addCow.jsp").forward(request, response);
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect(request.getContextPath() + "/index");
}



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cow cows = new Cow();
		SimpleDateFormat sdf = new SimpleDateFormat();
		
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
			DaoFactory.createCowDao().insert(cows);
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/index");
	}

}
