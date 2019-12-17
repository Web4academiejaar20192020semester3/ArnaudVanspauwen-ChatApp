package controller.handlers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.PersonService;
import domain.Person;
import domain.Role;

import java.io.IOException;

public abstract class RequestHandler {

	public String destination = "index.jsp";
	
	private PersonService personService;
	
	public abstract String handleRequest (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;
	
	public void setModel (PersonService personService) {
		this.personService = personService;
	}

	public PersonService getPersonService() {
		return personService;
	}
	
	protected boolean isFromUserWithRole (HttpServletRequest request, Role role) {
		Person person = (Person) request.getSession().getAttribute("user");
		if (person != null && person.getRole().equals(role)) {
			return true;
		}
		return false;
	}

}
