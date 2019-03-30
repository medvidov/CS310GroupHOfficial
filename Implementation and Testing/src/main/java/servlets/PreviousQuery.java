package servlets;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

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

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filename = request.getParameter("filename");
		String token[] = filename.split("-");
		String query = token[0];
		Double rad = Double.parseDouble(token[2]);
		int options = Integer.parseInt(token[1]);
		
		System.out.println(filename);
		
		ObjectMapper mapper = new ObjectMapper();
		File file = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storage\\" + filename + ".json");
		Results myres = mapper.readValue(file, Results.class);
		
		
		User thisUser = new User();
		
		ArrayList<Restaurant> restaurantResults = myres.restList;
		ArrayList<Recipe> recipeResults = myres.recList;
		ArrayList<String> imageResults = myres.imageList;
		
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
		session.setAttribute("query", query);
		session.setAttribute("imageURLs", imageJSON);
		session.setAttribute("user", userJSON);
		session.setAttribute("options", options);
		session.setAttribute("radius", rad);
		session.setAttribute("gList", gList);

		
		
		RequestDispatcher dispatch = request.getRequestDispatcher("Results.jsp?query=" + query);
		if(dispatch != null) {
			dispatch.forward(request,  response);
		}
	}



}
