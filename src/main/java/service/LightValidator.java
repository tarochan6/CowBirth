package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.FetchProfile.Item;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import domain.Cow;

public class LightValidator {

	private Item validatedLight;
	private boolean isValid;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public LightValidator(HttpServletRequest request) {
		
		String name = request.getParameter("name");
		String aidays = request.getParameter("aidays");
		String variety = request.getParameter("variety");

		String nameError = null;
		String aidayError = null;

		if (name.isBlank()) {
			nameError = "牛の名前を入力してください。";
		} else if (name.length() > 50) {
			nameError = "50文字以下で入力してください。";
		}

		if (aidays.isBlank()) {
			aidayError = "AI日を入力してください。";
		}

		if (nameError != null || aidayError != null) {
		
	
			request.setAttribute("name", name);
			request.setAttribute("variety", variety);
			request.setAttribute("aidays", aidays);
			
			request.setAttribute("nameError", nameError);
			request.setAttribute("aidayError", aidayError);
			return;
		}

		Date aiday;
		try {
			aiday = (sdf.parse(request.getParameter("aidays")));
		} catch (ParseException e) {
			aiday = new Date();
			throw new ServletException(e);
		}
				

		isValid = true;

	}

	public Cow getvalidatedLight() {
		return validatedLight;
	}

	public boolean isValid() {
		return isValid;
	}
		

}
	}
}
