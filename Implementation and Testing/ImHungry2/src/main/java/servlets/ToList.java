package servlets;

import java.io.IOException;
import java.util.ArrayList;


import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
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
@WebServlet("/ToList")
public class ToList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		HttpSession session = request.getSession();
		String list = request.getParameter("list");
		User myuser = (User) session.getAttribute("userObj");
		Gson gson = new Gson();
	
		//checks which list to go to
		if(list.equals("favorite")){
			//set the favorite lists as session variable and send to the front end
			String favRes = gson.toJson(myuser.favoriteRestaurant);
			String favRec = gson.toJson(myuser.favoriteRecipe);
			session.setAttribute("favRes", favRes);
			session.setAttribute("favRec", favRec);
			RequestDispatcher dispatch = request.getRequestDispatcher("Favorite.jsp");
			if (!(dispatch == null)) {
				dispatch.forward(request,  response);
			}
		}
		else if(list.equals("explore")){
			//set the explore lists as session variable and send to the front end
			String expRes = gson.toJson(myuser.exploreRestaurant);
			String expRec = gson.toJson(myuser.exploreRecipe);
			session.setAttribute("expRes", expRes);
			session.setAttribute("expRec", expRec);
			RequestDispatcher dispatch = request.getRequestDispatcher("ToExplore.jsp");
			if (!(dispatch == null)) {
				dispatch.forward(request,  response);
			}
		}
		else {
			//set the do not show lists as session variable and send to the front end
			String notRes = gson.toJson(myuser.notRestaurant);
			String notRec = gson.toJson(myuser.notRecipe);
			session.setAttribute("notRes", notRes);
			session.setAttribute("notRec", notRec);
			RequestDispatcher dispatch = request.getRequestDispatcher("DoNotShow.jsp");
			if (!(dispatch == null)) {
				dispatch.forward(request,  response);
			}
		}
	}
}