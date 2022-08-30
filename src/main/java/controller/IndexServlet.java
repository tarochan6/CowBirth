package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import domain.Cow;
import domain.User;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/user/index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	User user = (User) request.getSession().getAttribute("user");
		
		List<Cow> cows = null;
		try {
			cows = DaoFactory.createCowDao().findCowData(user.getId());
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("cows", cows);
    	
    	request.getRequestDispatcher("/WEB-INF/view/user/index.jsp").forward(request, response);
    
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
		
}
