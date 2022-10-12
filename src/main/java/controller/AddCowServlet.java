package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CowDao;
import dao.DaoFactory;
import dao.VarietyCowDao;
import domain.Cow;
import domain.User;
import domain.Variety;

/**
 * Servlet implementation class AddCowServlet
 */
@WebServlet("/user/addCow")
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
	request.getRequestDispatcher("/WEB-INF/view/user/addCow.jsp").forward(request, response);
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect(request.getContextPath() + "/user/index");
}



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("name");
		String aiday = request.getParameter("aiday");
		
		CowDao dao = DaoFactory.createCowDao();
		
		List<String> errors = new ArrayList<>();
		if(name.isBlank()) {
			errors.add("牛の名前またはAI日が未入力です。");
		}
		else if (aiday.isBlank()) {
			errors.add("牛の名前またはAI日が未入力です。");
		}
		
		if(errors.size() > 0) {
			User user = (User) request.getSession().getAttribute("user");
			request.setAttribute("varietyList", varietyList);
			Cow cows = new Cow();
			
			request.setAttribute("errors", errors);
			request.setAttribute("name", name);
			request.setAttribute("aiday", aiday);
			
			request.setAttribute("varietyList", varietyList);
			cows.setUserId(user.getId());
			
			request.getRequestDispatcher("/WEB-INF/view/user/addCow.jsp").forward(request, response);
			return;
		}
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			User user = (User) request.getSession().getAttribute("user");
			Cow cows = new Cow();
			
			cows.setUserId(user.getId());
			cows.setCowName(request.getParameter("name"));
			cows.setVarietyId(Integer.parseInt(request.getParameter("varietyId")));
			cows.setNote(request.getParameter("note"));
			try {
				cows.setAiDay(sdf.parse(request.getParameter("aiday")));
			} catch (ParseException e) {
				throw new ServletException(e);
			}
			dao.insert(cows);
			
			response.sendRedirect(request.getContextPath() + "/user/index");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


