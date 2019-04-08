package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

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
		
		//using firebase
		JSONObject a = JsonReader.readJsonFromUrl("https://imhungry-64e63.firebaseio.com/data/" + filename + ".json");

		//File file = new File(filename + ".json");
		Results myres = mapper.readValue(a.toString(), Results.class);
		
		
		User thisUser = new User();
		
		ArrayList<Restaurant> restaurantResults = myres.restList;
		ArrayList<Recipe> recipeResults = myres.recList;
		ArrayList<String> imageResults = myres.imageList;
		double rad = myres.rad;
		int opt = myres.options;
		
		HttpSession session = request.getSession();
		
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
