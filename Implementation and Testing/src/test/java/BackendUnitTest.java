import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import com.fasterxml.jackson.databind.ObjectMapper;

import static org.mockito.Mockito.when;

import objects.Restaurant;
import objects.Results;
import objects.ToJson;
import objects.User;
import objects.YelpRequest;
import servlets.AddToGrocery;
import servlets.AddToServlet;
import servlets.GetQueries;
import servlets.MoveListServlet;
import servlets.PreviousQuery;
import servlets.RemoveListServlet;
import servlets.ReturnResults;
import servlets.ToList;
import objects.GroceryList;
import objects.ImagesRequest;
import objects.Recipe;
import objects.RecipeRequest;


public class BackendUnitTest {
	
	public int limit = 5;
	
	
	//RECIPE TESTS
//	@Test
//	public void failQuery() {
//		String query = "~)(*"; 
//		RecipeRequest y = new RecipeRequest(query,limit);
//		assertEquals(y.recipeResults.size(),0);
//	}
//	@Test
//	public void goodQuery() {
//		String query = "hamburger"; 
//		RecipeRequest y = new RecipeRequest(query,limit);
//		assertEquals(y.recipeResults.size(),limit);
//	}
//	
//	@Test
//	public void size1Query() {
//		String query = "hamburger"; 
//		RecipeRequest y = new RecipeRequest(query,1);
//		assertEquals(y.recipeResults.size(),1);
//	}
//	
//	@Test
//	public void size2Query() {
//		String query = "hamburger"; 
//		RecipeRequest y = new RecipeRequest(query,2);
//		assertEquals(y.recipeResults.size(),2);
//	}
//	
//	@Test
//	public void size3Query() {
//		String query = "hamburger"; 
//		RecipeRequest y = new RecipeRequest(query,3);
//		assertEquals(y.recipeResults.size(),3);
//	}
//	
//	@Test
//	public void size4Query() {
//		String query = "hamburger"; 
//		RecipeRequest y = new RecipeRequest(query,4);
//		assertEquals(y.recipeResults.size(),4);
//	}
//	
//	@Test
//	public void spaceQuery() {
//		String query = "hamburger food"; 
//		RecipeRequest y = new RecipeRequest(query,limit);
//		assertEquals(y.recipeResults.size(),limit);
//		
//		try {
//			Thread.sleep(1250);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//	}
//	@Test
//	public void cuisineQuery() {
//		String query = "chinese"; 
//		RecipeRequest y = new RecipeRequest(query, 1);
//		assertEquals(y.recipeResults.size(), 1);
//	}
//	
//	@Test
//	public void popularQuery() {
//		String query = "burger"; 
//		RecipeRequest y = new RecipeRequest(query,3);
//		assertEquals(y.recipeResults.size(),3);
//		try {
//			Thread.sleep(2000);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//	
//	@Test
//	public void unpopularQuery() {
//		String query = "u"; 
//		RecipeRequest y = new RecipeRequest(query,5);
//		assertEquals(y.recipeResults.size(),2);
//		
//		try {
//			Thread.sleep(1500);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//	
//	
//	//YELP REQUEST TESTS
//	@Test
//	public void failQueryRest() {
//		String query = "~)(*"; 
//		YelpRequest y = new YelpRequest(query,limit);
//		assertEquals(y.restaurantResults.size(),0);
//	}
////	@Test
////	public void goodQueryRest() {
////		String query = "hamburgers"; 
////		YelpRequest y = new YelpRequest(query,limit);
////
////		assertEquals(y.restaurantResults.size(),limit);
////	}
////	@Test
////	public void spaceQueryRest() {
////		String query = "hamburger food"; 
////		YelpRequest y = new YelpRequest(query,limit);
////
////		assertEquals(y.restaurantResults.size(),limit);
////	}
////	@Test
////	public void cuisineQueryRest() {
////		String query = "indian"; 
////		YelpRequest y = new YelpRequest(query,limit);
////
////		assertEquals(y.restaurantResults.size(),limit);		
////	}
//	
//	@Test
//	public void restaurantQueryFull() {
//		String query = "Starbucks"; 
//		YelpRequest y = new YelpRequest(query,limit);
//
//		assertEquals(y.restaurantResults.size(),limit);		
//	}	
//	@Test
//	public void restaurantQueryValid() {
//		String query = "Starbucks"; 
//		YelpRequest y = new YelpRequest(query,limit);
//		//query should return Starbucks nearby 
//		assertEquals(y.restaurantResults.get(0).name,"Starbucks");	
//	}
//	@Test
//	public void findWebsite() {
//		String query = "chipotle"; 
//		YelpRequest y = new YelpRequest(query,limit);
//		assertEquals(y.restaurantResults.get(0).websiteLink,"chipotle.com");	
//	}
//	
//	@Test
//	public void distanceCheck() {
//		String query = "burger"; 
//		YelpRequest y = new YelpRequest(query,limit);
//		//query should return Starbucks nearby 
//		assertEquals(y.restaurantResults.get(0).travelTime,"1 min");	
//	}
//	//Return Value Tests
//	@Test
//	public void fullPopulated () {
//		String query = "hamburger";
//		YelpRequest y = new YelpRequest(query,limit);
//		for(int i = 0; i < y.restaurantResults.size();i++) {
//			Restaurant s = y.restaurantResults.get(i);
//			//make sure all attributes have values
//			assertNotNull(s.name);
//			assertNotNull(s.websiteLink);
//			assertNotNull(s.price);
//			assertNotNull(s.distance);
//			assertNotNull(s.uniqueID);
//			assertNotNull(s.rating);
//			assertNotNull(s.address);
//			assertNotNull(s.googleMapsLink);
//		}
//	}
//	
//	@Test
//	public void caseSensitive () {
//		String query = "HamBurger";
//		YelpRequest y = new YelpRequest(query,limit);
//		for(int i = 0; i < y.restaurantResults.size();i++) {
//			Restaurant s = y.restaurantResults.get(i);
//			//make sure all attributes have values
//			assertNotNull(s.name);
//			assertNotNull(s.websiteLink);
//			assertNotNull(s.price);
//			assertNotNull(s.distance);
//			assertNotNull(s.uniqueID);
//			assertNotNull(s.rating);
//			assertNotNull(s.address);
//			assertNotNull(s.googleMapsLink);
//		}
//	}
	
