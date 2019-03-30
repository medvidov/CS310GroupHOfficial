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
import objects.Restaurant;
import objects.User;


/**
 * Servlet implementation for adding items to list
 */
@WebServlet("/RemoveListServlet")
public class RemoveListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		HttpSession session = request.getSession();
			
		String list1 = request.getParameter("list");
		String type = request.getParameter("itemType");
		
		
		int index = Integer.parseInt(request.getParameter("index"));
		
		//get User session and lists
        User thisUser = (User) session.getAttribute("userObj");
        ArrayList<Restaurant> resList = (ArrayList<Restaurant>) session.getAttribute("resList");
		ArrayList<Recipe> recList = (ArrayList<Recipe>) session.getAttribute("recList");
        
		//check which item to remove
        if(type.equals("restaurant")) {
        	//check the list to remove from
        	if(list1.equals("not")) { //add the items back from the Do Not Show list to the results list
        		Restaurant rc  = thisUser.notRestaurant.get(index);
        		resList.add(rc);
        	}
        	thisUser.removeRestaurant(list1, index);
        }
        else if(type.equals("recipe")) {
        	if(list1.equals("not")) { //add the items back from the Do Not Show list to the results list
        		Recipe rc  = thisUser.notRecipe.get(index);
        		recList.add(rc);
        	}
        	thisUser.removeRecipe(list1, index);
        }

        //resetting the session variable
		session.setAttribute("userObj", thisUser);
		
		Gson gson = new Gson();
		String userJSON = gson.toJson(thisUser);
		String resJSON = gson.toJson(resList);
		String recJSON = gson.toJson(recList);
		session.setAttribute("restaurantResults", resJSON);
	    session.setAttribute("recipeResults", recJSON);
		
	    session.setAttribute("user", userJSON);
		session.setAttribute("resList", resList);
		session.setAttribute("recList", recList);
	}
}