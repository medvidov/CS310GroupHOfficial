package servlets;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

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
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		//get parameters and user query
		String query = request.getParameter("query");
		String options = request.getParameter("options");
		Double rad = Double.parseDouble(request.getParameter("radius"));
		int numOptions = Integer.parseInt(options);

		User thisUser = new User();


		//check if the same search, then return the same results
		if(session.getAttribute("query") == null || !session.getAttribute("query").equals(query)
				|| (session.getAttribute("query").equals(query) && (int)session.getAttribute("options") != numOptions)
				|| (session.getAttribute("radius") != null && session.getAttribute("radius") != rad)) {

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

			for(int i = 0; i < size; i++) {
				//System.out.println(temp.get(i).distance);
				if(temp.get(i).distance <= (rad * 1600)) {
					restaurantResults.add(temp.get(i));
				}
			}

			//for testing purposes
//			if(query.contentEquals("hamburger")) {
//				imageResults.add("https://upload.wikimedia.org/wikipedia/commons/9/9a/Big_Mac_hamburger.jpg");
//				imageResults.add("https://www.recipetineats.com/wp-content/uploads/2016/02/Beef-Hamburgers_7-2.jpg");
//				imageResults.add("https://www.thespruceeats.com/thmb/ivY7T2DRygJN2nHwAFYqVxfbvs4=/3000x2000/filters:no_upscale():max_bytes(150000):strip_icc()/Hamburger-Hot-Dog-58add5f03df78c345bdef6ff.jpg");
//				imageResults.add("lS0qUrT8GphtM8D5oIIigwOEEQQlAARCEIRFBtgQJQQCDASgUaJAAQARIwgAEIQgkoANFKOVXVtmFznO7V4kkxNhNNzIjl3pHUBaBYBESoP9mkNA7V9jIJMn2Aydde7mnmTZMjZTuOJrGxGrebSDpqMscoJsTdaBZoQq1mzX5SHV6jjnLmnQgFgblMa3kyI14G6XV2cS0N7aoHAOGcEZu84OnTLYCBaIJQBPRKCMC6I7Z5u4ySJEiItGmv0SpGGo5QRJMuLpOtzPP6sgB1BHCCAHwi4okEAB6DUEEAAo2IILGApAIILACcmyjQQAZRsRIIAOogUEEAEEp2qJBAAKIoIIAAQKCCACKUUSCYBDuKQNEEEAAJaCCAEozqgggBSCCCAP/9k=");
//				imageResults.add("https://www.justataste.com/wp-content/uploads/2013/05/easy-homemade-parmesan-hamburger-buns-recipe.jpg");
//				imageResults.add("https://www.saveur.com/sites/saveur.com/files/styles/1000_1x_/public/import/2014/2014-05/recipe_papas-favorite-wild-west-hamburger_i166_500x750.jpg?itok=QYuMyACp");
//				imageResults.add("https://assets.epicurious.com/photos/57c5c6d9cf9e9ad43de2d96e/master/pass/the-ultimate-hamburger.jpg");
//				imageResults.add("https://foremangrillrecipes.com/wp-content/uploads/2013/05/american-hamburger-foreman-grill.jpg");
//				imageResults.add("https://cdn.vox-cdn.com/thumbor/rRLHMuiSwa6khLkqQg9gH-sGS30=/0x0:617x521/1200x800/filters:focal(320x235:418x333)/cdn.vox-cdn.com/uploads/chorus_image/image/59948629/hamburger_hamelet_facebook.0.png");
//				imageResults.add("https://thumbor.forbes.com/thumbor/1280x868/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F1164175639%2F960x0.jpg%3Ffit%3Dscale");
//
//				imageResults.add("https://realfood.tesco.com/media/images/Burger-31LGH-a296a356-020c-4969-86e8-d8c26139f83f-0-1400x919.jpg");
//				imageResults.add("http://www.recipe4living.com/assets/itemimages/400/400/3/default_0dacefd503f9d9812f1221e5b670e95b_dreamstimesmall_50289207.jpg");
//				imageResults.add("https://amp.thisisinsider.com/images/5571cbb9ecad04ea3f1d2bad-480-248.jpg");
//				imageResults.add("https://cdn.pixabay.com/photo/2017/12/09/23/04/bread-3008950_960_720.jpg");
//				imageResults.add("https://as1.ftcdn.net/jpg/00/43/43/08/500_F_43430821_7k8NyDsH7mWQscufbxbrw8wKezDhAKv7.jpg");
//				imageResults.add("https://media.istockphoto.com/photos/tasty-burgers-on-wooden-table-picture-id860251286");
//			} else {}

			ImagesRequest ir = new ImagesRequest(query);
			imageResults = ir.imageResultURLs;


		

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

			session.setAttribute("restaurantResults", restJson);
			session.setAttribute("recipeResults", recipeJson);
			session.setAttribute("query", query);
			session.setAttribute("imageURLs", imageJSON);
			session.setAttribute("user", userJSON);
			session.setAttribute("options", numOptions);
			session.setAttribute("radius", rad);
			session.setAttribute("gList", gList);
		}

		RequestDispatcher dispatch = request.getRequestDispatcher("Results.jsp?query=" + query);
		if (!(dispatch == null)) {
			dispatch.forward(request,  response);
		}
	}
}
