package com.rudrasoft.saxonlinepo.srv;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rudrasoft.saxonlinepo.bo.CZ_Registration_BO;
import com.rudrasoft.saxonlinepo.dao.CZ_Registration_DAO;
import com.rudrasoft.saxonlinepo.util.EmailValidator;
import com.google.gson.Gson;

/**
 * Servlet implementation class CZ_Resistration_Srv
 */
@WebServlet({ "/CZ_Resistration_Srv", "/register.htm", "/register/getCache", "/register/edit", "/register/save", "/register/update", "/register/saveCache", "/register/deleteCache" })
public class CZ_Resistration_Srv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CZ_Resistration_Srv() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see CZ_SubjectVisit_Srv#mapRequest(HttpServletRequest request, HttpServletResponse response)
	 * this method will map the Servlet request
	 */
	private void mapRequest(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {

		
		System.out.println("Servlet uRL request = "+request.getServletPath());

		/** mapping servlet request */
		switch (request.getServletPath()) {
			case "/register.htm":
				home(request, response);
				break;
			case "/register/save":
				save(request, response);
				break;
			case "/register/update":
				update(request, response);
				break;
			case "/register/delete":
				delete(request, response);
				break;
			default:
				home(request, response);
				break;
		}
	}

	

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see CZ_SubjectVisit_Srv#home(HttpServletRequest request, HttpServletResponse response)
	 * this method will fetch record and forward request to Death.jsp
	 */
	private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		/** forwarding request scope to the frm_Informed_Consent.jsp*/
		request.getRequestDispatcher("frm_Registration.jsp").forward(request, response);
	}

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see CZ_SubjectVisit_Srv#save(HttpServletRequest request, HttpServletResponse response)
	 * this method will insert requested record and redirect to home() method page
	 */
	private void save(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		Map<String, Object> data = new HashMap<>();
		Map<String, String> errors = new HashMap<>();
		
		if(request.getParameter("fname").equals("")){
			errors.put("fname", "first name is requierd!!!");
			System.out.println("Name is empty");
		}
		if(request.getParameter("lname").equals("")){
			errors.put("lname", "last first name is requierd!!!");
			System.out.println("Name is empty");
		}
		if(request.getParameter("email").equals(""))
			errors.put("email", "email is requierd!!!");
		else{
			boolean valid = new EmailValidator().validate(request.getParameter("email"));
			System.out.println("Email is "+request.getParameter("email")+" = "+valid);
			if(!valid){
				errors.put("email", "email is incorrect!!!!");
			}
		}
		if(request.getParameter("pwd").equals(""))
			errors.put("pwd", "password is requierd!!!");
		
		
		if(errors.isEmpty()){
			
			boolean result = CZ_Registration_DAO.save(setBO(request, response));
			if(result){
				data.put("success", true);
				data.put("message", "Success");
			}else{
				data.put("success", false);
				data.put("errors", errors);
			}
		}else{
			data.put("success", false);
			data.put("errors", errors);
		}
		
		Gson gson = new Gson();
    	response.setContentType("application/json");
    	response.getWriter().write(gson.toJson(data));
    	System.out.println("Json = "+gson.toJson(data));
	}
	

	/**
	 * @throws IOException 
	 * @see CZ_SubjectVisit_Srv#update(HttpServletRequest request, HttpServletResponse response)
	 * this method will update requested record
	 */
	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/** calling update method to update form data to the DB
		 *  inside update() method calling setBO() method to setting the form values to the BO object */

		
			/*int result = CZ_SubjectVisit_DAO.update(setBO(request, response));
			System.out.println("Result = "+result);*/
		
		/** After updating requested form data redirecting to the this.home() method  */
		response.sendRedirect("../Subject_Visit.htm");
	}
	
	/**
	 * @see CZ_SubjectVisit_Srv#delete(HttpServletRequest request, HttpServletResponse response)
	 * this method will delete requested record
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	
	/**
	 * @see CZ_SubjectVisit_Srv#setBO(HttpServletRequest request, HttpServletResponse response)
	 * this method will create the object of BO class and set the values to the BO class
	 */
	private CZ_Registration_BO setBO(HttpServletRequest request, HttpServletResponse response) {
		/** creating BO object to set form values to the BO object */
		CZ_Registration_BO bo = new CZ_Registration_BO();
		bo.setFname(request.getParameter("fname"));
		bo.setLname(request.getParameter("lname"));
		bo.setEmail(request.getParameter("email"));
		bo.setPwd(request.getParameter("pwd"));
		
		return bo;
	}
	
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			mapRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CZ_Resistration_Srv.class.getName()).log(Level.SEVERE, null, ex);
        }
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			mapRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CZ_Resistration_Srv.class.getName()).log(Level.SEVERE, null, ex);
        }
	}

}
