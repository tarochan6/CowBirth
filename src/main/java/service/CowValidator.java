package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import domain.Cow;

public class CowValidator {

	private Cow validatedCow;
	private boolean isValid;

	Cow cow = new Cow();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public CowValidator(HttpServletRequest request) throws ServletException, ParseException {
		String name = request.getParameter("name");
		int varietyId = Integer.parseInt(request.getParameter("varietyId"));
		String note = request.getParameter("note");
		try {
		Date aiday = (sdf.parse(request.getParameter("aiday")));
		} catch (ParseException e) {
			throw new ServletException(e);
		}
		
		String nameError = null;
		
		if(name.isBlank()) {
			nameError = "名号が未記入です。";
		} else if (name.length() > 50) {
			nameError = "50文字以下で入力してください。";
		}
		
		if(nameError != null) {
			request.setAttribute("name", name);
			request.setAttribute("varietyId", varietyId);
			request.setAttribute("note", note);
			request.setAttribute("aiday", sdf.parse(request.getParameter("aiday")));
			
			request.setAttribute("nameError", nameError);
			return;
		}
		
		validatedCow = new Cow();
		validatedCow.setCowName(name);
		validatedCow.setVarietyId(varietyId);
		validatedCow.setNote(note);
		validatedCow.setAiDay(sdf.parse(request.getParameter("aiday")));
		
		isValid = true;
		
	}
	
	
		

		


	public Cow getvalidatedCow() {
		return validatedCow;
	}

	public boolean isValid() {
		return isValid;
	}
}
