package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.gson.Gson;

import objects.Database;
import objects.JsonReader;
import objects.Recipe;
import objects.Restaurant;
import objects.Results;
import objects.User;

/**
 * Servlet implementation class PreviousQuery
 */
@WebServlet("/PreviousQuery")
public class PreviousQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreviousQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	//this creates a new user
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filename = request.getParameter("filename");
		ObjectMapper mapper = new ObjectMapper();
		
		User thisUser;
		JSONObject a = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("userObj") == null) {
			System.out.println("previous query:new user");
			thisUser = new User();
//			if(!thisUser.username.equals("")) {
//				a = JsonReader.readJsonFromUrl("https://imhungry-64e63.firebaseio.com/user/prevQuery-" + thisUser.username + "/" + filename + ".json");
//			}
//			else {
				a = JsonReader.readJsonFromUrl("https://imhungry-64e63.firebaseio.com/newQueries/" + filename + ".json");
			//}
		} else {
			thisUser = (User)session.getAttribute("userObj");
			System.out.println("previous query:same user");
			if(!thisUser.username.equals("")) {
				a = JsonReader.readJsonFromUrl("https://imhungry-64e63.firebaseio.com/user/prevQuery-" + thisUser.username + "/" + filename + ".json");
			}
			else {
				a = JsonReader.readJsonFromUrl("https://imhungry-64e63.firebaseio.com/newQueries/" + filename + ".json");
			}
		}
		
		//using firebase
		
		

		//File file = new File(filename + ".json");
		Results myres = mapper.readValue(a.toString(), Results.class);
		
		ArrayList<Restaurant> restaurantResults = myres.restList;
		ArrayList<Recipe> recipeResults = myres.recList;
		ArrayList<String> imageResults = myres.imageList;
		double rad = myres.rad;
		int opt = myres.options;

		Database db = new Database();
		db.finish = false;
		if(!thisUser.username.equals("")) {
			db.getUserPrevQuery(thisUser);
		}
		else {
			db.getPrevQuery();
		}
		
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
		for(int i = db.prev.size() - 1; i > -1; i--) {
			//System.out.println(db.prev.get(i));
			String token[] = db.prev.get(i).split(" ");
			previousQueries.add(token[0]);
			previousImg.add(token[1] + " " + token[2] + " " + token[3]+ " " + token[4]+ " " + token[5]
					+ " " + token[6]+ " " + token[7]+ " " + token[8]+ " " + token[9]+ " " + token[10]);
		}
		
		//setting session variable
		Gson gson = new Gson();
		
	     
		//use JSON for javascript readability
	    String prevQ = gson.toJson(previousQueries);
	    String prevI = gson.toJson(previousImg);
	    
		session.setAttribute("previousQ", prevQ);
		session.setAttribute("previousI", prevI);
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
		
		session.setAttribute("restaurantResults", restJson);
		session.setAttribute("recipeResults", recipeJson);
		session.setAttribute("query", filename);
		session.setAttribute("imageURLs", imageJSON);
		session.setAttribute("user", userJSON);
		session.setAttribute("options", opt);
		session.setAttribute("radius", rad);
		session.setAttribute("gList", gList);

		
		
		RequestDispatcher dispatch = request.getRequestDispatcher("Results.jsp?query=" + filename);
		if(dispatch != null) {
			dispatch.forward(request,  response);
		}
	}



}
