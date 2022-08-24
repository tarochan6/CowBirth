package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import domain.Cow;
import domain.User;

public class CowValidator {

	private Cow validatedCow;
	private boolean isValid;

	Cow cow = new Cow();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public CowValidator(HttpServletRequest request) throws ServletException, ParseException {
		
		User user = (User) request.getSession().getAttribute("user");
		
		cows.setUserId(user.getId());
		
		int id = request.getParameter("id");
		String name = request.getParameter("name");
		String aidays = request.getParameter("aidays");
		String note = request.getParameter("note");
		int varietyId = Integer.parseInt(request.getParameter("varietyId"));

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
			request.setAttribute("varietyId", varietyId);
			request.setAttribute("aidays", aidays);
			request.setAttribute("note", note);
			
			
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
				
		validatedCow = new Cow();
		validatedCow.setCowName(name);
		validatedCow.setVarietyId(varietyId);
		validatedCow.setAiDay(aiday);
		validatedCow.setNote(note);

		isValid = true;

	}

	public Cow getvalidatedCow() {
		return validatedCow;
	}

	public boolean isValid() {
		return isValid;
	}
}
