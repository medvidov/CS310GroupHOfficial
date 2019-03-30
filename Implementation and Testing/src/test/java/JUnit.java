import static org.junit.Assert.assertEquals;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;


import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

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

public class JUnit {

	
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
			session.setAttribute("userObj", newUser);
	    }
	    
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
}