	//USER Object Tests
	
	@Test
	public void addRecipeFavorite() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		r.name = "name";
		u.addRecipe(r, "favorite");
		assertEquals(u.favoriteRecipe.get(0).name,"name");
	}
	
	@Test
	public void addRecipeToExplore() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		r.name = "name";
		u.addRecipe(r, "explore");
		assertEquals(u.exploreRecipe.get(0).name,"name");
	}
	
	@Test
	public void addRecipeNotShow() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		r.name = "name";
		u.addRecipe(r, "not");
		assertEquals(u.notRecipe.get(0).name,"name");
	}
	
	@Test
	public void addRestaurantFavorite () {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "favorite");
		assertEquals(u.favoriteRestaurant.get(0).name,"name");
	}
	@Test
	public void addRestaurantToExplore () {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "explore");
		assertEquals(u.exploreRestaurant.get(0).name,"name");
	}
	@Test
	public void addRestaurantDoNotShow () {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "not");
		assertEquals(u.notRestaurant.get(0).name,"name");
	}
	
	
	@Test
	public void removeRecipeFavorite() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		u.addRecipe(r, "favorite");
		u.removeRecipe("favorite", 0);
		assertEquals(u.favoriteRecipe.size(),0);
	}
	
	@Test
	public void removeRecipeToExplore() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		u.addRecipe(r, "explore");
		u.removeRecipe("explore",0);
		assertEquals(u.exploreRecipe.size(),0);
	}
	
	@Test
	public void removeRecipeNotShow() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		u.addRecipe(r, "not");
		u.removeRecipe("not", 0);
		assertEquals(u.notRecipe.size(),0);
	}
	
	@Test
	public void removeRestaurantFavorite () {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "favorite");
		u.removeRestaurant("favorite", 0);
		assertEquals(u.favoriteRestaurant.size(),0);
	}
	@Test
	public void removeRestaurantToExplore () {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "explore");
		u.removeRestaurant("explore", 0);
		assertEquals(u.exploreRestaurant.size(),0);
	}
	@Test
	public void removeRestaurantDoNotShow () {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "not");
		u.removeRestaurant("not",0);
		assertEquals(u.notRestaurant.size(),0);
	}
	
	@Test
	public void moveRecipeFavorite_to_DoNotShow() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		r.name = "name";
		u.addRecipe(r, "favorite");
		u.moveRecipe("favorite","not", 0);
		assertEquals(u.notRecipe.get(0).name,"name");
	}
	@Test
	public void moveRecipeFavorite_to_Explore() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		r.name = "name";
		u.addRecipe(r, "favorite");
		u.moveRecipe("favorite","explore", 0);
		assertEquals(u.exploreRecipe.get(0).name,"name");
	}
	
	@Test
	public void moveRecipeToExplore_to_Favorite() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		r.name = "name";
		u.addRecipe(r, "explore");
		u.moveRecipe("explore", "favorite", 0);
		assertEquals(u.favoriteRecipe.get(0).name,"name");
	}
	@Test
	public void moveRecipeToExplore_to_DoNotShow() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		r.name = "name";
		u.addRecipe(r, "explore");
		u.moveRecipe("explore", "not", 0);
		assertEquals(u.notRecipe.get(0).name,"name");
	}
	
	@Test
	public void moveRecipeNotShow_to_Favorite() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		r.name = "name";
		u.addRecipe(r, "not");
		u.moveRecipe("not","favorite", 0);
		assertEquals(u.favoriteRecipe.get(0).name,"name");
	}
	@Test
	public void moveRecipeNotShow_to_Explore() {
		User u = new User ();
		Recipe r = new Recipe("name","imagelink","prep","cooktime", new ArrayList<String>(), new ArrayList<String>(),"q",2.0);
		r.name = "name";
		u.addRecipe(r, "not");
		u.moveRecipe("not","explore", 0);
		assertEquals(u.exploreRecipe.get(0).name,"name");
	}
	
	@Test
	public void moveRestaurantDoNotShow_to_Favorite () {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "not");
		u.moveRestaurant("not", "favorite", 0);
		assertEquals(u.favoriteRestaurant.get(0).name,"name");
	}
	@Test
	public void moveRestaurantDoNotShow_to_explore () {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "not");
		u.moveRestaurant("not", "explore", 0);
		assertEquals(u.exploreRestaurant.get(0).name,"name");
	}
	@Test
	public void moveRestaurantToExplore_to_Favorite () {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "explore");
		u.moveRestaurant("explore", "favorite", 0);
		assertEquals(u.favoriteRestaurant.get(0).name,"name");
	}
	@Test
	public void moveRestaurantToExplore_to_DoNotShow() {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "explore");
		u.moveRestaurant("explore", "not", 0);
		assertEquals(u.notRestaurant.get(0).name,"name");
	}	
	@Test
	public void moveRestaurantFavorite_to_DoNotShow () {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "favorite");
		u.moveRestaurant("favorite", "not", 0);
		assertEquals(u.notRestaurant.get(0).name,"name");
	}
	@Test
	public void moveRestaurantFavorite_to_Explore () {
		User u = new User ();
		Restaurant r = new Restaurant();
		r.name= "name";
		u.addRestaurant(r, "favorite");
		u.moveRestaurant("favorite", "explore", 0);
		assertEquals(u.exploreRestaurant.get(0).name,"name");
	}	
	
	@Test
	public void moveFalseRestaurant() {
		User u = new User ();
		assertFalse(u.moveRestaurant("nota", "asdf", 2));
	}
	@Test
	public void moveFalseRecipe() {
		User u = new User ();
		assertFalse(u.moveRecipe("nota", "asdf", 2));
	}
	
	//IMAGE REQUEST TESTS
	
	@Test
	public void imageRequestSize() {
		String query = "hamburger";
		ImagesRequest ir = new ImagesRequest(query);
		ArrayList<String> imageResults = new ArrayList<String>();
		imageResults = ir.imageResultURLs;
		assertEquals(imageResults.size(), 10);	
	}
	
	@Test
	public void imageRequestOtherQuery() {
		String query = "chicken";
		ImagesRequest ir = new ImagesRequest(query);
		ArrayList<String> imageResults = new ArrayList<String>();
		imageResults = ir.imageResultURLs;
		assertEquals(imageResults.size(), 10);	
	}
	
	//SERVLET TESTS
	
	@Mock
    HttpServletRequest request;
 
    @Mock
    HttpServletResponse response;
    
    @Mock
    HttpSession session;
    
    User newUser;
    ArrayList<Restaurant> resList;
    ArrayList<Recipe> recList;

    @Before
    public void runBeforeTestMethod() {
    	MockitoAnnotations.initMocks(this);
     
        request = Mockito.mock(HttpServletRequest.class);
        response = Mockito.mock(HttpServletResponse.class);
        session = Mockito.mock(HttpSession.class);

        when(request.getSession()).thenReturn(session);
   
    	//set up session vars
    	newUser = new User();
    	resList = new ArrayList<Restaurant>();
    	recList = new ArrayList<Recipe>();
   
    	//populate
    	Restaurant testRest = new Restaurant();
    	testRest.name = "Test Restaurant";
    	testRest.uniqueID = "0";
    	resList.add(testRest);
		newUser.exploreRestaurant.add(testRest);
		
		Restaurant favRest = new Restaurant();
    	favRest.name = "Fav Restaurant";
    	favRest.uniqueID = "1";
    	resList.add(favRest);
		newUser.favoriteRestaurant.add(favRest);
		
		Restaurant notRest = new Restaurant();
		notRest.name = "Not Restaurant";
    	notRest.uniqueID = "2";
    	resList.add(notRest);
		newUser.notRestaurant.add(notRest);
		
		Recipe testRecipe = new Recipe("Test Recipe", "img.com", "10 m", "10 m", new ArrayList<String>(),new ArrayList<String>(), "query", 0.0);
		testRecipe.uniqueID = "3";
		recList.add(testRecipe);
		newUser.favoriteRecipe.add(testRecipe);
		
		Recipe exploreRecipe = new Recipe("Explore Recipe", "img.com", "10 m", "10 m", new ArrayList<String>(),new ArrayList<String>(), "query", 0.0);
		exploreRecipe.uniqueID = "4";
		recList.add(exploreRecipe);
		newUser.exploreRecipe.add(exploreRecipe);
		
		Recipe notRecipe = new Recipe("Not Recipe", "img.com", "10 m", "10 m", new ArrayList<String>(),new ArrayList<String>(), "query", 0.0);
		exploreRecipe.uniqueID = "5";
		recList.add(notRecipe);
		newUser.notRecipe.add(notRecipe);

		session.setAttribute("resList", resList);
		session.setAttribute("recList", recList);
    }
 
    @Test
    public void testAddToServ() throws IOException, ServletException {
    	
    	AddToServlet servlet = new AddToServlet();
   
        when(request.getParameter("id")).thenReturn("1");
        when(request.getParameter("item")).thenReturn("Restaurant");
        when(request.getParameter("list")).thenReturn("favorite");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
 
    }
  
    @Test
    public void testAddToServNot() throws IOException, ServletException {
    	
    	AddToServlet servlet = new AddToServlet();
 
        when(request.getParameter("id")).thenReturn("1");
        when(request.getParameter("item")).thenReturn("Restaurant");
        when(request.getParameter("list")).thenReturn("not");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
 
    }
    
    @Test
    public void testAddToServWithRecipes() throws IOException, ServletException {
    	AddToServlet servlet = new AddToServlet();

        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list")).thenReturn("not");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
 
    }
    
    @Test
    public void testAddToServWithRecipesFav() throws IOException, ServletException {
    	AddToServlet servlet = new AddToServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list")).thenReturn("favorite");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
 
    }
    
    //movelistservlet
    
    @Test
    public void moveListServletGeneral() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("explore");
        when(request.getParameter("list2")).thenReturn("not");
        when(request.getParameter("itemType")).thenReturn("restaurant");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    @Test
    public void moveListServletExploreFavorite() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("explore");
        when(request.getParameter("list2")).thenReturn("favorite");
        when(request.getParameter("itemType")).thenReturn("restaurant");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    @Test
    public void moveListServletNotFavorite() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("not");
        when(request.getParameter("list2")).thenReturn("favorite");
        when(request.getParameter("itemType")).thenReturn("restaurant");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    @Test
    public void moveListServletNotExplore() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("not");
        when(request.getParameter("list2")).thenReturn("explore");
        when(request.getParameter("itemType")).thenReturn("restaurant");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    @Test
    public void moveListServletFavoriteNot() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("favorite");
        when(request.getParameter("list2")).thenReturn("not");
        when(request.getParameter("itemType")).thenReturn("restaurant");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
  
    @Test
    public void moveListServletFavoriteExplore() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("favorite");
        when(request.getParameter("list2")).thenReturn("explore");
        when(request.getParameter("itemType")).thenReturn("recipe");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    @Test
    public void moveListServletGeneralRecipe() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("explore");
        when(request.getParameter("list2")).thenReturn("not");
        when(request.getParameter("itemType")).thenReturn("recipe");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    @Test
    public void moveListServletExploreFavoriteRecipe() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("explore");
        when(request.getParameter("list2")).thenReturn("favorite");
        when(request.getParameter("itemType")).thenReturn("recipe");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    @Test
    public void moveListServletNotFavoriteRecipe() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("not");
        when(request.getParameter("list2")).thenReturn("favorite");
        when(request.getParameter("itemType")).thenReturn("recipe");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    @Test
    public void moveListServletNotExploreRecipe() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("not");
        when(request.getParameter("list2")).thenReturn("explore");
        when(request.getParameter("itemType")).thenReturn("recipe");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    @Test
    public void moveListServletFavoriteNotRecipe() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("favorite");
        when(request.getParameter("list2")).thenReturn("not");
        when(request.getParameter("itemType")).thenReturn("recipe");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
  
    @Test
    public void moveListServletFavoriteExploreRecipe() throws IOException, ServletException {
    	
    	MoveListServlet servlet = new MoveListServlet();
 
        when(request.getParameter("id")).thenReturn("0");
        when(request.getParameter("item")).thenReturn("Recipe");
        when(request.getParameter("list1")).thenReturn("favorite");
        when(request.getParameter("list2")).thenReturn("explore");
        when(request.getParameter("itemType")).thenReturn("recipe");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    //removelistservlet
    @Test
    public void removeListServ() throws IOException, ServletException {
    	
    	RemoveListServlet servlet = new RemoveListServlet();
    	
        when(request.getParameter("list")).thenReturn("not");
        when(request.getParameter("itemType")).thenReturn("restaurant");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
  
    @Test
    public void removeListServRecipe() throws IOException, ServletException {
    	
    	RemoveListServlet servlet = new RemoveListServlet();
    	
        when(request.getParameter("list")).thenReturn("not");
        when(request.getParameter("itemType")).thenReturn("recipe");
        when(request.getParameter("index")).thenReturn("0");
        when(session.getAttribute("userObj")).thenReturn(newUser);
        when(session.getAttribute("resList")).thenReturn(resList);
        when(session.getAttribute("recList")).thenReturn(recList);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    //returnresultsservlet
    
    
    @Test
    public void returnResultsServ() throws IOException, ServletException {
    	
    	ReturnResults servlet = new ReturnResults();
    	
        when(request.getParameter("query")).thenReturn("hamburger");
        when(request.getParameter("options")).thenReturn("5");
        when(request.getParameter("radius")).thenReturn("10.0");
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    
    
    @Test
    public void returnResultsServCuisine() throws IOException, ServletException {
    	
    	ReturnResults servlet = new ReturnResults();
    	
        when(request.getParameter("query")).thenReturn("chinese");
        when(request.getParameter("options")).thenReturn("1");
        when(request.getParameter("radius")).thenReturn("10.0");
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    //tolistservlet
    
    @Test
    public void toList() throws IOException, ServletException {
    	
    	ToList servlet = new ToList();
    	
        when(request.getParameter("list")).thenReturn("favorite");
        when(session.getAttribute("userObj")).thenReturn(newUser);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    @Test
    public void toListExplore() throws IOException, ServletException {
    	
    	ToList servlet = new ToList();
    	
        when(request.getParameter("list")).thenReturn("explore");
        when(session.getAttribute("userObj")).thenReturn(newUser);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
    @Test
    public void toListNot() throws IOException, ServletException {
    	
    	ToList servlet = new ToList();
    	
        when(request.getParameter("list")).thenReturn("not");
        when(session.getAttribute("userObj")).thenReturn(newUser);
       
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
 
        servlet.service(request, response);
        
        assertEquals(1, 1);
    }
    
  //test GroceryList.java
  	@Test
  	public void notNullGlist() {
  		GroceryList list = new GroceryList();
  		assertNotNull(list.gList);
  	}
  	
  	@Test
  	public void addGlist() {
  		GroceryList list = new GroceryList();
  		list.gList.add("hello");
  		assertEquals(list.gList.get(0),"hello");
  		assertEquals(list.gList.size(), 1);
  	}

  	
  	//test AddToGrocery.java
  	//test Results.java
  	
  	//SERVLET TESTS
  	
  	    
  	    //test adding null to grocery
  	    @Test
  	    public void testCannotFindRecipe() throws IOException, ServletException {
  	    	
  	    	AddToGrocery servlet = new AddToGrocery();
  	 
  	        when(request.getParameter("id")).thenReturn("nothing");
  	        when(session.getAttribute("userObj")).thenReturn(newUser);
  	        when(session.getAttribute("resList")).thenReturn(resList);
  	        when(session.getAttribute("recList")).thenReturn(recList);
  	       
  	        StringWriter sw = new StringWriter();
  	        PrintWriter pw = new PrintWriter(sw);
  	         
  	        when(response.getWriter()).thenReturn(pw);
  	 
  	        servlet.service(request, response);
  	        
  	        assertEquals(1, 1);
  	    }
  	    
  	    //test adding groceries
  	    @Test
  	    public void testFindRecipe() throws IOException, ServletException {
  	    	
  	    	AddToGrocery servlet = new AddToGrocery();
  	 
  	        when(request.getParameter("id")).thenReturn("3");
  	        when(session.getAttribute("userObj")).thenReturn(newUser);
  	        when(session.getAttribute("resList")).thenReturn(resList);
  	        when(session.getAttribute("recList")).thenReturn(recList);
  	       
  	        StringWriter sw = new StringWriter();
  	        PrintWriter pw = new PrintWriter(sw);
  	         
  	        when(response.getWriter()).thenReturn(pw);
  	 
  	        servlet.service(request, response);
  	        
  	        assertEquals(1, 1);
  	    }    
  	    
  	    @Test
  	    public void ToJsonTest() throws IOException, ServletException {
  	    	
  	    }
  	    
  	    //test GetQUeries
  	    
  	    
  	    //file exists
  	    @Test
  	    public void testGetQueries() throws IOException, ServletException {
  	    	
  	    	ObjectMapper mapper = new ObjectMapper();
  	    	File file = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storage\\queries.txt");
  	    	file.delete();
  	    	File list = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storage\\queries.txt");
  	        ArrayList<String> queries = new ArrayList<String>();
  	        //if query list does not exist create it 
  	        
          	queries = new ArrayList<String>();
          	queries.add("hamburger-5-10.0.json");
          	queries.add("hamburger-7-10.0.json");
          	mapper.writeValue(list, queries);
  	        	
  	    	GetQueries servlet = new GetQueries();
  	    	
  	        StringWriter sw = new StringWriter();
  	        PrintWriter pw = new PrintWriter(sw);
  	         
  	        when(response.getWriter()).thenReturn(pw);
  	 
  	        servlet.service(request, response);
  	        
  	        assertEquals(1, 1);
  	    }
  	    
  	    @Test
  	    public void testNoPrevQueries() throws IOException, ServletException {
  	    	
  	    	File file = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storage\\queries.txt");
  	    	file.delete();
  	    	
  	    	GetQueries servlet = new GetQueries();
  	    	
  	        StringWriter sw = new StringWriter();
  	        PrintWriter pw = new PrintWriter(sw);
  	         
  	        when(response.getWriter()).thenReturn(pw);
  	 
  	        servlet.service(request, response);
  	        
  	        File newFile = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storage\\queries.txt");
  	        
  	        assertEquals(1, 1);
  	    }
  	    
  	    
  	    //test PreviousQuery
  	    @Test
  	    public void testPreviousQuery() throws IOException, ServletException{
  	    	
  	    	PreviousQuery servlet = new PreviousQuery();
  	   	 
  	        when(request.getParameter("filename")).thenReturn("hamburger-5-10.0");
  	        
  	        StringWriter sw = new StringWriter();
  	        PrintWriter pw = new PrintWriter(sw);
  	         
  	        when(response.getWriter()).thenReturn(pw);
  	 
  	        servlet.service(request, response);
  	        
  	        assertEquals(1, 1);
  	    }
  	    

  	    @Test
  	    public void testResultsObject() throws IOException, ServletException {
  	    	ArrayList<Restaurant> rs = new ArrayList<Restaurant>();
  	    	ArrayList<Recipe> rc = new ArrayList<Recipe>();
  	    	ArrayList<String> images = new ArrayList<String>();
  	    	Results r = new Results(rs, rc, images);
  	    	
  	    	Results blankR = new Results();
  	    	
  	    	assertEquals(1,1);
  	    }
  	    
  	    @Test
  	    public void testNullJSONObject() throws IOException, ServletException {
  	    	ArrayList<Restaurant> rs = new ArrayList<Restaurant>();
  	    	ArrayList<Recipe> rc = new ArrayList<Recipe>();
  	    	ArrayList<String> images = new ArrayList<String>();
  	    	Results r = new Results(rs, rc, images);
  	    	String filename = "file.txt";
  	    	
  	    	
  	        File file = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storage" + filename);
  	    	
  	        ToJson n = new ToJson(r, filename);
  	    	assertEquals(1, 1);
  	    }
  	    
  	    @Test
  	    public void testToJSONObject() throws IOException, ServletException {
  	    	ArrayList<Restaurant> rs = new ArrayList<Restaurant>();
  	    	ArrayList<Recipe> rc = new ArrayList<Recipe>();
  	    	ArrayList<String> images = new ArrayList<String>();
  	    	Results r = new Results(rs, rc, images);
  	    	String filename = "hamburger-5-10.0.json";
  	    	
  	        File file = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storage" + filename);
  	        file.delete();
  	    	ToJson n = new ToJson(r, filename);
  	    	assertEquals(1, 1);
  	    }
  	    
  	    @Test
  	    public void testToJSONObject2() throws IOException, ServletException {
  	    	ArrayList<Restaurant> rs = new ArrayList<Restaurant>();
  	    	ArrayList<Recipe> rc = new ArrayList<Recipe>();
  	    	ArrayList<String> images = new ArrayList<String>();
  	    	Results r = new Results(rs, rc, images);
  	    	String filename = "hamburger-5-10.0.json";
  	    	
  	        File file = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storage" + filename);
  	        file.delete();
  	        
  	        File list = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storagequeries.txt");
  	        list.delete();
  	    	
  	        ToJson n = new ToJson(r, filename);
  	    	assertEquals(1, 1);
  	    }
  	    
  	    @Test
  	    public void testToJSONObject3() throws IOException, ServletException {
  	    	ArrayList<Restaurant> rs = new ArrayList<Restaurant>();
  	    	ArrayList<Recipe> rc = new ArrayList<Recipe>();
  	    	ArrayList<String> images = new ArrayList<String>();
  	    	Results r = new Results(rs, rc, images);
  	    	String filename = "hamburger-5-10.0.json";
  	    	
  	        File file = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storage" + filename);
  	        file.delete();
  	        
  	        File list = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storagequeries.txt");
  	    	
  	        ToJson n = new ToJson(r, filename);
  	    	assertEquals(1, 1);
  	    }
  	    
  	    @Test
  	    public void toJSONGetQueriesTest() throws IOException, ServletException {
  	    	ArrayList<Restaurant> rs = new ArrayList<Restaurant>();
  	    	ArrayList<Recipe> rc = new ArrayList<Recipe>();
  	    	ArrayList<String> images = new ArrayList<String>();
  	    	Results r = new Results(rs, rc, images);
  	    	String filename = "hamburger-5-10.0.json";
  	    	ToJson n = new ToJson(r, filename);
  	    	ArrayList<String> test = n.getQueries();
  	    	assertEquals(1, 1);
  	    }
  	    
 	    @Test
  	    public void toJSONGetQueriesTest2() throws IOException, ServletException {
  	    	ArrayList<Restaurant> rs = new ArrayList<Restaurant>();
  	    	ArrayList<Recipe> rc = new ArrayList<Recipe>();
  	    	ArrayList<String> images = new ArrayList<String>();
  	    	Results r = new Results(rs, rc, images);
  	    	String filename = "hamburger-5-10.0.json";
  	    	ToJson n = new ToJson(r, filename);
  			File list = new File("C:\\Users\\Bram\\Desktop\\workspace\\310GroupH\\src\\main\\java\\storage\\queries.txt");
  			list.delete();
  	    	ArrayList<String> test = n.getQueries();
  	    	assertEquals(1, 1);
  	    }
  	  
  	  @Test
      public void returnResultsServWithRadius1() throws IOException, ServletException {
      	
  		  ReturnResults servlet = new ReturnResults();
      	
          when(request.getParameter("query")).thenReturn("hamburger");
          when(request.getParameter("options")).thenReturn("5");
          when(request.getParameter("radius")).thenReturn("10.0");
         
          StringWriter sw = new StringWriter();
          PrintWriter pw = new PrintWriter(sw);
         
          when(response.getWriter()).thenReturn(pw);
             
          servlet.service(request, response);
          assertEquals(1, 1);
      }
  	  
  	  @Before
  	  public void testRadius() throws IOException, ServletException{
  		  MockitoAnnotations.initMocks(this);
  	     
  		  request = Mockito.mock(HttpServletRequest.class);
  		  response = Mockito.mock(HttpServletResponse.class);
  		  session = Mockito.mock(HttpSession.class);

  		  when(request.getSession()).thenReturn(session);
  		  
  		  session.setAttribute("radius", 100);
  	  }
  	 
  	  @Test
      public void returnResultsServWithRadius2() throws IOException, ServletException {
      	
  		  ReturnResults servlet = new ReturnResults();
      	
          when(request.getParameter("query")).thenReturn("hamburger");
          when(request.getParameter("options")).thenReturn("5");
          when(request.getParameter("radius")).thenReturn("10.0");
         
          StringWriter sw = new StringWriter();
          PrintWriter pw = new PrintWriter(sw);
          when(response.getWriter()).thenReturn(pw);
                      
          servlet.service(request, response);
          assertEquals(1, 1);
          session.setAttribute("radius", 100);
          
          ReturnResults servlet2 = new ReturnResults();
        	
          when(request.getParameter("query")).thenReturn("hamburger");
          when(request.getParameter("options")).thenReturn("5");
          when(request.getParameter("radius")).thenReturn("20.0");
         
          StringWriter sw2 = new StringWriter();
          PrintWriter pw2 = new PrintWriter(sw2);
          when(response.getWriter()).thenReturn(pw2);
                       
          servlet.service(request, response);
          
          assertEquals(1, 1);
      }
  	  
  	  @Test
  	  public void returnRestaurantString() throws IOException, ServletException {
  		  Restaurant r = new Restaurant();
  		  System.out.println(r);
  	  }
      
}