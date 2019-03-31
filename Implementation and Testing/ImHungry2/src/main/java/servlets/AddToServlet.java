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
@WebServlet("/AddToServlet")
public class AddToServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String item = request.getParameter("item");
		String list = request.getParameter("list");
		
	
		session.setAttribute("id", id);
		if(item.equals("Restaurant")) {
			session.setAttribute("item", item);
		}
		session.setAttribute("list", list);
		
		User thisUser = (User) session.getAttribute("userObj");
		ArrayList<Restaurant> resList = (ArrayList<Restaurant>) session.getAttribute("resList");
		ArrayList<Recipe> recList = (ArrayList<Recipe>) session.getAttribute("recList");
		
		//restaurant item
		if(item.equals("Restaurant")) {
			
			Restaurant rs = null;
			//search for restaurant item
			for(int i = 0; i < resList.size(); i++) {
				if(resList.get(i).uniqueID.equals(id)) {
					rs = resList.get(i);
				}
			}
			thisUser.addRestaurant(rs, list);
			
			if(list.equals("favorite")) {
				resList.remove(rs);
				resList.add(0, rs);
			}
			else if (list.equals("not")) {
				resList.remove(rs);
			}
		}
		else { //recipe item
	
			//search for recipe item
			Recipe rc = null;
			for(int i = 0; i < recList.size(); i++) {	
				if(recList.get(i).uniqueID.equals(id)) {
					rc = recList.get(i);
				}
			}
			thisUser.addRecipe(rc, list);
			
			if(list.equals("favorite")) {
				recList.remove(rc);
				recList.add(0, rc);
			}
			else if (list.equals("not")){
				recList.remove(rc);
			}
		}
		
		
		session.setAttribute("userObj", thisUser);
		
		Gson gson = new Gson();
		String userJSON = gson.toJson(thisUser);
		String resJSON = gson.toJson(resList);
		String recJSON = gson.toJson(recList);

	    session.setAttribute("user", userJSON);
	    session.setAttribute("resList", resList);
	    session.setAttribute("recList", recList);
	    session.setAttribute("restaurantResults", resJSON);
	    session.setAttribute("recipeResults", recJSON);
		
	}
}