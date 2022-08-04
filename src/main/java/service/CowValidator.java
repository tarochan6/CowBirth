package service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import domain.Cow;

public class CowValidator {

	private Cow validatedCow;
	private boolean isValid;

	public CowValidator(HttpServletRequest request) {
		String name = request.getParameter("name");
		int varietyId = Integer.parseInt(request.getParameter("varietyId"));
		String note = request.getParameter("note");
		String aiday = request.getParameter("aiday");
		
		int 

	}

	public Cow getvalidatedCow() {
		return validatedCow;
	}

	public boolean isValid() {
		return isValid;
	}
}
