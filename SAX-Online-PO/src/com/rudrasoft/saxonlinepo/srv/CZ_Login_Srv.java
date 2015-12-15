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
import javax.servlet.http.HttpSession;

import com.rudrasoft.saxonlinepo.bo.CZ_Registration_BO;
import com.rudrasoft.saxonlinepo.dao.CZ_Login_DAO;
import com.rudrasoft.saxonlinepo.util.EmailValidator;
import com.google.gson.Gson;

/**
 * Servlet implementation class CZ_Login_Srv
 */
@WebServlet(
		description = "This is Controller for controlling login request", 
		urlPatterns = { 
				"/CZ_Login_Srv", 
				"/login.htm", 
				"/login/validate",
				"/home.htm",
				"/logout"
		})
public class CZ_Login_Srv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CZ_Login_Srv() {
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
			case "/login.htm":
				loginHome(request, response);
				break;
			case "/login/validate":
				validate(request, response);
				break;
			case "/home.htm":
				home(request, response);
				break;
			case "/logout":
				logout(request, response);
				break;
			default:
				loginHome(request, response);
				break;
		}
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Invalidating session.........");
		HttpSession session=request.getSession();  
        session.invalidate(); 
        response.sendRedirect("login.htm");
		
	}

	private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** forwarding request scope to the frm_Informed_Consent.jsp*/
		HttpSession session=request.getSession();  
        if(session.getAttribute("fname") != null){  
        	System.out.println("Session is not empty");
        	request.getRequestDispatcher("Home.jsp").forward(request, response);
		}else{
			System.out.println("session is empty........");
			response.sendRedirect("login.htm");
		}
	}

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see CZ_SubjectVisit_Srv#home(HttpServletRequest request, HttpServletResponse response)
	 * this method will fetch record and forward request to Death.jsp
	 */
	private void loginHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		/** forwarding request scope to the frm_Informed_Consent.jsp*/
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @throws IOException 
	 * @see CZ_SubjectVisit_Srv#save(HttpServletRequest request, HttpServletResponse response)
	 * this method will insert requested record and redirect to home() method page
	 */
	private void validate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Map<String, Object> data = new HashMap<>();
		Map<String, String> errors = new HashMap<>();
		
		if(request.getParameter("email").equals(""))
			errors.put("email", "email is requierd!!!");
		else{
			boolean valid = new EmailValidator().validate(request.getParameter("email"));
			System.out.println("Email is "+request.getParameter("email")+" = "+valid);
			if(!valid){
				errors.put("email", "email is incorrect!!!!");
			}
		}
		
		if(errors.isEmpty()){
			CZ_Registration_BO bo = CZ_Login_DAO.validate(request.getParameter("email"), request.getParameter("pwd"));
			if(bo.isSuccess()){
				data.put("success", true);
				data.put("message", "Success");
				HttpSession session=request.getSession();  
		        session.setAttribute("fname",bo.getFname());   
		        session.setAttribute("lname",bo.getLname());
		        session.setAttribute("email",bo.getEmail());
		        session.setAttribute("userID", bo.getUserId());
			}else{
				data.put("success", false);
				errors.put("error", "Invalid email or password!!!!!!!!!!");
				data.put("errors", errors);
			}
			
			
		}else{
			data.put("success", false);
			data.put("errors", errors);
		}
		System.out.println("name = "+request.getParameter("name"));
		System.out.println("email = "+request.getParameter("email"));
		System.out.println("superheroAlias = "+request.getParameter("superheroAlias"));
		// TODO Auto-generated method stub
		
		Gson gson = new Gson();
    	response.setContentType("application/json");
    	response.getWriter().write(gson.toJson(data));
    	System.out.println("Json = "+gson.toJson(data));
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			mapRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CZ_Login_Srv.class.getName()).log(Level.SEVERE, null, ex);
        }
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			mapRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CZ_Login_Srv.class.getName()).log(Level.SEVERE, null, ex);
        }
	}

}
