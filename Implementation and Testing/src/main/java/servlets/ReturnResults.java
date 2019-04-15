package servlets;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.gson.Gson;

import objects.Database;
import objects.ImagesRequest;
import objects.Recipe;
import objects.RecipeRequest;
import objects.Restaurant;
import objects.Results;
import objects.ToJson;
import objects.User;
import objects.YelpRequest;

/**
 * Servlet implementation class searchUser
 */
@WebServlet("/ReturnResults")
public class ReturnResults extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnResults() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User thisUser = null;
		
		if(session.getAttribute("userObj") == null) {
			System.out.println("rr:new user");
			thisUser = new User();

		} else {
			thisUser = (User)session.getAttribute("userObj");
			System.out.println("rr:same user");
		}
		
		//get parameters and user query
		String query = request.getParameter("query");
		String options = request.getParameter("options");
		Double rad = Double.parseDouble(request.getParameter("radius"));
		int numOptions = Integer.parseInt(options);
		
			
		//check if the same search, then return the same results
//		if(session.getAttribute("query") == null || !session.getAttribute("query").equals(query) 
//				|| (session.getAttribute("query").equals(query) && (int)session.getAttribute("options") != numOptions)
//				|| (session.getAttribute("radius") != null && session.getAttribute("radius") != rad)) {
			 
			//create new instances of Results
			ArrayList<Restaurant> restaurantResults = new ArrayList<Restaurant>();
			ArrayList<Recipe> recipeResults = new ArrayList<Recipe>();
			ArrayList<String> imageResults = new ArrayList<String>();
			
			//API Calls to get restaurant and recipe results
			YelpRequest y = new YelpRequest(query, numOptions);
			ArrayList<Restaurant> temp = y.restaurantResults;
			//restaurantResults = y.restaurantResults;
			
			RecipeRequest r = new RecipeRequest(query, numOptions);
			recipeResults = r.recipeResults;
			
			int size = temp.size();

			//radius implementation
			for(int i = 0; i < size; i++) {
				
				if(temp.get(i).distance <= (rad * 1600)) {
					restaurantResults.add(temp.get(i));
				}
				else {     }
			}
			
			
			ImagesRequest ir = new ImagesRequest(query);
			imageResults = ir.imageResultURLs;

			
			Results myres = new Results(restaurantResults, recipeResults, imageResults,rad, numOptions);
			ToJson write = new ToJson(myres, query);

			Database db = new Database();
			db.finish = false;
			db.getPrevQuery();
			db.addNewQuery(query, myres);
			
			while(!db.finish) {
				//System.out.println("a");
				try {
					TimeUnit.SECONDS.sleep(1);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				if(db.finish) {
					System.out.println("b");
					break;
				}
			}
			
			//get previous query
			ArrayList<String> previousQueries = new ArrayList<String>();
			ArrayList<String> previousImg = new ArrayList<String>();
			for(int i = 0; i < db.prev.size(); i++) {
				//System.out.println(db.prev.get(i));
				String token[] = db.prev.get(i).split(" ");
				previousQueries.add(token[0]);
				previousImg.add(token[1]);
			}
			
			//setting session variable
			Gson gson = new Gson();
			
			session.setAttribute("resList", restaurantResults);
			session.setAttribute("recList", recipeResults);
			session.setAttribute("imgList", imageResults);
			session.setAttribute("userObj", thisUser);
		     
			//use JSON for javascript readability
		    String restJson = gson.toJson(restaurantResults);
		    String recipeJson = gson.toJson(recipeResults);
		    String imageJSON = gson.toJson(imageResults);
		    String userJSON =  gson.toJson(thisUser);
		    String gList = gson.toJson(thisUser.gList);
		    String prevQ = gson.toJson(previousQueries);
		    String prevI = gson.toJson(previousImg);
			
			session.setAttribute("restaurantResults", restJson);
			session.setAttribute("recipeResults", recipeJson);
			session.setAttribute("query", query);
			session.setAttribute("imageURLs", imageJSON);
			session.setAttribute("user", userJSON);
			session.setAttribute("options", numOptions);
			session.setAttribute("radius", rad);
			session.setAttribute("gList", gList);
			session.setAttribute("previousQ", prevQ);
			session.setAttribute("previousI", prevI);
		//}
	
		RequestDispatcher dispatch = request.getRequestDispatcher("Results.jsp?query=" + query);
		if (!(dispatch == null)) {
			dispatch.forward(request,  response);
		}
	}
}
