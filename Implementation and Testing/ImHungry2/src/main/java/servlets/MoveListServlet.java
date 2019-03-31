package servlets;


import java.io.IOException;

import com.google.gson.Gson;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import objects.ImagesRequest;
import objects.Recipe;
import objects.RecipeRequest;
import objects.Restaurant;
import objects.User;
import objects.YelpRequest;

/**
 * Servlet implementation class searchUser
 */
@WebServlet("/MoveListServlet")
public class MoveListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
				
		String list1 = request.getParameter("list1");
		String list2 = request.getParameter("list2");
		String type = request.getParameter("itemType");
		
		int index = Integer.parseInt(request.getParameter("index"));
		
		ArrayList<Restaurant> resList = (ArrayList<Restaurant>) session.getAttribute("resList");
		ArrayList<Recipe> recList = (ArrayList<Recipe>) session.getAttribute("recList");
		
        User u = (User) request.getSession().getAttribute("userObj");
        
        if(type.equals("restaurant")) {
        	
        	if(list1.equals("explore")) {
        		Restaurant res = u.exploreRestaurant.get(index);
	        	if(list2.equals("not")) {
	        		resList.remove(res);
	        	}
	        	 if(list2.equals("favorite")) {
	        		resList.remove(res);
	        		resList.add(0, res);
	        	}
        	}
        	else if(list1.equals("favorite")) {
        		System.out.println(u.favoriteRestaurant.size());
        		
        		Restaurant res = u.favoriteRestaurant.get(index);
        		if(list2.equals("not")) {
        			resList.remove(res);
        		}
        	}
        	else { // from not
        		Restaurant res = u.notRestaurant.get(index);
        		if(list2.equals("favorite")) {
        			resList.add(0,res);
        		}
        		else {
        			resList.add(res);
        		}
        	}
        	u.moveRestaurant(list1, list2, index);
        	
        	
        }
        else if(type.equals("recipe")) {
        	if(list1.equals("explore")) {
        		Recipe res = u.exploreRecipe.get(index);
	        	if(list2.equals("not")) {
	        		recList.remove(res);
	        	}
	        	if(list2.equals("favorite")) {
	        		recList.remove(res);
	        		recList.add(0,res);
	        	}
        	}
        	else if(list1.equals("favorite")) {
        		Recipe res = u.favoriteRecipe.get(index);
        		if(list2.equals("not")) {
        			recList.remove(res);
        		}
        	}
        	else { // from not
        		Recipe res = u.notRecipe.get(index);
        		if(list2.equals("favorite")) {
        			recList.add(0,res);
        		}
        		else {
        			recList.add(res);
        		}
        	}
        	u.moveRecipe(list1, list2, index);
        }
        
        session.setAttribute("userObj", u);
		
		Gson gson = new Gson();
		String userJSON = gson.toJson(u);
		String resJSON = gson.toJson(resList);
		String recJSON = gson.toJson(recList);
		session.setAttribute("restaurantResults", resJSON);
	    session.setAttribute("recipeResults", recJSON);
		
	    session.setAttribute("user", userJSON);
	    session.setAttribute("resList", resList);
	    session.setAttribute("recList", recList);
	    
	}
}
