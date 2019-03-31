package servlets;

import java.io.IOException;
import java.util.ArrayList;


import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import objects.Recipe;

import objects.User;


/**
 * Servlet implementation for adding items to list
 */
@WebServlet("/AddToGrocery")
public class AddToGrocery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToGrocery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		
		User thisUser = (User) session.getAttribute("userObj");
		ArrayList<Recipe> recList = (ArrayList<Recipe>) session.getAttribute("recList");
		
		
		//search for recipe item
		Recipe rc = null;
		for(int i = 0; i < recList.size(); i++) {	
			if(recList.get(i).uniqueID.equals(id)) {
				rc = recList.get(i);
				//and save groceries to the list
				thisUser.addGrocery(rc);
				break;
			}
		}
			
		//save to session
		session.setAttribute("userObj", thisUser);
		
		Gson gson = new Gson();
		String userJSON = gson.toJson(thisUser);
		String gList = gson.toJson(thisUser.gList);
	    session.setAttribute("user", userJSON);
	    session.setAttribute("gList", gList);


		
	}
}