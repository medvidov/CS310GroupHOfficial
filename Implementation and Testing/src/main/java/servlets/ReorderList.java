package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import objects.Recipe;
import objects.Restaurant;
import objects.User;

/**
 * Servlet implementation class ReorderList
 */
@WebServlet("/ReorderList")
public class ReorderList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReorderList() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String list = request.getParameter("list");
		String token[] = id.split("-");
		String itemType = token[0];
		String move = request.getParameter("move");
		int index = Integer.parseInt(token[1]);

		User thisUser = (User) session.getAttribute("userObj");
		
		if(itemType.equals("restaurant")) {
			if(list.equals("favorite")) {
				Restaurant cur = thisUser.favoriteRestaurant.get(index);
				if(move.equals("up")) {
					thisUser.favoriteRestaurant.set(index,thisUser.favoriteRestaurant.get(index - 1));
					thisUser.favoriteRestaurant.set(index - 1, cur);
				}
				else {
					thisUser.favoriteRestaurant.set(index,thisUser.favoriteRestaurant.get(index + 1));
					thisUser.favoriteRestaurant.set(index + 1, cur);
				}
			}
			else if(list.equals("explore")) {
				Restaurant cur = thisUser.exploreRestaurant.get(index);
				if(move.equals("up")) {
					thisUser.exploreRestaurant.set(index,thisUser.exploreRestaurant.get(index - 1));
					thisUser.exploreRestaurant.set(index - 1, cur);
				}
				else {
					thisUser.exploreRestaurant.set(index,thisUser.exploreRestaurant.get(index + 1));
					thisUser.exploreRestaurant.set(index + 1, cur);
				}
			}
			else {
				Restaurant cur = thisUser.notRestaurant.get(index);
				if(move.equals("up")) {
					thisUser.notRestaurant.set(index,thisUser.notRestaurant.get(index - 1));
					thisUser.notRestaurant.set(index - 1, cur);
				}
				else {
					thisUser.notRestaurant.set(index,thisUser.notRestaurant.get(index + 1));
					thisUser.notRestaurant.set(index + 1, cur);
				}
			}
		}
		else {
			if(list.equals("favorite")) {
				Recipe cur = thisUser.favoriteRecipe.get(index);
				if(move.equals("up")) {
					thisUser.favoriteRecipe.set(index,thisUser.favoriteRecipe.get(index - 1));
					thisUser.favoriteRecipe.set(index - 1, cur);
				}
				else {
					thisUser.favoriteRecipe.set(index,thisUser.favoriteRecipe.get(index + 1));
					thisUser.favoriteRecipe.set(index + 1, cur);
				}
			}
			else if(list.equals("explore")) {
				Recipe cur = thisUser.exploreRecipe.get(index);
				if(move.equals("up")) {
					thisUser.exploreRecipe.set(index,thisUser.exploreRecipe.get(index - 1));
					thisUser.exploreRecipe.set(index - 1, cur);
				}
				else {
					thisUser.exploreRecipe.set(index,thisUser.exploreRecipe.get(index + 1));
					thisUser.exploreRecipe.set(index + 1, cur);
				}
			}
			else {
				Recipe cur = thisUser.notRecipe.get(index);
				if(move.equals("up")) {
					thisUser.notRecipe.set(index,thisUser.notRecipe.get(index - 1));
					thisUser.notRecipe.set(index - 1, cur);
				}
				else {
					thisUser.notRecipe.set(index,thisUser.notRecipe.get(index + 1));
					thisUser.notRecipe.set(index + 1, cur);
				}
			}
		}
		
		Gson gson = new Gson();
		
		//set the favorite lists as session variable and send to the front end
		String favRes = gson.toJson(thisUser.favoriteRestaurant);
		String favRec = gson.toJson(thisUser.favoriteRecipe);
		String expRes = gson.toJson(thisUser.exploreRestaurant);
		String expRec = gson.toJson(thisUser.exploreRecipe);
		String notRes = gson.toJson(thisUser.notRestaurant);
		String notRec = gson.toJson(thisUser.notRecipe);
		session.setAttribute("notRes", notRes);
		session.setAttribute("notRec", notRec);
		session.setAttribute("expRes", expRes);
		session.setAttribute("expRec", expRec);
		session.setAttribute("favRes", favRes);
		session.setAttribute("favRec", favRec);
		
		
	}

}
