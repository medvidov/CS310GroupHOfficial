package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import objects.User;

/**
 * Servlet implementation class GroceryChecked
 */
@WebServlet("/GroceryChecked")
public class GroceryChecked extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroceryChecked() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		String check = request.getParameter("check");
		
		//System.out.println(id);
		//System.out.println(check);
		//get user
		User thisUser = (User) session.getAttribute("userObj");
		
		if(check.equals("true")) {
			thisUser.gList.get(id).check = true;
		}
		else {
			thisUser.gList.get(id).check = false;
		}
		
		Gson gson = new Gson();
		
		session.setAttribute("userObj", thisUser);
	     
		//use JSON for javascript readability

	    String userJSON =  gson.toJson(thisUser);
	    String gList = gson.toJson(thisUser.gList);
		
		session.setAttribute("user", userJSON);
		session.setAttribute("gList", gList);
		
		
	}

	

}
