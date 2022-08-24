package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.UserDao;
import domain.User;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	request.getRequestDispatcher("/WEB-INF/view/signup.jsp").forward(request, response);
	
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String loginId = request.getParameter("loginId");
		String loginPass = request.getParameter("loginPass");
		String confPass = request.getParameter("confPass");
	
		
		UserDao dao = DaoFactory.createUserDao();
		
		
		//バリデーション
		List<String> errors = new ArrayList<>();
		if(loginId.isBlank()) {
			errors.add("ログインIDが未入力です。");
		} else {
			User tempUser = null;
			try {
				tempUser = dao.findByLoginId(loginId);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(tempUser != null) {
				errors.add("既に使用されているログインIDです。");
			}
		}
		if(loginPass.isBlank()) {
			errors.add("パスワードが未入力です。");
		} else if (!loginPass.equals(confPass)) {
			errors.add("確認用パスワードが一致していません。");
		}
	
		//入力に不備がある場合
		if(errors.size() > 0) {
			request.setAttribute("errors", errors);
			request.setAttribute("loginId", loginId);
			request.setAttribute("loginPass", loginPass);
			request.getRequestDispatcher("/WEB-INF/view/signup.jsp").forward(request, response);
			return;
		}
	//入力に不備なし→登録
		try {
			User user = new User();
			user.setLoginId(loginId);
			user.setLoginPass(loginPass);
			dao.insert(user);
			
			response.sendRedirect(request.getContextPath() + "/signupDone");
		} catch ( Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
