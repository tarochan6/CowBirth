package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import domain.Cow;
import domain.User;

/**
 * Servlet implementation class EdicCowSevlet
 */
@WebServlet("/editCow")
public class EditCowSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	private List<Variety> varietyList;
	private CowDao cowDao;

	public void init(ServletConfig config) throws ServletException {
		VarietyCowDao varietyCowDao = DaoFactory.createVarietyCowDao();
		try {
			varietyList = varietyCowDao.findAll();
			cowDao = DaoFactory.createCowDao();
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
*/
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**
		try {
			Cow cow = cowDao.findById(Integer.parseInt(request.getParameter("id")),
					Integer.parseInt(request.getParameter("userId")));

			request.setAttribute("name", cow.getCowName());
			request.setAttribute("VarietyId", cow.getVarietyId());
			request.setAttribute("note", cow.getNote());
			request.setAttribute("aiday", cow.getAiDay());

			request.setAttribute("varietyList", varietyList);

			request.getRequestDispatcher("/WEB-INF/view/saveCow.jsp").forward(request, response);

		} catch (Exception e) {
			throw new ServletException(e);
		}
		 */
		
		  try { User user = (User) request.getSession().getAttribute("user"); 
		  Integer id = Integer.parseInt(request.getParameter("id"));
		  
		  Cow cow = DaoFactory.createCowDao().findById(id, user.getId());
		  
		  
		  request.setAttribute("cow", cow);
		  request.getRequestDispatcher("/WEB-INF/view/editCow.jsp").forward(request,response);
		  }catch (Exception e) {
			  e.printStackTrace();
		  response.sendRedirect(request.getContextPath() + "/index");
		  }
		 

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/**
		 * try { CowValidator validator = new CowValidator(request);
		 * 
		 * if(!validator.isValid()) { request.setAttribute("varietyList", varietyList);
		 * request.getRequestDispatcher("/WEB-INF/view/saveCow.jsp").forward(request,
		 * response); return; }
		 * 
		 * Cow cow = validator.getvalidatedCow();
		 * cow.setId(Integer.parseInt(request.getParameter("id"))); cowDao.update(cow);
		 * 
		 * request.getRequestDispatcher("/WEB-INF/view/saveCowDone.jsp").forward(request,
		 * response); }catch (Exception e) { throw new ServletException(e); }
		 */

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
